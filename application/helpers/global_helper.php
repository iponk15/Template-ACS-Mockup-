<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


	function generate_menu(){
		$CI 	   = &get_instance();
		$select    = 'menu_id,menu_nama,menu_controllers,menu_is_primary,menu_url,menu_sub_menu,menu_status,';
		$data_menu = $CI->m_global->get('cuti_config_menu',null,null,$select);

		return $data_menu;
	}

	function menu_role($param){
		$CI 	   = &get_instance();
		$select    = 'group_id,group_role_id,group_nama,group_deskripsi,group_ip_temp,group_data,group_controller,group_status';
		$data_menu = $CI->m_global->get('user_group',null,null,$select, ['group_role_id' => $param]);

		return $data_menu;
	}

	function isJSON($string){
	   return is_string($string) && is_array(json_decode($string, true)) ? true : false;
	}

	function genPass($string,$password){
		$CI 	= &get_instance();
		$key    = $CI->config->item('secret_key');
		$salt   = sha1(md5($string).$key);
		$hasil  = md5($salt.$password);

		return $hasil;
	}

	function is_ccanalyst($nopeg){
		$CI    = &get_instance();
		$hasil = $CI->m_global->count('cuti_admin',null,['admin_nopeg' => $nopeg]);

		return $hasil;
	}

	function info_ses($user_id){
		$CI   =& get_instance();
		$data = @$CI->m_global->get('user',NULL,['user_id' => $user_id])[0];

		return $data;
	}

	function getUserIP(){
        $client  = @$_SERVER['HTTP_CLIENT_IP'];
        $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
        $remote  = $_SERVER['REMOTE_ADDR'];

        if(filter_var($client, FILTER_VALIDATE_IP)){
            $ip = $client;
        }elseif(filter_var($forward, FILTER_VALIDATE_IP)){
            $ip = $forward;
        }else{
            $ip = $remote;
        }

        return $ip;
    }

    function state_color($param){
    	$list = ['1'=>'success','2'=>'warning','3'=>'danger','4'=>'info','5'=>'primary','6'=>'secondary'];

    	return $list[$param];
	}

	function olah($data){
		$decode  = json_decode($data);
		$menu    = [];
		$submenu = [];

		foreach ($decode as $key) {
			if($key->parent == '#'){
				$menu[] = ['text' => $key->text, 'ID' => $key->ID];
			}else{
				$submenu[] = ['text' => $key->text, 'parent' => $key->parent];
			}
		}

		pre($menu);
		pre($submenu);

		// return $hasil;

	}
		function some($data){
		$decode  = json_decode($data);
		$menu    = [];
		$submenu = [];

		foreach ($decode as $key) {
			if($key->parent == '#'){
				$menu[] = ['text' => $key->text, 'ID' => $key->ID,'child'=>array()];
			}else{
				$submenu[] = ['text' => $key->text, 'parent' => $key->parent];
			}
		}

		$ret = array($menu,$submenu);
		return $ret;

		// return $hasil;

	}

	function tab_menu ($primary, $controller, $uri, $paramChild){
		if ($primary == 1 && $controller == $uri) {
			return 'm-menu__item--active m-menu__item--active-tab';
		} elseif($primary == null && $controller != $uri && $paramChild==true) {
			return 'm-menu__item--active-tab';
		}

	}

	function valid_email($param) {
		return !!filter_var($param, FILTER_VALIDATE_EMAIL);
	}

	function umur($tanggal){
		// Format bulan-tanggal-tahun
		$birthDate = explode("-", $tanggal);
		$umur      = (date("md", date("U", mktime(0, 0, 0, $birthDate[0], $birthDate[1], $birthDate[2]))) > date("md") ? ((date("Y") - $birthDate[2]) - 1) : (date("Y") - $birthDate[2]));

		return $umur;
	}

	function unique_multidim_array($array, $key) {
		$temp_array = array();
		$i 			= 0;
		$key_array  = array();

		foreach($array as $val) {
			if (!in_array($val[$key], $key_array)) {
				$key_array[$i]  = $val[$key];
				$temp_array[$i] = $val;
			}
			$i++;
		}

		return $temp_array;
	}

	function getSession($field = ''){
		$CI   =& get_instance();

		if(!empty($field)){
			$result = ($CI->session->userdata('acs_session')->$field == '' ? '-' : $CI->session->userdata('acs_session')->$field);
		}else{
			$result = $CI->session->userdata('acs_session');
		}

		return $result;
	}

	function getCodeSendgrid(){
		$CI   =& get_instance();
		$code 	= $CI->m_global->get('has_config', null, ['config_kode' => 'SGD', 'config_limitemail > 0' => NULL], '*', null, null, '0', '1');
		return $code;
	}

	function kurangiEmail(){
	    $CI         = &get_instance();
	    $getConf    = $CI->m_global->get('has_config', null, ['config_kode' => 'SGD', 'config_limitemail > 0' => NULL], '*', null, null, '0', '1');
	    $update     = null;
	    if (!empty($getConf)) {
	        $id          = $getConf[0]->config_id;
	        $data['config_limitemail']  = $getConf[0]->config_limitemail - 1;

	        $update  = $CI->m_global->update('has_config', $data, ['config_id' => $id]);

	        return $update;
	    }else{
	        return $update;
	    }
	}

	function templateEmail($param){
		$token = getCodeSendgrid();
		$code  = (empty($token) ? '' : $token[0]->config_temp);;
		$email = new \SendGrid\Mail\Mail();
		$email->setFrom($param['from'], "Station Manager BO ".$param['bo']);
		$email->setSubject($param['subject']);
		$email->addTo($param['email'], '');
		$email->addContent("text/plain", ($param['mesage'] == '' ? ' ' : $param['mesage']));
		// $email->addContent("text/html", "<strong>and easy to do anywhere, even with PHP</strong>");

		if(!empty($param['path'])){
			$path = explode('/',$param['path']);
			$file_encoded = base64_encode(file_get_contents($param['path']));
			$email->addAttachment(
				$file_encoded, //file path
				"application/pdf", //Header file
				end($path), //Name file yg dikirim di attachment
				"attachment"
			);
		}

		$sendgrid = new \SendGrid($code);

		try {
			$response = $sendgrid->send($email);
			// print $response->statusCode() . "\n";
			// print_r($response->headers());
			// print $response->body() . "\n";
			// echo $response->statusCode();exit;
			if($response->statusCode() == '202'){
				kurangiEmail();
				return $data['status'] = '1';
			}else{
				return $data['status'] = '0';
			}

		} catch (Exception $e) {
			echo 'Caught exception: '. $e->getMessage() ."\n";
			return $data['status'] = '0';
		}
	}

	function captcha(){
		$CI   =& get_instance();
		$vals = array(
			'img_path'      => FCPATH.'assets/captcha/',
			'img_url'       => base_url('assets/captcha'),
			'img_width'     => '200',
			'img_height'    => 40,
			'expiration'    => 7200,
			'word_length'   => 3,
			'font_size'     => 300,
			'img_id'        => 'Imageid',
			'pool'          => '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',

			// White background and border, black text and red grid
			'colors'        => array(
					'background' => array(255, 255, 255),
					'border'     => array(255, 255, 255),
					'text'       => array(0, 0, 0),
					'grid'       => array(255, 40, 40)
			)
		);

		$cap    = create_captcha($vals);
		$result = ['capImage' => $cap['image'], 'capWord' => $cap['word'], 'capTime' => $cap['time']];

		return $result;
	}

	function log_activity($menu,$note,$addtnl = ''){
		$CI =& get_instance();

		$role 				          = [1 => 'Superadmin',2 => 'KK',3 => 'AA','5' => 'Admin'];
		$logA['logAct_menu']          = $menu;
		$logA['logAct_emp']           = getSession('user_nopeg');
		$logA['logAct_note']          = $note;
		$logA['logAct_role']          = getSession('user_role_id');
		$logA['logAct_ip']            = getUserIP();
		$logA['logAct_date']          = date('Y-m-d H:i:s');
		$logA['logAct_flag']          = (!empty($addtnl) ? 2 : 1);
		$logA['logAct_device']        = gethostname();
		$logA['logAct_flight_no']     = (!empty($addtnl) ? $addtnl['flight_no'] : null );
		$logA['logAct_flight_status'] = (!empty($addtnl) ? $addtnl['flight_status'] : null );
		$query 				          = $CI->m_global->insert('acs_log_activity', $logA);

		return true;
	}

	function salt(){
		$CI 		  =& get_instance();
		$raw_salt_len = 16;
		$buffer 	  = '';
		$buffer_valid = FALSE;

		if (function_exists('random_bytes')){
			$buffer = random_bytes($raw_salt_len);
			if ($buffer){
				$buffer_valid = TRUE;
			}
		}

		if (!$buffer_valid && function_exists('mcrypt_create_iv') && !defined('PHALANGER')){
			$buffer = mcrypt_create_iv($raw_salt_len, MCRYPT_DEV_URANDOM);
			if ($buffer){
				$buffer_valid = TRUE;
			}
		}

		if (!$buffer_valid && function_exists('openssl_random_pseudo_bytes')){
			$buffer = openssl_random_pseudo_bytes($raw_salt_len);
			if ($buffer){
				$buffer_valid = TRUE;
			}
		}

		if (!$buffer_valid && @is_readable('/dev/urandom')){
			$f    = fopen('/dev/urandom', 'r');
			$read = strlen($buffer);

			while ($read < $raw_salt_len){
				$buffer .= fread($f, $raw_salt_len - $read);
				$read    = strlen($buffer);
			}

			fclose($f);

			if ($read >= $raw_salt_len){
				$buffer_valid = TRUE;
			}
		}

		if (!$buffer_valid || strlen($buffer) < $raw_salt_len){
			$bl = strlen($buffer);
			for ($i = 0; $i < $raw_salt_len; $i++){
				if ($i < $bl){
					$buffer[$i] = $buffer[$i] ^ chr(mt_rand(0, 255));
				}else{
					$buffer .= chr(mt_rand(0, 255));
				}
			}
		}

		$salt = $buffer;

		// encode string with the Base64 variant used by crypt
		$base64_digits   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
		$bcrypt64_digits = './ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		$base64_string 	 = base64_encode($salt);
		$salt 			 = strtr(rtrim($base64_string, '='), $base64_digits, $bcrypt64_digits);
		$salt 		     = substr($salt, 0, $CI->config->item('salt_length', 'ion_auth'));

		return $salt;
	}

	function hash_password($password, $salt = FALSE, $use_sha1_override = FALSE){
		$CI =& get_instance();
		if (empty($password)){
			return FALSE;
		}

		// bcrypt
		if ($use_sha1_override === FALSE && $CI->config->item('hash_method', 'ion_auth') == 'bcrypt'){
			return $CI->bcrypt->hash($password);
		}

		if ($CI->store_salt && $salt){
			return sha1($password . $salt);
		}else{
			$salt = $CI->salt();
			return $salt . substr(sha1($salt . $password), 0, -$CI->config->item('salt_length', 'ion_auth'));
		}
	}

	function getTotalDaysOfCurentYears(){
		$year  = date('Y');
		$bulan = ['01','02','03','04','05','06','07','08','09','10','11','12'];
		$sum   = 0;

		foreach ($bulan as $arr){
			$sum+= date('t', strtotime($year.'-'.$arr));
		};

		return $sum;
	}

	function reformat_date($date){
		$exp = explode('/', $date);
		$newDate = $exp[1].'/'.$exp[0].'/'.$exp[2];
		return $newDate;
	}
	
	function db_escape($param = ''){
		$CI =& get_instance();
		
		return $CI->db->escape($param);
	}

	function path(){
		$exp = explode('/', $_SERVER['SCRIPT_FILENAME']);
		array_pop($exp);
		$imp = implode('/', $exp);
		return $imp;
	}

	function form_paging($table,$field_id,$where){
		$CI =& get_instance();

		// get data id
		$id = $CI->m_global->get($table,null,$where,$field_id);
		
		if(!empty($id)){
			// get data previous
			$we_next      = $field_id.' = ( SELECT MIN('.$field_id.') FROM '.$table.' WHERE '.$field_id.' > '.$id[0]->$field_id.')';
			$prev         = $CI->m_global->get($table,null,null,$field_id,$we_next);
			$data['prev'] = (!empty($prev) ? md56($prev[0]->$field_id) : null);

			// get data next
			$we_next      = $field_id.' = ( SELECT MAX('.$field_id.') FROM '.$table.' WHERE '.$field_id.' < '.$id[0]->$field_id.')';
			$next         = $CI->m_global->get($table,null,null,$field_id,$we_next);
			$data['next'] = (!empty($next) ? md56($next[0]->$field_id) : null);

			// order current data
			$sltJoin      = '(SELECT
								@curRow := @curRow + 1 AS row_number,
								a.'.$field_id.'
							FROM '.$table.' a
							JOIN (SELECT @curRow := 0) r
							ORDER BY a.'.$field_id.' DESC) temp ';
			$join         = [ [$sltJoin,'b.'.$field_id.' = temp.'.$field_id,'left'] ];
			$codr_where   = [ 'b.'.$field_id => $id[0]->$field_id ];
			$getCurrnt    = $CI->m_global->get($table.' b',$join,$codr_where,'temp.row_number');
			$data['codr'] = $getCurrnt[0]->row_number;

			// jml data 
			$data['juml'] = $CI->m_global->count($table);

			return $data;
		}else{
			return FALSE;
		}
	}

	function ubah_status_order($table,$where,$where_id,$url='',$flag='',$arrChild = ''){
		$CI    =& get_instance();
		$getDt = $CI->m_global->get($table,null,$where_id,'order_status');

		if(!empty($getDt)){
			if($getDt[0]->order_status == '1'){
				$mes_suc = 'Konfirmasi data berhasil';
				$mes_fld = 'Gagal mengkonfirmasi data';
			}else if($getDt[0]->order_status == '2'){
				$mes_suc = 'Data berhasil dikirim';
				$mes_fld = 'Data gagal dikirim';
			}else if($getDt[0]->order_status == '3'){
				$mes_suc = 'Data berhasil diterima';
				$mes_fld = 'Data gagal diterima';
			}

			$upOrd = $CI->m_global->update($table,$where,$where_id);

			if(empty($flag)){
				$upSrt = TRUE;
			}else{
				$upSrt = $CI->m_global->update($arrChild['table'],$arrChild['where'],$arrChild['whereId']);
				
				if($upSrt){
					$getSurat = $CI->m_global->get($arrChild['table'],$arrChild['join'],$arrChild['whereId'],$arrChild['select']);
					$send     = sendShipmentData($getSurat);
				}
			}

			if ($upOrd && $upSrt) {
				$data['status']  = 1;
				$data['message'] = $mes_suc;

				if(!empty($url)){
					$data['custUrl'] = $url;
				}
			} else {
				$data['status']  = 0;
				$data['message'] = $mes_fld;
			}
		}else{
			$data['status']  = 0;
			$data['message'] = 'Data Order ini tidak di temukan';
		}
		
		return json_encode($data);
	}

	function abbreviate( $strString, $intLength = NULL ) {
        $defaultAbbrevLength = 8;
        $strString           = preg_replace("/[^A-Za-z0-9]/", '', $strString);	
        $strString           = ucfirst( $strString );				
		$stringIndex         = 0;
        $uppercaseCount      = preg_match_all('/[A-Z]/', $strString, $uppercaseLetters, PREG_OFFSET_CAPTURE);	
        $targetLength        = isset( $intLength ) ? intval( $intLength ) : $defaultAbbrevLength;        		  
        $uppercaseCount      = $uppercaseCount > $targetLength ? $targetLength : $uppercaseCount; 			      	
        $targetWordLength    = round( $targetLength / intval( $uppercaseCount ) );								              
        $abbrevLength        = 0;		    
        $abbreviation        = '';		    
        
        for($i = 0; $i < $uppercaseCount; $i++) {
            $ucLetters[] = $uppercaseLetters[0][$i][0];
		}
		
        $characterDeficit = 0;	            
		$wordIndex 		  = $targetWordLength;			
		
        while( $stringIndex < strlen( $strString ) ) {	
            if( $abbrevLength >= $targetLength ) 		      
                break;
			
			$currentChar = $strString[ $stringIndex++ ];	

            if( in_array( $currentChar, $ucLetters ) ) { 	       
                $characterDeficit += $targetWordLength - $wordIndex;	
                $wordIndex = 0;											                  
            } else if( $wordIndex >= $targetWordLength ) {
                if( $characterDeficit == 0 )                
                    continue;
                else
                    $characterDefecit--;	                    
			}
			
            $abbreviation .= $currentChar;	
            $abbrevLength++;				        
            $wordIndex++;					          
		}
		
        echo $abbreviation;
	}
	
	function sendShipmentData($data){
		$CI      =& get_instance();
		$wsdl    ="http://api.rpxholding.com/wsdl/rpxwsdl.php?wsdl";
		$client  = new SoapClient($wsdl);
		$select  = 'unit_nama,unit_alamat,unit_kelurahan,unit_kecamatan,unit_kota,unit_provinsi,unit_kode_pos,unit_no_tlp,unit_hp,unit_email';
		$getUnit = $CI->m_global->get('acs_unit_kerja',null,['unit_id' => getSession('unit_id')],$select);
		$param   = [];

		if(!empty($getUnit)){
			$dataUnit = $getUnit[0];
		}else{
			$dataUnit = [];
		}

		foreach ($data as $value) {
			try {
				$result = $client->sendShipmentData( 
					"demo", //$data['username'],
					"demo", //$data['password'],
					"", //$data['awb'],
					$value->surat_nomor, //$data["package_id"],
					"OS", //$data["order_type"],
					$value->surat_npwp, //$data["order_number"],
					"SDP", //$data["service_type_id"],
					"234098705", //$data["shipper_account"],
					getSession('user_nama'), //$data["shipper_name"],
					$dataUnit->unit_nama, //$data["shipper_company"],
					$dataUnit->unit_alamat, //$data["shipper_address1"],
					"", //$data["shipper_address2"],
					$dataUnit->unit_kelurahan, //$data["shipper_kelurahan"],
					$dataUnit->unit_kecamatan, //$data["shipper_kecamatan"],
					$dataUnit->unit_kota, //$data["shipper_city"],
					$dataUnit->unit_provinsi, //$data["shipper_state"],
					$dataUnit->unit_kode_pos, //$data["shipper_zip"],
					$dataUnit->unit_no_tlp, //$data["shipper_phone"],
					"", //$data["identity_no"],
					$dataUnit->unit_hp, //$data["shipper_mobile_no"],
					$dataUnit->unit_email, //$data["shipper_email"],
					"", //$data["consignee_account"],
					$value->surat_wp, //$data["consignee_name"],
					$value->surat_nama_usaha, //$data["consignee_company"],
					$value->surat_alamat, //$data["consignee_address1"],
					"", //$data["consignee_address2"],
					$value->surat_kelurahan, //$data["consignee_kelurahan"],
					$value->surat_kecamatan, //$data["consignee_kecamatan"],
					$value->surat_kota, //$data["consignee_city"],
					$value->surat_kota, //$data["consignee_state"],
					"", //$data["consignee_zip"],
					"", //$data["consignee_phone"],
					"", //$data["consignee_mobile_no"],
					"", //$data["consignee_email"],
					"", //$data["desc_of_goods"],
					"1", //$data["tot_package"],
					"1", //$data["actual_weight"],
					"1", //$data["tot_weight"],
					$value->surat_biaya, //$data["tot_declare_value"],
					"", //$data["tot_dimensi"],
					"", //$data["flag_mp_spec_handling"],
					"", //$data["insurance"],
					"", //$data["surcharge"],
					"", //$data["high_value"],
					"", //$data["value_docs"],
					"", //$data["electronic"],
					"", //$data["flag_dangerous_goods"],
					"", //$data["flag_birdnest"],
					$value->surat_biaya, //$data["declare_value"],
					"json", //$data["format"],
					"", //$data["dest_store_id"],
					"", //$data["dest_dc_id"],
					"", //$data["widhtx"],
					"", //$data["lengthx"],
					"" //$data["heightx"] 
				);

				$param [] = ['surat_id' => $value->surat_id, 'return_rpx' => $result];
			}catch ( Exception $e ) {
				echo $e->getMessage();
			}
		}

		foreach ($param as $key) {
			$dec    = json_decode($key['return_rpx']);
			$awb    = $dec->RPX->DATA[0]->AWB_RETURN;
			$update = $CI->m_global->update('acs_surat',['surat_awb' => $awb],['surat_id' => $key['surat_id']]);
		}

		return true;
	}

	function logsNote($note){
		json_decode($note);
		$isJson = (json_last_error() == JSON_ERROR_NONE);
		 
		if($isJson == '1'){
			$jsonDec = json_decode($note);
			$html    = '<div class="m-list-timeline m-list-timeline--skin-light">
							<div class="m-list-timeline__items">';
			foreach ($jsonDec as $key => $value) {
				$html .= '		<div class="m-list-timeline__item">
									<span class="m-list-timeline__badge m-list-timeline__badge--info"></span>
									<span class="m-list-timeline__text">'.$key.' : '.$value.'</span>
								</div>';
			}

			$html .= '		</div>
						</div>';

		}else{
			$html = $note;
		}

		return $html;
	}

	function getFieldNama($id,$array){
		$CI      =& get_instance();
		$getData = $CI->m_global->get($array[0],null,[$array[1] => $id],$array[2]);
		$fieldNm = $array[2];

		if(!empty($getData)){
			return $getData[0]->$fieldNm;
		}else{
			return '-';
		}
	}
?>