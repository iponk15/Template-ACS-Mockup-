<div class="m-portlet m-portlet--tabs">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">	
				<span class="m-portlet__head-icon">
					<i class="flaticon-interface-2"></i>
				</span>
				<h3 class="m-portlet__head-text">
					<?php echo $pagetitle; ?>
				</h3>
			</div>
		</div>
		<div class="m-portlet__head-tools">
			<ul class="nav nav-tabs m-tabs-line m-tabs-line--right" role="tablist">
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link active" data-toggle="tab" href="#flaticon" role="tab">
						Flaticon
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#fontawesome" role="tab">
						Fontawesome 5
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#lineawesome" role="tab">
						Lineawesome
					</a>
				</li>
				<li class="nav-item m-tabs__item">
					<a class="nav-link m-tabs__link" data-toggle="tab" href="#socicons" role="tab">
						Socicons
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="m-portlet__body">
		<div class="tab-content">
			<div class="tab-pane active" id="flaticon" role="tabpanel">
				<div class="col-xl-12 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url($url.'/show_add/1') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-plus-circle"></i><span>Tambah Data Flaticon</span></span>
					</a>
					<div class="m-separator m-separator--dashed d-xl-none"></div>
				</div>
				<br>
				<?php 
					if(empty($rcdFltcn)){
						echo '<div class="m-alert m-alert--icon m-alert--icon-solid m-alert--outline alert alert-info alert-dismissible fade show" role="alert">
								<div class="m-alert__icon">
									<i class="flaticon-exclamation-1"></i>
									<span></span>
								</div>
								<div class="m-alert__text">
									<strong>Mohon maaf !</strong> Data icon <b>Flaticon</b> kosng.
								</div>
							</div>';
					}else{
						echo '<div class="row">';
							foreach ($rcdFltcn as $value) {
								echo '<div class="col-md-2">
										<div class="m-demo-icon" style="background-color: ghostwhite;">
											<div class="m-demo-icon__preview">
												<i class="'.$value->icon_label.'"></i>
											</div>
											<div class="m-demo-icon__class">'.$value->icon_deskripsi.' </div>
											<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
												<a href="#" class="m-portlet__nav-link m-dropdown__toggle btn btn-outline-warning m-btn m-btn--icon btn-sm m-btn--icon-only m-btn--pill m-btn--air">
													<i class="la la-ellipsis-v"></i>
												</a>
												<div class="m-dropdown__wrapper">
													<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
													<div class="m-dropdown__inner">
														<div class="m-dropdown__body">
															<div class="m-dropdown__content">
																<ul class="m-nav">
																	<li class="m-nav__section m-nav__section--first">
																		<span class="m-nav__section-text"><h6>Aksi</h6></span>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/show_edit/'.md56($value->icon_id)).'" class="m-nav__link ajaxify">
																			<i class="m-nav__link-icon flaticon-edit"></i>
																			<span class="m-nav__link-text">Edit Icon</span>
																		</a>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/action_delete/'.md56($value->icon_id)).'" class="m-nav__link" onClick="return f_status(2, this, event)">
																			<i class="m-nav__link-icon flaticon-circle"></i>
																			<span class="m-nav__link-text">Hapus Icon</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>';
							}
						echo '</div>';

					}
				?>
			</div>
			<div class="tab-pane" id="fontawesome" role="tabpanel">
				<div class="col-xl-12 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url($url.'/show_add/2') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-plus-circle"></i><span>Tambah Data Fontawesome 5</span></span>
					</a>
					<div class="m-separator m-separator--dashed d-xl-none"></div>
				</div>
				<br>
				<?php 
					if(empty($rcdFawsm)){
						echo '<div class="m-alert m-alert--icon m-alert--icon-solid m-alert--outline alert alert-info alert-dismissible fade show" role="alert">
								<div class="m-alert__icon">
									<i class="flaticon-exclamation-1"></i>
									<span></span>
								</div>
								<div class="m-alert__text">
									<strong>Mohon maaf !</strong> Data icon <b>Fontawesome 5</b> kosng.
								</div>
							</div>';
					}else{
						echo '<div class="row">';
							foreach ($rcdFawsm as $value) {
								echo '<div class="col-md-2">
										<div class="m-demo-icon" style="background-color: ghostwhite;">
											<div class="m-demo-icon__preview">
												<i class="'.$value->icon_label.'"></i>
											</div>
											<div class="m-demo-icon__class">'.$value->icon_deskripsi.' </div>
											<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
												<a href="#" class="m-portlet__nav-link m-dropdown__toggle btn btn-outline-warning m-btn m-btn--icon btn-sm m-btn--icon-only m-btn--pill m-btn--air">
													<i class="la la-ellipsis-v"></i>
												</a>
												<div class="m-dropdown__wrapper">
													<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
													<div class="m-dropdown__inner">
														<div class="m-dropdown__body">
															<div class="m-dropdown__content">
																<ul class="m-nav">
																	<li class="m-nav__section m-nav__section--first">
																		<span class="m-nav__section-text"><h6>Aksi</h6></span>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/show_edit/'.md56($value->icon_id)).'" class="m-nav__link ajaxify">
																			<i class="m-nav__link-icon flaticon-edit"></i>
																			<span class="m-nav__link-text">Edit Icon</span>
																		</a>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/action_delete/'.md56($value->icon_id)).'" class="m-nav__link" onClick="return f_status(2, this, event)">
																			<i class="m-nav__link-icon flaticon-circle"></i>
																			<span class="m-nav__link-text">Hapus Icon</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>';
							}
						echo '</div>';

					}
				?>		
			</div>
			<div class="tab-pane" id="lineawesome" role="tabpanel">
				<div class="col-xl-12 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url($url.'/show_add/3') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-plus-circle"></i><span>Tambah Data Lineawesome</span></span>
					</a>
					<div class="m-separator m-separator--dashed d-xl-none"></div>
				</div>
				<br>
				<?php 
					if(empty($rcdLawsm)){
						echo '<div class="m-alert m-alert--icon m-alert--icon-solid m-alert--outline alert alert-info alert-dismissible fade show" role="alert">
								<div class="m-alert__icon">
									<i class="flaticon-exclamation-1"></i>
									<span></span>
								</div>
								<div class="m-alert__text">
									<strong>Mohon maaf !</strong> Data icon <b>Lineawesome</b> kosng.
								</div>
							</div>';
					}else{
						echo '<div class="row">';
							foreach ($rcdLawsm as $value) {
								echo '<div class="col-md-2">
										<div class="m-demo-icon" style="background-color: ghostwhite;">
											<div class="m-demo-icon__preview">
												<i class="'.$value->icon_label.'"></i>
											</div>
											<div class="m-demo-icon__class">'.$value->icon_deskripsi.' </div>
											<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
												<a href="#" class="m-portlet__nav-link m-dropdown__toggle btn btn-outline-warning m-btn m-btn--icon btn-sm m-btn--icon-only m-btn--pill m-btn--air">
													<i class="la la-ellipsis-v"></i>
												</a>
												<div class="m-dropdown__wrapper">
													<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
													<div class="m-dropdown__inner">
														<div class="m-dropdown__body">
															<div class="m-dropdown__content">
																<ul class="m-nav">
																	<li class="m-nav__section m-nav__section--first">
																		<span class="m-nav__section-text"><h6>Aksi</h6></span>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/show_edit/'.md56($value->icon_id)).'" class="m-nav__link ajaxify">
																			<i class="m-nav__link-icon flaticon-edit"></i>
																			<span class="m-nav__link-text">Edit Icon</span>
																		</a>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/action_delete/'.md56($value->icon_id)).'" class="m-nav__link" onClick="return f_status(2, this, event)">
																			<i class="m-nav__link-icon flaticon-circle"></i>
																			<span class="m-nav__link-text">Hapus Icon</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>';
							}
						echo '</div>';

					}
				?>
			</div>
			<div class="tab-pane" id="socicons" role="tabpanel">
				<div class="col-xl-12 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url($url.'/show_add/4') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-plus-circle"></i><span>Tambah Data Socicons</span></span>
					</a>
					<div class="m-separator m-separator--dashed d-xl-none"></div>
				</div>
				<br>
				<?php 
					if(empty($rcdScicn)){
						echo '<div class="m-alert m-alert--icon m-alert--icon-solid m-alert--outline alert alert-info alert-dismissible fade show" role="alert">
								<div class="m-alert__icon">
									<i class="flaticon-exclamation-1"></i>
									<span></span>
								</div>
								<div class="m-alert__text">
									<strong>Mohon maaf !</strong> Data icon <b>Socicons</b> kosng.
								</div>
							</div>';
					}else{
						echo '<div class="row">';
							foreach ($rcdScicn as $value) {
								echo '<div class="col-md-2">
										<div class="m-demo-icon" style="background-color: ghostwhite;">
											<div class="m-demo-icon__preview">
												<i class="'.$value->icon_label.'"></i>
											</div>
											<div class="m-demo-icon__class">'.$value->icon_deskripsi.' </div>
											<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
												<a href="#" class="m-portlet__nav-link m-dropdown__toggle btn btn-outline-warning m-btn m-btn--icon btn-sm m-btn--icon-only m-btn--pill m-btn--air">
													<i class="la la-ellipsis-v"></i>
												</a>
												<div class="m-dropdown__wrapper">
													<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
													<div class="m-dropdown__inner">
														<div class="m-dropdown__body">
															<div class="m-dropdown__content">
																<ul class="m-nav">
																	<li class="m-nav__section m-nav__section--first">
																		<span class="m-nav__section-text"><h6>Aksi</h6></span>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/show_edit/'.md56($value->icon_id)).'" class="m-nav__link ajaxify">
																			<i class="m-nav__link-icon flaticon-edit"></i>
																			<span class="m-nav__link-text">Edit Icon</span>
																		</a>
																	</li>
																	<li class="m-nav__item">
																		<a href="'.base_url('icon/action_delete/'.md56($value->icon_id)).'" class="m-nav__link" onClick="return f_status(2, this, event)">
																			<i class="m-nav__link-icon flaticon-circle"></i>
																			<span class="m-nav__link-text">Hapus Icon</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>';
							}
						echo '</div>';

					}
				?>
			</div>
		</div>
	</div>
</div>
<a href="<?php echo base_url($url); ?>" class="reload ajaxify"></a>
<script type="text/javascript">
	$(document).ready(function () {
		
	});
</script>