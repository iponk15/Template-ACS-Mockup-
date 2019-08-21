<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	private $url = 'dashboard';

	public function __construct(){
		parent::__construct();
	}

	function index(){
		$data['pagetitle'] = 'Dashboard';
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), 'Dashboard' => base_url('dashboard')];

		// get data role
		$getDataRole  = $this->m_global->get('acs_role',null,['role_id' => getSession('user_role_id'),'role_nama']);
		$data['role'] = (!empty($getDataRole) ? $getDataRole[0]->role_nama : '-');

		$this->templates->display('dashboard', $data);
	}

	function detail(){
		$data['pagetitle'] = 'Detail Page';
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), 'Dashboard' => base_url('dashboard'), 'Detail' => base_url('dashboard/detail')];

		$this->templates->display('detail', $data);
	}

	function backupstore(){
		$data['pagetitle'] = 'Backup Store Page';
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), 'Dashboard' => base_url('dashboard'), 'Detail' => base_url('dashboard/detail'), 'Backup Store' => base_url('dashboard/backupstore')];

		$this->templates->display('backupstore', $data);
	}

	function floating(){
		$data['pagetitle'] = 'Floating Page';
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), 'Dashboard' => base_url('dashboard'), 'Detail' => base_url('dashboard/detail'), 'Backup Store' => base_url('dashboard/backupstore'), 'Floating' => base_url('dashboard/floating')];

		$this->templates->display('floating', $data);
	}

	function uplift(){
		$data['pagetitle'] = 'Uplift Page';
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), 'Dashboard' => base_url('dashboard'), 'Detail' => base_url('dashboard/detail'), 'Backup Store' => base_url('dashboard/backupstore'), 'Floating' => base_url('dashboard/floating'), 'Uplift' => base_url('dashboard/uplift')];

		$this->templates->display('uplift', $data);
	}
}

/* End of file Dashboard.php */
/* Location: ./application/modules/dashboard/controllers/Dashboard.php */