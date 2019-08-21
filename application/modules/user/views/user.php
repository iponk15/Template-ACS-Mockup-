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
					<a href="<?php echo base_url($url); ?>" class="m-portlet__nav-link m-portlet__nav-link--icon ajaxify">
						<i class="la la-refresh"></i>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<!--begin: Search Form -->
		<div class="m-form m-form--label-align-right m--margin-top-20 m--margin-bottom-30">
			<div class="row align-items-center">
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 order-2">
					<div class="form-group m-form__group row align-items-center">
						<div class="col-md-4">
							<div class="m-input-icon m-input-icon--left">
								<input type="text" class="form-control m-input m-input--solid generalSearch" placeholder="Search...">
								<span class="m-input-icon__icon m-input-icon__icon--left">
									<span>
										<i class="la la-search"></i>
									</span>
								</span>
							</div>
							<div class="d-md-none m--margin-bottom-10"></div>
						</div>
						<div class="col-md-4">
							<div class="m-input-icon m-input-icon--left">
								<select class="form-control m-input user_status">
									<option value="">Select Status</option>
									<option value="1">Active</option>
									<option value="0">Inactive</option>
								</select>
							</div>
							<div class="d-md-none m--margin-bottom-10"></div>
						</div>
						<div class="col-md-4">
							<div class="m-input-icon m-input-icon--left">
								<select class="form-control m-input user_bo">
									<option></option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 order-1 order-xl-2 m--align-right">
					<?php if (isset($aaaa)): ?>
					<!-- KONDISI UNTUK MENGHIDDEN TOMBOL INI -->
					<a href="<?php echo base_url('user/export_excel') ?>" class="btn btn-primary m-btn m-btn--custom m-btn--icon m-btn--air" target="_blank">
						<span><i class="la la-file-excel-o"></i><span>Export</span></span>
					</a>						
					<?php endif ?>
					<a href="<?php echo base_url('user/show_add') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-plus-circle"></i><span>Add User</span></span>
					</a>
					<div class="m-separator m-separator--dashed d-xl-none"></div>
				</div>
			</div>
		</div>
		
		<!--begin: Datatable -->
		<div class="datatable"></div>
		<!--end: Datatable -->
	</div>
</div>
<a href="<?php echo base_url('user'); ?>" class="reload ajaxify"></a>
<script type="text/javascript">
	$(document).ready(function () {

		$('.user_status').select2({
			placeholder : 'Select Status',
			allowClear  : true
		});

		var clas   = '.datatable';
		var urll   = '<?php echo base_url("user/select"); ?>';
		var column = [
			{ field: "no",title: "<center>No.</center>",width: 30,textAlign: 'center',sortable:!1},
			{ field: "user_nopeg",title: "<center>Nopeg</center>",filterable: true,width: 60,textAlign: 'center'},
			{ field: "user_nama",title: "<center>Nama</center>",filterable: true,width: 150},
			{ field: "user_email",title: "<center>Email</center>",filterable: true,width: 230},
			{ field: "role_nama",title: "<center>Role</center>",filterable: true,width: 90,textAlign: 'center'},
			{ field: "user_status",title: "<center>Status</center>",filterable: true,width: 70,textAlign: 'center'},
			{ field: "action", title: "<center>Action</center>",width: 150,textAlign: 'center',sortable:!1}
		];

	 	var cari = {generalSearch :'.generalSearch', user_status : '.user_status', user_bo: '.user_bo'};
	 	global.init_datatable(clas, urll, column, cari);
	 	global.init_select2('.user_bo', 'fetch/fetch_global/has_bo/bo_code/bo_code', 'Select BO', false, true);
	});
</script>