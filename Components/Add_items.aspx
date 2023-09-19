<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_items.aspx.cs" Inherits="Components_Add_items" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Add Items</title>
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

    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <style>
        .ui-dialog {
            width: 100% !important;
            top: 213.149px !important;
            left: 0px !important;
            z-index: 101 !important;
            position: fixed !important;
        }

        .ui-widget-header {
            border: 1px solid #384862 !important;
            background: #384862 !important;
            color: #ffffff !important;
            font-weight: bold;
        }

        .ui-dialog-buttonset button {
            border: none !important;
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        }

        .ui-dialog-titlebar-close {
            display: none;
        }

        .pmd-textfield .form-control {
            font-size: .7rem !important;
        }


        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            margin: 0;
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

        input {
            font-size: 13px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        .itemListLi {
            margin-top: 10px;
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
        /***  daniel - Fork me friend - style  ***/



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
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px; margin-top: -15px;">Add Items
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>

    <div class="searchbox_box">
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="container" style="background: #f7f7f7;">
                    <div class="serdiv">
                        <i style="padding-left: 10px;" class="fa fa-search"></i>
                        <input id="txt_search" class="searchinput" style="width: 75%;" placeholder="search items here..." />
                        <img class="pull-right" width="30" src="barcode-scanner.svg" />
                    </div>
                    <%--<div class="">
                        <span style="font-size: 14px;">Show suggested products?<label class="switch">
                            <input type="checkbox" id="suggestion_on" checked>
                            <span class="slider round"></span>
                        </label>
                        </span>
                    </div>--%>
                </div>


            </div>
            <div class="col-sm-2"></div>
        </div>


    </div>

    <div id="search_cuatomer" class="container d-none">
        <div class="row">
            <div class="col-sm-12">
                <div class="searchcustomerbynumber">
                    <span>+91</span>
                    <input id="Cust_searchBynum" type="number" class="searchcustinput" maxlength="10" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" style="width: 70%; background: transparent; color: white;" placeholder="Mobile" />
                    <button id="searchbynumberbtn" class="btn" style="width: 15%; background: #ffffff40; color: white;">
                        <i class="fa fa-angle-right"></i>
                    </button>
                </div>
                <span class="validationtext" style="display: none;"></span>
            </div>
        </div>


    </div>



    <div style="margin-top: 120px;">
        <ul id="searchResult" ></ul>
    </div>
    <div style="margin-top:10px;">
        <div class="container">
           <div class="">
                        <span style="font-size: 14px;">Show suggested products?<label class="switch">
                            <input type="checkbox" id="suggestion_on" checked>
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

        <div id="additemsbox">
            <div id="added__itemsbox">
            <label>Added Item List</label>
        </div>
        </div>
        


        <div class="container" style="margin-bottom: 60px;" id="Personal_Section">
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
                            <button class="btn btnstyle w-100 " id="callPersonalDetailSection" style="margin-top: 5px;">Proceed</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </footer>
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>



    <!-- Modal -->
    <div class="modal fade" id="order_summery" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>


    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Admin/js/textfield.js"></script>


    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

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
        function getOfferItemsList(MID, Item, Qty, Flag, Price) {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_items.aspx/Update_Offer_Data",
                data: '{MID: "' + MID + '",Flag:"' + Flag + '", OfferData:' + Offer_Data + ', Qty:"' + Qty + '", Price:"' + Price + '", Item:"' + Item + '"}',
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
                if (Search_Value.length >= 2) {


                    if ($('#suggestion_on').prop('checked')) {
                        getsuggestions($.trim($('#txt_search').val()))
                        $("#labeltxt").show();
                    }
                    else {
                        $('#suggestedsearchResult').empty();
                        $("#labeltxt").hide();
                    }
                    $('#searchResult').empty();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Add_items.aspx/fnGetAllProducts",
                        data: '{search: "' + Search_Value + '"}',
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                            $('#searchResult').css('height', '300px');
                            $('#searchResult').css({ "border": "1px solid lightgrey", "margin": "5px", "border-radius": "5px" })
                            $('.itemListLi').click(function (e) {
                                e.stopImmediatePropagation();

                                var current = $(this);
                                var MID = current.attr('mid');
                                var Price = $.trim(current.parent().parent().parent().find('.Amount').val());
                                var Qty = $.trim(current.parent().parent().parent().find('.qty').val());
                                var Item = $.trim(current.parent().parent().parent().parent().parent().find('.item_names').val());
                                var Img = current.parent().parent().parent().parent().parent().find('img').attr('src');
                                RowGenerated(MID, Price, Qty, Item, Img);
                                getTotalAmountAndCount(Price, Qty, 'ADD');
                                getOfferItemsList(MID, Item, Qty, 'ADD', Price);
                                $('#txt_search').val('');
                                $('#txt_search').focus();
                                $('#searchResult').empty();
                                $('#suggestedsearchResult').empty();
                                $('.deleterow').click(function (e) {
                                    e.stopImmediatePropagation();
                                    getOfferItemsList($(this).attr('mid'), '', '', 'DELETE', '');
                                    getTotalAmountAndCount($(this).attr('price'), $(this).attr('qty'), 'DELETE');
                                    $(this).parent().parent().parent().parent().parent().parent().remove();
                                })
                            })
                        }
                    })
                }
                else {
                    $('#searchResult').empty();

                }

            },

            create: function (event, ui) {
                $(this).data('ui-autocomplete')._renderItem = function (ul, item) {

                    return $('<li>').append('<div class="container "style="padding-right: 30px;padding-left:30px;background:#fff;"><div class="row boxdiv"><div class="col-2" ><img class="w-100" src="' + 'https://mycornershop.in/Menu_Pics/' + item.IMAGE_URL + '" alt="img">' +
                        '</div><div class="col-10"><div class="row"><div class="col-12">' +
                        '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
                        'Item name</label><input  type="text" value="' + item.Item_Name + '" class="form-control item_names"></div>' +
                        '</div ></div > ' +
                        '<div class="row"><div class="col-4"><div class="form-group pmd-textfield"><label for="regular1" class="control-label">' +
                        'Price</label><input type="number" value="' + item.Price + '" class="form-control Amount"></div></div><div class="col-4">' +
                        '<div class="form-group pmd-textfield"><label for="regular1" class="control-label">Qty</label>' +
                        '<input type="number" value="1" class="form-control qty"></div></div><div class="col-4"><div class="form-group">' +
                        '<button class="btn btnstyle itemListLi" type="button" item_name="' + item.Item_Name + '" mid="' + item.MID + '">ADD</button></div></div></div></div></div></div>').appendTo('#searchResult');


                };
            },
            select: function (event, ui) {

                event.preventDefault();

                //  ui.item.cg_name


            }

        });

        function RowGenerated(MID, Price, Qty, Item, Img) {
            $('#searchResult').css('height', '0px');
            $('#labeltxt').hide();
            var Total = parseFloat(Price) * parseFloat(Qty);
            var Data = '<div class="row"><div class="col-sm-2" ></div ><div class="col-sm-8"><div class="card p-1"><div class="row"><div class="col-3 text-center">' +
                '<img width="50" height="50" src="' + Img + '" />' +
                '</div><div class="col-9"><a class="deletebtn pull-right" style="margin-right: 10px;"><i class="fa fa-trash deleterow" qty="' + Qty + '" price="' + Price + '" mid="' + MID + '" style="color: red"></i></a>' +
                '<div style="margin: auto"><span>' + Item + '</span></div><div style="margin: auto"><span>' + Price + '</span> x <span>' + Qty + '</span><span style="float:right;">' + Total + '</span></div>' +
                '</div></div></div></div><div class="col-sm-2"></div></div>';

            $('#added__itemsbox').append(Data);
            $('#additemsbox').css({ "border": "1px solid lightgrey", "background": "white", "margin": "5px"});
            $('#searchResult').hide();
            $('#suggestedsearchResult').hide();
            $('.deleterow').click(function (e) {
                e.stopImmediatePropagation();
                getOfferItemsList($(this).attr('mid'), '', '', 'DELETE', '');
                getTotalAmountAndCount($(this).attr('price'), $(this).attr('qty'), 'DELETE');
                $(this).parent().parent().parent().parent().parent().parent().remove();
            })
        }

        function getTotalAmountAndCount(Price, Qty, Flag) {
            var Count = $.trim($('#item_count').text()) || '0';
            var Amount = $.trim($('#item_total_amount_').text()) || '0';
            if (Flag == 'ADD') {
                Count = parseFloat(Count) + parseFloat(Qty);
                Amount = parseFloat(Amount) + (parseFloat(Price) * parseFloat(Qty));
            }
            else {
                Count = parseFloat(Count) - parseFloat(Qty);
                Amount = parseFloat(Amount) - (parseFloat(Price) * parseFloat(Qty));
            }

            $('#item_count').html(Count);
            $('#item_total_amount_').html(Amount);

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
                        $('#suggestedsearchResult').css({ "border": "1px solid lightgrey", "border-radius": "5px", "border-radius": "5px" })
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
                                '<button class="btn btnstyle itemListLi" type="button" item_name="' + current[i].Item_Name + '" mid="' + current[i].MID + '">ADD</button></div></div></div></div></div></div>').appendTo('#suggestedsearchResult');
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
        $(document).ready(function () {

            var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = window.location.search.substring(1),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                    }
                }
            };


            var header_id = getUrlParameter('header_id');
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_items.aspx/getItemsByHeader",
                data: '{header_id: "' + header_id + '"}',
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    $("#added__itemsbox").empty();
                    $("#added__itemsbox").append(data.d);
                    //$('#additemsbox').css({ "border": "1px solid lightgrey", "background": "white", "margin": "5px" });


                },
                complete: function () {
                    $("#preload").hide();
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })
        });

        $('#callPersonalDetailSection').click(function (f) {
            f.stopImmediatePropagation();

            ConfirmDialog3("Changes made will reflect the order and will not be able to edit");

        });


        function ConfirmDialog3(message) {
            $('<div></div>').appendTo('body')
                .html('<div><h6>' + message + '?</h6></div>').dialog({
                    modal: true,
                    title: 'Confirm Payment',
                    zIndex: 10000,
                    autoOpen: true,
                    width: 'auto',
                    resizable: false,
                    buttons: {
                        No: function () {
                            $(this).dialog("close");
                        },
                        Yes: function () {
                            $(this).dialog("close");
                            CreateOrder();
                        }
                    },
                    close: function (event, ui) {
                        $(this).remove();
                    }
                });
        };


        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
        };




        function CreateOrder() {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_items.aspx/CreateOrder",
                data: '{OfferData:' + Offer_Data + ', Flag:"' + 'ADD' + '", Header_id:"' + getUrlParameter('header_id') + '"}',
                dataType: "json",
                success: function (data) {
                    $('#submitOrder').attr('disabled', 'false');

                    showpopup('Order punched succeesfully');
                    setTimeout(function (e) {
                        window.history.back();
                    }, 1500)

                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })
        };






    </script>
</body>
</html>
