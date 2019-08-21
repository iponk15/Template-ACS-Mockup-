<header id="m_header" class="m-grid__item    m-header " m-minimize-offset="200" m-minimize-mobile-offset="200">
    <div class="m-container m-container--fluid m-container--full-height">
        <div class="m-stack m-stack--ver m-stack--desktop">
            <!-- BEGIN: Brand -->
            <div class="m-stack__item m-brand  m-brand--skin-dark ">
                <div class="m-stack m-stack--ver m-stack--general">
                    <div class="m-stack__item m-stack__item--middle m-brand__logo">
                        <a href="<?php echo base_url() ?>" class="m-brand__logo-wrapper">
							<img alt="asperindo" src="<?php echo base_url() ?>assets/app/media/img/logos/logo4.png" style="width: 153px;"/>
						</a>
                    </div>
                    <div class="m-stack__item m-stack__item--middle m-brand__tools">
                        <!-- BEGIN: Left Aside Minimize Toggle -->
                        <a href="javascript:;" id="m_aside_left_minimize_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block  ">
							<span></span>
						</a>
                        <!-- END -->
                        <!-- BEGIN: Responsive Aside Left Menu Toggler -->
                        <a href="javascript:;" id="m_aside_left_offcanvas_toggle" class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block">
							<span></span>
						</a>
                        <!-- END -->
                        <!-- BEGIN: Topbar Toggler -->
                        <a id="m_aside_header_topbar_mobile_toggle" href="javascript:;" class="m-brand__icon m--visible-tablet-and-mobile-inline-block">
							<i class="flaticon-more"></i>
						</a>
                        <!-- BEGIN: Topbar Toggler -->
                    </div>
                </div>
            </div>
            <!-- END: Brand -->
            <div class="m-stack__item m-stack__item--fluid m-header-head" id="m_header_nav">
                <!-- BEGIN: Horizontal Menu -->
                <button class="m-aside-header-menu-mobile-close  m-aside-header-menu-mobile-close--skin-dark " id="m_aside_header_menu_mobile_close_btn"><i class="la la-close"></i></button>
                <!-- END: Horizontal Menu -->
                <!-- BEGIN: Topbar -->
                <div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general">
                    <div class="m-stack__item m-topbar__nav-wrapper">
                        <ul class="m-topbar__nav m-nav m-nav--inline">
                            <li class="m-nav__item m-topbar__user-profile  m-dropdown m-dropdown--medium m-dropdown--arrow  m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light" m-dropdown-toggle="click">
                                <a href="#" class="m-nav__link m-dropdown__toggle">
									<span class="m-topbar__userpic">
                                        <?php
                                            $records	= $this->m_global->get('acs_user',null,['user_nopeg' => $this->session->userdata('acs_session')->user_nopeg],'*');
                                            $no_image	= base_url().'assets/app/media/img/users/user4.jpg';
                                        ?>
										<img src="<?php echo ( is_null($records[0]->user_avatar) ? $no_image : base_url().'assets/app/media/img/users/'.$records[0]->user_avatar ) ?>" class="m--img-rounded m--marginless m--img-centered" id="icon-preview-nav" alt="" style="height:41px; width: 41px;"/>
									</span>
									<span class="m-nav__link-icon m-topbar__usericon  m--hide">
										<span class="m-nav__link-icon-wrapper"><i class="flaticon-user-ok"></i></span>
									</span>
									<span class="m-topbar__username m--hide">Nick</span>
								</a>
                                <div class="m-dropdown__wrapper">
                                    <span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
                                    <div class="m-dropdown__inner">
                                        <div class="m-dropdown__header m--align-center">
                                            <div class="m-card-user m-card-user--skin-light">
                                                <div class="m-card-user__pic">
                                                    <form class="form-upload-img">
                                                        <img id="image-preview-user" src="<?php echo ( !is_null($records[0]->user_avatar) ?  base_url().'assets/app/media/img/users/'.$records[0]->user_avatar : $no_image ) ?>" class="m--img-rounded m--marginless" alt="" style="height:70px; width: 70px;"/>
                                                        <input type="file" name="profile_img" id="image-source-user" accept="image/*" onchange="previewImage()" style="display: none;">
                                                    </form>
                                                </div>
                                                <div class="m-card-user__details">
                                                    <span class="m-card-user__name m--font-weight-500">
                                                        <?php echo getSession('user_nama');  ?>
                                                        <?php //echo $this->session->userdata('user_nama'); ?>
                                                    </span>
                                                    <a href="<?php echo getSession('user_email');  ?>" class="m-card-user__email m--font-weight-300 m-link" style="word-break: break-all;">
                                                        <?php echo getSession('user_email');  ?>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-dropdown__body">
                                            <div class="m-dropdown__content">
                                                <ul class="m-nav m-nav--skin-light">
                                                    <li class="m-nav__section m--hide">
                                                        <span class="m-nav__section-text">Section</span>
                                                    </li>

                                                    <li class="m-nav__separator m-nav__separator--fit">
                                                    </li>
                                                    <li class="m-nav__item">
                                                        <a href="<?php echo base_url('login/out'); ?>" class="btn m-btn--pill    btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder" id="btnlogout">Logout</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END: Topbar -->
            </div>
        </div>
    </div>
</header>
<script>
    $('#image-preview-user').click(function(event) {
        $('#image-source-user').click();
    });
    function previewImage() {
		document.getElementById("image-preview-user").style.display = "block";

		var oFReader = new FileReader();
		oFReader.readAsDataURL(document.getElementById("image-source-user").files[0]);
		oFReader.onload = function(oFREvent) {
			document.getElementById("image-preview-user").src = oFREvent.target.result;
            document.getElementById("icon-preview-nav").src = oFREvent.target.result;
		}
    }
    $('#image-source-user').on('change', function () {
        var url = "<?php echo base_url()?>"+"profile/action_profile";
        var data = new FormData($('.form-upload-img')[0]);
        var gambar = $('#image-preview-user').attr('src');
        console.log(gambar);
        $.ajax({
            type: "post",
            url: url,
            data: data,
            contentType: false,
            cache: false,
            processData: false,
            success: function (response) {
                console.log('success change image profile');
            }
        });
    });
</script>