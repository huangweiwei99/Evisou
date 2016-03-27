var Channel = function () {
    var handleChannel = function() {
        var grid = new Datatable();

        $(".delete").click(function () {
            var message = "你确定要删除勾选的记录吗?";
            if ($(this).attr("message"))
                message = $(this).attr("message") + "，" + message;
            if (confirm(message)) 
                if (grid.getSelectedRowsCount() > 0) {
                    grid.setAjaxParam("customActionType", "delete");
                    grid.setAjaxParam("id", grid.getSelectedRows());
                    grid.getDataTable().ajax.reload();
                    grid.clearAjaxParams();
                } else {
                    alert("还没有勾选记录")
                }
                
        });
       
        $.extend(true, $.fn.DataTable.TableTools.classes, {
            "container": "btn-group tabletools-dropdown-on-portlet",
            "buttons": {
                "normal": "btn btn-sm green-stripe default",
                "disabled": "btn btn-sm default  green-stripe disabled"
            },
            "collection": {
                "container": "DTTT_dropdown dropdown-menu tabletools-dropdown-menus"
            }
        });
        grid.init({
            src: $("#datatable_channel"),
            onSuccess: function (grid) {
                // execute some code after table records loaded
            },
            onError: function (grid) {
                // execute some code on network or other general error  
            },
            loadingMessage: '载入中...',
            dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options 

                // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
                // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/scripts/datatable.js). 
                // So when dropdowns used the scrollable div should be removed. 
                //"dom": "<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'<'table-group-actions pull-right'>>r>t<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>",
				/*"oLanguage": {//语言国际化
				    "sUrl": "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Chinese.json"
				},*/
               
                "aoColumns": [
                     {
                         "aDataSort": [0],
                         "mData": "ID",
                         "mRender": function (source, type, val) {
                             return "<input type=\"checkbox\" name=\"id[]\" value=" + val[0] + ">";
                             //  return '<a href=\"/TransactionDetails/Details/' + oObj.aData[0] + '\">View</a>';
                         }
                     },
                     { "aDataSort": [1] },
                     { "aDataSort": [2] },                     
                     {
                         "aDataSort": [3],
                         "mData": "IsActive",
                         "mRender": function (source, type, val) {
                             var str = "<span class=\"label label-sm label-";
                             str += val[3]=="True" ? "success" : "danger";
                             str += "\">" + val[3] + "</span>";
                             return str;
                             // "<span class=\"label label-sm label-success\">" + val[5] + "</span>"
                         }

                     },
                     {
                         "aDataSort": [4],
                         "mData": "ID",
                         "bSortable": false,
                         "mRender": function (source, type, val) {
                             var str = " <a class=\"btn btn-xs purple thickbox\" title=\'编辑文章频道\' data-modal href=\"Edit/"+val[0] + "\">";
                             str+="<i class=\"fa fa-edit\"></i>";
                             str+="编辑";
                             str += "</a>";
                             return str
                         }
                     }, 
                ],
               // "sDom": 'T<"clear">lrtip',
                "sDom": "T<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'<'table-group-actions pull-right'>>r><'table-scrollable't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>>",
                "oTableTools": {
                    "sSwfPath": "../../assets/global/plugins/datatables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
                    "aButtons": [{
                        "sExtends": "pdf",
                        "sButtonText": "PDF"
                    }, {
                        "sExtends": "csv",
                        "sButtonText": "CSV"
                    }, {
                        "sExtends": "xls",
                        "sButtonText": "Excel"
                    }, {
                        "sExtends": "print",
                        "sButtonText": "打印",
                        "sInfo": 'Please press "CTR+P" to print or "ESC" to quit',
                        "sMessage": "Generated by DataTables"
                    }]
                },
                "lengthMenu": [
                    [10, 20, 50, 100, 150],
                    [10, 20, 50, 100, 150] // change per page values here 
                ],
                "pageLength": 10, // default record count per page                
                "ajax": {
                    "url": "Datatable", // ajax source
                },
                "order": [
                    [1, "asc"]
                ] // set first column as a default sort by asc
            }
        });

       

         // handle group actionsubmit button click
        grid.getTableWrapper().on('click', '.table-group-action-submit', function (e) {
            e.preventDefault();
            var action = $(".table-group-action-input", grid.getTableWrapper());
            if (action.val() != "" && grid.getSelectedRowsCount() > 0) {
                grid.setAjaxParam("customActionType", "group_action");
                grid.setAjaxParam("customActionName", action.val());
                grid.setAjaxParam("id", grid.getSelectedRows());
                grid.getDataTable().ajax.reload();
                grid.clearAjaxParams();
                
            } else if (action.val() == "") {
                App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: '请选择动作',
                    container: grid.getTableWrapper(),
                    place: 'prepend'
                });
            } else if (grid.getSelectedRowsCount() === 0) {
                App.alert({
                    type: 'danger',
                    icon: 'warning',
                    message: '没有选择的记录',
                    container: grid.getTableWrapper(),
                    place: 'prepend'
                });
            }
        });
    }

    return {

        //main function to initiate the module
        init: function () {
            handleChannel();
        }
    };
}();