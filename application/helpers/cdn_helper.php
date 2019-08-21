<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
    START Core Helper
*/

# untuk print_f
function pre( $var, $exit = null )
{
    $CI = &get_instance();
    echo '<pre>';
    if ( $var == 'lastdb' ){
        print_r($CI->db->last_query());
    } else if ( $var == 'post' ){
        print_r($CI->input->post());
    } else if ( $var == 'get' ){
        print_r($CI->input->get());
    } else {
        print_r( $var );
    }
    echo '</pre>';

    if ( $exit )
    {
        exit();
    }
}

function md5_mod($str, $salt){

    $str = md5(md5($str).$salt);
    return $str;
}

function sidebar_menu( $menu, $url )
{
    // echo $url;
    // foreach ( $menu as $key => $value )
    // {
    //     if (is_array($value['link'])) {
    //         foreach ($value['link'] as $Fkey => $Fvalue) {
    //             if (is_array($Fvalue['link'])) {
    //                 if (in_array($url, array_column($Fvalue['link'], 'path'))) {
    //                     echo "found";
    //                 }else{
    //                     echo "not found";
    //                 }
    //             }
    //         }
    //     }
    //     // pre($value['link']);
    // }
    // exit;
    foreach ( $menu as $key => $value )
    {
        $mexpand = '';
        if (is_array($value['link'])) {
            foreach ($value['link'] as $Fkey => $Fvalue) {
                if (is_array($Fvalue['link'])) {
                    if (in_array($url, array_column($Fvalue['link'], 'path'))) {
                        $mexpand='m-menu__item--submenu m-menu__item--open m-menu__item--expanded';
                    } else {
                        $mexpand = '';
                    }
                }
            }
        }

        echo '<li class="m-menu__item '.
        (is_array($value['link']) ? 
         (in_array($url, array_column($value['link'], 'path')) ? 
            'm-menu__item--submenu m-menu__item--open m-menu__item--expanded' 
            : 
            $mexpand
        )
         : 
         ($value['path'] == $url ? 'm-menu__item--active' : '')).
            '" aria-haspopup="true">

            <a '.(is_array($value['link']) ? 'href="javascript:void(0)" class="m-menu__link m-menu__toggle parent"' : 'href="'.base_url($value['link']).'" class="m-menu__link ajaxify"').'>
            <span class="m-menu__item-here"></span>
            <i class="m-menu__link-icon flaticon-'.$value['icon'].'"></i>
            <span class="m-menu__link-text">'.$value['name'].'</span>'.

            (is_array($value['link']) ? '<i class="m-menu__ver-arrow la la-angle-right"></i>' : '').
            '</a>';
            sub_menu( $value, $url, '2' );
    	echo '</li>';
    }
}

function sub_menu( $value, $url, $segment ){
    /*
        Mempunyai sub menu atau tidak
        untuk menampilkan sub link
    */

    if ( is_array($value['link']) )
    {
        echo '<div class="m-menu__submenu">
                <span class="m-menu__arrow"></span>
                    <ul class="m-menu__subnav">';

        $CI =& get_instance();
        // pre($url);
        // $sub_url = $CI->uri->segment(2);
        // pre($sub_url,1);

        /*
            Menampilkan sub menu
        */
        // foreach ( $value['link'] as $kSub => $kValue ){
            
        // }
        // exit;
        foreach ( $value['link'] as $kSub => $kValue )
        {
            if (is_array($kValue['link'])) {
                if (in_array($url, array_column($kValue['link'], 'path'))) {
                    $mopen = 'm-menu__item--open';                    
                }else{
                    $mopen = '';
                }
            }
            $sub_url = $CI->uri->segment($segment);
            echo '<li class="m-menu__item '.(
                (
                    is_array($kValue['link']) ?
                    'm-menu__item--submenu '.$mopen
                    :
                    (
                        $kValue['link'] == $url.'/'.$sub_url ?
                            'm-menu__item--active'
                        :
                        ($kValue['link'] == $url ? 'm-menu__item--active' : '')
                    )
                )
            ).'" aria-haspopup="true">';
            /*
                Jika path parent sama dengan uri sebelumnya
                dan path sekarang sama dengan uri sekarang
            */
           
           echo '<a href="'.(is_array($kValue['link']) ? 'javascript:void(0)' : base_url($kValue['link'])).'" class="'.(is_array($kValue['link']) ? 'm-menu__link m-menu__toggle' : 'm-menu__link ajaxify submenu').'">
                <i class="m-menu__link-icon flaticon-'.$kValue['icon'].'">
                    <span></span>
                </i>
                <span class="m-menu__link-text">'.$kValue['name'].'</span>'.
                (is_array($kValue['link']) ? '<i class="m-menu__ver-arrow la la-angle-right"></i>' : '').
            '</a>';
           if (is_array($kValue['link'])) {
               sub_menu_child($kValue, $url, '2');
           }
            echo "</li>";
        }

        echo '</ul></div>';
    }
}

