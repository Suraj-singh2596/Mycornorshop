﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inventory_Report.aspx.cs" Inherits="Admin_Inventory_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inventory Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />

    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" />

    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
    <style>
        /* table.dataTable td.sorting_1 {
            background-color: white;
            border: 1px lightgrey;
        }

        table.dataTable td {
            background-color: white;
            border: 1px lightgrey;
        }

        table.dataTable tr.odd {
            background-color: white;
            border: 1px lightgrey;
        }

        table.dataTable tr.even {
            background-color: white;
            border: 1px lightgrey;
        }*/
        .floating-label {
            position: relative;
            margin-bottom: 20px;
        }

        .floating-input, .floating-select {
            font-size: 14px;
            padding: 4px 4px;
            display: block;
            width: 180px;
            height: 30px;
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #757575;
        }

            .floating-input:focus, .floating-select:focus {
                outline: none;
                border-bottom: 2px solid #5264AE;
            }

        .Shiftlabel {
            color: #999;
            font-size: 14px;
            font-weight: normal;
            position: absolute;
            pointer-events: none;
            left: 5px;
            top: 5px;
            transition: 0.2s ease all;
            -moz-transition: 0.2s ease all;
            -webkit-transition: 0.2s ease all;
        }

        .floating-input:focus ~ label, .floating-input:not(:placeholder-shown) ~ label {
            top: -18px;
            font-size: 14px;
            color: #5264AE;
        }

        .floating-select:focus ~ label, .floating-select:not([value=""]):valid ~ label {
            top: -18px;
            font-size: 14px;
            color: #5264AE;
        }

        .floating-input:focus ~ .bar:before, .floating-input:focus ~ .bar:after, .floating-select:focus ~ .bar:before, .floating-select:focus ~ .bar:after {
            width: 50%;
        }

        *, *:before, *:after {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .floating-textarea {
            min-height: 30px;
            max-height: 260px;
            overflow: hidden;
            overflow-x: hidden;
        }
    </style>
</head>
<body>
    <input type="checkbox" name="" checked="checked" id="side-menu-switch" />
    <div class="side-menu">

        <nav id="navMenu">
        </nav>
        <label id="sidemenu" for="side-menu-switch">
            <i class="fa fa-angle-left"></i>
        </label>
    </div>
    <form id="form1" runat="server">
        <div>
            <div id="preload" style="display: none;">
                <div class="sk-folding-cube">
                    <div class="sk-cube1 sk-cube"></div>
                    <div class="sk-cube2 sk-cube"></div>
                    <div class="sk-cube4 sk-cube"></div>
                    <div class="sk-cube3 sk-cube"></div>
                </div>
            </div>
            <nav class="navbar fixed-top navbar-light bg-light">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 35px;">
                    <p style="font-size: 16px; color: #e6e6e6; text-align: left; margin-bottom: 22px; font-weight: 400;">Inventory Report</p>
                </a>

            </nav>
            <div class="searchbox_box d-none">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="container">
                            <div class="serdiv">
                                <div id="reportrange" class="pull-left" style="background: #fff; font-size: 13px; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%; border-radius: 5px;">
                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
      <span></span><b class="caret"></b>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-sm-2"></div>
                </div>


            </div>
            <div class="container">
                <div class="row" id="item_div" style="margin-top: 20px;">
                    <div class="col-12 col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="trxhistory mb-3">
                                <label>Inventory Report</label>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered display" id="example" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Item Name</th>
                                            <th>Initial Stock</th>
                                            <th>Purchase Qty</th>
                                            <th>Sale Qty</th>
                                            <th>Defected Stock</th>
                                            <th>Current Stock</th>
                                            <th>Barcode</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Item Name</th>
                                            <th>Initial Stock</th>
                                            <th>Purchase Qty</th>
                                            <th>Sale Qty</th>
                                            <th>Defected Stock</th>
                                            <th>Current Stock</th>
                                            <th>Barcode</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="generalPopupForAll" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center PopupHeader">
                            <h5 class="modal-title w-100 " style="">Adjust stock for 24 Mantra Barnyard Millet</h5>
                            <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                                <i class="fa fa-times" aria-hidden="true"></i>
                            </button>
                        </div>
                        <div class="modal-body ">
                            <div class="row">
                                <div class="col-8 col-sm-6">
                                    <div class="floating-label">
                                        <input class="floating-input w-100" value="5" id="Adjust_Stock" type="text" placeholder=" " />
                                        <label class="Shiftlabel">Adjustment Stock</label>
                                    </div>
                                </div>
                                <div class="col-4 col-sm-6">
                                    <button type="button" class="btn btnstyle" id="btnAdjustStock">Change</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-md-12 col-sm-12">
                                    <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                                        <div class="trxhistory mb-3">
                                            <label>Stock Adjustment History</label>
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-bordered display" id="AdjustmentTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Qty</th>
                                                        <th>Comment</th>
                                                        <th>Adjustment Done By</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Date</th>
                                                        <th>Qty</th>
                                                        <th>Comment</th>
                                                        <th>Adjustment Done By</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>

    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>

    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>



    <script>
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)
            $('#Alert_btn').trigger('click');
        }
        window.onpopstate = function () {
            let open_modal = document.querySelector('.modal.show')
            if (open_modal) {
                open_modal.dataset.pushback = 'true';
                $(open_modal).modal('hide')
            }
        }

        $(document).ready(function () {
             
            getAllItems();
        })

        function getAllItems() {

            $.ajax({
                type: "POST",
                async: true,
                url: "Inventory_Report.aspx/getAllItems",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        var table = '';
                        if ($.fn.dataTable.isDataTable('#example')) {
                            table = $('#example').DataTable({
                                data: parsedData,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [

                                    { 'data': 'NAME' },

                                    { 'data': 'INITIAL_STOCK' },
                                    { 'data': 'PURCHASE_QTY' },
                                    { 'data': 'SALE_QTY' },
                                    { 'data': 'ADJUSTED_QTY' },
                                    { 'data': 'CURRENT_STOCK' },
                                    { 'data': 'BARCODE' },
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',

                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                        else {
                            table = $('#example').DataTable({

                                data: parsedData,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [

                                    { 'data': 'NAME' },

                                    { 'data': 'INITIAL_STOCK' },
                                    { 'data': 'PURCHASE_QTY' },
                                    { 'data': 'SALE_QTY' },
                                    { 'data': 'ADJUSTED_QTY' },
                                    { 'data': 'CURRENT_STOCK' },
                                    { 'data': 'BARCODE' },
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                        $('#example tbody').on('click', 'tr td:first-child', function () {
                            if ($(this).parent().hasClass('selected')) {
                                $(this).parent().removeClass('selected');
                            }
                            else {
                                table.$('tr.selected').removeClass('selected');
                                $(this).parent().addClass('selected');
                            }
                        });

                        $('#example tbody').on('click', 'tr td:nth-child(2)', function () {
                            var p = $(this),
                                Stock = p.text(),
                                tr = p.parent().closest('tr'),
                                Purchase_Qty = tr.find('td:nth-child(3)').text(),
                                Sale_Qty = tr.find('td:nth-child(4)').text(),
                                Stock_Adjustment = tr.find('td:nth-child(5)').text(),
                                Current_Stock = tr.find('td:nth-child(6)').text(),
                                Item_Name = p.parent().closest('tr').find('td:nth-child(1)').find('span').text(),
                                MID = p.parent().closest('tr').find('td:nth-child(1)').find('span').attr('mid');

                            var Modal = '<div class="modal-dialog modal-sm" role="document"><div class="modal-content">' +
                                '<div class="modal-header text-center PopupHeader"><h6 class="modal-title w-100 ">Initial stock for <br><span class="item_name">' + Item_Name + '</span></h6>' +
                                '<button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">' +
                                '<i class="fa fa-times" aria-hidden="true"></i></button></div><div class="modal-body"><div class="row">' +
                                '<div class="col-8 col-sm-6"><div class="floating-label"><input class="floating-input w-100" value="' + Stock + '" id="Inital_Stock" type="text" placeholder=" " />' +
                                '<label class="Shiftlabel">Initial Stock</label></div></div><div class="col-4 col-sm-6">' +
                                '<button type="button" class="btn btnstyle" id="btnChangeIntitalStock">Save</button>' +
                                '</div></div></div></div></div>';

                            $('#generalPopupForAll').empty();
                            $('#generalPopupForAll').append(Modal);
                            window.location.hash = "modal";
                            $('#generalPopupForAll').modal();

                            $('#btnChangeIntitalStock').click(function (e) {
                                e.stopImmediatePropagation();
                                var Qty = $.trim($('#Inital_Stock').val()) || 0;
                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Inventory_Report.aspx/changeInitialStock",
                                    data: '{MID: "' + MID + '",Qty: "' + Qty + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        p.text(Qty);
                                        tr.find('td:nth-child(6)').text(parseFloat(Qty) + parseFloat(Purchase_Qty) - parseFloat(Stock_Adjustment) - parseFloat(Sale_Qty));
                                        $('#generalPopupForAll').modal('hide');
                                        showpopup('Stock Intialised successfully');
                                    }
                                })
                            })
                        });
                        $('#example tbody').on('click', 'tr td:nth-child(3)', function () {
                            var p = $(this),
                                tr = p.parent().closest('tr'),
                                Item_Name = p.parent().closest('tr').find('td:nth-child(1)').find('span').text(),
                                MID = p.parent().closest('tr').find('td:nth-child(1)').find('span').attr('mid');

                            var Modal = '<div class="modal-dialog modal-lg" role="document"><div class="modal-content">' +
                                '<div class="modal-header text-center PopupHeader"><h6 class="modal-title w-100 " style="">Purchase History for <br><span class="item_name">' + Item_Name + '</span></h6>' +
                                '<button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">' +
                                '<i class="fa fa-times" aria-hidden="true"></i></button></div><div class="modal-body">' +
                                '<div class="row">' +
                                '<div class="col-12 col-md-12 col-sm-12"><div class="card p-3 mt-3 mb-3" style="overflow: auto;">' +
                                '<div class="trxhistory mb-3"><label>Purchase History</label></div><div class="table-responsive">' +
                                '<table class="table table-bordered display" id="PurchaseTable" width="100%" cellspacing="0"><thead><tr>' +
                                '<th>Supplier</th><th>Qty</th><th>UOM</th><th>Description</th><th>Invoice No</th><th>Purchase Price per unit</th></tr></thead><tfoot><tr><th>Supplier</th>' +
                                '<th>Qty</th><th>UOM</th><th>Description</th><th>Invoice No</th><th>Purchase Price per unit</th></tr></tfoot></table></div></div></div></div></div></div></div>';
                            $('#generalPopupForAll').empty();
                            $('#generalPopupForAll').append(Modal);
                            window.location.hash = "modal";
                            $('#generalPopupForAll').modal();
                            fnPurchaseHistory(MID);

                        });
                        $('#example tbody').on('click', 'tr td:nth-child(4)', function () {
                            var p = $(this),
                                tr = p.parent().closest('tr'),
                                Item_Name = p.parent().closest('tr').find('td:nth-child(1)').find('span').text(),
                                MID = p.parent().closest('tr').find('td:nth-child(1)').find('span').attr('mid');

                            var Modal = '<div class="modal-dialog modal-lg" role="document"><div class="modal-content">' +
                                '<div class="modal-header text-center PopupHeader"><h6 class="modal-title w-100 " >Sale History for <br><span class="item_name">' + Item_Name + '</span></h6>' +
                                '<button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">' +
                                '<i class="fa fa-times" aria-hidden="true"></i></button></div><div class="modal-body">' +
                                '<div class="row">' +
                                '<div class="col-12 col-md-12 col-sm-12"><div class="card p-3 mt-3 mb-3" style="overflow: auto;">' +
                                '<div class="trxhistory mb-3"><label>Sale History</label></div><div class="table-responsive">' +
                                '<table class="table table-bordered display" id="SaleTable" width="100%" cellspacing="0"><thead><tr>' +
                                '<th>Name</th><th>Number</th><th>Sale Date</th><th>Qty</th><th>Price</th></tr></thead><tfoot><tr><th>Name</th>' +
                                '<th>Number</th><th>Sale Date</th><th>Qty</th><th>Price</th></tr></tfoot></table></div></div></div></div></div></div></div>';
                            $('#generalPopupForAll').empty();
                            $('#generalPopupForAll').append(Modal);
                            window.location.hash = "modal";
                            $('#generalPopupForAll').modal();
                            fnSaleHistory(MID);
                        });
                        $('#example tbody').on('click', 'tr td:nth-child(5)', function () {
                            var p = $(this),
                                Stock_Adjustment = p.text(),
                                tr = p.parent().closest('tr'),
                                Purchase_Qty = tr.find('td:nth-child(3)').text(),
                                Sale_Qty = tr.find('td:nth-child(4)').text(),
                                // Stock_Adjustment = tr.find('td:nth-child(5)').text(),
                                Initial_Stock = tr.find('td:nth-child(2)').text(),
                                Item_Name = p.parent().closest('tr').find('td:nth-child(1)').find('span').text(),
                                MID = p.parent().closest('tr').find('td:nth-child(1)').find('span').attr('mid');

                            var Modal = '<div class="modal-dialog" role="document"><div class="modal-content">' +
                                '<div class="modal-header text-center PopupHeader"><h6 class="modal-title w-100 " style="">Record defected stock for <br/><span class="item_name">' + Item_Name + '</span></h6>' +
                                '<button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">' +
                                '<i class="fa fa-times" aria-hidden="true"></i></button></div><div class="modal-body"><div class="row">' +
                                '<div class="col-12 col-sm-12">' +
                                '<div class="floating-label"><input class="floating-input w-100" value="' + Stock_Adjustment + '" id="Adjust_Stock" type="text" placeholder=" " />' +
                                '<label class="Shiftlabel">Missing/Defected Stock Qty</label></div></div>' +
                                '<div class="col-12 col-sm-12">' +
                                '<div class="floating-label"><textarea id="adjustment_Comment" style="height: 100px;" class="floating-input floating-textarea w-100" placeholder=" "></textarea>' +
                                '<label class="Shiftlabel">Comment</label></div></div>' +
                                '<div class="col-12 col-sm-12">' +
                                '<button type="button" class="btn btnstyle w-100" id="btnAdjustStock">Save</button></div></div>' +
                                '<div class="row">' +
                                '<div class="col-12 col-md-12 col-sm-12"><div class="card p-3 mt-3 mb-3" style="overflow: auto;">' +
                                '<div class="trxhistory mb-3"><label>Defected Stock History</label></div><div class="table-responsive">' +
                                '<table class="table table-bordered display" id="AdjustmentTable" width="100%" cellspacing="0"><thead><tr>' +
                                '<th>Date</th><th>Qty</th><th>Comment</th><th>Adjustment Done By</th></tr></thead><tfoot><tr><th>Date</th>' +
                                '<th>Qty</th><th>Comment</th><th>Adjustment Done By</th></tr></tfoot></table></div></div></div></div></div></div></div>';
                            $('#generalPopupForAll').empty();
                            $('#generalPopupForAll').append(Modal);
                            window.location.hash = "modal";
                            $('#generalPopupForAll').modal();
                            fnStockAjustment(MID);
                            $('#btnAdjustStock').click(function (e) {
                                e.stopImmediatePropagation();
                                var Qty = $.trim($('#Adjust_Stock').val()) || 0;
                                var Comment = escape($.trim($('#adjustment_Comment').val()));
                                if (Qty != '0') {
                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "Inventory_Report.aspx/changeAdjustmentStock",
                                        data: '{MID: "' + MID + '",Qty: "' + Qty + '",Comment: "' + Comment + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (data) {
                                            p.text(parseFloat(Stock_Adjustment) + parseFloat(Qty));
                                            showpopup('Stock ajusted successfully');
                                            tr.find('td:nth-child(6)').text(parseFloat(Initial_Stock) + parseFloat(Purchase_Qty) - parseFloat(Stock_Adjustment) - parseFloat(Qty) - parseFloat(Sale_Qty));
                                            $('#generalPopupForAll').modal('hide');
                                        }
                                    })
                                }

                            })
                        });
                    }
                },
                complete: function () {
                    $("#preload").hide();
                }
            })
        }
        function fnSaleHistory(MID) {
            $.ajax({
                type: "POST",
                async: true,
                url: "Inventory_Report.aspx/fnSaleHistory",
                data: '{MID: "' + MID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (data.d != '') {
                        var ResultAdjustStock = JSON.parse(data.d);
                        var tableAdjustmentStock = '';

                        if ($.fn.dataTable.isDataTable('#SaleTable')) {
                            tableAdjustmentStock = $('#SaleTable').DataTable({
                                data: ResultAdjustStock,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [
                                    { 'data': 'C_NAME' },
                                    { 'data': 'C_NUMBER' },
                                    { 'data': 'ORDER_DATE' },
                                    { 'data': 'QTY' },
                                    { 'data': 'SALE_PRICE' }
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                        else {
                            tableAdjustmentStock = $('#SaleTable').DataTable({
                                stateSave: true,
                                "bDestroy": true,
                                data: ResultAdjustStock,
                                columns: [
                                    { 'data': 'C_NAME' },
                                    { 'data': 'C_NUMBER' },
                                    { 'data': 'ORDER_DATE' },
                                    { 'data': 'QTY' },
                                    { 'data': 'SALE_PRICE' }
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                    }

                }
            })
        }
        function fnPurchaseHistory(MID) {
            $.ajax({
                type: "POST",
                async: true,
                url: "Inventory_Report.aspx/fnPurchaseHistory",
                data: '{MID: "' + MID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (data.d != '') {
                        var ResultAdjustStock = JSON.parse(data.d);
                        var tableAdjustmentStock = '';

                        if ($.fn.dataTable.isDataTable('#PurchaseTable')) {
                            tableAdjustmentStock = $('#PurchaseTable').DataTable({
                                data: ResultAdjustStock,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [
                                    { 'data': 'SUPPLIER' },
                                    { 'data': 'QTY' },
                                    { 'data': 'UOM' },
                                    { 'data': 'DESCRIPTION' },
                                    { 'data': 'INV_NO' },
                                    { 'data': 'PURCHASE_RATE_WITH_TAX' },
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                        else {
                            tableAdjustmentStock = $('#PurchaseTable').DataTable({
                                stateSave: true,
                                "bDestroy": true,
                                data: ResultAdjustStock,
                                columns: [
                                    { 'data': 'SUPPLIER' },
                                    { 'data': 'QTY' },
                                    { 'data': 'UOM' },
                                    { 'data': 'DESCRIPTION' },
                                    { 'data': 'INV_NO' },
                                    { 'data': 'PURCHASE_RATE_WITH_TAX' },
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                    }

                }
            })
        }
        function fnStockAjustment(MID) {
            $.ajax({
                type: "POST",
                async: true,
                url: "Inventory_Report.aspx/getAdjusmentHistory",
                data: '{MID: "' + MID + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (data.d != '') {
                        var ResultAdjustStock = JSON.parse(data.d);
                        var tableAdjustmentStock = '';

                        if ($.fn.dataTable.isDataTable('#AdjustmentTable')) {
                            tableAdjustmentStock = $('#AdjustmentTable').DataTable({
                                data: ResultAdjustStock,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [
                                    { 'data': 'ADJUSTMENT_DATE' },
                                    { 'data': 'QTY' },
                                    { 'data': 'COMMENT' },
                                    { 'data': 'PERSON_NAME' },
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                        else {
                            tableAdjustmentStock = $('#AdjustmentTable').DataTable({
                                stateSave: true,
                                "bDestroy": true,
                                data: ResultAdjustStock,
                                columns: [
                                    { 'data': 'ADJUSTMENT_DATE' },
                                    { 'data': 'QTY' },
                                    { 'data': 'COMMENT' },
                                    { 'data': 'PERSON_NAME' },
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                    }

                }
            })
        }
    </script>
</body>
</html>
