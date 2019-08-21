<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require 'vendor/autoload.php';
class Role extends MX_Controller {

	private $url            = 'role';
	private $prefix         = 'role_';
	private $pagetitle      = 'Daftar Role';
	private $table			= 'acs_role';

	public function __construct(){
		parent::__construct();
	}

	function index(){
		$data['pagetitle'] 		= $this->pagetitle;
		$data['subtitle']  		= '';
		$data['url']			= $this->url;
		$data['breadcumb'] 		= ['index' => base_url('dashboard'), $this->pagetitle => null];

		$this->templates->display($this->url, $data);
	}

	function select()
	{
		$join    = null;
        $where   = null;
        $where_e = null;
        $group   = null;
        $paging  = $_REQUEST['pagination'];

        if (empty($_REQUEST['query'])) {
            $search  = [];
        }else{
            $search  = $_REQUEST['query'];
        }

        $order   = (isset($_REQUEST['sort']) ? [ $_REQUEST['sort']['field'], $_REQUEST['sort']['sort'] ] : ['role_id', 'DESC']);

        // setting pencarian data
        if(!empty($search)){
            foreach ($search as $value => $param) {
                if($value == 'generalSearch'){
                    $where_e = '('.$this->prefix.'kode like "%'.$param.'%" OR '.$this->prefix.'nama like "%'.$param.'%")';
                }else{
                    $where[$value] = $param;
                }
            }
            $awal = null;
        }else{
            $where   = null;
            $where_e = null;
        }

        // setting pagging
        $start = intval($paging['page']);
        $limit = intval($paging['perpage']);
        $awal  = ($start == 1 ? '0' : ($start * $limit) - $limit);


        // set record data
        $select          = 'role_id,role_nama,role_deskripsi,role_status,role_lastupdate';
        $data['total']   = $this->m_global->count($this->table,$join,$where,$where_e,$group);
		$result          = $this->m_global->get($this->table,$join,$where,$select,$where_e,$order,$awal,$limit,$group);
        $data['records'] = array();
		$i               = 1 + $awal;

        foreach ($result as $key => $value) {

            $data['records'][] = [
                'no'         	  => $i++,
                'role_nama' 	  => $value->role_nama,
                'role_deskripsi'  => $value->role_deskripsi,
				'role_status'     => ($value->role_status == '1' ? '<span><span class="m-badge  m-badge--success m-badge--wide">Active</span></span>' : '<span><span class="m-badge  m-badge--danger m-badge--wide">Inactive</span></span>' ),
                'role_lastupdate' => date('d F Y - H:i:s', strtotime($value->role_lastupdate)),
                'action'          => '<a href="'.base_url($this->url.'/change_status/'.md56($value->role_id).'/'.$value->role_status).'" onClick="return f_status(1, this, event)" class="m-portlet__nav-link btn m-btn m-btn--hover-'.($value->role_status == "1" ? "brand" : "focus").' m-btn--icon m-btn--icon-only m-btn--pill change_status" title="Change Status">
											<i class="la la-eye"></i>
										</a>
										<a href="'.base_url($this->url.'/show_edit/'.md56($value->role_id)).'" data-table="disres" data-toggle="modal" class="ajaxify m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill edit_data" title="Edit details">
											<i class="la la-edit"></i>
										</a>
										<a href="'.base_url($this->url.'/action_delete/'.md56($value->role_id)).'" onClick="return f_status(2, this, event)" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete">
											<i class="la la-trash"></i>
										</a>',
			];
        }

        $encode = (object)[
            'meta' => ['page' => $start, 'pages' => null, 'perpage' => $limit, 'total' => $data["total"], 'sort' => 'asc', 'field' => $this->prefix.'id'],
            'data' =>  $data['records']
        ];

        echo json_encode($encode);
	}

	function show_add(){
		$data['pagetitle'] 		= "Form Tambah";
		$data['subtitle']  		= '';
		$data['url']			= $this->url;
		$data['breadcumb'] 		= ['index' => base_url('dashboard'), $this->pagetitle => base_url($this->url), 'Tambah Data' => base_url($this->url.'/show_add')];

		$this->templates->display($this->url.'_add', $data);
	}