function sub_menu_child( $value, $url, $segment ){
    $CI =& get_instance();
    $sub_url = $CI->uri->segment($segment);
    if (is_array($value['link'])) {
        echo '<div class="m-menu__submenu">
                <span class="m-menu__arrow"></span>
                <ul class="m-menu__subnav">';

        foreach ($value['link'] as $Mvalue) {
            echo '<li class="m-menu__item '.(
                $Mvalue['link'] == $url.'/'.$sub_url ?
                'm-menu__item--active'
                :
                ($Mvalue['link'] == $url ? 
                'm-menu__item--active' 
                : 
                '')
                ).'" aria-haspopup="true" m-menu-link-redirect="1">
                    <a href="'.base_url($Mvalue['link']).'" class="m-menu__link ajaxify submenu subparent1">
                        <i class="m-menu__link-icon flaticon-'.$Mvalue['icon'].'">
                            <span></span>
                        </i>
                        <span class="m-menu__link-text">'.$Mvalue['name'].'</span>
                    </a>
                </li>';
        }

        echo '</ul>
            </div>';
    }
}

function login_data( $val )
{
    $CI             = &get_instance();
    $user_data      = $CI->session->userdata('user_data');
    return $user_data->$val;
}

function uang( $var, $tipe=null, $dec="0" )
{
    if ( empty($var) ) return 0;
    return 'Rp. ' . number_format(str_replace(',','.',$var), $dec,',','.').($dec=="0"?($tipe == true ? ',-' : ",00" ):'');
}

function uang2( $var, $dec="0" )
{
    if ( empty($var) ) return 0;
    return number_format(str_replace(',','.',$var),$dec,',','.');
}

function bulan($bulan)
{
    $aBulan = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];

    return $aBulan[$bulan];
}

function bulanEng($bulan)
{
    $aBulan = ['January','February','March','April','May','June','July','August','September','October','November','December'];

    return $aBulan[$bulan];
}

function hari($hari)
{
    $data  = date('N', strtotime($hari));
    $aHari = ['', 'Senin', 'Selasa','Rabu','Kamis',"Jum'at",'Sabtu','Minggu'];

    return $aHari[$data];
}

function tgl_format($tgl , $format = "")
{
    if ($format == "") {
        $tanggal    = date('d', strtotime($tgl));
        $bulan      = bulan( date('n', strtotime($tgl))-1 );
        $tahun      = date('Y', strtotime($tgl));
        return $tanggal.' '.$bulan.' '.$tahun;
    }elseif ($format == 'd/m/Y') {
        $tanggal    = date('d', strtotime($tgl));
        $bulan      = date('m',strtotime($tgl));
        $tahun      = date('Y', strtotime($tgl));
        return $tanggal.'-'.$bulan.'-'.$tahun;
    }

}

function bulan_min($bulan)
{
    $aBulan = ['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Ags','Sep','Okt','Nov','Des'];
    
    return $aBulan[$bulan];
}

function tgl_format2( $tgl, $showtime = 0, $nomin = null )
{
    if( !is_null($tgl) and $tgl != '' and $tgl != '0000-00-00' ){

    $tanggal    = date('d', strtotime($tgl));
    $bulan      = ( $nomin == null ? bulan_min( date('n', strtotime($tgl))-1 ) : bulan( date('n', strtotime($tgl))-1 ) );
    $tahun      = ( $nomin == null ? date('y', strtotime($tgl)) : date('Y', strtotime($tgl)) );

    $hasil      = $tanggal.' '.$bulan.' '.$tahun;

    if ( $showtime == 1 ) $jam = ' ' . substr($tgl, -8) . '';
    $hasil = ( $showtime == 1 ) ? $hasil . @$jam : $hasil;

    } else {
        $hasil = '';
    }

    return $hasil;
}

function date_format_indo($format = 'd-M-Y',$tgl=NULL)
{
    if($tgl == NULL){
        $tgl = date('Y-m-d');
    }
    
    $exp = explode('-', $tgl);
    $detik      = date('s', strtotime($tgl));
    $menit      = date('i', strtotime($tgl));
    $jam        = date('H', strtotime($tgl));
    $tanggal    = date('d', strtotime($tgl));
    $bulan      = bulan( date('n', strtotime($tgl))-1 );
    $tahun      = date('Y', strtotime($tgl));

    if( empty($exp[1]) ){
        return $tanggal.' '.$bulan.' '.$tahun;
    }else{
        $hasil = '';
        foreach (str_split($format) as $key=>$value) {
            if($value == 'M'){
                $hasil .= ($bulan);
            }
            else if($value == 'Y'){
                $hasil .= ($tahun);
            }
            else if($value == 'y'){
                $hasil .= (substr($tahun,2,2));
            }
            else if($value == 'd'){
                $hasil .= ($tanggal);
            }
            else if($value == 'H'){
                $hasil .= ($jam);
            }
            else if($value == 'i'){
                $hasil .= ($menit);
            }
            else if($value == 'm'){
                $hasil .= (date('n', strtotime($tgl)));
            }
            else if($value == 's'){
                $hasil .= ($detik);
            }else{
                $hasil .= $value;
            }
        }
        return $hasil;

    }
}

