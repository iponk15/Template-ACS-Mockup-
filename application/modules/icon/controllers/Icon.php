<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Icon extends MX_Controller {

	private $url       = 'icon';
	private $prefix    = 'icon_';
	private $pagetitle = 'Daftar Icon';
	private $table	   = 'wfm_icon';

	public function __construct(){
		parent::__construct();
	}

	function index(){
		$data['pagetitle'] = $this->pagetitle;
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), $this->pagetitle => base_url('icon')];
		$data['rcdFltcn']  = $this->m_global->get($this->table,null,['icon_tipe' => '1'],'icon_id,icon_label,icon_deskripsi',null,['icon_id', 'DESC']);
		$data['rcdFawsm']  = $this->m_global->get($this->table,null,['icon_tipe' => '2'],'icon_id,icon_label,icon_deskripsi',null,['icon_id', 'DESC']);
		$data['rcdLawsm']  = $this->m_global->get($this->table,null,['icon_tipe' => '3'],'icon_id,icon_label,icon_deskripsi',null,['icon_id', 'DESC']);
		$data['rcdScicn']  = $this->m_global->get($this->table,null,['icon_tipe' => '4'],'icon_id,icon_label,icon_deskripsi',null,['icon_id', 'DESC']);

		$this->templates->display($this->url, $data);
	}

	function show_add($tipe){
		$data['pagetitle'] 		= "Form Tambah";
		$data['subtitle']  		= '';
		$data['url']			= $this->url;
		$data['tipe'] 		    = $tipe;
		$data['breadcumb'] 		= ['index' => base_url('dashboard'), $this->pagetitle => base_url($this->url), 'Tambah Data' => base_url($this->url.'/show_add/'.$tipe)];

		$this->templates->display($this->url.'_add', $data);
	}

	function action_add($flag = null)
	{
		$post = $this->input->post();

		$this->form_validation->set_rules('icon_label', 'Label', 'trim|required|callback_label');

		if ($this->form_validation->run($this)) {
			$data[$this->prefix.'label']	   = strip_tags($post['icon_label']);
			$data[$this->prefix.'deskripsi']   = strip_tags($post['icon_deskripsi']);
			$data[$this->prefix.'tipe']        = strip_tags($post['icon_tipe']);
			$data[$this->prefix.'createdby']   = md56(getSession()->user_id);
			$data[$this->prefix.'createddate'] = date('Y-m-d H:i:s');
			$data[$this->prefix.'ip']          = getUserIP();
			$query 					   		   = $this->m_global->insert($this->table, $data);

			if(!empty($flag)){
				$last_id = md56($this->db->insert_id());
			}

			if ($query) {
				$response['status']  = 1;
				$response['message'] = 'Data berhasil disimpan';

				if(!empty($flag)){
					$response['custUrl'] = 'icon/show_edit/'.$last_id;
				}

			} else {
				$response['status']	 = 0;
				$response['message'] = 'Data gagal disimpan';
			}
		}else{
			$response['status']  = 2;
			$response['message'] = validation_errors();
		}

		echo json_encode($response);
	}

	function label($param){
		$cek = count($this->m_global->get($this->table, NULL, ['icon_label' => $param], 'icon_label'));

        if (!empty($cek)){
            $this->form_validation->set_message('label', 'Icon Flaticon <b>'.$param.'</b> sudah ada');
			return FALSE;
        }else{
            return TRUE;
        }
    }

	function show_edit($id){
		$select            = 'icon_id,icon_label,icon_deskripsi,icon_tipe';
		$data['records']   = $this->m_global->get($this->table, null, [md56($this->prefix.'id', 1) => $id],$select)[0];
		$data['id']		   = $id;
		$data['pagetitle'] = "Form Edit";
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), $this->pagetitle => base_url($this->url), "Edit Data" => base_url($this->url.'/show_edit/'.$id ) ];

		$this->templates->display($this->url.'_edit', $data);
	}

	function action_edit($id)
	{
		$post                            = $this->input->post();
		$data[$this->prefix.'deskripsi'] = strip_tags($post['icon_deskripsi']);
		$data[$this->prefix.'tipe']      = strip_tags($post['icon_tipe']);
		$data[$this->prefix.'updatedby'] = md56(getSession()->user_id);
		$data[$this->prefix.'ip']        = getUserIP();
		$query 							 = $this->m_global->update($this->table, $data, [md56($this->prefix.'id', 1) => $id]);

		if ($query) {
			$response['status']  = 1;
			$response['message'] = 'Data berhasil diubah';

			echo json_encode($response);
		} else {
			$response['status']	 = 0;
			$response['message'] = 'Data gagal diubah';

			echo json_encode($response);
		}
	}

	function action_delete($id)
	{
		$query = $this->m_global->delete($this->table, [md56($this->prefix.'id', 1) => $id]);

		if ($query) {
			$response['status']		= 1;
			$response['message']	= 'Data berhasil di hapus';
		} else {
			$response['status']		= 0;
			$response['message']	= 'Data gagal di hapus';
		}

		echo json_encode($response);
	}

	function change_status($id, $status)
	{
		if ($status == '1') {
			$data[$this->prefix.'status']	= '0';
		} else {
			$data[$this->prefix.'status']	= '1';
		}

		$query	= $this->m_global->update($this->table, $data, [md56($this->prefix.'id', 1) => $id]);

		if ($query) {
			$response['status']		= 1;
			$response['message']	= 'Succesfully';
		} else {
			$response['status']		= 0;
			$response['message']	= 'Failed';
		}

		echo json_encode($response);
	}

}

/* End of file Jenis_surat.php */
/* Location: ./application/modules/jenis_surat/controllers/Jenis_surat.php */