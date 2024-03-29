<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends MX_Controller {

	private $prefix         = 'user_';
    private $url            = 'user';
    private $table_db       = 'acs_user';
    private $pagetitle      = 'User';
    private $rule_valid     = 'xss_clean|encode_php_tags';

	public function __construct()
	{
        $this->config->load('ion_auth', TRUE);
        $this->store_salt  = $this->config->item('store_salt', 'ion_auth');
        $this->salt_length = $this->config->item('salt_length', 'ion_auth');
        $this->hash_method = $this->config->item('hash_method', 'ion_auth');
		parent::__construct();
	}

	public function index()
	{
		$data['pagetitle']	= 'List Data User';
		$data['url']		= $this->url;
		$data['breadcumb']	= ['index' => base_url('dashboard'), 'User' => base_url('user')];
		$this->templates->display($this->url, $data);
	}

	public function select()
	{
    	$join    = [ ['acs_role','user_role_id = role_id','left'] ];
        $where   = null;
        $where_e = null;
        $group   = null;
        $paging  = $_REQUEST['pagination'];
        $search  = (!empty($_REQUEST['query']) ? $_REQUEST['query'] : null);
        $order   = (isset($_REQUEST['sort']) ? [ $_REQUEST['sort']['field'], $_REQUEST['sort']['sort'] ] : ['user_createddate', 'DESC']);

        // setting pencarian data
        if(!empty($search)){
            foreach ($search as $value => $param) {
                if($value == 'generalSearch'){
                    $where_e = '(user_nopeg like "%'.$param.'%" OR user_nama like "%'.$param.'%")';
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
        $start  = $paging['page'];
        $limit  = $paging['perpage'];
        $awal   = ($start == 1 ? '0' : ($start * $limit) - $limit);

        // set record data
        $select          = 'user_id,user_nopeg,user_nama,user_email,user_status,user_lastupdate,role_nama';
        $data['total']   = $this->m_global->count($this->table_db,$join,$where,$where_e,$group);
        $result          = $this->m_global->get($this->table_db,$join,$where,$select,$where_e,$order,$awal,$limit,$group);
        $data['records'] = array();
        $role            = [1 => 'Superadmin', 2 =>'KK', 3 => 'AA', 5 => 'Admin'];
        $i               = 1 + $awal;

        foreach ($result as $key => $value) {
            $data['records'][] = [
                'no'            => $i++,
                'user_nopeg'    => $value->user_nopeg,
                'user_nama'     => $value->user_nama,
                'user_email'    => trim($value->user_email),
                'role_nama'     => $value->role_nama,
                'user_status'   => ($value->user_status == '1' ? '<span><span class="m-badge  m-badge--success m-badge--wide">Active</span></span>' : '<span><span class="m-badge  m-badge--danger m-badge--wide">Inactive</span></span>' ),
                'action'        => '<a href="'.base_url($this->url.'/change_status/'.md56($value->user_id).'/'.$value->user_status).'" onClick="return f_status(1, this, event)" class="m-portlet__nav-link btn m-btn m-btn--hover-'.($value->user_status == "1" ? "brand" : "focus").' m-btn--icon m-btn--icon-only m-btn--pill change_status" title="Change Status">
                                        <i class="la la-eye"></i>
                                    </a>
                                    <a href="'.base_url($this->url.'/show_edit/'.md56($value->user_id)).'" data-table="disres" data-toggle="modal" class="ajaxify m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill edit_data" title="Edit details">
                                        <i class="la la-edit"></i>
                                    </a>
                                    <a href="'.base_url($this->url.'/action_del/'.md56($value->user_id)).'" onClick="return f_status(2, this, event)" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete">
                                        <i class="la la-trash"></i>
                                    </a>'
            ];
        }

        $encode = (object)[
            'meta' => ['page' => $start, 'pages' => null, 'perpage' => $limit, 'total' => $data["total"], 'sort' => 'asc', 'field' => 'user_id'],
            'data' =>  $data['records']
        ];

        echo json_encode($encode);
	}


    public function show_add()
    {
        $data['pagetitle']  = 'Form Add';
        $data['subtitle']   = '';
        $data['url']        = $this->url;
        $data['breadcumb']  = ['index' => base_url("dashboard"), 'User' => base_url('user'), 'Add Data' => base_url('user/show_add')];

        $this->templates->display($this->prefix.'add', $data);
    }

    public function nopeg_check($nopeg){
        $cek = count($this->m_global->get('acs_user', nULL, ['user_nopeg' => $nopeg], 'user_nopeg'));

        if (!empty($cek)){
            return FALSE;
        }else{
            return TRUE;
        }
    }

	public function action_add(){
		$post = $this->input->post();

        $this->form_validation->set_rules('user_nopeg', 'Nopeg', 'trim|required|callback_nopeg_check');
        $this->form_validation->set_rules('user_nama', 'Nama', 'trim|required');
        $this->form_validation->set_rules('user_pass', 'Password', 'trim|required');
        $this->form_validation->set_rules('user_role', 'Role', 'trim|required');

        if(!empty($post['user_instansi_id'])){
            $this->form_validation->set_rules('user_area_id', 'Area', 'trim|required');
        }

        if(!empty($post['user_area_id'])){
            $this->form_validation->set_rules('user_unit_id', 'Unit', 'trim|required');
        }

        if ( $this->form_validation->run( $this ) ){
            $salt                     = $this->store_salt ? salt() : FALSE;
            $password                 = hash_password($post['user_pass'], $salt);
            $data['user_nopeg']       = $post['user_nopeg'];
            $data['user_nama']        = strip_tags($post['user_nama']);
            $data['user_email']       = strip_tags($post['user_email']);
            $data['user_role_id']     = $post['user_role'];
            $data['user_password']    = strip_tags($password);
            $data['user_salt']        = $salt;
			$data['user_createdby']   = getSession()->user_nopeg;
            $data['user_createddate'] = date('Y-m-d H:i:s');
            $data['user_ip_temp']     = getUserIP();
            $insert                   = $this->m_global->insert('acs_user', $data);

            if ($insert) {
                $data['status']     = 1;
                $data['message']    = 'Successfully';

                echo json_encode( $data );
            } else {
                $data['status']     = 0;
                $data['message']    = 'Failed';

                echo json_encode( $data );
            }
        }else{
            $data['status']     = 2;
            $data['message']    = 'Nopeg <b>'.$post['user_nopeg'].'</b> is already exist';

            echo json_encode( $data );
        }
	}

	public function show_edit($id){
		$data['pagetitle'] = 'Form Edit';
		$data['subtitle']  = '';
		$data['breadcumb'] = ['index' => base_url("dashboard"), 'User' => base_url('user'), 'Edit Data' => base_url('user/show_edit/'.$id)];
        $data['user_id']   = $id;
        $data['url']       = $this->url;

        // get data
        $join              = [ ['acs_role','user_role_id = role_id','left'] ];
        $select            = 'user_id,user_nopeg,user_nama,user_email,role_id,role_nama';
        $data['records']   = $this->m_global->get($this->table_db, $join, [md56('user_id',1) => $id],$select)[0];

		$this->templates->display($this->prefix.'edit', $data);
	}

	public function action_edit($id){
		$post = $this->input->post();
        $this->form_validation->set_rules('user_nama', 'Nama', 'trim|required');
        $this->form_validation->set_rules('user_role', 'Role', 'trim|required');

        if ( $this->form_validation->run( $this ) )
        {
            $data['user_nama']        = strip_tags($post['user_nama']);
            $data['user_email']       = strip_tags($post['user_email']);
            $data['user_role_id']  	  = $post['user_role'];
            $data['user_updatedby']   = getSession()->user_nopeg;
            $data['user_ip_temp']     = getUserIP();

            if ($post['new_user_pass'] != null) {
                $salt                  = $this->store_salt ? salt() : FALSE;
                $password              = hash_password($post['new_user_pass'], $salt);
                $data['user_password'] = $password;
                $data['user_salt']     = $salt;
            }

            $update = $this->m_global->update($this->table_db, $data,[md56('user_id',1) => $id]);

            if ($update) {
                $data['status']     = 1;
                $data['message']    = 'Successfully';

                echo json_encode( $data );
            } else {
                $data['status']     = 0;
                $data['message']    = 'Failed';

                echo json_encode( $data );
            }
        }
	}

    public function action_del($id){
        $delete = $this->m_global->delete($this->table_db, [md56('user_id',1) => $id]);

        if ( $delete ){
            $data['status']  = 1;
            $data['message'] = 'Successfully';

            echo json_encode( $data );
        } else {
            $data['status']  = 0;
            $data['message'] = 'Failed';

            echo json_encode( $data );
        }
    }

    public function change_status($id,$status)
    {
        if ($status == 1) {
            $data['user_status'] = '0';
        } else {
            $data['user_status'] = '1';
        }

        $update = $this->m_global->update($this->table_db, $data, [md56('user_id',1) => $id]);
        if ( $update ){
            $end['status']  = 1;
            $end['message'] = 'Successfully';
            echo json_encode( $end );
        } else {
            $end['status']  = 0;
            $end['message'] = 'Failed';

            echo json_encode( $end );
        }
    }

    public function export_excel()
    {
        $record     = $this->m_global->get($this->table_db);
        // pre($record,1);
        $heading = array('No', 'Nopeg', 'Nama');
        $this->load->library('excel');
        $phpExcel   = new PHPExcel();
        $phpExcels  = $phpExcel->setActiveSheetIndex(0);
        $phpExcels->setTitle('Data User');

        // $phpExcel->getStyle('A1:D3')->getBorders()->getAllBorders()->setBorderStyle(PHPExcel_Style_Border::BORDER_THIN);
        $jmldata  = $this->m_global->count($this->table_db);
        $jmldatas = $jmldata + 1;
        $phpExcels->getStyle('A1:C'.$jmldatas)->applyFromArray(array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_MEDIUM
                ),
            ),
        ));

        $rowNumberH = 1;
        $colH       = 'A';

        foreach($heading as $h){
            $phpExcels->setCellValue($colH.$rowNumberH,$h);
            $colH++;
        }

        $maxrow = count($record)+2;
        $row    = 2;
        $no     = 1;

        foreach($record as $n){
            $phpExcels->setCellValue('A'.$row,$no);
            $phpExcels->setCellValue('B'.$row,$n->user_nopeg);
            $phpExcels->setCellValue('C'.$row,$n->user_nama);

            $row++;
            $no++;
        }

        $objWriter = PHPExcel_IOFactory::createWriter($phpExcel,'Excel2007');
        ob_end_clean();
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="export_data.xls"');
        header('Cache-Control: max-age=0');

        $objWriter->save('php://output');

    }

    public function force_offline($id)
    {
        $update = $this->m_global->update($this->table_db, $data, [md56('user_id',1) => $id]);
        if ( $update ){
            $end['status']  = 1;
            $end['message'] = 'Successfully';
            echo json_encode( $end );
        } else {
            $end['status']  = 0;
            $end['message'] = 'Failed';

            echo json_encode( $end );
        }
    }

}

/* End of file User.php */
/* Location: ./application/modules/user/controllers/User.php */