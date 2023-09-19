<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Sales_New.aspx.cs" Inherits="Components_Add_Sales_New" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Sales</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />

    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link href="../Admin/css/textfield.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link href="CSS/purchase_main.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            margin: 0;
        }

        .ui-menu {
            display: none !important;
        }

        .fu_input {
            position: absolute;
            top: -10px;
            font-size: 14px;
            left: 30px;
            background: white;
        }

        .form-control {
            line-height: 0px;
        }

        .editedamountcss {
            background: gray;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
        }

        .editedamountcss_opn {
            background: #f3f2f2;
            color: #444444;
            text-align: center;
            border: none;
            border-radius: 5px;
            /*border: 1px solid #d2d2d2;*/
        }




        /****  floating-Lable style start ****/
        .floating-label {
            position: relative;
            margin-bottom: 20px;
        }

        .floating-input,
        .floating-select {
            font-size: 14px;
            padding: 4px 4px;
            display: block;
            width: 100% !important;
            height: 30px;
            background-color: transparent;
            border: none;
            border-bottom: 1px solid #757575;
        }

            .floating-input:focus,
            .floating-select:focus {
                outline: none;
                border-bottom: 2px solid #5264ae;
            }

        .floating-form label {
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

        .floating-input:focus ~ label,
        .floating-input:not(:placeholder-shown) ~ label {
            top: -18px;
            font-size: 14px;
            color: #5264ae;
        }

        .floating-select:focus ~ label,
        .floating-select:not([value=""]):valid ~ label {
            top: -18px;
            font-size: 14px;
            color: #5264ae;
        }

        /* active state */
        .floating-input:focus ~ .bar:before,
        .floating-input:focus ~ .bar:after,
        .floating-select:focus ~ .bar:before,
        .floating-select:focus ~ .bar:after {
            width: 50%;
        }

        *,
        *:before,
        *:after {
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

        /* highlighter */
        .highlight {
            position: absolute;
            height: 50%;
            width: 100%;
            top: 15%;
            left: 0;
            pointer-events: none;
            opacity: 0.5;
        }

        /* active state */
        .floating-input:focus ~ .highlight,
        .floating-select:focus ~ .highlight {
            -webkit-animation: inputHighlighter 0.3s ease;
            -moz-animation: inputHighlighter 0.3s ease;
            animation: inputHighlighter 0.3s ease;
        }

        #searchResult {
            list-style: none;
            padding: 0px;
            /*position: absolute;*/
            margin: 0;
            top: 130px;
            background: #fff;
            overflow: auto;
            z-index: 1;
        }

        #suggestedsearchResult {
            list-style: none;
            padding: 0px;
            /*position: absolute;*/
            margin: 0;
            top: 130px;
            background: #fff;
            z-index: 1;
        }


            #searchResult li, #suggestedsearchResult li {
                background: white;
                padding: 0px;
            }

                #searchResult li:nth-child(even), #suggestedsearchResult li:nth-child(even) {
                    background: #fff;
                }

                #searchResult li:hover, #suggestedsearchResult li:hover {
                    cursor: pointer;
                }


        /* animation */
        @-webkit-keyframes inputHighlighter {
            from {
                background: #5264ae;
            }

            to {
                width: 0;
                background: transparent;
            }
        }

        @-moz-keyframes inputHighlighter {
            from {
                background: #5264ae;
            }

            to {
                width: 0;
                background: transparent;
            }
        }

        @keyframes inputHighlighter {
            from {
                background: #5264ae;
            }

            to {
                width: 0;
                background: transparent;
            }
        }


        .itemname {
            font-size: 12px;
        }


        .rtname {
            background: #27cacc;
            padding: 2px;
            padding-left: 5px;
            border-radius: 5px;
            font-size: 12px;
            margin-top: 10px;
        }

        .pmd-textfield .form-control {
            font-size: .7rem !important;
        }

        .form-group.pmd-textfield {
            margin-bottom: 0px !important;
        }

        .orderdate__number {
            margin-top: 10px;
            font-weight: 500;
            color: #2ab5b7;
            font-size: 12px;
        }


        #added__itemsbox {
            padding-top: 0% !important;
        }

        .box_design {
            background: white;
            padding: 10px;
            border-radius: 5px;
        }

        .itemprice {
            font-size: 12px;
            font-weight: bold;
        }

        .itemListLi {
            padding: 0;
            width: 100%;
        }

        .pmd-textfield .form-control {
            padding-bottom: 0px;
        }

        .pmd-textfield label {
            font-size: 12px;
        }

        .floating-credit {
            position: fixed;
            bottom: 10px;
            right: 10px;
            color: #aaa;
            font-size: 13px;
            font-family: arial, sans-serif;
        }

            .floating-credit a {
                text-decoration: none;
                color: #000000;
                font-weight: bold;
            }

                .floating-credit a:hover {
                    border-bottom: 1px dotted #f8f8f8;
                }

        .floating-heading {
            position: fixed;
            color: #aaa;
            font-size: 20px;
            font-family: arial, sans-serif;
        }

        #searchResult .boxdiv, #suggestedsearchResult .boxdiv {
            padding: 10px;
            border: 1px solid lightgrey;
            border-radius: 5px;
            margin-top: 3px;
            background: white;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 22px;
            top: 4px;
            float: right;
        }

            /* Hide default HTML checkbox */
            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                left: 4px;
                bottom: 3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            /*background-color: #2196F3;*/
            background: linear-gradient( 107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

            .slider.round:before {
                border-radius: 50%;
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

        /***  daniel - Fork me friend - style  ***/
    </style>
</head>
<body>
    <div id="preload" style="display: none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <%-- header section  --%>

    <nav class="navbar fixed-top navbar-light bg-light" id="headertextappend">
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px; margin-top: -15px;">Add Sales
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>

    <div class="container p-0">
        <div class="searchbox_box">
            <div class="row">
                <div class="col-2 col-sm-2 col-md-3 col-lg-4 col-xl-4"></div>
                <div class="col-12 col-sm-8 col-md-6 col-lg-4 col-xl-4">
                    <div class="container">
                        <div class="serdiv">
                            <i style="padding-left: 10px;" class="fa fa-search"></i>
                            <input id="txt_search" class="searchinput" style="width: 75%;" placeholder="search items here..." />
                            <img class="pull-right" width="30" src="barcode-scanner.svg" />
                        </div>
                    </div>
                </div>
                <div class="col-2 col-sm-2 col-md-3 col-lg-4 col-xl-4"></div>
            </div>
        </div>
    </div>

    <div style="margin-top: 120px;">
        <ul id="searchResult"></ul>
    </div>
    <div style="margin-top: 10px; display: none;">
        <div class="container">
            <div class="">
                <span style="font-size: 14px;">Show suggested products?<label class="switch">
                    <input type="checkbox" id="suggestion_on">
                    <span class="slider round"></span>
                </label>
                </span>
            </div>
        </div>
        <div>
            <ul id="suggestedsearchResult"></ul>
        </div>

    </div>

    <div class="container">


        <div class="clear"></div>

        <div id="additemsbox" class="pt-3" style="border: 1px solid lightgray; border-radius: 5px; padding: 8px; display: none;">
            <label>Order Items</label>
            <div id="added__itemsbox">
            </div>
        </div>

        <div class="container" style="margin-bottom: 60px;" id="Personal_Section">
        </div>
    </div>

    <div class="container mb-5" id="saleHistory" style="display: none;">
        <div class="row p-2">
            <div class="col-12 col-sm-12">
                <label>Today's Sale History</label>
            </div>
            <div class="col-12 col-sm-12" id="bindHistory">
            </div>
        </div>
    </div>

    <footer>
        <div class="footer__">
            <div class="container">
                <div class="row">
                    <div class="col-5">
                        <div class="total-section text-center">
                            <div class="items__count"><span id="item_count">0</span><span id="item_count_"> items</span></div>
                            <div class="items__total"><span id="item_total_amount">Rs. </span><span id="item_total_amount_"></span></div>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="button-section">
                            <button class="btn btnstyle w-100 " id="callPersonalDetailSection" style="margin-top: 5px;">Create Order</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </footer>

    <%--<div class="modal fade" id="GeneralPopup" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title text-center col-11">Last 5 invoices</h6>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="walletbox" style="padding: 5px; border-radius: 5px;">
                        <div class="container">
                            <div class="row p-0">
                                <div class="col-sm-12 col-12 p-0">
                                    <div class="floating-label">
                                        <input class="floating-input w-100" value="5" id="Adjust_Stock" type="text" placeholder=" " />
                                        <label class="Shiftlabel">Adjustment Stock</label>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-12 p-0 mt-2">
                                    <div class="floating-label">
                                        <input class="floating-input w-100" value="5" id="Adjust_Stock" type="text" placeholder=" " />
                                        <label class="Shiftlabel">Adjustment Stock</label>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-12 p-0 mt-2">
                                    <div class="floating-label">
                                        <input class="floating-input w-100" value="5" id="Adjust_Stock" type="text" placeholder=" " />
                                        <label class="Shiftlabel">Adjustment Stock</label>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-12 p-0 mt-2">
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal" aria-label="Close">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>--%>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Admin/js/textfield.js"></script>


    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>


    <script>
        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }
        var Offer_Data = [];
        function inittialiseOrderData() {
            var FormData = {

            }
            if (Offer_Data == '')
                Offer_Data = JSON.stringify(FormData);
        }
        function getOfferItemsList(MID, Item, Qty, Flag, Price, Price_With_GST, GST, GST_Included, UOM) {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_Sales_New.aspx/Update_Offer_Data",
                data: '{MID: "' + MID + '",Flag:"' + Flag + '", OfferData:' + Offer_Data + ', Qty:"' + Qty
                    + '", Price:"' + Price + '", Item:"' + Item + '", Price_With_GST:"' + Price_With_GST + '", GST:"' + GST
                    + '", GST_Included:"' + GST_Included + '", UOM:"' + UOM + '"}',
                dataType: "json",
                success: function (data) {
                    Offer_Data = JSON.stringify(data.d);
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })

        }

        $('#txt_search').autocomplete({
            source: function (request, response) {
                var Search_Value = $.trim($('#txt_search').val());
                if ($('#suggestion_on').prop('checked')) {
                    getsuggestions($.trim($('#txt_search').val()))
                    $("#labeltxt").show();
                }
                else {
                    $('#suggestedsearchResult').empty();
                    $("#labeltxt").hide();
                }
                if (Search_Value.length >= 2) {
                    $('#searchResult').empty();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Add_Sales_New.aspx/fnGetAllProducts",
                        data: '{search: "' + Search_Value + '"}',
                        dataType: "json",
                        success: function (data) {
                            response($.map($.parseJSON(data.d), function (item) {
                                var valueChecked = '';
                                if (item.GST_INCLUDED == 'Y') {
                                    valueChecked = 'checked';
                                }
                                return $('<li>').append('<div class="container "style="padding-right: 30px;padding-left:30px;background:#ffff;"><div class="row boxdiv"><div class="col-2" ><img class="w-100" src="' + 'https://mycornershop.in/Menu_Pics/' + item.IMAGE_URL + '" alt="img">' +
                                    '</div><div class="col-10"><div class="row"><div class="col-12">' +
                                    '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
                                    'Item name</label><input  type="text" value="' + item.NAME + '" class="form-control item_names"></div>' +
                                    '</div ></div > ' +
                                    '<div class="row"><div class="col-4"><div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
                                    'Rate</label><input type="number" value="' + item.PRICE + '" class="form-control Amount"></div></div><div class="col-4">' +
                                    '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">Qty</label>' +
                                    '<input type="number" value="1" class="form-control qty"></div></div>' +

                                    '<div class="col-4">' +
                                    '<div class="form-group pmd-textfield"><label class="control-label">GST</label>' +
                                    '<input type="number" value="' + item.GST_PERCENTAGE + '" class="form-control gst"></div></div>' +

                                    '<div class="col-4">' +
                                    '<div class="form-group pmd-textfield"><label class="control-label">UOM</label>' +
                                    '<input type="text" value="" class="form-control uom"></div></div>' +

                                    '<div class="col-6"><div class="form-check" style="font-size: .7rem !important;margin-top: 6px;">' +
                                    '<input class= "form-check-input gst_checkbox"  type ="checkbox" ' + valueChecked + ' value = "" id = "defaultCheck' + item.MID + '" >' +
                                    '<label class="form-check-label mt-1" for="defaultCheck' + item.MID + '">GST Included</label></div></div>' +

                                    '<div class="col-6">' +
                                    '<div class="form-group pmd-textfield"><label class="control-label">Price with GST</label>' +
                                    '<input type="number" value="' + item.PRICE + '" class="form-control price_with_gst"></div></div>' +

                                    '<div class="col-12"><div class="form-group">' +
                                    '<button class="btn btnstyle itemListLi" type="button" item_name="' + item.NAME + '" mid="' + item.MID + '">add</button></div></div></div></div></div></div>').appendTo('#searchResult');

                            }));
                            //response(JSON.parse(data.d));
                            $('#searchResult').css('height', '1px');
                            if (data.d.length > 0) {
                                $('#searchResult').css('height', '300px');
                            }


                            $('#searchResult').css({ "border": "1px solid lightgrey", "margin": "5px", "border-radius": "5px" })
                            $('.itemListLi').click(function (e) {
                                e.stopImmediatePropagation();
                                var current = $(this);
                                var MID = current.attr('mid');
                                var Rate = $.trim(current.parent().parent().parent().find('.Amount').val());
                                var Qty = $.trim(current.parent().parent().parent().find('.qty').val());
                                var Item = $.trim(current.attr('item_name'));
                                var Img = current.parent().parent().parent().parent().parent().find('img').attr('src');
                                var Price_With_GST = $.trim(current.parent().parent().parent().find('.price_with_gst').val());
                                var GST = $.trim(current.parent().parent().parent().find('.gst').val());
                                var GST_Included = $.trim(current.parent().parent().parent().find('.gst_checkbox').prop('checked') == true ? 'Y' : 'N');
                                var UOM = $.trim(current.parent().parent().parent().find('.uom').val());
                                var Amount = $.trim(current.parent().parent().parent().find('.Amount').val());
                                if (GST_Included == 'N') {
                                    Amount = $.trim(current.parent().parent().parent().find('.price_with_gst').val());
                                }

                                RowGenerated(MID, Rate, Qty, Item, Img, Price_With_GST, GST, GST_Included, UOM);
                                getTotalAmountAndCount(Amount, Qty, 'ADD');

                                getOfferItemsList(MID, Item, Qty, 'ADD', Rate, Price_With_GST, GST, GST_Included, UOM);


                                $('#txt_search').val('')
                                $('#txt_search').focus();
                                $('#searchResult').empty();
                                $('#suggestedsearchResult').empty();
                                $('.deleterow').click(function (e) {
                                    e.stopImmediatePropagation();

                                    getOfferItemsList($(this).attr('mid'), '', '', 'DELETE', '', '', '', '', '');
                                    getTotalAmountAndCount($(this).attr('price'), $(this).attr('qty'), 'DELETE');
                                    $(this).parent().parent().parent().parent().parent().parent().remove();
                                })
                            })
                        }
                    })
                }
                else {
                    $('#searchResult').css('height', '1px');
                    $('#searchResult').empty();
                }

            },

            //create: function (event, ui) {
            //    $(this).data('ui-autocomplete')._renderItem = function (ul, item) {

            //        return $('<li>').append('<div class="container "style="padding-right: 30px;padding-left:30px;background:#ffff;"><div class="row boxdiv"><div class="col-2" ><img class="w-100" src="' + 'https://mycornershop.in/Menu_Pics/' + item.IMAGE_URL + '" alt="img">' +
            //            '</div><div class="col-10"><div class="row"><div class="col-12">' +
            //            '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
            //            'Item name</label><input  type="text" value="' + item.NAME + '" class="form-control item_names"></div>' +
            //            '</div ></div > ' +
            //            '<div class="row"><div class="col-4"><div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
            //            'Price</label><input type="number" value="' + item.Price + '" class="form-control Amount"></div></div><div class="col-4">' +
            //            '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">Qty</label>' +
            //            '<input type="number" value="1" class="form-control qty"></div></div><div class="col-4"><div class="form-group">' +
            //            '<button class="btn btnstyle itemListLi" type="button" item_name="' + item.NAME + '" mid="' + item.MID + '">add</button></div></div></div></div></div></div>').appendTo('#searchResult');

            //    };


            //},
            minLength: 3,
            select: function (event, ui) {

                event.preventDefault();

                //  ui.item.cg_name


            }

        });

        function RowGenerated(MID, Price, Qty, Item, Img, Price_With_GST, GST, GST_Included, UOM) {
            var Total = parseFloat(Price) * parseFloat(Qty);
            if (GST_Included == 'N') {
                Total = parseFloat(Price_With_GST) * parseFloat(Qty);
            }

            var Data = '<div class="row"><div class="col-sm-2" ></div ><div class="col-sm-8"><div class="card p-1"><div class="row"><div class="col-3 text-center">' +
                '<img width="50" height="50" src="' + Img + '" />' +
                '</div><div class="col-9"><a class="deletebtn pull-right" style="margin-right: 10px;"><i class="fa fa-trash deleterow" qty="' + + '" price="' + Price + '" mid="' + MID + '" style="color: red"></i></a>' +
                '<div style="margin: auto"><span>' + Item + '</span></div><div style="margin: auto"><span>' + Qty + ' ' + UOM + '</span> x <span>' + Price + '</span><span style="float:right;">' + Total + '</span></div>' +
                '</div></div></div></div><div class="col-sm-2"></div></div>';

            $('#added__itemsbox').append(Data);
            $('#additemsbox').css('display', 'block');

            $('#searchResult').empty();
            $('#searchResult').css('height', '1px');
            $('#suggestedsearchResult').empty();

            $('.deleterow').click(function (e) {
                e.stopImmediatePropagation();
                getOfferItemsList($(this).attr('mid'), '', '', 'DELETE', '', '', '', '', '');
                getTotalAmountAndCount($(this).attr('price'), $(this).attr('qty'), 'DELETE');
                $(this).parent().parent().parent().parent().parent().parent().remove();
            })
        }
        $('#suggestion_on').change(function () {
            if ($(this).prop('checked')) {
                if ($.trim($('#txt_search').val()).length > 2) {
                    getsuggestions($.trim($('#txt_search').val()))
                    $("#labeltxt").show();
                }
            }
            else {

                $('#suggestedsearchResult').empty();
                $("#labeltxt").hide();
            }
        })

        function getsuggestions(Search_Value) {
            $('#suggestedsearchResult').empty();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_items.aspx/fnGetAllSuggestedProducts",
                data: '{search: "' + Search_Value + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var current = data.d;
                        $('#suggestedsearchResult').css({ "border": "1px solid lightgrey", "margin": "5px", "border-radius": "5px" })
                        for (var i = 0; i < current.length; i++) {

                            $('<li>').append('<div class="container" style="padding-right: 30px;padding-left:30px;background:#fff;"><div class="row boxdiv"><div class="col-2" ><img class="w-100" src="' + 'https://mycornershop.in/Menu_Pics/' + current[i].IMAGE_URL + '" alt="img">' +
                                '</div><div class="col-10"><div class="row"><div class="col-12">' +
                                '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
                                'Item name</label><input  type="text" value="' + current[i].Item_Name + '" class="form-control item_names"></div>' +
                                '</div></div > ' +
                                '<div class="row"><div class="col-4"><div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
                                'Price</label><input type="number" value="' + current[i].Price + '" class="form-control Amount"></div></div><div class="col-4">' +
                                '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">Qty</label>' +
                                '<input type="number" value="1" class="form-control qty"></div></div><div class="col-4"><div class="form-group">' +
                                '<button class="btn btnstyle itemListLi" type="button" item_name="' + current[i].Item_Name + '" mid="' + current[i].MID + '">add</button></div></div></div></div></div></div>').appendTo('#suggestedsearchResult');
                        }
                        fnAddItem();
                    }
                    else {
                        $('#suggestedsearchResult').empty();
                        $("#labeltxt").hide();
                    }
                    $("#labeltxt").show();
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })


        }
        function fnAddItem() {
            $('.itemListLi').click(function (e) {
                e.stopImmediatePropagation();

                var MID = $(this).attr('mid');
                var Item_Name = $.trim($(this).parent().parent().parent().parent().parent().find('.item_names').val());
                var Price = $.trim($(this).parent().parent().parent().find('.Amount').val());
                var Qty = $.trim($(this).parent().parent().parent().find('.qty').val());
                var Img = $(this).parent().parent().parent().parent().parent().find('img').attr('src');


                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Add_items.aspx/fnGenerateNewItemInList",
                    data: '{MID: "' + MID + '",Price: "' + Price + '",Item_Name: "' + Item_Name + '"}',
                    dataType: "json",
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    success: function (data) {
                        var Item_ID = data.d;
                        RowGenerated(Item_ID, Price, Qty, Item_Name, Img);
                        getTotalAmountAndCount(Price, Qty, 'ADD');
                        getOfferItemsList(Item_ID, Item_Name, Qty, 'ADD', Price);
                        $('#txt_search').val('');
                        $('#txt_search').focus();
                        $('#searchResult').empty();
                        $('#suggestedsearchResult').empty();
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        showpopup(e.statusText);
                    }
                })

            })

        }
        function getTotalAmountAndCount(Price, Qty, Flag) {
            var Count = $.trim($('#item_count').text()) || '0';
            var Amount = $.trim($('#item_total_amount_').text()) || '0';
            if (Flag == 'ADD') {
                Count = parseFloat(Count) + parseFloat(1);
                Amount = parseFloat(Amount) + (parseFloat(Price) * parseFloat(Qty));
            }
            else {
                Count = parseFloat(Count) - parseFloat(1);
                Amount = parseFloat(Amount) - (parseFloat(Price) * parseFloat(Qty));
            }

            $('#item_count').html(Count);
            $('#item_total_amount_').html(Amount);

        }

        //$('#callPersonalDetailSection').click(function (e) {
        //    e.stopImmediatePropagation();
        //    if ($('#item_count').text() != '0') {

        //        var Data = '<div class="row"><div class="col-sm-3" ></div><div class="col-sm-6"><div class="card" style="padding: 10px; margin-top: 20%;"><form>' +
        //            '<div class="container"><div class="row"><div class="col-12"><div class="form-group"><label for="email">Name</label><input type="text" class="form-control w-100" id="name">' +
        //            '</div></div></div><div class="row"><div class="col-6"><div class="form-group"><label for="pwd">Amount</label>' +
        //            '<input type="number" class="form-control" value="' + $.trim($('#item_total_amount_').text()) + '" id="amt"></div></div><div class="col-6"><div class="form-group">' +
        //            '<label for="pwd">Mobile</label><input type="number" class="form-control" id="Mob"></div></div></div></div>' +
        //            '<button type="button" class="btn btnstyle w-100" id="submitOrder">Submit</button></form></div></div>' +
        //            '<div class="col-sm-3"></div></div>';
        //        $('#Personal_Section').empty();
        //        $('#Personal_Section').append(Data);
        //        $(window).scrollTop($('#Personal_Section').position().top);

        //        $('#submitOrder').click(function (f) {
        //            f.stopImmediatePropagation();
        //            var Mobile = $.trim($('#Mob').val());
        //            var Name = $.trim($('#name').val());
        //            var Amount = $.trim($('#amt').val());
        //            if ($('#item_count').text() != '0') {
        //                $('#submitOrder').attr('disabled', 'true');
        //                CreateOrder(Mobile, Name, Amount, 'ADD');
        //            }
        //            else {
        //                showpopup('Create order first');
        //            }
        //        })
        //    }
        //    else {
        //        showpopup('Create order first');
        //    }
        //})

        $('#callPersonalDetailSection').click(function (e) {
            e.stopImmediatePropagation();
            if ($('#item_count').text() != '0') {

                //var Data = '<div class="row"><div class="col-sm-3" ></div><div class="col-sm-6"><div class="card" style="padding: 10px; margin-top: 20%;"><form>' +
                //    '<div class="container"><div class="row"><div class="col-12"><div class="form-group"><label for="email" class="fu_input" >Name</label><input type="text" class="form-control w-100" id="name">' +
                //    '</div></div></div><div class="row"><div class="col-5 d-none"><div class="form-group"><label for="pwd"  class="fu_input">Amount</label>' +
                //    '<input type="number" class="form-control" value="' + $.trim($('#item_total_amount_').text()) + '" id="amts"></div></div><div class="col-12"><div class="form-group">' +
                //    '<label for="pwd"  class="fu_input">Mobile</label><input type="number" class="form-control" id="Mob"></div></div>' +
                //    '<div class="container"><div class="row mb-2"> <div class="col-7"><div class="form-check"><input type = "checkbox" checked="checked" class="form-check-input" id = "exampleCheck1">' +
                //    '<label class="form-check-label" for="exampleCheck1">Paid for full</label></div></div><div class="col-5"><input type="number" readonly="readonly" class="w-100 editedamountcss" value="' + $.trim($('#item_total_amount_').text()) + '" id="amt"/></div></div></div>' +
                //    '</div ></div >' +
                //    '<button type="button" class="btn btnstyle w-100" id="submitOrder">Submit</button></form></div></div>' +
                //    '<div class="col-sm-3"></div></div>';

                var Data = '<div class="row"><div class="col-sm-3" ></div><div class="col-sm-6"><div class="card" style="padding: 10px; margin-top: 20%;"><form>' +
                    '<div class="container"><div class="row"><div class="col-12"><div class="floating-form mt-3" ><div class="floating-label"><input class="floating-input" id="name" type="text" placeholder=" ">' +
                    '<span class="highlight"></span><label>Name</label></div>' +

                    '<div class="floating-label"><input class="floating-input" id="GST_Number" type="text" placeholder=" ">' +
                    '<span class="highlight"></span><label>GST No</label></div>' +
                    '<div class="floating-label"><input class="floating-input" id="InvoiceNo" type="text" placeholder=" ">' +
                    '<span class="highlight"></span><label>Invoice No</label></div>' +


                    '<div class="floating-label"><input class="floating-input"  id="Mob"  type="number" placeholder=" ">' +
                    '<span class="highlight"></span><label>Mobile</label></div></div></div></div><div class="row"><div class="col-5 d-none"><div class="form-group"><label for="pwd"  class="fu_input">Amount</label>' +
                    '<input type="number" class="form-control" value="' + $.trim($('#item_total_amount_').text()) + '" id="amts"></div></div>' +
                    '<div class="container"><div class="row mb-2"> <div class="col-7"><div class="form-check"><input type = "checkbox" checked="checked" class="form-check-input" id = "exampleCheck1">' +
                    '<label class="form-check-label" for="exampleCheck1">Paid for full</label></div></div><div class="col-5"><input type="number" readonly="readonly" class="w-100 editedamountcss" value="' + $.trim($('#item_total_amount_').text()) + '" id="amt"/></div></div></div>' +
                    '</div></div>' +
                    '<button type="button" class="btn btnstyle w-100" id="submitOrder">Submit</button></form></div></div>' +
                    '<div class="col-sm-3"></div></div>';
                $('#Personal_Section').empty();
                $('#Personal_Section').append(Data);
                $(window).scrollTop($('#Personal_Section').position().top);

                $("#exampleCheck1").click(function () {
                    if ($(this).is(":checked")) {
                        $("#amt").addClass("editedamountcss");
                        $("#amt").removeClass("editedamountcss_opn");
                        $("#amt").attr("readonly", "readonly");
                    }
                    else {
                        $("#amt").removeClass("editedamountcss");
                        $("#amt").addClass("editedamountcss_opn");
                        $("#amt").removeAttr("readonly");



                    }
                })

                $('#submitOrder').click(function (f) {
                    f.stopImmediatePropagation();
                    var Mobile = $.trim($('#Mob').val());
                    var Name = $.trim($('#name').val());
                    var GST_Number = $.trim($('#GST_Number').val());
                    var Invoice_No = $.trim($('#InvoiceNo').val());
                    var Amount = $.trim($('#amt').val());
                    if ($('#item_count').text() != '0') {
                        $('#submitOrder').attr('disabled', 'true');
                        CreateOrder(Mobile, Name, Amount, 'ADD', GST_Number, Invoice_No);
                    }
                    else {
                        showpopup('Create order first');
                    }
                })
            }
            else {
                showpopup('Create order first');
            }
        })

        function CreateOrder(Mobile, Name, Amount, Flag, GST_Number, Invoice_No) {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_Sales_New.aspx/CreateOrder",
                data: '{Mobile: "' + Mobile + '",Name:"' + Name + '", OfferData:' + Offer_Data + ', Flag:"' + Flag
                    + '", Paid_Amount:"' + Amount + '", GST_Number:"' + GST_Number + '", Invoice_No:"' + Invoice_No + '"}',
                dataType: "json",
                success: function (data) {
                    $('#submitOrder').attr('disabled', 'false');
                    if (Flag == 'ADD') {
                        showpopup('Order punched succeesfully');
                        setTimeout(function (e) {
                            location.reload();
                        }, 1500)
                    }
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })

        }

        $('#viewHistory').click(function (e) {
            e.stopImmediatePropagation();
            $('#GeneralPopup').modal();
        })

        function getSaleHistory() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_Sales_New.aspx/fngetSaleHistory",
                data: '{}',
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    $('#bindHistory').empty();
                    if (data.d != '') {
                        $('#saleHistory').show();
                        var Result = JSON.parse(data.d);
                        var History = '';
                        for (var i = 0; i < Result.length; i++) {
                            var Link = '';
                            var Invoice_class = 'generate_Invoice';
                            var button_text = 'Generate Invoice'
                            var Invoice_No = '';
                            if (Result[i].INVOICE_ID != '0') {
                                Link = 'https://mycornershop.in/Invoice/Invoices.aspx?invoice=' + Result[i].INVOICE_ID;
                                Invoice_class = 'view_invoice';
                                button_text = 'View Invoice';
                                Invoice_No = 'Inv# ' + Result[i].SHORT_INVOICE_CODE
                            }
                            var Cust_No = Result[i].C_NUMBER;
                            if (Result[i].C_NUMBER == '11' || Result[i].C_NUMBER == '') {
                                Cust_No = 'NA';
                            }

                            History = History + '<div class="row" style="font-size: 14px;border: 1px solid lightgray;    margin-bottom: 5px; border-radius: 10px; background-color: white;">' +
                                '<div class="col-8 col-sm-8" ><label>' + Result[i].C_NAME + ' - ' + Cust_No + '</label></div><div class="col-4 col-sm-4"><span class="float-right">Amount: ' + Result[i].TOTAL_AMOUNT + '</span>' +
                                '</div><div class="col-7 col-sm-7"><span class="invoice_no">' + Invoice_No + '</span></div>' +
                                '<div class="col-5 col-sm-5 mb-2">' +
                                '<button type="button" link="' + Link + '" class="btn btnstyle ' + Invoice_class + ' float-right p-0" header_id="' + Result[i].HEADER_ID + '">' + button_text + '</button>' +
                                '</div></div>';
                        }
                        $('#bindHistory').append(History);

                        $('.view_invoice').click(function (e) {
                            e.stopImmediatePropagation();
                            window.location.href = $(this).attr('link');
                        })
                        $('.generate_Invoice').click(function (e) {
                            e.stopImmediatePropagation();
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Add_Sales_New.aspx/fnGenerateInvoice",
                                data: '{Header_ID: "' + $(this).attr('header_id') + '"}',
                                dataType: "json",
                                beforeSend: function () {
                                    $("#preload").show();
                                },
                                success: function (data) {
                                    if (data.d != '') {
                                        window.location.href = data.d;
                                    }
                                    else {
                                        showpopup('Some error occured. Please try again later');
                                    }
                                },
                                complete: function () {
                                    $("#preload").hide();
                                },
                                error: function (e) {
                                    showpopup(e.statusText);
                                }
                            })
                        })
                    }
                },
                complete: function () {
                    $("#preload").hide();
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })
        }

        $(document).ready(function () {
            getSaleHistory();
        })
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
    </script>
</body>
</html>
