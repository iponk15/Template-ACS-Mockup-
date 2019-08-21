<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Menu extends MX_Controller {

	private $url       = 'menu';
	private $prefix    = 'menu_';
	private $pagetitle = 'Daftar Menu';
	private $table	   = 'acs_menu';

	public function __construct(){
		parent::__construct();
	}

	function index(){
		$data['pagetitle'] = $this->pagetitle;
		$data['subtitle']  = '';
		$data['url']	   = $this->url;
		$data['breadcumb'] = ['index' => base_url('dashboard'), $this->pagetitle => $this->url];

		$this->templates->display($this->url, $data);
	}

	function preview_menu(){
		if(isset($_GET['operation'])) {
		   try {
		     $result = null;
		     
		     switch($_GET['operation']) {
		       case 'get_node':
		         $node  		   = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
		         $order 		   = ['menu_order', 'ASC'];
		         $data             = $this->m_global->get('acs_menu', null, null, 'menu_id id, menu_link name, menu_nama text, IF(menu_parent IS NULL, 0, menu_parent) parent_id, menu_icon icon, menu_link', null, $order);
		         $itemsByReference = array();
		         /*BEGIN BUILD STRUKTUR DATA*/
		         foreach($data as $key => $item) {
		         	$style['style']						   = $item->menu_link == '' ? '' : 'text-decoration: underline';
		            $itemsByReference[$item->id] 		   = $item;
		            $itemsByReference[$item->id]->icon     = $item->icon == '' ? '' : 'flaticon-'.$item->icon;
		            $itemsByReference[$item->id]->a_attr   = $style;
		            $itemsByReference[$item->id]->children = array();
		            $itemsByReference[$item->id]->data 	   = new StdClass();
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
		       case 'create_node':
		         $node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
		         
		         $nodeText = isset($_GET['text']) && $_GET['text'] !== '' ? $_GET['text'] : '';
		         $dataIns['menu_nama']		= $nodeText;
		         $dataIns['menu_parent']	= $node;
		         $dataIns['menu_order']		= $_GET['position'];
		         $dataIns['menu_createdby']	= getSession()->user_id;
		         $dataIns['menu_createddate']	= date('Y-m-d H:i:s');
		         $dataIns['menu_ip']	= getUserIP();
		         $insert = $this->m_global->insert('acs_menu', $dataIns);
		         $last_id 	= $this->db->insert_id();

		         
		         $result = array('id' => $last_id);
		  
		         break;
		       case 'rename_node':
		         $node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
		         //print_R($_GET);
		         $nodeText = isset($_GET['text']) && $_GET['text'] !== '' ? $_GET['text'] : '';
		         $dataUpt['menu_nama']		= $nodeText;
		         $update = $this->m_global->update('acs_menu', $dataUpt, ['menu_id' => $node]);
		         break;
		       case 'delete_node':
		         $node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
		         $delete = $this->m_global->delete('acs_menu', ['menu_id' => $node]);
		         $del_child = $this->m_global->delete('acs_menu', ['menu_parent' => $node]);
		         break;
		       case 'move_node':
		       	 $this->db->trans_begin();
		         $node = isset($_GET['id']) && $_GET['id'] !== '#' ? (int)$_GET['id'] : 0;
		         $parent = $_GET['parent'] === '#' ? NULL : $_GET['parent'];
		         $position = $_GET['position'];
		         $old_position = $_GET['old_position'];
		         
		         /*END GET DATA MENU YANG PARENT SAMA DAN ORDER LEBIH DARI*/
		         $dataUpt['menu_parent'] = $parent;
		         $dataUpt['menu_order']	 = $position;

		         $update = $this->m_global->update('acs_menu', $dataUpt, ['menu_id' => $node]);
		         /*BEGIN GET MENU YANG SUDAH DI UPDATE*/

		         /*BEGIN GET DATA MENU & BUILD ARRAY AFTER UPDATE MENU ORDER NODE YANG DI DRAG*/
		         $NewMenu = $this->m_global->get('acs_menu', null, ['menu_parent' => $parent], 'menu_id, menu_order, menu_nama', null, ['menu_order', 'ASC']);
		         $menuPrior = array();
		         foreach ($NewMenu as $key => $value) {
		         	$menuPrior[$value->menu_id] = $value;
		         	$menuPrior[$value->menu_id]->prioritas = ($value->menu_id == $node ? ($value->menu_order > $old_position ? 2 : 0) : 1);
		         }
		         /*BEGIN GET DATA MENU & BUILD ARRAY AFTER UPDATE MENU ORDER NODE YANG DI DRAG*/

		         /*BEGIN SORT DATA MENU BERDASARKAN MENU ORDER DAN PRIORITAS*/
		         usort($NewMenu, function($a, $b) {
				    $retval = $a->menu_order <=> $b->menu_order;
				    if ($retval == 0) {
				    	$retval = $a->prioritas <=> $b->prioritas;
				    }
				    return $retval;
				 });
		         /*END SORT DATA MENU BERDASARKAN MENU ORDER DAN PRIORITAS*/

		         for ($i=0; $i < count($NewMenu); $i++) { 
		         	$NewUpt[]	= array('menu_id' => $NewMenu[$i]->menu_id, 'menu_order' => $i);
		         }

		         isset($NewUpt) ? $this->db->update_batch('acs_menu', $NewUpt, 'menu_id') : '';

		         if ($this->db->trans_status() === TRUE) {
					$this->db->trans_commit();
				} else {
					$this->db->trans_rollback();
				}
		         /*END GET MENU YANG SUDAH DI UPDATE*/
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

	function detail($id){
		$data['url'] = $this->url;
		$data['id']	 = $id;
		$data['records']	= $this->m_global->get('acs_menu', null, ['menu_id' => $id]);
        $this->load->view($this->url.'_modal_detail', $data);
	}

	function detail_edit($id){
		$post 	= $this->input->post();
    	
		$this->db->trans_begin();
		/*BEGIN UPDATE KE TABLE acs_order*/
		$dataIns['menu_link']		= $post['menu_link'] == '' ? NULL : $post['menu_link'];
		$dataIns['menu_icon']		= $post['menu_icon'] == '' ? NULL : $post['menu_icon'];
		$dataIns['menu_udpatedby']	= getSession()->user_id;
		
		$update = $this->m_global->update($this->table, $dataIns, ['menu_id' => $id]);
		/*END UPDATE KE TABLE acs_order*/

		if ($this->db->trans_status() === TRUE) {
			$this->db->trans_commit();
			$datajs['status']  = 1;
            $datajs['message'] = 'Berhasil ubah!';
		} else {
			$this->db->trans_rollback();
			$datajs['status']  = 0;
            $datajs['message'] = 'Gagal ubah!';
		}
    	echo json_encode( $datajs );
	}

	function detail_add()
	{
		$post = $this->input->post();

		$this->form_validation->set_rules('menu_nama', 'Nama', 'trim|required');

		if ($this->form_validation->run($this)) {
			$this->db->trans_begin();
			$data[$this->prefix.'nama']		   = strip_tags($post['menu_nama']);
			$data[$this->prefix.'createdby']   = getSession()->user_id;
			$data[$this->prefix.'createddate'] = date('Y-m-d H:i:s');
			$data[$this->prefix.'ip']          = getUserIP();

			$query 					   		   = $this->m_global->insert($this->table, $data);

			if ($this->db->trans_status() === TRUE) {
				$this->db->trans_commit();
				$response['status']  = 1;
				$response['message'] = 'Menu berhasil disimpan';
			} else {
				$this->db->trans_rollback();
				$response['status']	 = 0;
				$response['message'] = 'Menu gagal disimpan';
			}
		}else{
			$response['status']  = 2;
			$response['message'] = validation_errors();
		}

		echo json_encode($response);
	}
}

/* End of file Jenis_surat.php */
/* Location: ./application/modules/jenis_surat/controllers/Jenis_surat.php */