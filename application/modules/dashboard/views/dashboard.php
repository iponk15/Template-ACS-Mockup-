<div class="row">
	<div class="col-xl-3 col-lg-4">
		<div class="m-portlet m-portlet--full-height  ">
			<div class="m-portlet__body">
				<div class="m-card-profile">
					<div class="m-card-profile__title m--hide">
						Your Profile
					</div>
					<div class="m-card-profile__pic">
						<div class="m-card-profile__pic-wrapper">
							<img src="<?php echo base_url('assets/app/media/img/users/user4.jpg') ?>" alt="" />
						</div>
					</div>
					<div class="m-card-profile__details">
						<span class="m-card-profile__name"><?php echo getSession('user_nama'); ?></span>
						<a href="" class="m-card-profile__email m-link"><?php echo getSession('user_email') ?></a>
					</div>
				</div>
				<ul class="m-nav m-nav--hover-bg m-portlet-fit--sides">
					<li class="m-nav__separator m-nav__separator--fit"></li>
					<li class="m-nav__section m--hide">
						<span class="m-nav__section-text">Section</span>
					</li>
					<li class="m-nav__item">
						<a href="javascript:;" class="m-nav__link">
							<i class="m-nav__link-icon flaticon-settings"></i>
							<span class="m-nav__link-text"><?php echo $role; ?></span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-xl-9 col-lg-8">
		<div class="alert alert-success" role="alert">
			<strong>Selamat datang di Aplikasi Aerofood ACS</strong>
		</div>
		<div class="m-portlet m-portlet--mobile ">
			<div class="m-portlet__head">
				<div class="m-portlet__head-caption">
					<div class="m-portlet__head-title">
						<span class="m-portlet__head-icon">
							<i class="flaticon-paper-plane"></i>
						</span>
						<h3 class="m-portlet__head-text">
							Jadwal Penerbangan
						</h3>
					</div>
				</div>
				<div class="m-portlet__head-tools">
					<ul class="m-portlet__nav">
						<li class="m-portlet__nav-item">
							<div class="m-dropdown m-dropdown--inline m-dropdown--arrow m-dropdown--align-right m-dropdown--align-push" m-dropdown-toggle="hover" aria-expanded="true">
								<a href="#" class="m-portlet__nav-link btn btn-lg btn-secondary  m-btn m-btn--icon m-btn--icon-only m-btn--pill  m-dropdown__toggle">
									<i class="la la-ellipsis-h m--font-brand"></i>
								</a>
								<div class="m-dropdown__wrapper">
									<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
									<div class="m-dropdown__inner">
										<div class="m-dropdown__body">
											<div class="m-dropdown__content">
												<ul class="m-nav">
													<li class="m-nav__section m-nav__section--first">
														<span class="m-nav__section-text">Quick Actions</span>
													</li>
													<li class="m-nav__item">
														<a href="" class="m-nav__link">
															<i class="m-nav__link-icon flaticon-share"></i>
															<span class="m-nav__link-text">Create Post</span>
														</a>
													</li>
													<li class="m-nav__item">
														<a href="" class="m-nav__link">
															<i class="m-nav__link-icon flaticon-chat-1"></i>
															<span class="m-nav__link-text">Send Messages</span>
														</a>
													</li>
													<li class="m-nav__item">
														<a href="" class="m-nav__link">
															<i class="m-nav__link-icon flaticon-multimedia-2"></i>
															<span class="m-nav__link-text">Upload File</span>
														</a>
													</li>
													<li class="m-nav__section">
														<span class="m-nav__section-text">Useful Links</span>
													</li>
													<li class="m-nav__item">
														<a href="" class="m-nav__link">
															<i class="m-nav__link-icon flaticon-info"></i>
															<span class="m-nav__link-text">FAQ</span>
														</a>
													</li>
													<li class="m-nav__item">
														<a href="" class="m-nav__link">
															<i class="m-nav__link-icon flaticon-lifebuoy"></i>
															<span class="m-nav__link-text">Support</span>
														</a>
													</li>
													<li class="m-nav__separator m-nav__separator--fit m--hide">
													</li>
													<li class="m-nav__item m--hide">
														<a href="#" class="btn btn-outline-danger m-btn m-btn--pill m-btn--wide btn-sm">Submit</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="m-portlet__body">

				<table class="table m-table m-table--head-bg-brand table-bordered m-table--border-success">
					<thead class="thead-inverse">
						<tr>
							<th width="1%"><center><b>No.</b></center></th>
							<th width="15%"><center><b>Flihgt No</b></center></th>
							<th width="15%"><center><b>Ac Type</b></center></th>
							<th><center><b>From</b></center></th>
							<th><center><b>To</b></center></th>
							<th><center><b>ATD</b></center></th>
							<th><center><b>ATA</b></center></th>
							<th width="15%"><center><b>Action</b></center></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><center>1</center></th>
							<td><center>GA-728</center></td>
							<td><center>PK-GPW</center></td>
							<td><center>DPS</center></td>
							<td><center>PER</center></td>
							<td><center>2019-05-01 19:25:00</center></td>
							<td><center>2019-05-01 23:07:00</center></td>
							<td>
								<center>
									<a href="<?php echo base_url('dashboard/detail') ?>" class="btn btn-outline-success btn-sm m-btn m-btn--icon ajaxify">
										<span>
											<i class="fa flaticon-settings"></i>
											<span>Proses</span>
										</span>
									</a>
								</center>
							</td>
						</tr>
						<tr>
							<th scope="row"><center>2</center></th>
							<td><center>GA-822</center></td>
							<td><center>PK-GFM</center></td>
							<td><center>CGK</center></td>
							<td><center>SIN</center></td>
							<td><center>2019-05-05 20:31:00</center></td>
							<td><center>2019-05-05 23:23:00</center></td>
							<td>
								<center>
									<a href="<?php echo base_url('dashboard/detail') ?>" class="btn btn-outline-success btn-sm m-btn m-btn--icon ajaxify">
										<span>
											<i class="fa flaticon-settings"></i>
											<span>Proses</span>
										</span>
									</a>
								</center>
							</td>
						</tr>
						<tr>
							<th scope="row"><center>3</center></th>
							<td><center>GA-162</center></td>
							<td><center>PK-GFL</center></td>
							<td><center>CGK</center></td>
							<td><center>PDG</center></td>
							<td><center>2019-05-03 11:28:00</center></td>
							<td><center>2019-05-03 13:12:00</center></td>
							<td>
								<center>
									<a href="#" class="btn btn-outline-success btn-sm m-btn m-btn--icon">
										<span>
											<i class="fa flaticon-settings"></i>
											<span>Proses</span>
										</span>
									</a>
								</center>
							</td>
						</tr>
						<tr>
							<th scope="row"><center>4</center></th>
							<td><center>GA-328</center></td>
							<td><center>PK-GMO</center></td>
							<td><center>CGK</center></td>
							<td><center>SUB</center></td>
							<td><center>2019-04-23 20:03:00</center></td>
							<td><center>2019-04-23 21:35:00</center></td>
							<td>
								<center>
									<a href="#" class="btn btn-outline-success btn-sm m-btn m-btn--icon">
										<span>
											<i class="fa flaticon-settings"></i>
											<span>Proses</span>
										</span>
									</a>
								</center>
							</td>
						</tr>
						<tr>
							<th scope="row"><center>5</center></th>
							<td><center>GA-168</center></td>
							<td><center>PK-GNM</center></td>
							<td><center>CGK</center></td>
							<td><center>PDG</center></td>
							<td><center>2019-04-21 20:04:00</center></td>
							<td><center>2019-04-21 21:54:00</center></td>
							<td>
								<center>
									<a href="#" class="btn btn-outline-success btn-sm m-btn m-btn--icon">
										<span>
											<i class="fa flaticon-settings"></i>
											<span>Proses</span>
										</span>
									</a>
								</center>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	</div>
</div>