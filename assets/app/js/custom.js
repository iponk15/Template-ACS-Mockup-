//function update status
function form_delete(ele, eve,){
    eve.preventDefault();

    var mes  = "Apakah anda yakin akan menghapus data ini ?";
    var sus  = "Data berhasil di hapus !";
    var err  = "Data gagal di hapus !";
    var head = "Hapus Data !";
    var html = false;

    swal({
        title              : "Anda Yakin ?",
        text               : mes,
        html               : html,
        type               : "warning",
        showCancelButton   : true,
        confirmButtonColor : '#DD6B55',
        confirmButtonText  : 'Yes'
    }).then(function(isConfirm){
        if(isConfirm.value == true){
            var href = $(ele).attr('href');
            mApp.block("#body-content",{});
            $.post(href, function(data1, textStatus, xhr) {
                mApp.unblock("#body-content",{});
                if (data1.status == 1) {
                    swal(
                        head,
                        sus,
                        'success'
                    );
                   
                    $(".reload_index").trigger("click");
                } else {
                    swal(
                        head,
                        err,
                        'error'
                    );
                }
            }, 'json');
        }
    });
}

function f_status(stat, ele, eve, dtele){
    eve.preventDefault();

    if(stat == 1){
        var mes = "Are you sure want to change Status ?";
        var sus = "Successfully Change Status!";
        var err = "Error Change Status!";
        var head= "Status Changed!";
        var html = false;
    }else if(stat == 2){
        var mes = "Are you sure want to Delete data ?";
        var sus = "Successfully Delete data!";
        var err = "Error Delete data!";
        var head= "Deleted!";
        var html = false;
    }else if(stat == 3){
        var mes = "<b>This will delete all related Subscription too!</b></br>Are you sure want to Delete data ?";
        var sus = "Successfully Delete data!";
        var err = "Error Delete data!";
        var head= "Deleted";
        var html = true;
    };
    // return false;
    swal({
        title: "Are you sure?",
        text: mes,
        html: html,
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: '#DD6B55',
        onOpen: function() {
                var prm = {
                autoclose   : true,
                format      : "mm/dd/yyyy",
                orientation: "bottom left"
            }
            global.init_dtrp(1,'.form-date',prm);
        },
        preConfirm : function(){
            if (stat==10) {
                if ($('#res_date').val() == '') { 
                    toastr.error('Reservation Date cannot be blank!!', 'Error');
                    return false
                } else { 
                    return true
                };
            } else {
                return true;
            }
        },
        confirmButtonText : 'Yes'
    }).then(function(isConfirm){
        if(isConfirm.value == true){
            var href = $(ele).attr('href');
            mApp.block("#body-content",{});
            if (stat == 10) {
                var dateRes = $('#res_date').val();
                $.post(href, {dateRes : dateRes}, function(data1, textStatus, xhr) {
                    mApp.unblock("#body-content",{});
                    if (data1.status == 1) {
                        swal(
                            head,
                            sus,
                            'success'
                        );

                        $(".reload").trigger("click");
                    } else {
                        swal(
                            head,
                            err,
                            'error'
                        );
                    }
                }, 'json');                
            } else {
                $.post(href, function(data1, textStatus, xhr) {
                    mApp.unblock("#body-content",{});
                    if (data1.status == 1) {
                        swal(
                            head,
                            sus,
                            'success'
                        );
                        if (stat == 9) {
                            location.reload();
                        } else {
                            $(".reload").trigger("click");
                        }
                    } else {
                        swal(
                            head,
                            err,
                            'error'
                        );
                    }
                }, 'json');
                // return false;
            }
        }
    });
};

