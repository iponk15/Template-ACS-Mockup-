<div class="m-portlet m-portlet--head-sm m-portlet--collapse" m-portlet="true" id="m_portlet_tools_7" >
    <div class="m-portlet__head">
        <div class="m-portlet__head-caption">
            <a href="<?php echo base_url('dashboard') ?>" class="btn btn-outline-danger btn-sm 	m-btn m-btn--icon m-btn--outline-2x ajaxify">
                <span>
                    <i class="fa fa-plane"></i>
                    <span>Back To List Flight Schedule</span>
                </span>
            </a>
        </div>
    </div>
</div>
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
				<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 order-2">
					<div class="form-group m-form__group row align-items-center">
						<div class="col-md-4">
                                <h4>Table MWH</h4>
						</div>
					</div>
				</div>
				<div class="col-xl-6 order-1 order-xl-2 m--align-right">
					<a href="<?php echo base_url('dashboard/backupstore') ?>" class="ajaxify btn btn-accent m-btn m-btn--custom m-btn--icon m-btn--air">
						<span><i class="la la-refresh"></i><span>Proses Backup Store</span></span>
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
                    <td colspan="6" style="background-color: whitesmoke;" align="center">Main Warehouse</td>
                </tr>
                <tr>
                    <td align="center" style="background-color: aquamarine;">#</td>
                    <td align="center" style="background-color: aquamarine;">No DCC</td>
                    <td align="center" style="background-color: aquamarine;">Article Number</td>
                    <td align="center" style="background-color: aquamarine;">QTY SAP</td>
                    <td colspan="2" align="center" style="background-color: aquamarine;">QTY Receive</td>
                </tr>
                <tr>
                    <th scope="row">
                        <center>
                            <label class="m-checkbox">
                                <input type="checkbox"><span></span>
                            </label>
                        </center>
                    </th>
                    <td><center>DCC01</center></td>
                    <td><center>AT01</center></td>
                    <td><center>1100</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC02</center></td>
                    <td><center>AT02</center></td>
                    <td><center>1200</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC03</center></td>
                    <td><center>AT03</center></td>
                    <td><center>1300</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC04</center></td>
                    <td><center>AT04</center></td>
                    <td><center>1400</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC05</center></td>
                    <td><center>AT05</center></td>
                    <td><center>1500</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC06</center></td>
                    <td><center>AT06</center></td>
                    <td><center>1600</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC07</center></td>
                    <td><center>AT07</center></td>
                    <td><center>1700</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC08</center></td>
                    <td><center>AT08</center></td>
                    <td><center>1800</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC09</center></td>
                    <td><center>AT09</center></td>
                    <td><center>1900</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
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
                    <td><center>DCC10</center></td>
                    <td><center>AT10</center></td>
                    <td><center>2000</center></td>
                    <td colspan="2">
                        <center>
                            <input type="number" name="" class="form-control m-input">
                        </center>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
