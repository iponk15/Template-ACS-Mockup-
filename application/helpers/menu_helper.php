<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * [Fungsi untuk generate menu]
 * @return [array] [Array menu]
 */

	function menu(){
		$CI =& get_instance();
		$CI->load->database();
		$CI->load->model('global/m_global');
		$CI->load->helper('cdn');
		$select 	= 'menu_id, menu_parent, menu_nama name, menu_icon icon, menu_link path, menu_link link';
		$join 		= [['acs_menu', 'menu_id = group_menu_id', 'left']];
		$where 		= ['group_role' => getSession('user_role_id')];
		$order 		= ['menu_order', 'ASC'];
		$acs_group  = $CI->m_global->get('acs_group', $join, $where, $select, null, $order);
		$has_child 	= $CI->m_global->get('acs_menu', null, ['menu_parent IS NOT NULL' => NULL], 'menu_parent', null, null, null, null, 'menu_parent');
		$parent_has_child = array_column($has_child, 'menu_parent');

		/*BEGIN BUILD STRUKTUR DATA*/
		foreach ($acs_group as $key => $value) {
			$menu[$value->menu_id]	= $value;
			$menu[$value->menu_id]->name	= $value->name;
			$menu[$value->menu_id]->icon	= $value->icon;
			$menu[$value->menu_id]->path	= $value->path;
			$menu[$value->menu_id]->link	= in_array($value->menu_id, $parent_has_child) ? array() : $value->link;
		}
		/*END BUILD STRUKTUR DATA*/
		
		/*BEGIN SET GROUP CHILDREN YANG SESUAI DENGAN PARENT*/
		foreach ($acs_group as $key => $value) {
			if ($value->menu_parent && isset($menu[$value->menu_parent])) {
				$menu[$value->menu_parent]->link[] = $value;
			}
		}
		/*END SET GROUP CHILDREN YANG SESUAI DENGAN PARENT*/

		/*BEGIN HAPUS CHILD YANG TIDAK SESUAI DENGAN PARENT*/
		foreach($acs_group as $key => &$value) {
            if($value->menu_parent && isset($menu[$value->menu_parent]))
             unset($acs_group[$key]);
         }
		/*END HAPUS CHILD YANG TIDAK SESUAI DENGAN PARENT*/
        $acs_group = array_values($acs_group);
        $menu = json_decode(json_encode($acs_group), true);

		return $menu;
	}


/* End of file menu_helper.php */
/* Location: ./application/helpers/menu_helper.php */