	function action_add($flag = null)
	{
		$post = $this->input->post();
		
		$this->form_validation->set_rules('role_nama', 'Nama role', 'trim|required');
		$this->form_validation->set_rules('val_jstree', 'Menu ', 'trim|required');

		if ($this->form_validation->run($this)) {
			$val_jstree = json_decode($post['val_jstree']);
			$id_menu = array_column($val_jstree, 'id');
			$parent_menu = array_column($val_jstree, 'parent');
			$group_menu_id = array_unique(array_merge($id_menu, $parent_menu));

			$this->db->trans_begin();
			/*BEGIN INSERT KE TABLE ROLE*/
			$data['role_nama']			= strip_tags($post['role_nama']);
			$data['role_deskripsi']		= strip_tags($post['role_deskripsi']);
			$data['role_createdby']		= getSession()->user_id;
			$data['role_createddate']	= date('Y-m-d H:i:s');
			$data['role_ip']		 	= getUserIP();
			$insert = $this->m_global->insert($this->table,$data);
			$insert_id = $this->db->insert_id();
			/*END INSERT KE TABLE ROLE*/

			/*BEGIN INSERT KE TABLE GROUP*/
			$data = [];
			foreach ($group_menu_id as $menu_id) {
				$data['group_role']			= $insert_id;
				$data['group_menu_id']		= $menu_id;
				$data['group_createdby']	= getSession()->user_id;
				$data['group_createddate']	= date('Y-m-d H:i:s');
				$data['group_ip']		 	= getUserIP();
				$batch[]		= $data;
			}
			$insert_batch = $this->db->insert_batch('acs_', $batch);
			/*END INSERT KE TABLE GROUP*/

			if ($this->db->trans_status() === TRUE) {
				$this->db->trans_commit();
				$response['status']  = 1;
				$response['message'] = 'Data berhasil disimpan';				
			} else {
				$this->db->trans_rollback();
				$response['status']	 = 0;
				$response['message'] = 'Data gagal disimpan';
			}
		}else{
			$response['status']  = 2;
			$response['message'] = 'Pilih salah satu menu!';
		}

		echo json_encode($response);
	}

	function preview_menu($role_id = null){
		if(isset($_GET['operation'])) {
		   try {
		     $result = null;
		     
		     switch($_GET['operation']) {
		       case 'get_node':
		       	 $group_menu_id = [];
		         $node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
		         $join = $role_id ? [['acs_group', 'group_role = role_id', 'left'], ['acs_menu', 'menu_id = group_menu_id', 'left']] : NULL;
		         $where = $role_id ? [md56('group_role',1) => $role_id] : NULL;
		         $data = $this->m_global->get('acs_menu', NULL, NULL, 'menu_id id, menu_link name, menu_nama text, IF(menu_parent IS NULL, 0, menu_parent) parent_id, menu_icon icon, menu_link', null, ['menu_order', 'ASC']);
		         if ($role_id) {
		         	$selectMenu = $this->m_global->get('acs_role', $join, $where, 'acs_group.*');
		         	$group_menu_id = array_column($selectMenu, 'group_menu_id');
		         }

		         $itemsByReference = array();
		         /*BEGIN BUILD STRUKTUR DATA*/
		         foreach($data as $key => $item) {
		            $itemsByReference[$item->id] = $item;
		            $itemsByReference[$item->id]->icon = $item->icon == '' ? '' : 'flaticon-'.$item->icon;
		            $itemsByReference[$item->id]->state = in_array($item->id, $group_menu_id) ? ($item->menu_link == '' && $item->parent_id == 0 ? array('opened' => !0) : array('selected' => !0)) : '';
		            $itemsByReference[$item->id]->children = array();
		            $itemsByReference[$item->id]->data = new StdClass();
		         }
		         /*END BUILD STRUKTUR DATA*/
		  
		         /*BEGIN SET GROUP CHILDREN YANG SESUAI DENGAN PARENT*/
		         foreach($data as $key => &$item)
		            if($item->parent_id && isset($itemsByReference[$item->parent_id]))
		             $itemsByReference [$item->parent_id]->children[] = &$item;
		         /*END SET GROUP CHILDREN YANG SESUAI DENGAN PARENT*/
		  
		         /*BEGIN HAPUS CHILD YANG TIDAK SESUAI DENGAN PARENT*/
		         foreach($data as $key => &$item) {
		            if($item->parent_id && isset($itemsByReference[$item->parent_id]))
		             unset($data[$key]);
		         }
		         /*END HAPUS CHILD YANG TIDAK SESUAI DENGAN PARENT*/
		         
		         $result = array_values($data);
		         break;
		       default:
		         throw new Exception('Unsupported operation: ' . $_GET['operation']);
		         break;
		     }
		     header('Content-Type: application/json; charset=utf-8');
		     echo json_encode($result);
		   }
		   catch (Exception $e) {
		     header($_SERVER["SERVER_PROTOCOL"] . ' 500 Server Error');
		     header('Status:  500 Server Error');
		     echo $e->getMessage();
		   }
		   die();
		 }
	}

