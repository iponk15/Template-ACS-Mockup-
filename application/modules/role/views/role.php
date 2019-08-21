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
								<select class="form-control m-input role_status">
									<option value=""></option>
									<option value="1">Active</option>
									<option value="0">Inactive</option>
								</select>
							</div>
							<div class="d-md-none m--margin-bottom-10"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url($url.'/show_add') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-plus-circle"></i><span>Tambah Data</span></span>
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
<a href="<?php echo base_url($url); ?>" class="reload ajaxify"></a>
<script type="text/javascript">
	$(document).ready(function () {
		$('.role_status').select2({
			placeholder: 'Select Status',
			allowClear : true
		});

		var clas   = ".datatable";
		var urll   = "<?php echo base_url($url.'/select'); ?>";
		var column = [
			{ field: "no",title: "No.",width: 30,textAlign: 'center',sortable:!1},
			{ field: "role_nama",title: "Nama",filterable: true,width: 	120},
			{ field: "role_deskripsi",title: "Deskripsi",filterable: true,width: 150},
			{ field: "role_status",title: "Status",filterable: true,width: 65,textAlign: 'center'}, 
			{ field: "role_lastupdate",title: "Last Update",filterable: true,width: 150,textAlign: 'center'}, 
			{ field: "action", title: "Action",width: 120,textAlign: 'center',sortable:!1}
		];

		var cari = {
			generalSearch :'.generalSearch', 
			role_status   : '.role_status'
		};

		global.init_datatable(clas, urll, column,cari);
	});
</script>