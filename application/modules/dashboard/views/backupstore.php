<div class="m-portlet">
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <div class="m-portlet__head-title">
                <span class="m-portlet__head-icon">
                    <i class="flaticon-map-location"></i>
                </span>
                <h3 class="m-portlet__head-text">
                    <?php echo $pagetitle; ?>
                </h3>
            </div>
        </div>
        <div class="m-portlet__head-tools">
            <ul class="m-portlet__nav">
                <li class="m-portlet__nav-item">
                    <a href="" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-close"></i></a>
                </li>
                <li class="m-portlet__nav-item">
                    <a href="" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-refresh"></i></a>
                </li>
                <li class="m-portlet__nav-item">
                    <a href="" class="m-portlet__nav-link m-portlet__nav-link--icon"><i class="la la-circle"></i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="m-portlet__body">
        <div class="m-form m-form--label-align-right m--margin-top-20 m--margin-bottom-30">
			<div class="row align-items-center">
				<div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 order-2">
					<div class="form-group m-form__group row align-items-center">
						<div class="col-md-4">
                                <h4>Table Backup Store</h4>
						</div>
					</div>
				</div>
				<div class="col-xl-4 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url('dashboard/floating') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-refresh"></i><span>Proses Floating</span></span>
					</a>
					<div class="m-separator m-separator--dashed d-xl-none"></div>
				</div>
			</div>
		</div>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td style="background-color: aliceblue;" align="right" colspan="1">Flight Number</td>
                    <td colspan="1"><center><b>GA-728</b></center></td>
                    <td style="background-color: aliceblue;" align="right" colspan="1">AC Type</td>
                    <td colspan="1"><b><center>PK-GPW</center></b></td>
                    <td style="background-color: aliceblue;" align="right" colspan="1">Status</td>
                    <td colspan="1"><center><b>Schedule</b></center></td>
                </tr>
                <tr>
                    <td style="width:10%;background-color: aliceblue;" align="center">From</td>
                    <td style="width:10%;background-color: aliceblue;" align="center">To</td>
                    <td style="width:10%;background-color: aliceblue;" align="center">Dep Date (Loc)</td>
                    <td style="width:10%;background-color: aliceblue;" align="center">Arr Date (Loc)</td>
                    <td style="width:10%;background-color: aliceblue;" align="center">Dep Time (Loc)</td>
                    <td style="width:10%;background-color: aliceblue;" align="center">Arr Time (Loc)</td>
                </tr>
                <tr>
                    <td align="center"><b>DPS</b></td>
                    <td align="center"><b>PER</b></td>
                    <td align="center"><b>2019-05-01</b></td>
                    <td align="center"><b>2019-05-01</b></td>
                    <td align="center"><b>19:25:00</b></td>
                    <td align="center"><b>23:07:00</b></td>
                </tr>
                <tr>
                    <td colspan="6" style="background-color: whitesmoke;" align="center">Backup Store</td>
                </tr>
                <tr>
                    <td align="center" colspan="6">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th style="background-color: aquamarine;"><center>#</center></th>
                                    <th style="background-color: aquamarine;"><center>Date</center></th>
                                    <th style="background-color: aquamarine;"><center>No DCC</center></th>
                                    <th style="background-color: aquamarine;"><center>Article Number</center></th>
                                    <th style="background-color: aquamarine;"><center>QTY SAP</center></td>
                                    <th style="background-color: aquamarine;"><center>QTY Receive</center></td>
                                    <th style="background-color: aquamarine;"><center>QTY Request</center></th>
                                    <th style="background-color: aquamarine;"><center>Remark</center></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">
                                        <center>
                                            <label class="m-checkbox">
                                                <input type="checkbox"><span></span>
                                            </label>
                                        </center>
                                    </th>
                                    <td><center><?php echo date('d M Y')?></center></td>
                                    <td><center>DCC01</center></td>
                                    <td><center>AT01</center></td>
                                    <td><center>1100</center></td>
                                    <td><center>800</center></td>
                                    <td>
                                        <center>
                                            <input type="number" name="" class="form-control m-input">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="text" name="" class="form-control m-input">
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <center>
                                            <label class="m-checkbox">
                                                <input type="checkbox"><span></span>
                                            </label>
                                        </center>
                                    </th>
                                    <td><center><?php echo date('d M Y')?></center></td>
                                    <td><center>DCC02</center></td>
                                    <td><center>AT02</center></td>
                                    <td><center>1200</center></td>
                                    <td><center>400</center></td>
                                    <td>
                                        <center>
                                            <input type="number" name="" class="form-control m-input">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="text" name="" class="form-control m-input">
                                        </center>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <center>
                                            <label class="m-checkbox">
                                                <input type="checkbox"><span></span>
                                            </label>
                                        </center>
                                    </th>
                                    <td><center><?php echo date('d M Y')?></center></td>
                                    <td><center>DCC03</center></td>
                                    <td><center>AT03</center></td>
                                    <td><center>1300</center></td>
                                    <td><center>600</center></td>
                                    <td>
                                        <center>
                                            <input type="number" name="" class="form-control m-input">
                                        </center>
                                    </td>
                                    <td>
                                        <center>
                                            <input type="text" name="" class="form-control m-input">
                                        </center>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