$(document).on('click','.ajaxify',function(e){
    e.preventDefault();
    // mApp.block('body', {});
    var ajaxify       = [null, null, null];
    var url           = $(this).attr("href");
    var content       = $('.body-content');
    var active        = 'm-menu__item--active';
    var activeparent  = 'm-menu__item--submenu m-menu__item--open m-menu__item--expanded';
    var activeparents = 'm-menu__item--submenu m-menu__item--open';
    var cat           = $(this).attr('class');
    var titlep        = $('title').text();
    // $( document ).ajaxStart(function() {
    //   mApp.block(content, {});
    // });
    // Single menu / tidak punya child/parent
    if (cat == 'm-menu__link ajaxify') {
        $('li').removeClass(active);
        $('li').removeClass(activeparent);
        // $('li').removeClass(activesub1);
        $(this).parent().addClass(active);
    }

    if (cat == 'm-menu__link ajaxify submenu') {
        $('li').removeClass(active);
        $('li').removeClass(activeparent);
        // $('li').removeClass(activesub1);
        $(this).parent().addClass(active);
        $(this).parent().parent().parent().parent().addClass(activeparent);
        // $(this).addClass(activesub1);
    }

    if (cat == 'm-menu__link ajaxify submenu subparent1') {
        $('li').removeClass(active);
        $('li').removeClass(activeparent);
        $('li').removeClass(activeparents);
        // $('li').removeClass(activesub1);
        $(this).parent().addClass(active);
        // console.log('1');
        $(this).parent().parent().parent().parent().parent().parent().parent().addClass(activeparent);
        $(this).parent().parent().parent().parent().addClass(activeparents);
        // $(this).addClass(activesub1);
    }
    
    
    history.pushState(null, null, url);
    if(url != ajaxify[2]){
        ajaxify.push(url);
    }

    ajaxify     = ajaxify.slice(-3, 5);
    var the     = $(this);
    var posting = $.post( url, { status_link: 'ajax' } );

    posting.done(function( data ) {
        content.html(data);

        // set blockui
        mApp.block(content, {});
        setTimeout(function() {
            mApp.unblock(content);
        }, 1000);

        // set otomastis scroll top
        $('.m-scroll-top').trigger('click');
        var titlej   = $('.m-content .m-portlet__head-title h3 span').html();
        var title = $('.tab-title').text();
        $('title').text(titlej+' - Aeroffod ACS');
    });

});

