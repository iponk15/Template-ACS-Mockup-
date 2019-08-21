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
					<a href="<?php echo base_url($url); ?>" class="m-portlet__nav-link m-portlet__nav-link--icon ajaxify">
						<i class="la la-refresh"></i>
					</a>
				</li>
			</ul>
		</div>
	</div>

	<form class="m-form m-form--fit m-form--label-align-right form_add" action="<?php echo base_url($url.'/detail_add') ?>" method="post">
		<div class="m-portlet__body">
			<div class="m-form__content">
				<div class="m-alert m-alert--icon alert alert-warning m--hide m_form_msg" user="alert">
					<div class="m-alert__icon"><i class="la la-warning"></i></div>
					<div class="m-alert__text">Warning!!! <br> There is some input cannot be blank!</div>
					<div class="m-alert__close"><button type="button" class="close" data-close="alert" aria-label="Close"></button></div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="form-group m-form__group row">
						<label for="example-text-input" class="col-form-label col-lg-4 col-sm-12">New Parent <span class="m--font-danger">*</span></label>
						<div class="col-lg-8 col-md-12 col-sm-12">
							<input class="form-control m-input" type="text" name="menu_nama" placeholder="Masukkan nama parent" tabindex="1" autocomplete="off">
						</div>
					</div>
					<div class="form-group m-form__group row">
						<div class="col-lg-12 col-md-12 col-sm-12" align="right">
							<button type="submit" class="btn btn-success m-btn btn-sm m-btn m-btn--icon" tabindex="2">
							<span>
								<i class="fa fa-check-circle"></i>
								<span>Tambah</span>
							</span>
						</button>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-5 col-sm-5">
					<div class="m-portlet m-portlet--creative m-portlet--bordered-semi">
						<div class="m-portlet__head">
							<div class="m-portlet__head-caption">
								<div class="m-portlet__head-title">
									<span class="m-portlet__head-icon">
										<i class="flaticon-layers"></i>
									</span>
									<h3 class="m-portlet__head-text">
										Atur menumu disini
									</h3>
									<h2 class="m-portlet__head-label m-portlet__head-label--primary">
										<span>Menu</span>
									</h2>
								</div>			
							</div>
						</div>
						<div class="m-portlet__body" style="max-height: 300px;overflow-y: auto;" id="tree_menu">
							
						</div>
					</div>	
				</div>
			</div>
		</div>
	</form>
</div>

<div class="modal fade" id="m_detail" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
      </div>
      <div class="modal-body" id="menu_detail"></div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
        <button type="button" class="btn btn-primary" id="btn-update">Ubah</button>
      </div>
    </div>
  </div>
</div>

<a href="<?php echo base_url($url); ?>" class="reload ajaxify"></a>

<script type="text/javascript">
	function customMenu(node)
	{
		var tree = $("#tree_menu").jstree(true);
	    var items = {
	        'Create' : {
	            'label' : 'Create Submenu',
	            'action' : function (obj) {node = tree.create_node(node);tree.edit(node);}
	        },
	        'Rename' : {
	            'label' : 'Rename',
	            'action' : function (obj) {tree.edit(node);}
	        },
	        'Delete' : {
	            'label' : 'Delete',
	            'action' : function (obj) {
	            	var child = node.children.length;
	            	if (child > 0) {
		            	swal({
					        title: "Apakah anda yakin?",
					        text: 'Submenu pada menu ini juga akan dihapus!',
					        html: false,
					        type: "warning",
					        showCancelButton: true,
					        confirmButtonColor: '#DD6B55',
					        confirmButtonText : 'Yes'
					    }).then(function(isConfirm){
					    	if(isConfirm.value == true){
					        	tree.delete_node(node);
					    	}
					    });
	            	}else{
					    tree.delete_node(node);
	            	}
	            }
	        },
	        'Detail' : {
	            'label' : 'Detail',
	            'action' : function (obj) {
	            	$('#exampleModalLabel').text(node.text);
	            	var target = base_url+"menu/detail/"+node.id;
	            	$('#menu_detail').html('');
	            	$('#m_detail').modal('show');
					mApp.block("#menu_detail",{});
					$("#menu_detail").load(target);
					mApp.unblock("#menu_detail",{});
	            }
	        }
	    }

	    if (node.type === 'level_1') {
	        delete items.item2;
	    } else if (node.type === 'level_2') {
	        delete items.item1;
	    }

	    return items;
	}

	$(document).ready(function () {
		// set form validation
		var rules = {
			menu_nama : {required: true}
	    };

	    var message = {};
		global.init_form_validation('.form_add',rules,message);

		$('#tree_menu').jstree({
			'contextmenu' : {
		        'items': function (node) {
		        	return customMenu(node)
		        }
		    },
	        'core' : {
		      	'data' : {
		              'url' : base_url+'menu/preview_menu?operation=get_node',
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
	      	'plugins' : ['state','contextmenu','wholerow','dnd']
    	}).on('create_node.jstree', function (e, data) {
		      $.get(base_url+'menu/preview_menu?operation=create_node', { 'id' : data.node.parent, 'position' : data.position, 'text' : data.node.text })
		        .done(function (d) {
		          data.instance.set_id(data.node, d.id);
		        })
		        .fail(function () {
		          data.instance.refresh();
		        });
		    }).on('rename_node.jstree', function (e, data) {
		      $.get(base_url+'menu/preview_menu?operation=rename_node', { 'id' : data.node.id, 'text' : data.text })
		        .fail(function () {
		          data.instance.refresh();
		        });
		    }).on('delete_node.jstree', function (e, data) {
		      $.get(base_url+'menu/preview_menu?operation=delete_node', { 'id' : data.node.id })
		        .fail(function () {
		          data.instance.refresh();
		        });
	    	}).bind("move_node.jstree", function(e, data) {
	    	  $.get(base_url+'menu/preview_menu?operation=move_node', { 'id' : data.node.id, 'parent' : data.parent, 'position' : data.position, 'old_position' : data.old_position})
		        .fail(function () {		          		
		          	swal({title: "Gagal!", text: "Terjadi kesalahan sambungan!", type: "error"}).then(function(){ 
					   data.instance.refresh();
					   }
					);
		        });
			});

		$('#btn-update').on('click', function(){
			var href = $('.form_detail').attr('action');
			$.ajax({
                type     : "POST",
                cache    : false,
                url      : href,
                data     : $('.form_detail').serialize(),
                success  : function(res) {
                    var datatrim = JSON.parse(res);
                    if (datatrim.status == 1) {
                        toastr.success(datatrim.message, 'Berhasil!');
                        $('#m_detail').modal('hide');
                        $('.reload').trigger('click');
                    } else if(datatrim.status == 0) {
                        toastr.error(datatrim.message, 'Gagal!')
                    }
                }
            });
		});
	});
</script>