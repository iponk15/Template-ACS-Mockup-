<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 4
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Dribbble: www.dribbble.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
Renew Support: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<html lang="en" >
    <!-- begin::Head -->
    <head>
        <meta charset="utf-8" />

        <title>Login - Aerofood ACS</title>
        <meta name="description" content="Latest updates and statistic charts">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">

        <!--begin::Web font -->
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
        <script>
          	WebFont.load({
				google: {"families":["Poppins:300,400,500,600,700","Roboto:300,400,500,600,700"]},
				active: function() {
					sessionStorage.fonts = true;
				}
          	});
        </script>
		<link href="<?php echo base_url() ?>/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
		<link href="<?php echo base_url() ?>assets/demo/base/style.bundle.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="<?php echo base_url() ?>/assets/demo/media/img/logo/favicon.ico" />
		<?php echo $script_captcha; // javascript recaptcha ?>
    </head>
    <!-- end::Head -->
    <!-- begin::Body -->
    <body  class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default"  >
		<!-- begin:: Page -->
		<div class="m-grid m-grid--hor m-grid--root m-page">
			<div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-grid--tablet-and-mobile m-grid--hor-tablet-and-mobile m-login m-login--1 m-login--signin" id="m_login">
				<div class="m-grid__item m-grid__item--order-tablet-and-mobile-2 m-login__aside">
					<div class="m-stack m-stack--hor m-stack--desktop">
							<div class="m-stack__item m-stack__item--fluid">

								<div class="m-login__wrapper">

									<div class="m-login__logo">
										<a href="javascript:void(0)">
										<img src="<?php echo base_url('assets/app/media/img/logos/logo2.png') ?>" style="width: 35%;">
										</a>
									</div>

									<div class="m-login__signin">
										<div class="m-login__head">
											<h3 class="m-login__title">Sign In To Website</h3>
										</div>
										<form method="POST" class="m-login__form m-form" action="<?php echo base_url('login/cek_login'); ?>">
											<input type="hidden" name="<?php echo $this->security->get_csrf_token_name(); ?>" value="<?php echo $this->security->get_csrf_hash(); ?>" />
											<div class="form-group m-form__group">
												<input tabindex="1" class="form-control m-input" type="text" placeholder="Emp No" name="user_nopeg" autocomplete="off">
											</div>
											<div class="form-group m-form__group">
												<input tabindex="2" class="form-control m-input m-login__form-input--last" type="password" placeholder="Password" name="user_password" autocomplete="off">
											</div>
											<div class="form-group m-form__group m--margin-top-15">
												<val id="image_captcha"><?php echo $captcha; ?></val> &nbsp;
											</div>
											<div class="m-login__form-action">
												<button tabindex="4" type="submit" id="m_login_signin_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">Sign In</button>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="m-stack__item m-stack__item--center">

								<div class="m-login__account">
									<!-- <a href="<?php echo base_url('login/bypas'); ?>"  class="m-link m-link--focus m-login__account-link">Bypas</a> -->
								</div>

							</div>
					</div>
				</div>
				<div class="m-grid__item m-grid__item--fluid m-grid m-grid--center m-grid--hor m-grid__item--order-tablet-and-mobile-1	m-login__content m-grid-item--center" style="background-image: url(<?php echo ( !empty($records) ?  base_url().'assets/app/media/img/bg/'.$records[0]->config_temp : $no_image ) ?>)">
					<div class="m-grid__item">
						<h3 class="m-login__welcome">Aerofood ACS</h3>
						<p class="m-login__msg">
							<!-- Lorem ipsum dolor sit amet, coectetuer adipiscing<br>elit sed diam nonummy et nibh euismod -->
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- end:: Page -->
		<!--begin::Base Scripts -->
		<script src="<?php echo base_url() ?>/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
		<script src="<?php echo base_url() ?>/assets/demo/base/scripts.bundle.js" type="text/javascript"></script>
		<!--end::Base Scripts -->
		<!--begin::Page Snippets -->
		<script src="<?php echo base_url() ?>/assets/app/js/login.js" type="text/javascript"></script>
		<!--end::Page Snippets -->
		<script type="text/javascript">
			var base_url = '<?php echo base_url() ?>';

			$( function(){
				$(".m-login__btn").click(function() {
					grecaptcha.reset();
				})
			});
		</script>
	</body>
		<!-- end::Body -->
</html>