function date_task_indo($tgl = NULL){
    $detik      = date('s', strtotime($tgl));
    $menit      = date('i', strtotime($tgl));
    $jam        = date('H', strtotime($tgl));
    $tanggal    = date('d', strtotime($tgl));
    $bulan      = bulan( date('n', strtotime($tgl))-1 );
    $tahun      = date('Y', strtotime($tgl));

    $result = (empty($tgl) ? '<span class="label label-sm label-danger "> <i> No Data </i> </span>' : 'Tanggal <span class="label label-sm label-warning ">'.$tanggal.' '.$bulan.' '.$tahun.'</span> Jam <span class="label label-sm label-warning ">'.$jam.':'.$menit.':'.$detik.'</span>');

    return $result;
}

function bulan_tahun($param){
    $bulan = bulan( date('n', strtotime($param))-1 );
    $tahun = date('Y', strtotime($param));
    return $bulan.' '.$tahun;
}

function date_value($tgl)
{
   $date        = date_format_indo($tgl);
   $date_indo   = explode(' ', $date);

   $hr  = hari($tgl);
   $tg  = Terbilang($date_indo[0]);
   $bln = $date_indo[1];
   $thn = Terbilang($date_indo[2]);

   return $hr . ' tanggal ' . $tg . ' bulan ' . $bln . ' tahun ' . $thn;
}

function bln_thn($tgl, $deli)
{
    $data   = explode($deli, $tgl);
    $x      = (intval($data[0])-1);

    return bulan($x) . ' ' . $data[1];
}

function config( $val, $json = null )
{
    $CI =& get_instance();
    $result = $CI->m_global->get_data_all('config', null, ['config_nama' => $val])[0];
    if ( $result ) {
      if ( $json ){
        return json_decode( $result->config_value );
      } else {
        return $result->config_value;
      }
    } else {
        return null;
    }
}

function terbilang( $x ) 
{
    $x = abs($x);
    $angka = array("", "satu ", "dua ", "tiga ", "empat ", "lima ","enam ", "tujuh ", "delapan ", "sembilan ", "sepuluh ", "sebelas ");
    $temp = "";
    if ($x <12) {
        $temp = "". $angka[$x];
    } else if ($x <20) {
        $temp = Terbilang($x - 10). "belas ";
    } else if ($x <100) {
        $temp = Terbilang($x/10)."puluh ". Terbilang($x % 10);
    } else if ($x <200) {
        $temp = "seratus " . Terbilang($x - 100);
    } else if ($x <1000) {
        $temp = Terbilang($x/100) . "ratus " . Terbilang($x % 100);
    } else if ($x <2000) {
        $temp = " seribu" . Terbilang($x - 1000);
    } else if ($x <1000000) {
        $temp = Terbilang($x/1000) . "ribu " . Terbilang($x % 1000);
    } else if ($x <1000000000) {
        $temp = Terbilang($x/1000000) . "juta " . Terbilang($x % 1000000);
    } else if ($x <1000000000000) {
        $temp = Terbilang($x/1000000000) . "milyar " . Terbilang(fmod($x,1000000000));
    } else if ($x <1000000000000000) {
        $temp = Terbilang($x/1000000000000) . "trilyun " . Terbilang(fmod($x,1000000000000));
    }
    return $temp;
}

function list_name($array)
{
    $data   = '';
    $count  = count($array);

    if($count == 1) {
        $data = $array[0];
    } else if ($count == 2) {
        $data = $array[0] . ' and ' . $array[1];
    } else if ($count > 2) {
        foreach ($array as $key => $val) {
            ($key == ($count - 1)) ?
            $data .= ' and ' . $val :
            $data .= $val . ', ';
        }
    }

    return $data;
}

function setTanggal($param){
    $ex = explode('_', $param);

    $hasil['from'] = date('Y-m-d', strtotime($ex[0]));
    $hasil['to']   = date('Y-m-d', strtotime($ex[1]));

    return $hasil;
}

function getDatesFromRange($start, $end, $format = 'Y-m-d') {
    $array = array();
    $interval = new DateInterval('P1D');

    $realEnd = new DateTime($end);
    $realEnd->add($interval);

    $period = new DatePeriod(new DateTime($start), $interval, $realEnd);

    foreach($period as $date) { 
        $array[] = $date->format($format); 
    }

    return $array;
}

function date_diffblock($date_end){
    $start_date = new DateTime();
    $since_start = $start_date->diff(new DateTime($date_end));
    return $since_start;
}

function md56($param,$tipe = null,$jml = null){
	if(empty($tipe)){
		return substr(md5($param),0, ( empty($jml) ? 6 : $jml  ) );
	}else{
		return 'SUBSTRING(md5('.$param.'),true,6)';
	}
}


?>

