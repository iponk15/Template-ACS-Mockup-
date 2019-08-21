<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// To use reCAPTCHA, you need to sign up for an API key pair for your site.
// link: http://www.google.com/recaptcha/admin
/*BEGIN CONFIG FOR LOCALHOST*/
$config['recaptcha_site_key'] = '6LfygIEUAAAAAIiS-_Iohh0K-ERXyEM78kfSIZVe';
$config['recaptcha_secret_key'] = '6LfygIEUAAAAAEe7RhVo-MuzCvYeSiLeJjwVqNkU';
/*END CONFIG FOR LOCALHOST*/

/*BEGIN CONFIG FOR IP 192.168.1.181 Recapcha v2*/
// $config['recaptcha_site_key'] = '6LeP2K0UAAAAABEQ1Yu4UvU115IednWY0XaEOoG6';
// $config['recaptcha_secret_key'] = '6LeP2K0UAAAAAMuEs06mEp4lrQwbxndoli26G2nI';
/*END CONFIG FOR IP 192.168.1.181*/

// reCAPTCHA supported 40+ languages listed here:
// https://developers.google.com/recaptcha/docs/language
$config['recaptcha_lang'] = 'en';

/* End of file recaptcha.php */
/* Location: ./application/config/recaptcha.php */
