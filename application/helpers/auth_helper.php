<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	$CI = &get_instance();
	$CI->load->library( 'session' );
	$CI->load->helper('menu');
	$CI->load->helper('cdn');

	$ex          = array('login');
	$session     = $CI->session->userdata('acs_session');
	$status_link = @$CI->input->post('status_link');
	$config_su   = ['sabre_cm', 'log', 'sendgrid', 'background'];
	$config_ad   = ['pkb', 'receipt'];
	
	if ( !empty($session) AND ( ( in_array ( $this->uri->segment(1), $ex) AND $this->uri->segment(2) != "out") OR $this->uri->segment(1) == "" ) ){
		redirect( base_url('dashboard') );
	} else if ( empty($session) AND ! in_array( $this->uri->segment(1), $ex ) ) {
		if ( $status_link == 'ajax' ){
			echo 'out';
			redirect(base_url('login'));
		}else{
			redirect(base_url('login'));
		}
	}

	/*AUTH ROLE*/
	if (!empty($session)) {
		$uri1 	= $this->uri->segment(1);
		$uri2 	= $this->uri->segment(2);
		$menu 	= menu();
		$link 	= array_column($menu, 'link');
		$newMt  = 'fetch';
		$link[] = $newMt;
		
		/*BEGIN GROUPING LINK*/
		foreach ($link as $links) {
			if (is_array($links)) {
				foreach ($links as $linksChild) {
					if (is_array($linksChild['link'])) {
						foreach ($linksChild['link'] as $value) {
							$group_link []	= $value['link'];
						}	
					} else {
						$group_link []	= $linksChild['link'];
					}
				}
			}else{
				$group_link []	= $links;
			}
		}

		/*BEGIN LOGIC ROLE*/
		$is_ex 		= in_array($uri1, $ex) ? 'TRUE' : 'FALSE';
		$is_link 	= in_array($uri1, $group_link) ? 'TRUE' : 'FALSE';
		
		if ($uri2 == '') {
			if ($is_link == 'FALSE' AND $is_ex == 'FALSE') {
				redirect( base_url('dashboard') );
			}
		}else{
			if ($uri1 == 'config') {
				if ($session->user_role_id == '1') {
					/*SUPERADMIN*/
					if (in_array($uri2, $config_ad)) {
						redirect( base_url('dashboard') );
					}
				} else {
					/*ADMIN*/
					if (in_array($uri2, $config_su)) {
						redirect( base_url('dashboard') );
					}
				}	
			}elseif ($is_link == 'FALSE' AND $is_ex == 'FALSE') {
				if ($session->user_role_id == '2' || $session->user_role_id == '3') {
					if (!in_array($uri1, $config_ad)) {
						redirect( base_url('dashboard') );
					}
				}else{
					redirect( base_url('dashboard') );
				}
			}
		}
		/*END LOGIC ROLE*/
	}

?>