$(window).bind('popstate',function(){
    var state = window.location.href;
    var pageContent = $('.body-content');
    $.ajax({
        type     : "POST",
        cache    : false,
        url      : state,
        data     : { status_link: 'ajax' },
        dataType : "html",
        success  : function(res) {
            if (res == 'out') {
                window.location = base_url + 'home';
            } else {
                pageContent.html(res);
                $('.m-scroll-top').trigger('click');
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            errorAjaxify();
        }
    });
});

$(document).on('keyup blur', '.currency', function(a){
    var e = window.event || e;
    var keyUnicode = e.charCode || e.keyCode;
    var max = 11;

    if (e !== undefined) {
        switch (keyUnicode) {
            case 16: break; // Shift
            case 27: this.value = ''; break; // Esc: clear entry
            case 35: break; // End
            case 36: break; // Home
            case 37: break; // cursor left
            case 38: break; // cursor up
            case 39: break; // cursor right
            case 40: break; // cursor down
            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
            case 190: break; // .
            default: $(this).formatCurrency({ colorize: true, negativeFormat: '-%s%n', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
        }
    }

    if (a.which < 0x20) {
        // e.which < 0x20, then it's not a printable character
        // e.which === 0 - Not a character
        return;     // Do nothing
    }
    if (this.value.length == max) {
        a.preventDefault();
    } else if (this.value.length > max) {
        // Maximum exceeded
        this.value = this.value.substring(0, max);
    }
    
})

/*BEGIN JS MODULE ORDER SURAT*/
$(document).on('change','#customFile',function(e){
    e.preventDefault();
    var href = base_url+'order_surat/import_preview';
    var inputFile = $('input[name=uploadFile]');
    var fileToUpload = inputFile[0].files[0];
    mApp.block('.table_order');
    if (fileToUpload) 
    {
        var fileName = fileToUpload.name.split('.');
        var ext      = fileName[fileName.length - 1];

        if (ext == "xls" || ext == "xlsx" || ext == "csv") {
            var formData = new FormData();
            formData.append("uploadFile", fileToUpload);

            $.ajax({
                url: href,
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function ( xhr ) {
                   
                },
                success: function(data) 
                {
                    var datatrim = JSON.parse(data);
                    if (datatrim.status == 1) {
                        var table = $('#m_table_order').DataTable();
                        $('#temp_store').val(datatrim.dataView);
                        $('#data_store').val(datatrim.dataIns);
                        table.destroy();
                        // console.log(datajson);
                        $("#m_table_order").DataTable({
                            responsive: !0,
                            data: JSON.parse(datatrim.dataView),
                            columnDefs: [{
                                targets: -1,
                                title: "Aksi",
                                orderable: !1,
                                render: function(e, a, i, n) {
                                    return '<a href="javascript:void(0)" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only" onclick="return delrow(this)"><i class="la la-trash"></i></a>'
                                }
                            }]
                        })
                        mApp.unblock('.table_order');
                    } else {
                        toastr.warning(datatrim.message, 'Warning');
                        mApp.unblock('.table_order');
                    }
                    return datajson;
                }
            })
        }else{
            toastr.warning('Extension not suported. please select xls|xlsx|csv file', 'Warning');   
            mApp.unblock('.table_order');
        }

    }else{
        toastr.warning('File Not Found', 'Warning');  
        mApp.unblock('.table_order');
    }
})
/*BEGIN JS MODULE ORDER SURAT*/

function reset_date(id){
    $(id).val('');
}

function triggerDate(id){
    $(id).focus();
}

function UrlExists(url)
{
    var http = new XMLHttpRequest();
    http.open('HEAD', url, false);
    http.send();
    return http.status!=404;
}

function removeFirst(arr, func)
{
    for (var i=0; i<arr.length; i++)
    {
        if (func.call(arr[i]))
        {
            arr.splice(i,1);
            return arr;
        }
    }
}
function delrow(a){
    mApp.block('.table_order');
    var tempJson    = $('#temp_store').val();
    var dataJson    = $('#data_store').val();
    var srt_no      = $(a).closest('tr').find('td').first().text();
    var trim_tjson    = JSON.parse(tempJson);
    var trim_djson    = JSON.parse(dataJson);
    /*BEGIN FUNCTION REMOVE DATA*/
    removeFirst(trim_djson, function(){return this.surat_nomor== srt_no})
    removeFirst(trim_tjson, function(){return this[0]== srt_no})
    /*END FUNCTION REMOVE DATA*/
    
    /*BEGIN REINIT DATATABLES*/
    var table = $('#m_table_order').DataTable();
    $('#temp_store').val(JSON.stringify(trim_tjson));
    $('#data_store').val(JSON.stringify(trim_djson));
    table.destroy();
    
    $("#m_table_order").DataTable({
        responsive: !0,
        data: trim_tjson,
        columnDefs: [{
            targets: -1,
            title: "Aksi",
            orderable: !1,
            render: function(e, a, i, n) {
                return '<a href="javascript:void(0)" class="btn btn-danger m-btn m-btn--icon m-btn--icon-only" onclick="return delrow(this)"><i class="la la-trash"></i></a>'
            }
        }]
    })
    /*END REINIT DATATABLES*/
    mApp.unblock('.table_order');
}

$(document).on('click','.actajax',function(e){
    e.preventDefault();

    var href = $(this).attr("href");
    var conf = $(this).attr("actConfirm");
    var xdta = JSON.parse($(this).attr('actID'));

    if(conf == 1){
        var swll = $(this).attr("actSwall");
        var jprs = JSON.parse(swll);
        var xdta = JSON.parse($(this).attr('actID'));

        swal(jprs).then(function(isConfirm){
            if(isConfirm.value == true){
                mApp.block("#body-content",{});
                $.post(href, xdta, function(result) {
                    if(result.status == '1'){
                        toastr.options = call_toastr('4000');
                        var $toast     = toastr['success'](result.message, "Success");

                        if(typeof(result.custUrl) != "undefined"){
                            var init_url = base_url + result.custUrl;
                            $('.reload').attr('href',init_url);
                        }
                        
                        $('.reload').trigger('click');

                        mApp.unblock("#body-content",{});
                        
                    }else{
                        console.log('gagal');
                    }
                }, 'json');
            }
        });
    }else{
        mApp.block("#body-content",{});
        $.post(href,xdta,function(result){
            mApp.unblock("#body-content",{});
            if(result.status == '1'){
                toastr.options = call_toastr('4000');
                var $toast     = toastr['success'](result.message, "Success");

                if(typeof(result.custUrl) != "undefined"){
                    var init_url = base_url + result.custUrl;
                    $('.reload').attr('href',init_url);
                }
                
                $('.reload').trigger('click');
            }else{
                console.log('gagal');
            }
        },'json');

    }
    
    function call_toastr(duration){
        var option = {
            "closeButton": true,
            "debug": false,
            "positionClass": "toast-top-right",
            "onclick": null,
            "showDuration": "1000",
            "hideDuration": "1000",
            "timeOut": duration,
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        return option;
    }

});