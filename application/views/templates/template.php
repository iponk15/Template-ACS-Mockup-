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
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><?php echo $pagetitle .' - '. 'Aerofood ACS' ?></title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        WebFont.load({
            google: { "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"] },
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <link href="<?php echo base_url('assets/vendors/custom/fullcalendar/fullcalendar.bundle.css')?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url('assets/vendors/base/vendors.bundle.css')?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url('assets/demo/base/style.bundle.css')?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url('assets/vendors/custom/datatables/datatables.bundle.css')?>" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url('assets/vendors/custom/custom.css')?>" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="<?php echo base_url()?>assets/demo/media/img/logo/favicon.ico" />
    <link rel="shortcut icon" href="<?php echo base_url()?>assets/vendors/custom/jstree338/dist/themes/default/style.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        var base_url   = '<?php echo base_url() ?>';
        var cover_csrf = { status_link: 'ajax', '<?php echo $this->security->get_csrf_token_name(); ?>' :  '<?php echo $this->security->get_csrf_hash();  ?>'};

        WebFont.load({
            google: {"families":["Poppins:300,400,500,600,700","Roboto:300,400,500,600,700","Asap+Condensed:500"]},
                active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <script src="<?php echo base_url('assets/vendors/base/vendors.bundle.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/demo/base/scripts.bundle.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/vendors/custom/datatables/datatables.bundle.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/app/js/global_helper.js'); ?>" type="text/javascript"></script>

    <script src="<?php echo base_url('assets/vendors/custom/fullcalendar/fullcalendar.bundle.js')?>" type="text/javascript"></script>

    <script src="<?php echo base_url('assets/app/js/ajaxify.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/app/js/custom.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/app/js/jquery.formatCurrency-1.4.0.min.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/app/js/jquery.inputmask.bundle.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/vendors/custom/jstree338/dist/jstree.min.js')?>" type="text/javascript"></script>
    <script src="<?php echo base_url('assets/app/js/livestamp.min.js')?>"></script>
</head>
    <body class="m-page--fluid m-page--loading-enabled m-page--loading m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
        <div class="m-page-loader m-page-loader--base">
            <div class="m-blockui">
                <span>Please wait...</span>
                <span><div class="m-loader m-loader--brand"></div></span>
            </div>
        </div>
        <div class="m-grid m-grid--hor m-grid--root m-page">
            <?php echo $_header ?>
            <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-page__container m-body">
                <?php echo $_sidebar; ?>
                <div class="m-grid__item m-grid__item--fluid m-wrapper body-content" id="body-content">
                    <?php echo $_breadcumb ?>
                    <div class="m-content">
                        <?php echo $_content ?>
                    </div>
                </div>
            </div>
            <?php //echo $_footer ?>
        </div>
        <div id="m_scroll_top" class="m-scroll-top">
            <i class="la la-arrow-up"></i>
        </div>
    </body>

    <div class="modal fade" id="m_idletime" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Session Timeout</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">                     
                    <p>Your session is about to expire.</p>
                    <p>Redirecting in <span class="countdown-holder" id="pageBeginCountdownText"></span> seconds.</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped countdown-bar active" role="progressbar" style="min-width: 15px; width: 100%;"  id="pageBeginCountdown">
                            <span class="countdown-holder"></span>
                        </div>
                    </div>                   
                </div>
                <div class="modal-footer">
                    <a href="<?php echo base_url('login/out') ?>" type="button" class="btn btn-secondary">Logout</a>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Stay Connected</button>
                </div>
            </div>
        </div>
    </div>
    <script>

        function ProgressCountdown(timeleft) {
            var deftime     = timeleft;
            return new Promise((resolve, reject) => {
                var countdownTimer = setInterval(() => {
                    timeleft--;

                    var width     = (timeleft/deftime)*100;
                    // document.getElementById(bar).value = timeleft;
                    $('#pageBeginCountdown').css("width", width+'%');
                    $('#pageBeginCountdownText').text(timeleft);
                    $('.countdown-holder').text(timeleft+'s');

                    if (timeleft <= 0) {
                        clearInterval(countdownTimer);
                        resolve(true);
                        $("#m_idletime").data('bs.modal')._isShown ? window.location = base_url + '/login/out' : null;
                    }
                }, 1000);
            });
        };

        $(document).ready(function() {
            // $(document).on("idle.idleTimer", function(t, e, l) {
            //     $('#m_idletime').modal();
            // });

            // $(document).on("active.idleTimer", function(t, e, l, s) {
            //     // console.log('active idle');
            // });

            // SET IDLE TIME 10 MENIT
            // $(document).idleTimer(6e5);

            // $('#m_idletime').on('show.bs.modal', function() {
            //     // do something when the modal is shown
            //     // ProgressCountdown(30);
            // });
            
        });

        $(window).on('load', function() {
            // global.init_sessionTimeout();
            // global.init_IdleTimerDemo();
            $('body').removeClass('m-page--loading');
        });
    </script>
</html>