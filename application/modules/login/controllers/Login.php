<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MX_Controller {
	// set protected
	protected $_ion_hooks;

	public function __construct(){
		parent::__construct();
		$this->config->load('ion_auth', TRUE);
		// $this->load->library(array('ion_auth', 'form_validation'));

		$this->store_salt  = $this->config->item('store_salt', 'ion_auth');
		$this->salt_length = $this->config->item('salt_length', 'ion_auth');
		$this->hash_method = $this->config->item('hash_method', 'ion_auth');
		$group_name = $this->config->item('database_group_name', 'ion_auth');
		if (empty($group_name)) {
			// By default, use CI's db that should be already loaded
			$CI =& get_instance();
			$this->db = $CI->db;
		}else{
			// For specific group name, open a new specific connection
			$this->db = $this->load->database($group_name, TRUE, TRUE);
		}

		$this->tables = $this->config->item('tables', 'ion_auth');
		$this->identity_column = $this->config->item('identity', 'ion_auth');

	}


	public function index(){

		// $data['captcha'] 	= captcha();
		$data['captcha'] 		= $this->recaptcha->getWidget();
		$data['script_captcha'] = $this->recaptcha->getScriptTag();
		$data['records']		= $this->m_global->get('acs_config',null,['config_kode' => 'BGR'],'config_kode,config_nama,config_keterangan,config_temp');
		$data['no_image']		= base_url().'assets/app/media/img/bg/bg-5.jpg';
		$this->session->set_userdata('hasCaptcha', $data['captcha']);

		$this->load->view('login/login',$data);
	}

	protected function _call_hook($event, $name){
		if (isset($this->_ion_hooks->{$event}[$name]) && method_exists($this->_ion_hooks->{$event}[$name]->class, $this->_ion_hooks->{$event}[$name]->method)){
			$hook = $this->_ion_hooks->{$event}[$name];

			return call_user_func_array(array($hook->class, $hook->method), $hook->arguments);
		}

		return FALSE;
	}

	public function trigger_events($events){
		if (is_array($events) && !empty($events)){
			foreach ($events as $event){
				$this->trigger_events($event);
			}
		}else{
			if (isset($this->_ion_hooks->$events) && !empty($this->_ion_hooks->$events)){
				foreach ($this->_ion_hooks->$events as $name => $hook){
					$this->_call_hook($events, $name);
				}
			}
		}
	}

	public function cek_login(){
		$this->trigger_events('pre_login');

		$user_ip 		   = getUserIP();
		$user_device 	   = gethostname();
		$use_sha1_override = FALSE;
		$post     		   = $this->input->post();
		$pass     		   = genPass($post['user_nopeg'], $post['user_password']);

		$this->trigger_events('extra_where');

		$join      = null;
		$where     = ['user_nopeg' => $post['user_nopeg'], 'user_status' => '1'];
		$select    = 'user_id,user_nopeg,user_nama,user_email,user_password,user_role_id,user_status,user_ip_temp';
		$dataUser  = $this->m_global->get('acs_user',$join,$where,$select);
		$cek   	   = count($dataUser);
		$recaptcha = $this->input->post('g-recaptcha-response');
        $response  = $this->recaptcha->verifyResponse($recaptcha);
		$response  = [ 'success' => true];
		
		if ($cek == 1) {
			if(!isset($response['success']) || $response['success'] <> true){
				$data['status']  = 2;
				$data['message'] = 'Captcha not selected';
			}else{
				$id = md56($dataUser[0]->user_id);
				if($use_sha1_override === FALSE && $this->hash_method == 'bcrypt'){
					// SESSION KOSONG
					$bcrypt = $this->bcrypt->verify($post['user_password'],$dataUser[0]->user_password);
					if (!empty($bcrypt)) {
						// set session
						$this->trigger_events('pre_set_session');
						$this->session->set_userdata('acs_session', $dataUser[0]);
						$this->trigger_events('post_set_session');
						$this->session->unset_userdata('hasCaptcha');

						// set update terakhlogin && user_session
						$updt['user_last_login'] = time();
						$this->m_global->update('acs_user', $updt, [md56('user_id',1) => $id] );

						// set hapus login attempt
						if($this->config->item('track_login_attempts', 'ion_auth')){
							$old_attempts_expire_period = 86400;
							$old_attempts_expire_period = max($old_attempts_expire_period, $this->config->item('lockout_time', 'ion_auth'));

							if ($this->config->item('track_login_ip_address', 'ion_auth')){
								$count = time() - $old_attempts_expire_period;
								$this->m_global->delete('acs_login_attempts',['logatt_login' => $dataUser[0]->user_email, 'logatt_ip' => $dataUser[0]->user_ip_temp],'logatt_waktu < '.$count);
							}
						}

						// update kode pengingat (Remember Me)
						if (@$post['remember'] == 'on' && $this->config->item('remember_users', 'ion_auth')){
							$this->trigger_events('pre_remember_user');

							$ingat['user_remember_code'] = salt();
							$pengingat 				     = $this->m_global->update('acs_user',$ingat,[md56('user_id',1) => $id]);

							if($pengingat){
								if($this->config->item('user_expire', 'ion_auth') === 0){
									$expire = (60*60*24*365*2);
								}else{
									$expire = $this->config->item('user_expire', 'ion_auth');
								}

								set_cookie(array(
									'name'   => $this->config->item('identity_cookie_name', 'ion_auth'),
									'value'  => $dataUser[0]->user_email,
									'expire' => $expire
								));

								set_cookie(array(
									'name'   => $this->config->item('remember_cookie_name', 'ion_auth'),
									'value'  => salt(),
									'expire' => $expire
								));
							}
						}

						// $menu = 'Login';
						// $note = 'User with nopeg <b>'.getSession()->user_nopeg.'</b> successfully sign in to system';
						// log_activity($menu,$note);

						// REMOVE LOG GAGAL LOGIN
						// $this->m_global->delete('acs_log_loginx', ['logattmps_username' => $post['user_nopeg'], 'logattmps_ip' => $user_ip, 'logattmps_device' => $user_device]);
						$data['status'] = true;
					} else {

						$dataInsWhere 	= ['logattmps_username' => $post['user_nopeg'], 'logattmps_ip' => $user_ip, 'logattmps_device' => $user_device];
						// CEK COUNT USER
						$count_user_wrong 	= $this->m_global->count('acs_log_loginx', null, $dataInsWhere);

						if ($count_user_wrong <10) {
							// INSERT LOG GAGAL LOGIN
							$insertLogFailed 	= $this->m_global->insert('acs_log_loginx', $dataInsWhere);
							$data['status']   	= '0';
							$data['message'] 	= 'Account is wrong!';
						}else{
							$data['status']   	= '0';
							$data['message'] 	= 'Please contact Head Office!<br>Phone: +62 21 25601808';
						}
					}

				}else{
					// logic another magic encrypt library
					$data['status']   = '0';
					$data['message'] = "Library don't exist!";
				}

			}
		}else{
			$data['status']  = false;
			$data['message'] = 'Incorrect Emp No or password. Please try again.';
		}
		echo json_encode($data);

	}

	public function out(){
		$menu = 'Login';
		$note = 'User with nopeg <b>'.@getSession()->user_nopeg.'</b> successfully sign out from system';
		log_activity($menu,$note);

		$this->session->sess_destroy();

		redirect(base_url().'login');
	}

	function refresh(){
		$data['captcha'] 		= $this->recaptcha->getWidget();
		$data['script_captcha'] = $this->recaptcha->getScriptTag();

		echo $data['captcha'];
	}

	function bypas(){
		// get data user
		$join            = NULL;
		$xdata['record'] = $this->m_global->get('acs_user',$join,['user_status' => '1'],'user_nopeg,user_nama');

		$this->load->view('form_bypas',$xdata);
	}

	function apiRpx(){
		$wsdl   ="http://api.rpxholding.com/wsdl/rpxwsdl.php?wsdl";
		$client = new SoapClient($wsdl);
		$data = [
			"username" 			 	=> "demo",
			"password" 			 	=> "demo",
			"awb"                 	=> "799884373735",//"799884373680",
			"package_id"          	=> "KPP-SUB/VI/SO/2019-1",
			"order_type"          	=> 'OS',
			"order_number"        	=> "7773872341",
			"service_type_id"     	=> 'SDP',
			"shipper_account"     	=> '234098705',
			"shipper_name"        	=> "Andre Indrawari",
			"shipper_company"     	=> "PT ALim Rugi",
			"shipper_address1"    	=> "Jln. Kebagusan Raya no. 192",
			"shipper_address2"    	=> "",
			"shipper_kelurahan"   	=> "Kebagusan",
			"shipper_kecamatan"   	=> "Pasar Minggu",
			"shipper_city"        	=> "Jakarta Selatan",
			"shipper_state"       	=> "Jakarta",
			"shipper_zip"         	=> "12520",
			"shipper_phone"       	=> "021123321",
			"identity_no"         	=> "",
			"shipper_mobile_no"   	=> "08973950031",
			"shipper_email"       	=> "andre@mail.com",
			"consignee_account"   	=> "",
			"consignee_name"      	=> "Irfan Isma Somantri",
			"consignee_company"   	=> "PT Cendana Teknika Utama",
			"consignee_address1"  	=> "Jl Lenteng agung ",
			"consignee_address2"  	=> "",
			"consignee_kelurahan" 	=> "Lenteng Agung",
			"consignee_kecamatan" 	=> "Pasar Minggu",
			"consignee_city"      	=> "Jakarta Selatan",
			"consignee_state"     	=> "Jakarta",
			"consignee_zip"       	=> "12630",
			"consignee_phone"     	=> "0265544378",
			"consignee_mobile_no" 	=> "08973950031",
			"consignee_email"     	=> "irfan.isma@gmail.com",
			"desc_of_goods"       	=> 'Surat',
			"tot_package"         	=> "1",
			"actual_weight"       	=> "1",
			"tot_weight"          	=> "1",
			"tot_declare_value"   	=> "10000",
			"tot_dimensi"   	  	=> "1",
			"flag_mp_spec_handling" => "s1",
			"insurance"   			=> "1",
			"surcharge"   			=> "1",
			"high_value"   			=> "1",
			"value_docs"   			=> "1",
			"electronic"   			=> "1",
			"flag_dangerous_goods"  => "1",
			"flag_birdnest"   		=> "1",
			"declare_value"       	=> "1",
			"format"  			 	=> "json",
			"dest_store_id"  		=> "PAS",
			"dest_dc_id"  			=> "PAS",
			"widhtx"  			 	=> "PAS",
			"lengthx"  			 	=> "PAS",
			"heightx"  			 	=> "PAS"
		];

		pre($data);

		// getTrackingAWB
		// sendShipmentData

		try {
			$result = $client->getTrackingAWB(
				$data['username'],
				$data['password'],
				$data['awb'],
				// $data["package_id"],
				// $data["order_type"],
				// $data["order_number"],
				// $data["service_type_id"],
				// $data["shipper_account"],
				// $data["shipper_name"],
				// $data["shipper_company"],
				// $data["shipper_address1"],
				// $data["shipper_address2"],
				// $data["shipper_kelurahan"],
				// $data["shipper_kecamatan"],
				// $data["shipper_city"],
				// $data["shipper_state"],
				// $data["shipper_zip"],
				// $data["shipper_phone"],
				// $data["identity_no"],
				// $data["shipper_mobile_no"],
				// $data["shipper_email"],
				// $data["consignee_account"],
				// $data["consignee_name"],
				// $data["consignee_company"],
				// $data["consignee_address1"],
				// $data["consignee_address2"],
				// $data["consignee_kelurahan"],
				// $data["consignee_kecamatan"],
				// $data["consignee_city"],
				// $data["consignee_state"],
				// $data["consignee_zip"],
				// $data["consignee_phone"],
				// $data["consignee_mobile_no"],
				// $data["consignee_email"],
				// $data["desc_of_goods"],
				// $data["tot_package"],
				// $data["actual_weight"],
				// $data["tot_weight"],
				// $data["tot_declare_value"],
				// $data["tot_dimensi"],
				// $data["flag_mp_spec_handling"],
				// $data["insurance"],
				// $data["surcharge"],
				// $data["high_value"],
				// $data["value_docs"],
				// $data["electronic"],
				// $data["flag_dangerous_goods"],
				// $data["flag_birdnest"],
				// $data["declare_value"],
				$data["format"]
				// $data["dest_store_id"],
				// $data["dest_dc_id"],
				// $data["widhtx"],
				// $data["lengthx"],
				// $data["heightx"]
			);

			echo "<br/>";
			pre(json_decode($result));
		}catch ( Exception $e ) {
			echo $e->getMessage();
		}
	}

}

/* End of file Login.php */
/* Location: ./application/modules/login/controllers/Login.php */