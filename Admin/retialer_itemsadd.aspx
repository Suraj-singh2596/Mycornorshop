<%@ Page Language="C#" AutoEventWireup="true" CodeFile="retialer_itemsadd.aspx.cs" Inherits="Admin_retialer_itemsadd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Retailer Item Add</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />

    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css" rel="stylesheet" />

    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link href="css/textfield.css" rel="stylesheet" />

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <link href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" rel="stylesheet" />
    <link href="https://use.typekit.net/vzm3qix.css" rel="stylesheet" />
    <style>
        img {
            width: 58px;
        }

        .side-menu {
            width: 300px;
            height: 100%;
            padding: 50px 0;
            box-sizing: border-box;
            background-image: linear-gradient(0deg, #384862, #5294bd);
            display: flex;
            flex-flow: column nowrap;
            box-shadow: 5px 0px 10px rgba(17, 26, 41, 0.6);
            position: fixed;
            z-index: 9999;
            top: 0;
            transition: 0.5s;
            /* transform: translateX(0); */
        }

            .side-menu form {
                display: flex;
                margin: 0 10px 50px;
                border-radius: 100px;
                border: 1px solid #fff;
            }

                .side-menu form input,
                .side-menu form button {
                    background-color: transparent;
                    color: #fff;
                    border: none;
                    padding: 5px 10px;
                }

                .side-menu form input {
                    width: 230px;
                }

            .side-menu label {
                position: absolute;
                width: 40px;
                height: 80px;
                background-color: #384862;
                color: #fff;
                right: -40px;
                top: 0;
                bottom: 0;
                margin: auto;
                line-height: 80px;
                text-align: center;
                font-size: 30px;
                border-radius: 0 10px 10px 0;
            }

        #side-menu-switch {
            position: absolute;
            opacity: 0;
        }

            #side-menu-switch:checked + .side-menu {
                transform: translateX(-100%);
            }

                #side-menu-switch:checked + .side-menu label .fa {
                    transform: scaleX(-1);
                }

        ::placeholder {
            /* Chrome, Firefox, Opera, Safari 10.1+ */
            color: #fff;
            opacity: 1; /* Firefox */
        }

        .side-menu form button {
            width: 50px;
        }

        .side-menu form input:focus::placeholder {
            color: #ccc;
        }

        .side-menu form input:focus,
        .side-menu form button:focus {
            outline: none;
        }

        nav a {
            display: block;
            padding: 10px;
            color: #fff;
            text-decoration: none;
            position: relative;
            font-family: "Noto Sans TC", sans-serif;
        }

            nav a + a::before {
                content: "";
                position: absolute;
                left: 10px;
                right: 10px;
                top: 0;
            }
            /* Method 1 */
            nav a .fas {
                margin-right: -1.1em;
                transform: scale(0);
                transition: 0.5s;
            }

            nav a:hover .fas {
                margin-right: 0.3em;
                transform: scale(1);
            }


        @media only screen and (max-width: 1024px) {
            .side-menu {
                display: none;
            }
        }


        ::-webkit-scrollbar {
            display: none;
        }


        .Category_list {
            display: flex;
            overflow-x: auto;
            overflow-y: hidden;
        }

        .cat_list {
            white-space: nowrap;
            padding: 5px;
            margin: 10px;
            border-radius: 5px;
            /* padding-left: 15px; */
            /* padding-right: 15px; */
            /* box-shadow: 0 2.8px 1.2px rgb(0 0 0 / 3%), 0 -2.3px 5.3px rgb(0 0 0 / 5%), 0 0.5px 1px rgb(0 0 0 / 6%), 0 3.3px 17.9px rgb(0 0 0 / 7%), 0 11.8px 37.4px rgb(0 0 0 / 9%), 0 0px 0px rgb(0 0 0 / 12%); */
            /*box-shadow: 0 2px 8px 0 rgb(0 0 0 / 10%);*/
            text-align: center;
        }



        .cascade-slider {
            font-size: 14px;
            font-weight: 400;
            line-height: 1.25;
            color: #58595b;
        }

        .cascade-slider-item {
            display: flex;
            flex-flow: column nowrap;
            word-wrap: break-word;
            min-width: 0;
            /* max-width: 250px; */
            /* height: 500px; */
            background: #e7e7e7;
            /* background-clip: border-box; */
            /*border: 1px solid aliceblue;*/
            /* -webkit-box-shadow: 0 0 10px rgb(0 0 0 / 25%); */
            /* box-shadow: 0 0 10px rgb(0 0 0 / 25%); */
            -webkit-transition: all 1s ease;
            /* transition: all 1s ease;*/
        }

            .cascade-slider-item > img {
                width: 100%;
            }

            .cascade-slider-item.slick-current {
                position: relative;
                -webkit-transform: scale(1);
                transform: scale(1);
                z-index: 1;
            }

            .cascade-slider-item:not(.slick-current) {
                -webkit-transform: scale(0.95);
                transform: scale(0.95);
                filter: brightness(1);
            }

        .cascade-slider-body {
            display: flex;
            flex-flow: column nowrap;
            height: 130px;
            padding: 10px 15px;
        }

        .cascade-slider-title {
            font-size: 22px;
            font-weight: 700;
        }

        .cascade-slider-subtitle {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .cascade-slider-text {
            flex: 1;
            margin-bottom: 10px;
        }

        .slick-arrow {
            display: none !important;
        }


        .slick-center {
            width: auto !important;
        }

        .cascade-slider-item {
            width: auto !important;
        }



        .active {
            outline: none !important;
            background: #d3e8fa;
        }

        /* .slick-track{
           width:1000px!important;
        
       }*/

        td.details-control {
            background: url("https://crezzur.com/img/projects/details_open.png") no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.details-control {
            background: url("https://crezzur.com/img/projects/details_close.png") no-repeat center center;
        }

        .detail {
            width: 100%;
        }

        .dataTables_wrapper .dataTables_filter {
            text-align: left;
        }

        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0px !important;
        }

        .dataTables_wrapper .dataTables_filter input {
            margin-left: 0px;
        }


        .page-link {
            padding: 2px !important;
            color: white !important;
            background: linear-gradient( 107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;
        }

        .page-item.disabled .page-link {
            color: white !important;
        }

        .btn {
            padding: 2px !important;
            width: 100% !important;
        }

        .searchbox_box {
            top: 78px;
            position: fixed;
            width: 100%;
            z-index: 999;
        }

        .serdiv {
            background: white;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #38486259;
        }

        .searchinput {
            border: none;
            outline: none;
        }
    </style>
</head>

<body id="pageone">

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
            <nav class="navbar fixed-top navbar-light bg-light">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 30px;">SuperMart
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Sector-14 Gurgaon</p>
                </a>

            </nav>

            <!--2. Seacrch Section-->
            <div class="searchbox_box">
                <div class="row">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="container">
                            <div class="serdiv">
                                <i style="padding-left: 10px;" class="fa fa-search"></i>
                                <input id="txt_search" class="searchinput" style="width: 75%;" placeholder="search items here..." />
                                <img class="pull-right" style="width: 30px" src="../Components/barcode-scanner.svg" />
                            </div>

                        </div>


                    </div>
                    <div class="col-sm-2"></div>
                </div>


            </div>


            <!--3. Category -->

            <!--4. Sheduled Section-->
            <div class="container-fluid" style="margin-top: 120px; margin-bottom: 50px;">

                <div class="row">
                    <div class="col-sm-12 col-lg-12 col-md-12">
                        <div class="cascade-slider">
                            <div class="cascade-slider-track category_name">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="card p-2">
                            <div class="title">
                                <h6>My Store Items list</h6>
                            </div>

                            <div class="card">
                                <div class="container-fluid">
                                    <div class="table-responsive">

                                        <table id="example1" class="display" style="width: 100%">
                                            <thead>
                                                <tr>

                                                    <th>Name</th>
                                                    <th>Image</th>
                                                    <th>Price</th>
                                                    <th>Sub Category</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                        </table>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-6 col-md-6">
                        <div class="card p-2">
                            <div class="title">
                                <h6>General Items list</h6>
                            </div>

                            <div class="card">
                                <div class="container-fluid">
                                    <div class="container-fluid">
                                        <div class="table-responsive">

                                            <table id="example" class="display" style="width: 100%">
                                                <thead>
                                                    <tr>

                                                        <th>Name</th>
                                                        <th>Image</th>
                                                        <th>Barcode</th>
                                                        <th>Sub Category</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
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


    <footer>
        <div class="footer" style="color: white; position: fixed; width: 100%; bottom: 0; padding-top: 5px; padding-left: 10px; z-index: 1;"></div>
    </footer>



    <div class="modal fade" id="addnewitems" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>

    <input type="hidden" id="LedgerMob" />
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <input type="hidden" id="RID" runat="server" value="" />
    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>


    <script>

        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)
            $('#Alert_btn').trigger('click');
        }


        function getCookie(cname) {
            var name = cname + "=";
            var decodedCookie = decodeURIComponent(document.cookie);
            var ca = decodedCookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        $(document).ready(function () {
            getCategoryNames();
            getmenuname();
        });
        function getmenuname() {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getMenulist",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        $("#navMenu").empty();
                        $("#navMenu").append(data.d);

                    }

                }

            });
        }

        function getCategoryNames() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/getCategoryNames",
                data: '{}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        $('.category_name').empty();
                        $('.category_name').append(data.d);
                        $('.cascade-slider-track').slick({
                            centerMode: true,
                            infinite: false,
                            speed: 800,
                            slidesToShow: 10,
                            slidesToScroll: 10,
                            focusOnSelect: true,
                            responsive: [
                                {
                                    breakpoint: 1024,
                                    settings: {
                                        slidesToShow: 10,
                                        slidesToScroll: 10,
                                        infinite: false,
                                        dots: false
                                    }
                                },
                                {
                                    breakpoint: 600,
                                    settings: {
                                        centerMode: true,
                                        infinite: false,
                                        focusOnSelect: true,
                                        slidesToShow: 1,
                                        slidesToScroll: 1,
                                    }
                                },
                                {
                                    breakpoint: 480,
                                    settings: {
                                        centerMode: true,
                                        infinite: false,
                                        focusOnSelect: true,
                                        slidesToShow: 1,
                                        slidesToScroll: 1,
                                    }
                                }
                                ,
                                {
                                    breakpoint: 411,
                                    settings: {
                                        centerMode: true,
                                        infinite: false,
                                        focusOnSelect: true,
                                        slidesToShow: 1,
                                        slidesToScroll: 1,
                                    }
                                }
                            ]

                        });

                        $('.category_name .cascade-slider-item').click(function (e) {
                            e.stopImmediatePropagation();
                            $('.category_name .cascade-slider-item').removeClass('active');
                            $('.category_name .slick-current').addClass('active');
                            var CG_Name = $('.category_name .slick-current').text();

                            getListByCGName(CG_Name);
                            getListByCGNamerRetailer(CG_Name);
                        })
                    }
                    else {
                        showpopup('Please contact 9650601555 for assistance');

                    }
                }
            })
        }

        function getListByCGName(CG_Name) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/getListByCGName",
                data: '{CG_Name: "' + CG_Name + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        generateItemList(parsedData);

                    }
                    else {
                        $('#example tbody').empty();
                    }
                }
            });
        }

        function generateItemList(parsedData) {
            if ($.fn.dataTable.isDataTable('#example')) {
                table = $('#example').DataTable({
                    data: parsedData,
                    destroy: true,
                    columns: [
                        { 'data': 'NAME' },
                        { 'data': 'IMAGE_URL' },
                        { 'data': 'BARCODE' },
                        { 'data': 'SUB_CATEGORY' },
                        {
                            render: function (data, type, row) {
                                return createButton('mid', row.MID, 'Add');
                            }
                        }
                    ]

                });
            }
            else {
                table = $('#example').DataTable({

                    data: parsedData,
                    destroy: true,
                    columns: [

                        { 'data': 'NAME' },
                        { 'data': 'IMAGE_URL' },
                        { 'data': 'BARCODE' },
                        { 'data': 'SUB_CATEGORY' },
                        {
                            render: function (data, type, row) {
                                return createButton('mid', row.MID, 'Add');
                            }
                        }

                    ]

                });
            }
            $("#example").on("click", ".Add", function (e) {
                e.stopImmediatePropagation();
                var p = $(this).parent().closest('tr');
                var MID = $(this).attr('mid');
                var Table_Name = $("#example1");
                var flag = $(this).text();
                getMenuBymid(MID, flag, p, Table_Name)

                //fnActionTaken('Y', MID, p, Table_Name);
            });
        }

        function getMenuBymid(mid, flag, p, Table_Name) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/Getmenubymid",
                data: '{mid: "' + mid + '",flag: "' + flag + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#addnewitems").empty();
                        $("#addnewitems").append(data.d);
                        $("#addnewitems").modal();
                        $('#AddItemToList').click(function (e) {
                            e.stopImmediatePropagation();
                            var Item_Name = escapeHtml($.trim($('#Item_Name').val()));
                            var Comment = escapeHtml($.trim($('#Item_Desc').val()));
                            var Price = escapeHtml($.trim($('#Item_Price').val()));
                            var MRP = escapeHtml($.trim($('#Item_MRP').val()));
                            var Local_Name = escapeHtml($.trim($('#Item_Local_Name').val()));
                            var Barcode = escapeHtml($.trim($('#Item_Barcode').val()));
                            fnActionTaken('Y', $(this).attr('mid'), p, Table_Name, Item_Name, Comment, Price, MRP, Local_Name, Barcode);
                            $("#addnewitems").modal('hide');
                        })
                        $('#UpdateItemInMyList').click(function (e) {
                            e.stopImmediatePropagation();
                            var Item_Name = escapeHtml($.trim($('#Item_Name').val()));
                            var Comment = escapeHtml($.trim($('#Item_Desc').val()));
                            var Price = escapeHtml($.trim($('#Item_Price').val()));
                            var MRP = escapeHtml($.trim($('#Item_MRP').val()));
                            var Local_Name = escapeHtml($.trim($('#Item_Local_Name').val()));
                            var Barcode = escapeHtml($.trim($('#Item_Barcode').val()));
                            fnActionTaken('Z', $(this).attr('mid'), p, Table_Name, Item_Name, Comment, Price, MRP, Local_Name, Barcode);
                            $("#addnewitems").modal('hide');

                        })
                    }
                }
            })
        }

        var entityMap = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;',
            '/': '&#x2F;',
            '`': '&#x60;',
            '=': '&#x3D;'
        };
        function escapeHtml(string) {
            return String(string).replace(/[&<>"'`=\/]/g, function (s) {
                return entityMap[s];
            });
        }
        function fnActionTaken(Flag, MID, p, Table_Name, Item_Name, Comment, Price, MRP, Local_Name, Barcode) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/fnActionTaken",
                data: '{Flag: "' + Flag + '",MID: "' + MID + '",Item_Name: "' + Item_Name + '",Comment: "' + Comment
                    + '",Price: "' + Price + '",MRP: "' + MRP + '",Local_Name: "' + Local_Name + '",Barcode: "' + Barcode + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        if (Flag == 'N') {
                            Table_Name.prepend(data.d);
                            p.remove();
                            showpopup('Item removed successfully');
                        }
                        if (Flag == 'Y') {
                            Table_Name.prepend(data.d);
                            p.remove();
                            showpopup('Item added successfully');
                        }
                        if (Flag == 'Z') {
                            p.empty();
                            p.append(data.d);
                            showpopup('Item updated successfully');
                        }
                    }
                }
            })

        }

        function getListByCGNamerRetailer(CG_Name) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/getListByCGNamerRetailer",
                data: '{CG_Name: "' + CG_Name + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        RetailerItemList(parsedData);
                    }
                    else {
                        $('#example1 tbody').empty();
                    }
                }
            });
        }

        function RetailerItemList(parsedData) {
            if ($.fn.dataTable.isDataTable('#example1')) {
                table = $('#example1').DataTable({
                    data: parsedData,
                    destroy: true,
                    columns: [
                        { 'data': 'NAME' },
                        { 'data': 'IMAGE_URL' },
                        { 'data': 'BARCODE' },
                        { 'data': 'SUB_CATEGORY' },
                        {
                            render: function (data, type, row) {
                                return createButton('mid', row.MID, 'Remove');
                            }
                        }
                    ]

                });
            }
            else {
                table = $('#example1').DataTable({

                    data: parsedData,
                    destroy: true,
                    columns: [

                        { 'data': 'NAME' },
                        { 'data': 'IMAGE_URL' },
                        { 'data': 'BARCODE' },
                        { 'data': 'SUB_CATEGORY' },
                        {
                            render: function (data, type, row) {
                                return createButton('mid', row.MID, 'Remove');
                            }
                        }

                    ]

                });
            }
            $("#example1").on("click", ".Remove", function (e) {
                e.stopImmediatePropagation();
                var p = $(this).parent().closest('tr');
                var MID = $(this).attr('mid');
                var Table_Name = $("#example");

                fnActionTaken('N', MID, p, Table_Name, '', '', '', '', '', '');
            });

            $("#example1").on("click", "tbody tr td:nth-child(1)", function (e) {
                var p = $(this).parent().closest('tr');
                var MID = p.find('.Remove').attr('mid');
                var Table_Name = $("#example");
                var flag = 'Remove';
                getMenuBymid(MID, flag, p, Table_Name)
            });
        }

        function createButton(buttonType, rowID, button_name) {
            return '<button type="button" class="btn btnstyle ' + button_name + '" ' + buttonType + '="' + rowID + '" >' + button_name + '</button>';
        }



        $('#txt_search').autocomplete({
            source: function (request, response) {
                var Search_Value = $.trim($('#txt_search').val());
                if (Search_Value.length >= 2) {
                    searchGeneralList(Search_Value);
                    searchRetailerList(Search_Value);
                }
                else {
                    $("#example").empty();
                    $("#example1").empty();
                }
            }
        });
        function searchGeneralList(Search_Value) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/searchGeneralList",
                data: '{search: "' + Search_Value + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        generateItemList(parsedData);
                    }
                    else {
                        $('#example tbody').empty();
                    }

                }
            })
        }
        function searchRetailerList(Search_Value) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "retialer_itemsadd.aspx/searchRetailerList",
                data: '{search: "' + Search_Value + '"}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        RetailerItemList(parsedData);
                    }
                    else {
                        $('#example1 tbody').empty();
                    }
                }
            })
        }

    </script>

</body>
</html>