	function show_edit($id,$kat = null){
		$select            = '*';
		$data['records']   = $this->m_global->get($this->table, null, [md56($this->prefix.'id', 1) => $id],$select)[0];
		$data['id']		   = $id;
		$data['pagetitle'] = (!empty($kat) ? "Form Duplikat" : "Form Edit");
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), 'Daftar Jenis Surat' => base_url($this->url), (!empty($kat) ? "Duplikasi Data" : "Edit Data") => base_url($this->url.'/show_edit/'.$id. (!empty($kat) ? '/'.$kat : '') ) ];
		$data['frm_pging'] = form_paging($this->table,'role_id',[md56($this->prefix.'id', 1) => $id]);
		$data['form_kat']  = $kat;

		$this->templates->display($this->url.'_edit', $data);
	}

	function action_edit($id)
	{
		$post = $this->input->post();
		
		$this->form_validation->set_rules('role_nama', 'Nama role', 'trim|required');
		$this->form_validation->set_rules('val_jstree', 'Menu', 'trim|required');

		if ($this->form_validation->run($this)) {
			$val_jstree    = json_decode($post['val_jstree']);
			$id_menu 	   = array_column($val_jstree, 'id');
			$parent_menu   = array_column($val_jstree, 'parent');
			$group_menu_id = array_unique(array_merge($id_menu, $parent_menu));

			$this->db->trans_begin();
			/*BEGIN UPDATE KE TABLE ROLE*/
			$data['role_nama']	    = strip_tags($post['role_nama']);
			$data['role_deskripsi']	= strip_tags($post['role_deskripsi']);
			$data['role_updatedby']	= getSession()->user_id;
			$data['role_ip']		= getUserIP();
			$insert 			    = $this->m_global->update($this->table, $data, [md56('role_id',1) => $id]);
			$role_id 				= $this->m_global->get($this->table, null, [md56('role_id',1) => $id], 'role_id')[0]->role_id;
			/*END UPDATE KE TABLE ROLE*/

			/*BEGIN INSERT DELETE KE TABLE GROUP*/
			$delete = $this->m_global->delete('acs_group', [md56('group_role',1) => $id]);
			$data = [];
			// pre($group_menu_id,1);
			foreach ($group_menu_id as $menu_id) {
				$data['group_role']		   = $role_id;
				$data['group_menu_id']	   = $menu_id;
				$data['group_createdby']   = getSession()->user_id;
				$data['group_createddate'] = date('Y-m-d H:i:s');
				$data['group_ip']		   = getUserIP();
				$batch[]				   = $data;
			}
			$insert_batch = $this->db->insert_batch('acs_group', $batch);
			/*END INSERT DELETE KE TABLE GROUP*/

			if ($this->db->trans_status() === TRUE) {
				$this->db->trans_commit();
				$response['status']  = 1;
				$response['message'] = 'Data berhasil diubah';				
			} else {
				$this->db->trans_rollback();
				$response['status']	 = 0;
				$response['message'] = 'Data gagal diubah';
			}
		}else{
			$response['status']  = 2;
			$response['message'] = 'Pilih salah satu menu!';
		}

		echo json_encode($response);
	}

	function action_delete($id)
	{
		$query = $this->m_global->delete($this->table, [md56($this->prefix.'id', 1) => $id]);

		if ($query) {
			$response['status']		= 1;
			$response['message']	= 'Succesfully';
		} else {
			$response['status']		= 0;
			$response['message']	= 'Failed';
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