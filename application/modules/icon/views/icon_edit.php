<div class="m-portlet m-portlet--mobile">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<span class="m-portlet__head-icon">
					<i class="flaticon-interface-2"></i>
				</span>
				<h3 class="m-portlet__head-text">
					<span><?php echo $pagetitle ?></span>
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			<ul class="m-portlet__nav">
				<li class="m-portlet__nav-item">
					<a href="<?php echo base_url($url.'/show_edit/'.$id); ?>" class="m-portlet__nav-link m-portlet__nav-link--icon ajaxify">
						<i class="la la-refresh"></i>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<form class="m-form m-form--fit m-form--label-align-right form_edit" action="<?php echo base_url($url.'/action_edit/'.$id) ?>" method="post" data-confirm="1" >
		<input type="hidden" name="icon_tipe" value="<?php echo $records->icon_tipe; ?>" >
		<div class="m-portlet__body">
			<div class="m-form__content">
				<div class="m-alert m-alert--icon alert alert-warning m--hide m_form_msg" user="alert">
					<div class="m-alert__icon"><i class="la la-warning"></i></div>
					<div class="m-alert__text">Warning!!! <br> There is some input cannot be blank!</div>
					<div class="m-alert__close"><button type="button" class="close" data-close="alert" aria-label="Close"></button></div>
				</div>
			</div>
			<div class="form-group m-form__group row">
				<label for="example-text-input" class="col-form-label col-lg-2 col-sm-12">Label </label>
				<div class="col-lg-4 col-md-9 col-sm-12">
					<input class="form-control m-input" type="text" disabled value="<?php echo $records->icon_label ?>" tabindex="2">
				</div>
			</div>
			<div class="form-group m-form__group row">
				<label for="example-text-input" class="col-form-label col-lg-2 col-sm-12">Deskripsi </label>
				<div class="col-lg-4 col-md-9 col-sm-12">
					<textarea class="form-control m-input" name="icon_deskripsi" placeholder="Masukkan keterangan" cols="30" rows="5" tabindex="3"><?php echo $records->icon_deskripsi ?></textarea>
				</div>
			</div>
		</div>
		<div class="m-portlet__foot m-portlet__foot--fit">
			<div class="m-form__actions">
				<div class="row">
					<div class="offset-2 col-10">
						<a href="<?php echo base_url($url); ?>" class="btn btn-danger m-btn btn-sm  m-btn m-btn--icon ajaxify" tabindex="5">
							<span><i class="fa fa-backspace"></i>
								<span>Discard</span>
							</span>
						</a>
						<button type="submit" class="btn btn-success m-btn btn-sm m-btn m-btn--icon submit" tabindex="4">
							<span>
								<i class="fa fa-check-circle"></i>
								<span>Save</span>
							</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<a href="<?php echo base_url($url.'/show_edit/'.$id); ?>" class="reload ajaxify"></a>
<a href="<?php echo base_url($url); ?>" class="reload_index ajaxify"></a>

<script type="text/javascript">
	$(document).ready(function () {
		// set form validation
		var rules   = {};
	    var message = {};
		global.init_form_validation('.form_edit',rules,message);
	});
</script>