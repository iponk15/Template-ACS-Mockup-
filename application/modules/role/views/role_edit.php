<div class="m-portlet m-portlet--mobile">
	<div class="m-portlet__head">
		<div class="m-portlet__head-caption">
			<div class="m-portlet__head-title">
				<span class="m-portlet__head-icon">
					<i class="flaticon-file"></i>
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

	<form class="m-form m-form--fit m-form--label-align-right form_add" action="<?php echo base_url($url.'/action_edit/'.$id) ?>" method="post" onsubmit="return submitMe()" data-confirm="1">
		<div class="m-portlet__body">
			<div class="m-form__content">
				<div class="m-alert m-alert--icon alert alert-warning m--hide m_form_msg" user="alert">
					<div class="m-alert__icon"><i class="la la-warning"></i></div>
					<div class="m-alert__text">Warning!!! <br> There is some input cannot be blank!</div>
					<div class="m-alert__close"><button type="button" class="close" data-close="alert" aria-label="Close"></button></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-4">
					<div class="form-group m-form__group row">
						<label for="example-text-input" class="col-form-label col-lg-4 col-sm-12">Nama <span class="m--font-danger">*</span></label>
						<div class="col-lg-8 col-md-9 col-sm-12">
							<input class="form-control m-input" type="text" name="role_nama" placeholder="Masukkan nama" tabindex="2" autocomplete="off" value="<?php echo $records->role_nama ?>">
						</div>
					</div>
					<div class="form-group m-form__group row">
						<label for="example-text-input" class="col-form-label col-lg-4 col-sm-12">Deskripsi</label>
						<div class="col-lg-8 col-md-9 col-sm-12">
							<textarea class="form-control m-input" name="role_deskripsi" placeholder="Masukkan deskripsi" cols="30" rows="5" tabindex="3"><?php echo $records->role_deskripsi ?></textarea>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div id="m_tree_3" class="tree-demo"> </div>
				</div>
				<div class="col-md-2"></div>
			</div>
			<input type="hidden" name="val_jstree" value="" id="val_jstree">
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
								<span>Submit</span>
							</span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<a href="<?php echo base_url($url.'/show_edit/'.$id); ?>" class="reload ajaxify"></a>

<script type="text/javascript">
	function submitMe(){
		var result = $('#m_tree_3').jstree('get_selected', true);
		var resultIds = [];
		$.each(result, function() {
			resultIds.push(
          {
            id: this.id,
            parent: this.parent == '#' ? this.id : this.parent
          }
         )
	    });
	    $('#val_jstree').val(JSON.stringify(resultIds) == '[]' ? '' : JSON.stringify(resultIds));
	}

	$(document).ready(function () {
		var role_id 	= '<?php echo $id ?>';
		// set form validation
		var rules   = { role_nama : {required: true} };
		var message = {};
			
		global.init_form_validation('.form_add',rules,message);

		$("#m_tree_3").jstree({
            plugins: ["wholerow", "checkbox", "types"],
            core: {
                themes: {
                    responsive: !1
                },
                data : {
	              'url' : base_url+'role/preview_menu/'+role_id+'?operation=get_node',
	              'data' : function (node) {
	                return { 'id' : node.id };
	              },
	              "dataType" : "json"
	            }
	            ,'check_callback' : true,
	            'themes' : {
	              'responsive' : false
	            }
            },
            types: {
                default: {
                    icon: "fa fa-folder m--font-warning"
                },
                file: {
                    icon: "fa fa-file  m--font-warning"
                }
            }
        });
	});
</script>