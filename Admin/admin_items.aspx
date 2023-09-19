<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_items.aspx.cs" Inherits="Admin_admin_items" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Items</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <link href="js/croppie.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/scroller/2.0.3/css/scroller.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <link href="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.css" rel="stylesheet" />
    <style>
        .fa {
            color: gray;
        }

        #pageone {
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
        }


        .footer {
            background: #384862 !important;
        }

        .ui-widget {
            top: -606.4px;
            width: 325px !important;
            position: relative;
            left: 25px;
            background: rgb(0, 220, 255);
            z-index: 9999;
            line-height: 2.1;
        }

        .sticky-footer_close {
            display: block;
            background: #fff;
            position: fixed;
            top: 60px;
            left: -100%;
            width: 50%;
            z-index: 3;
            /* box-shadow: 0 1px 20px rgb(96, 93, 93), 0 0 40px rgb(255, 255, 255) inset; */
            border: 1px solid lightgrey;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
            transition: 1s;
        }

        .sticky-footer_open {
            display: block;
            background: #fff;
            position: fixed;
            top: 60px;
            left: 0px;
            width: 50%;
            z-index: 3;
            /* box-shadow: 0 1px 20px rgb(96, 93, 93), 0 0 40px rgb(255, 255, 255) inset; */
            border: 1px solid lightgrey;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
            transition: 1s;
        }




        .sticky-sort_close {
            display: block;
            background: #fff;
            position: fixed;
            top: 60px;
            right: -100%;
            width: 50%;
            z-index: 3;
            /* box-shadow: 0 1px 20px rgb(96, 93, 93), 0 0 40px rgb(255, 255, 255) inset; */
            border: 1px solid lightgrey;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
            transition: 1s;
        }

        .sticky-sort_open {
            display: block;
            background: #fff;
            position: fixed;
            top: 60px;
            right: 0px;
            width: 50%;
            z-index: 3;
            /* box-shadow: 0 1px 20px rgb(96, 93, 93), 0 0 40px rgb(255, 255, 255) inset; */
            border: 1px solid lightgrey;
            border-bottom-right-radius: 10px;
            border-bottom-left-radius: 10px;
            transition: 1s;
        }

        /*   .navbar-brand {
        font-size: 1rem !important;
    }*/

        .fa-user-circle-o {
            margin-top: 5px !important;
            font-size: 25px;
        }

        .userpic {
            margin-right: 10px;
            float: right;
        }


        .totalamountbox label {
            margin-bottom: 0px !important;
            display: inline-flex;
        }



        .totalamountbox select {
            width: 55px;
            border: none;
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
        }

        .totalamutsec {
            width: 85px;
            padding-left: 4px;
            padding-top: 5px;
            font-size: 12px;
            text-align: center;
        }

        .searchbox {
            margin-top: 0;
        }

            .searchbox input {
                padding: .175rem .75rem !important;
            }

        .roundbox {
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
            border: none;
            padding-left: 8px;
            padding-right: 8px;
            border-radius: 30px;
            background: #1acc8d;
            color: white;
            padding-top: 3px;
            padding-bottom: 3px;
            margin-left: -6px;
        }

        .rounded {
            border-radius: .25rem !important;
            background: #1acc8d;
            color: white;
        }

        @media (min-width:767px) {
            .totalamountbox {
                border: none;
            }
        }

        .location {
            font-size: 10px;
            color: lightslategray;
            background: #f9f9f9;
            border-radius: 5px;
        }

        .recievingamount {
            background: #efefef;
            border: 1px solid lightgrey;
            border-radius: 5px;
        }

            .recievingamount input {
                background: #dedede;
                border: 1px solid lightgrey;
                border-radius: 5px;
            }

        .Recievedamount {
            background: #fff !important;
        }

        .totalamutsec i {
            font-weight: bold;
        }

        .boxshadow {
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
        }

        .itmdetails {
            font-size: 12px;
        }

        .retailrdetails {
            font-weight: bold;
            background: #e5e6ea;
            color: #000000;
            border-radius: 5px;
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
        }

        .itemcard {
            border: 1px solid #e4e4e4;
            background: white;
            border-radius: 5px;
        }

        .border-left-default {
            border-left: .25rem solid gray !important;
        }

        .text-primary {
            color: gray !important;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 0%) !important;
        }

        .labelclor::-webkit-input-placeholder { /* WebKit browsers */
            color: lightgrey !important;
        }

        .labelclor:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color: lightgrey !important;
        }

        .labelclor::-moz-placeholder { /* Mozilla Firefox 19+ */
            color: lightgrey !important;
        }

        .labelclor:-ms-input-placeholder { /* Internet Explorer 10+ */
            color: lightgrey !important;
        }

        .btn:focus {
            box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 0%) !important;
        }

        table tr th, td {
            
            padding-left: 10px;
            padding-right: 10px;
        }



        .cardbtn {
            border-radius: 5px;
            outline: none;
            border: 0;
            overflow: hidden;
            position: relative;
            cursor: pointer;
            &:hover

        {
            opacity: .9;
        }

        }

        .hold-mouse {
            box-shadow: 4px 4px 55px #809093;
        }

        .circle {
            height: 25px;
            width: 25px;
            background-color: rgba(255, 255, 255, .3);
            border-radius: 50%;
            position: absolute;
            left: 50%;
            top: 50%;
            pointer-events: none;
            transform: scale(0);
            animation: grow 1s forwards;
        }

        @keyframes grow {
            0% {
                background-color: rgba(50, 50, 50, .5);
                transform: scale(1);
                z-index: 2;
            }

            100% {
                background-color: rgba(50, 50, 50, .3);
                transform: scale(30);
                opacity: 0;
                z-index: -1;
            }
        }

        .grow {
            animation: grow 1.4s ease-out forwards;
        }

        .button-2 {
            background-color: #91A1A4;
            color: #ecf0f1;
            height: 50px;
            width: 300px;
            font-size: 30px;
            border-radius: 5px;
            outline: none;
            border: 0;
            overflow: hidden;
            position: relative;
        }

        .shrink {
            animation: shrink .3s forwards alternate;
        }

        .jiggle {
            animation: jiggle 3s forwards ease-in-out;
        }

        @keyframes shrink {
            0% {
            }

            100% {
                transform: scale(.9);
            }
        }

        @keyframes jiggle {
            0% {
                transform: scale(.9);
            }

            10% {
                transform: scale(1.1);
            }

            20% {
                transform: scale(.9);
            }

            30% {
                transform: scale(1.05);
            }

            40% {
                transform: scale(.95);
            }

            50% {
                transform: scale(1.025);
            }

            60% {
                transform: scale(.975);
            }

            70% {
                transform: scale(1.02);
            }

            80% {
                transform: scale(.985);
            }

            90% {
                transform: scale(1.01);
            }

            100% {
                transform: scale(1);
            }
        }

        .button-3 {
            background-color: #91A1A4;
            color: #ecf0f1;
            height: 50px;
            width: 300px;
            font-size: 30px;
            border-radius: 5px;
            outline: none;
            border: 0;
            overflow: hidden;
            position: relative;
        }

        .shrink-button {
            animation: shrink-button 2s forwards ease-in-out;
        }

        @keyframes shrink-button {
            0% {
            }

            20% {
                transform: scale(.1, 1);
            }

            25% {
                transform: scale(.2, 1);
            }
            /*   30% { transform: scale(.1, 1); } */
            100% {
                transform: scale(0);
            }
        }


        .tagscss {
            border: 1px solid #d0dcff;
            margin: 10px;
            padding: 4px;
            border-radius: 25px;
            background: #d7e2ff;
            cursor: pointer;
        }

        .selectedtag {
            border: 1px solid #4e73df;
            margin: 10px;
            padding: 4px;
            border-radius: 25px;
            background: #4e73df;
            cursor: pointer;
            color: white;
        }

        .itmscss {
            background: green;
            color: white;
            padding: 5px;
            border-radius: 20px;
            margin: 5px;
            font-size: 10px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 10px;
        }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

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
                height: 15px;
                width: 15px;
                left: 0px;
                bottom: -2px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #2196F3;
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


        .notificationtrigrbtn {
            padding: 4px;
            border-radius: 5px;
            color: white !important;
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1) !important;
            cursor: pointer;
        }

        .disablenotifibtn {
            padding: 4px;
            border-radius: 5px;
            color: white !important;
            background: #ababab;
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1) !important;
            cursor: pointer;
        }

        .notif_count {
            background: #384862;
            /* padding: 4px; */
            border-radius: 30px;
            padding-left: 5px;
            padding-right: 5px;
            padding-top: 1px;
            padding-bottom: 1px;
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
            position: absolute;
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
                border-top: 1px solid #fff;
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


        .modal-dialog {
            position: fixed !important;
            width: 100% !important;
            margin: 0 !important;
        }

        .modal-body {
            overflow: auto !important;
            height: 80vh !important;
        }
            .offerImgbtn img{
        border-radius:5px;
    }
    .offerImgbtn_active{
        border: 3px solid #0062cc;
    border-radius: 5px;
    }

    .ofrtxt{
        font-size:10px;
        text-align:center
    }
    #image{
        height:150px;
        width:150px;
        display:none;
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

            <div id="preload" style="display: none;">
                <div class="sk-folding-cube">
                    <div class="sk-cube1 sk-cube"></div>
                    <div class="sk-cube2 sk-cube"></div>
                    <div class="sk-cube4 sk-cube"></div>
                    <div class="sk-cube3 sk-cube"></div>
                </div>
            </div>
            <nav class="navbar fixed-top navbar-light bg-light">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;">My Catalogue
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;">Sector-14 Gurgaon</p>
                </a>

            </nav>

            <!--2. Seacrch Section-->



            <!--3. Category -->

            <!--4. Sheduled Section-->

            <div id="shedulersection" class="container" runat="server" style="margin-top: 90px; margin-bottom: 0px;">
                <div class="row">
                    <div class="col-xl-3 col-md-6 mb-4 steal_deal">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div class="card-body TotalOrders">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Steal Deal</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="steal_deal_count"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-md-6 ">
                        <div class="card p-1 mt-3 mb-3" style="overflow: auto;">
                            <div class="steal_deal cardbtn" style="margin: auto; padding: 10px;">
                                <h5 style="margin: auto;">Steal Deal</h5>
                                <h2 id="steal_deal_count"></h2>
                            </div>
                        </div>

                    </div>--%>


                    <div class="col-xl-3 col-md-6 mb-4 best_deals">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Best Deals
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="best_deals_count"></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-shopping-basket fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- <div class="col-md-6 ">
                        <div class="card p-1 mt-3 mb-3" style="overflow: auto;">
                            <div class="best_deals cardbtn" style="margin: auto; padding: 10px;">
                                <h5 style="margin: auto;">Best Deals</h5>
                                <h2 id="best_deals_count"></h2>
                            </div>
                        </div>

                    </div>--%>

                    <div class="col-xl-3 col-md-6 mb-4 offers">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold   text-uppercase mb-1" style="color: #45bed0!important;">
                                            Offer
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="best_offers_count"></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-shopping-cart  fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- <div class="col-md-6">
                        <div class="card p-1 mt-3 mb-3" style="overflow: auto;">
                            <div class="offers cardbtn" style="margin: auto; padding: 10px;">
                                <h5 style="margin: auto;">Offer</h5>
                                <h2 id="best_offers_count"></h2>
                            </div>
                        </div>

                    </div>--%>


                    <div nametxt="Sales & Collection" class="col-xl-3 col-md-6 mb-4 items">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            Items

                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="total_items_count"></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-cube fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-md-6   ">
                        <div class="card p-1 mt-3 mb-3" style="overflow: auto;">
                            <div class="items cardbtn" style="margin: auto; padding: 10px;">
                                <h5 style="margin: auto;">Items</h5>
                                <h2 id="total_items_count"></h2>
                            </div>
                        </div>

                    </div>--%>
                </div>
            </div>


            <!--5. Transaction history-->
            <div class="container-fluid mb-5" id="myDiv">
                <div class="row d-none" id="steal_deal_div">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="trxhistory mb-3">
                                <label>Steal Deals <sup>(single item)</sup></label>
                                <a href="javascript:void(0);" id="addStealDeals" class="d-sm-inline-block btn btn-sm pull-right  btnstyle shadow-sm">
                                    <i class="fa fa-plus fa-sm text-white-50"></i>&nbsp;Add Steal Deals</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTableStealDeal" width="100%" cellspacing="0">
                                </table>
                            </div>


                        </div>

                    </div>

                </div>

                <div class="row d-none" id="special_deal_div">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="trxhistory mb-3">
                                <label>Best Deals<sup>(single item)</sup></label>
                                <a href="javascript:void(0);" id="adddeals" class="d-sm-inline-block btn btn-sm pull-right  btnstyle shadow-sm">
                                    <i class="fa fa-plus fa-sm text-white-50"></i>&nbsp;Add Deals</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTableDeals" width="100%" cellspacing="0">
                                </table>
                            </div>


                        </div>

                    </div>

                </div>

                <div class="row d-none" id="offer_div">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="trxhistory mb-3">
                                <label>Offers<sup>(muliple items)</sup></label>
                                <a href="javascript:void(0);" id="addOffers" class="d-sm-inline-block btn btn-sm pull-right  btnstyle shadow-sm">
                                    <i class="fa fa-plus fa-sm text-white-50"></i>&nbsp;Add Offers</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTableOffers" width="100%" cellspacing="0">
                                </table>
                            </div>


                        </div>

                    </div>

                </div>

                <div class="row d-none" id="item_div">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="trxhistory mb-3">
                                <label>Items</label>
                                <a href="javascript:void(0);" id="addproductbtn" class="d-sm-inline-block btn btn-sm pull-right  btnstyle shadow-sm">
                                    <i class="fa fa-plus fa-sm text-white-50"></i>&nbsp;Add More Items</a>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="example" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>A/NA</th>
                                            <th>S No</th>
                                            <th>Item Name</th>
                                            <th>Description</th>
                                            <th>Category Group</th>
                                            <th>Category</th>
                                            <th>Selling Price</th>
                                            <th>MRP</th>
                                            <th>GST Included</th>
                                            <th>GST Percentage</th>
                                            <th></th>
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
    </form>


    <footer>
        <div class="footer" style="color: white; position: fixed; width: 100%; bottom: 0; padding-top: 5px; padding-left: 10px; z-index: 9;">
        </div>
    </footer>
    <div class="modal fade" id="addstealdeal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
    <div class="modal fade" id="addoffersapnd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="overflow: scroll;">
    </div>
    <div class="modal fade" id="adddeal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
    <div class="modal fade" id="AddItemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="overflow: scroll;">
    </div>
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <input type="hidden" id="RID" runat="server" value="" />

    <div class="modal fade" id="img-upload-panel">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Upload Profile Photo</h4>
                    <button type="button" class="img-remove-btn close">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row container">
                        <div class="col">
                            <div class="img-edit-container"></div>
                        </div>
                    </div>
                    <div class="row container">
                        <div class="col">
                            <label>Brightness</label>
                            <input type="range" class="form-control-range filter" min="0" max="200" value="100" step="1" filter="brightness" />
                        </div>
                        <div class="col">
                            <label>Threshold</label>
                            <input type="range" class="form-control-range filter" min="0" max="200" value="100" step="1" filter="threshold" />
                        </div>
                    </div>
                    <div class="row container">
                        <div class="col">
                            <button type="button" class="btn btn-dark filter" filter="grayscale">Grayscale</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-dark filter" filter="sharpen">Sharpen</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-dark filter" filter="blur">Blur</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-dark img-clear-filter">Clear</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-dark img-rotate-left">Rotate Left</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-dark img-rotate-right">Rotate Right</button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary img-remove-btn">Close</button>
                    <button type="button" class="btn btn-primary img-upload-btn">Upload</button>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>

    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/2.0.3/js/dataTables.scroller.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="../Assest/bootstrap.js"></script>
    <script src="js/croppie.min.js"></script>
    <%-- <script src="js/imguploader.minify.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-jcrop/0.9.15/js/jquery.Jcrop.min.js" integrity="sha512-KKpgpD20ujD3yJ5gIJqfesYNuisuxguvTMcIrSnqGQP767QNHjEP+2s1WONIQ7j6zkdzGD4zgBHUwYmro5vMAw==" crossorigin="anonymous"></script>

    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.js"></script>

    <script>

        window.onpopstate = function () {
            let open_modal = document.querySelector('.modal.show')
            if (open_modal) {
                open_modal.dataset.pushback = 'true';
                $(open_modal).modal('hide')
            }
        }
        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)
            $('#Alert_btn').trigger('click');
        }
        $(document).ready(function () {
            getAllCount();
            getmenuname();
            if ($("#example tbody").length == 0) {
                setTimeout(function () {
                    getAllItems();
                }, 200)
            }
            if ($("#dataTableStealDeal").length == 1) {
                setTimeout(function () {
                    getStealDeal();
                }, 500)
            }
            if ($("#dataTableDeals").length == 1) {
                setTimeout(function () {
                    getDeals();
                }, 1000)
            }
            if ($("#dataTableOffers").length == 1) {
                setTimeout(function () {
                    getOffers();
                }, 1500)
            }

        })


        $('.items').click(function (e) {
            e.stopImmediatePropagation();
            if ($("#example tbody").length == 0) {
                getAllItems();
            }

            $('#special_deal_div').addClass('d-none');
            $('#offer_div').addClass('d-none');
            $('#steal_deal_div').addClass('d-none');
            $('#item_div').removeClass('d-none');
            $('html, body').animate({
                scrollTop: $("#item_div").offset().top
            }, 2000);
        })

        $('.steal_deal').click(function (e) {
            e.stopImmediatePropagation();
            if ($("#dataTableStealDeal").length == 1) {
                getStealDeal();
            }
            $('#special_deal_div').addClass('d-none');
            $('#offer_div').addClass('d-none');
            $('#item_div').addClass('d-none');
            $('#steal_deal_div').removeClass('d-none');

            $('html, body').animate({
                scrollTop: $("#steal_deal_div").offset().top
            }, 2000);
        })

        $('.best_deals').click(function (e) {
            e.stopImmediatePropagation();
            if ($("#dataTableDeals").length == 1) {
                getDeals()
            }
            $('#steal_deal_div').addClass('d-none');
            $('#offer_div').addClass('d-none');
            $('#item_div').addClass('d-none');
            $('#special_deal_div').removeClass('d-none');
            $('html, body').animate({
                scrollTop: $("#special_deal_div").offset().top
            }, 2000);
        })

        $('.offers').click(function (e) {
            e.stopImmediatePropagation();
            if ($("#dataTableOffers").length == 1) {
                getOffers();
            }
            $('#steal_deal_div').addClass('d-none');
            $('#special_deal_div').addClass('d-none');
            $('#item_div').addClass('d-none');
            $('#offer_div').removeClass('d-none');
            $('html, body').animate({
                scrollTop: $("#offer_div").offset().top
            }, 2000);
        })

        function getAllCount() {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/getItemAndOffersCount",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var current = data.d
                    current = current.split('|');
                    $('#steal_deal_count').html(current[0]);
                    $('#best_deals_count').html(current[1]);
                    $('#best_offers_count').html(current[2]);
                    $('#total_items_count').html(current[3]);
                },
            })
        }

        function getDeals() {

            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/getDealData",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#dataTableDeals').empty();
                    if (data.d != '') {
                        $("#dataTableDeals").append(data.d);
                        $('#dataTableDeals').dataTable();

                        $("#dataTableDeals").on('click', '.deletebtndeal', function (e) {
                            e.stopImmediatePropagation();
                            var deal_id = $(this).attr('deal_id');
                            var name = $(this).attr('name');
                            test4(deal_id, name);


                        })
                        function test4(mid, name) {
                            xdialog.confirm('Are you sure you want to delete this best deal <br>( ' + name + ' ) ?', function () {
                                // do work here if ok/yes selected...
                                insertdeal('', '', '', '', '', '', '', '', ''
                                    , '', 'DELETE', mid);

                                console.info('Done!');
                            }, {
                                style: 'width:420px;font-size:0.8rem;',
                                buttons: {
                                    ok: 'Confirm',
                                    cancel: 'Cancel'
                                },
                                oncancel: function () {
                                    console.warn('Cancelled!');
                                }
                            });
                        }

                        $("#dataTableDeals").on('click', '.editbtndeal', function (f) {
                            $("#adddeal").empty();
                            $.ajax({
                                type: "POST",
                                async: true,
                                url: "admin_items.aspx/gen_dealmodal",
                                data: '{Deal_ID: "' + $(this).attr('deal_id') + '"}',
                                beforeSend: function () {
                                    $("#preload").show();
                                },
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    $("#adddeal").append(data.d);

                                    window.location.hash = "modal";

                                    $("#adddeal").modal();


                                    $('#createdeal').click(function (e) {
                                        e.stopImmediatePropagation();
                                        var dealname = $('#dealname').val();


                                        var description = $('#Description').val();


                                        var ofrprice = $('#ofrprice').val();
                                        var instruction = $('#instruction').val();
                                        var startdate = $('#datestart').val();
                                        var enddate = $('#dateend').val();
                                        var Flag = 'ADD', Deal_ID = '';
                                        if (startdate.length == 0) {
                                            showpopup('Please select Start date');
                                        }

                                        else if (ofrprice.length == 0) {
                                            showpopup('Please select Offer Price');
                                        }
                                        else if (enddate.length == 0) {
                                            showpopup('Please select End date');
                                        }
                                        else {
                                            insertdeal(dealname, '', '', description, '', '', ofrprice, instruction, startdate
                                                , enddate, Flag, Deal_ID);
                                        }
                                    })

                                },
                                complete: function () {
                                    $("#preload").hide();
                                }
                            });
                        })
                        $("#dataTableDeals").on('click', '.notifyBestOffer', function (e) {
                            e.stopImmediatePropagation();
                            var deal_id = $(this).attr("deal_id");
                            var notif_count = $(this).find(".notif_count").text();
                            var minusCount = "0";
                            if (notif_count > 0) {
                                minusCount = parseInt(notif_count) - 1;

                                SendBestOfferNotif(deal_id);
                            } else {
                                showpopup("Max limit exhausted")
                                $(this).removeClass("notificationtrigrbtn btnstyle").addClass("disablenotifibtn");
                            }

                            $(this).find(".notif_count").text("");
                            $(this).find(".notif_count").text(minusCount);






                        })
                    }

                },
                complete: function () {
                    $("#preload").hide();
                }
            })
        }

        function getStealDeal() {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/GetStealDealData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    $('#dataTableStealDeal').empty();
                    if (data.d != '') {
                        $("#dataTableStealDeal").append(data.d);
                        $('#dataTableStealDeal').dataTable();

                        $("#dataTableStealDeal").on('click', '.deletebtnstealdeal', function (e) {
                            e.stopImmediatePropagation();
                            var sdid = $(this).attr('sdid');
                            var name = $(this).attr('name');
                            test2(sdid, name);


                        })
                        function test2(mid, name) {
                            xdialog.confirm('Are you sure you want to delete this Steal deal <br>( ' + name + ' ) ?', function () {
                                // do work here if ok/yes selected...
                                addstealdealintodb('', '', '', '', '', '', '', '', '', '',
                                    '', '', '', '', '', '', '', 'DELETE', mid);

                                console.info('Done!');
                            }, {
                                style: 'width:420px;font-size:0.8rem;',
                                buttons: {
                                    ok: 'Confirm',
                                    cancel: 'Cancel'
                                },
                                oncancel: function () {
                                    console.warn('Cancelled!');
                                }
                            });
                        }
                        $("#dataTableStealDeal").on('click', '.editbtnstealdeal', function (f) {
                            f.stopImmediatePropagation();
                            $("#addstealdeal").empty();
                            var SDID = $(this).attr('sdid');
                            $.ajax({
                                type: "POST",
                                async: true,
                                url: "admin_items.aspx/fnGetStealDealModal",
                                data: '{SDID: "' + SDID + '"}',
                                beforeSend: function () {

                                },
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {

                                    $("#addstealdeal").append(data.d);

                                    window.location.hash = "modal";

                                    $("#addstealdeal").modal();




                                    $("#AddStealDealbtn").click(function (e) {

                                        e.stopImmediatePropagation();
                                        var Name = '';
                                        var Portion = '';
                                        var MRP = '';
                                        var offer_price = $("#offerprice").val();
                                        var start_date = $("#datepicker").val();
                                        var end_date = $("#enddate").val();
                                        var MIN_order = $("#minorder").val();
                                        var SUN = $("#customCheck1:checked").val();
                                        var MON = $("#customCheck2:checked").val();
                                        var TUE = $("#customCheck3:checked").val();
                                        var WED = $("#customCheck4:checked").val();
                                        var THU = $("#customCheck5:checked").val();
                                        var FRI = $("#customCheck6:checked").val();
                                        var SAT = $("#customCheck7:checked").val();
                                        var Odd = $("#odd:checked").val();
                                        var Even = $("#even:checked").val();
                                        var Order_selection = $("#offerselection option:selected").val();

                                        if (offer_price.length == 0) {
                                            showpopup("offer_price missing");
                                        }
                                        else if (start_date.length == 0) {
                                            showpopup("start_date missing");
                                        }
                                        else if (end_date.length == 0) {
                                            showpopup("end_date missing");
                                        }
                                        else if (MIN_order.length == 0) {
                                            showpopup("MIN_order missing");
                                        }

                                        else {
                                            addstealdealintodb(Name, Portion, MRP, offer_price, start_date, end_date, MIN_order, SUN, MON, TUE,
                                                WED, THU, FRI, SAT, Odd, Even, Order_selection, 'EDIT', $(this).attr('sdid'));
                                        }
                                    })
                                }
                            })
                        })
                        $("#dataTableStealDeal").on('click', '.notifyStealDeal', function (e) {
                            e.stopImmediatePropagation();
                            var sdeal_id = $(this).attr("sdid");
                            var notif_count = $(this).find(".notif_count").text();
                            var minusCount = "0";
                            if (notif_count > 0) {
                                minusCount = parseInt(notif_count) - 1;

                                SendStealDealNotif(sdeal_id);
                            } else {
                                showpopup("Max limit exhausted")
                                $(this).removeClass("notificationtrigrbtn btnstyle").addClass("disablenotifibtn");
                            }

                            $(this).find(".notif_count").text("");
                            $(this).find(".notif_count").text(minusCount);
                        })
                    }
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        }


        function getOffers() {

            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/getOffersData",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#dataTableOffers').empty();
                    if (data.d != '') {
                        $("#dataTableOffers").append(data.d);
                        $('#dataTableOffers').dataTable();

                        $("#dataTableOffers").on('click', '.deletebtnoffer', function (e) {
                            e.stopImmediatePropagation();
                            var offer_id = $(this).attr('offer_id');
                            var name = $(this).attr('name');
                            test3(offer_id, name)

                        })
                        function test3(mid, name) {
                            xdialog.confirm('Are you sure you want to delete this offer <br>( ' + name + ' ) ?', function () {
                                // do work here if ok/yes selected...
                                insertoffers('', '', '', '', '', '', '', '', '', '', '', '',
                                    '', '', '', '', mid, 'DELETE', '', '','');

                                console.info('Done!');
                            }, {
                                style: 'width:420px;font-size:0.8rem;',
                                buttons: {
                                    ok: 'Confirm',
                                    cancel: 'Cancel'
                                },
                                oncancel: function () {
                                    console.warn('Cancelled!');
                                }
                            });
                        }
                        $("#dataTableOffers").on('click', '.editbtnoffer', function (f) {
                            f.stopImmediatePropagation();
                            showpopup('You cannot edit offer. Please delete the offer and create new one');
                        })



                        $("#dataTableOffers").on('click', '.notifyoffersbtn', function (e) {
                            e.stopImmediatePropagation();
                            var oid = $(this).attr("oid");
                            var notif_count = $(this).find(".notif_count").text();
                            var minusCount = "0";
                            if (notif_count > 0) {
                                minusCount = parseInt(notif_count) - 1;

                                SendOffersNotif(oid);
                            } else {
                                showpopup("Max limit exhausted")
                                $(this).removeClass("notificationtrigrbtn btnstyle").addClass("disablenotifibtn");
                            }

                            $(this).find(".notif_count").text("");
                            $(this).find(".notif_count").text(minusCount);






                        })
                    }
                },
                complete: function () {
                    $("#preload").hide();
                }
            })
        }

        function getAllItems() {

            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/getAllItems",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#addproductbtn").click(function () {

                        getItemModal('', 'ADD', '');
                    })
                    if (data.d != '') {
                        var result = (data.d).replace(/^\s+|\s+$/g, "");
                        var parsedData = JSON.parse(result).table;
                        $('#example').DataTable({
                            data: parsedData,
                            columns: [
                                {
                                    render: function (data, type, row) {

                                        //return createButton('Available', row.MID);
                                        return Availablility('Available', row.mid, row.item_availability);
                                    }
                                },
                                {
                                    render: function (data, type, row, meta) {
                                        return meta.row + meta.settings._iDisplayStart + 1;
                                    }
                                },                               

                                { 'data': 'name' },
                                { 'data': 'description' },
                                { 'data': 'category_name' },
                                { 'data': 'cg_name' },
                                { 'data': 'price' },
                                { 'data': 'mrp' },
                                { 'data': 'gst_included' },
                                { 'data': 'gst_percentage' },

                                {
                                    //edit button creation    
                                    render: function (data, type, row) {
                                        return createButton('edit', row.mid, row.name);
                                    }
                                },
                                {
                                    //delete button creation    
                                    render: function (data, type, row) {
                                        return createButton('delete', row.mid, row.name);
                                    }
                                }
                            ]


                            //,
                            //deferRender: true,
                            //scrollY: 200,
                            //scrollCollapse: true,
                            //scroller: true

                        });
                         
                        $("#example").on('click', '.deleteItem', function (e) {
                            e.stopImmediatePropagation();
                            var mid = $(this).attr('mid');
                            var name = $(this).attr('name');
                            current = $(this);
                            test(mid, name, current);
                            //addItem('', '', '', '', '', '', '', '',
                            //    '', '', '', '', $(this).attr('mid'), 'DELETE', '');

                        })

                        function test(mid, name, current) {
                            xdialog.confirm('Are you sure you want to delete this item <br>( ' + name + ' ) ?', function () {
                                // do work here if ok/yes selected...
                                addItem('', '', '', '', '', '', '', '',
                                    '', '', '', '', mid, 'DELETE', '', '');
                                current.parent().parent().remove();
                                console.info('Done!');
                            }, {
                                style: 'width:420px;font-size:0.8rem;',
                                buttons: {
                                    ok: 'Confirm',
                                    cancel: 'Cancel'
                                },
                                oncancel: function () {
                                    console.warn('Cancelled!');
                                }
                            });
                        }

                        $("#example").on('click', '.editItem', function (e) {
                            e.stopImmediatePropagation();
                            var current = $(this).parent().closest('tr');
                            getItemModal($(this).attr('mid'), 'EDIT', current);

                        })



                        $("#example").on('click', '.avability', function (e) {
                            e.stopImmediatePropagation();
                            var MID = $(this).attr("mid");
                            var val = "";
                            if ($(this).is(":checked")) {
                                val = 'Y'
                            }
                            else {
                                val = 'N'
                            }
                            MarkAvailablility(MID, val);
                        });


                    }

                },
                complete: function () {
                    $("#preload").hide();
                }
            })
        }

        //-------------------------send notify count update ---------------------------
        function SendStealDealNotif(offerid) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/update_Notif_count",
                data: '{offerid: "' + offerid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    var current = data.d;
                    current = current.split('|');
                    showpopup("Notification to " + current[0] + " customers is <br/> in progress");
                    notifyCustomer(current[1], current[2]);
                },
                complete: function () {
                    $("#preload").hide();
                },
            });

        }


        function SendBestOfferNotif(offerid) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/update_bestoffer_count",
                data: '{offerid: "' + offerid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    var current = data.d;
                    current = current.split('|');
                    showpopup("Notification to " + current[0] + " customers is <br/> in progress");
                    notifyCustomer(current[1], current[2]);
                },
                complete: function () {
                    $("#preload").hide();
                },
            });

        }


        function SendOffersNotif(offerid) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/update_offer_count",
                data: '{offerid: "' + offerid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    var current = data.d;
                    current = current.split('|');
                    showpopup("Notification to " + current[0] + " customers is <br/> in progress");
                    notifyCustomer(current[1], current[2]);
                },
                complete: function () {
                    $("#preload").hide();
                },
            });

        }

        function notifyCustomer(Title, Message) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/sendNotification",
                data: '{Title: "' + Title + '",Message: "' + Message + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                success: function (data) {

                },

            });
        }


        function getItemModal(MID, Flag, currentt) {

            $('#AddItemModal').empty();
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/fnAddNewItem",
                data: '{MID: "' + MID + '",Flag: "' + Flag + '"}',
                beforeSend: function () {
                    $("#preload").show();
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#AddItemModal').empty();
                    $('#AddItemModal').append(data.d);

                    window.location.hash = "modal";

                    $('#AddItemModal').modal();

                    var loadFile = function (event) {
                        var image = document.getElementById('image');
                        image.src = URL.createObjectURL(event.target.files[0]);
                    };

                    $('#addproductbtn').removeAttr('disabled');
                    //image();
                    $('#Category').change(function () {
                        var CGID = $(this).find('option:selected').attr('cgid');
                        var abc = '';
                        $('#subcategorys').find('option').each(function () {
                            if ($(this).attr('cgid') == CGID && abc == '') {
                                $(this).attr('selected', 'selected');
                                $(this).removeClass('d-none')
                                abc = '1';
                            }
                            else if ($(this).attr('cgid') == CGID && abc == '1') {
                                $(this).removeClass('d-none')
                            }
                            else {
                                $(this).removeAttr('selected')
                                $(this).addClass('d-none')
                            }
                        })
                    })

                    $(".tagselect").click(function () {

                        if ($(this).hasClass("tagscss")) {
                            $(this).removeClass("tagscss");
                            $(this).addClass("selectedtag");
                        }
                        else {
                            $(this).addClass("tagscss");
                            $(this).removeClass("selectedtag");

                        }

                    })
                    $("#Gstdetails").click(function () {
                        $("#gstform").slideToggle("slow", function () {
                        });
                    })

                    $("#Addtags").click(function () {
                        $("#tagsnames").slideToggle("slow", function () {
                        });
                    })


                    $('#submititems').click(function (e) {
                        e.stopImmediatePropagation();
                         
                        $(this).attr('disabled', 'disabled');
                        var Flag = $(this).attr('flag');
                        var Item_Name = $('#itemname').val();
                        var MTID = $('#Category option:selected').attr('cgid');
                        var MCID = $('#subcategorys option:selected').attr('mcid');

                        var LocalName = $('#localname').val();
                        var HSN_No = $('#Hsnnumber').val();
                        var MRP = $('#mrp').val();
                        var Selling_Price = $('#sprice').val();
                        var GST_Percentage = $('#GSTPERCENT').val();
                        var GST_Included = $('#GSTINCLUDED option:selected').val();
                        var selectedTags = '';
                        var Barcode = $('#barcode').val();
                        $('.selectedtag').each(function () {
                            selectedTags = selectedTags + $(this).text() + '|';
                        })
                        var imagesrc = $("#image").attr("src");
                        var ImgSource = '';
                        if (imagesrc != null || imagesrc != undefined) {
                            if (imagesrc.indexOf('base64') > -1) {
                                ImgSource = imagesrc.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
                            }
                            else {
                                ImgSource = '';
                            }

                        }
                        var Description = $('#Description').val();
                        var MID = $(this).attr('mid') || '';

                        var current_tr = '';


                        addItem(Item_Name, MTID, MCID, LocalName, HSN_No, MRP, Selling_Price, GST_Percentage,
                            GST_Included, ImgSource, Description, selectedTags, MID, Flag, Barcode, current_tr);

                        if (Flag == 'EDIT') {
                            showpopup('Item Updated Successfully');
                            var td_row = '<td class="sorting_1"><label class="switch">' +
                                '<input available="Y" mid="' + MID + '" class=" avability" type="checkbox" checked="">' +
                                '<span class="slider round"></span></label></td><td>1</td><td>' + Item_Name + '</td>' +
                                '<td>' + Description + '</td><td>' + $('#subcategorys option:selected').text() + '</td><td>' + $('#Category option:selected').text() + '</td><td>' + Selling_Price + '</td><td>' + MRP + '</td><td>' + GST_Included + '</td>' +
                                '<td>' + GST_Percentage + '</td><td><i mid="' + MID + '" name="' + Item_Name + '" class="fa fa-edit editItem"></i> ' +
                                '<i mid="' + MID + '" name="' + Item_Name + '" class="fa fa-tick d-none tickItem"></i></td><td>' +
                                '<i mid="' + MID + '" name="' + Item_Name + '" class="fa fa-trash deleteItem"></i></td>';
                            currentt.empty();
                            currentt.append(td_row);
                        }


                        if (Flag == 'DELETE') {
                            showpopup('Item deleted Successfully');
                        }
                    })

                    $('#itemname').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#itemname').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                Barcode: data.d[key].Barcode,
                                                price: data.d[key].Price,
                                                MRP: data.d[key].MRP,
                                                Local_Name: data.d[key].Option_Name
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            $('#barcode').val(ui.item.Barcode);
                            $('#sprice').val(ui.item.price);
                            $('#itemname').val(ui.item.label);
                            $('#mrp').val(ui.item.MRP);
                            $('#localname').val(ui.item.Local_Name);
                        }
                    });

                    $('#barcode').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#barcode').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                Barcode: data.d[key].Barcode,
                                                price: data.d[key].Price,
                                                MRP: data.d[key].MRP,
                                                Local_Name: data.d[key].Option_Name
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            $('#barcode').val(ui.item.Barcode);
                            $('#sprice').val(ui.item.price);
                            $('#itemname').val(ui.item.label);
                            $('#mrp').val(ui.item.MRP);
                            $('#localname').val(ui.item.Local_Name);
                        }
                    });

                    
                },
                complete: function () {
                    $("#preload").hide();
                }
            })
        }

        function addItem(Item_Name, MTID, MCID, LocalName, HSN_No, MRP, Selling_Price, GST_Percentage,
            GST_Included, ImgSource, Description, selectedTags, MID, Flag, Barcode, current_tr) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/fnUpdateMenuItem",
                data: '{Item_Name:"' + Item_Name + '",MTID:"' + MTID + '",MCID:"' + MCID + '",LocalName:"' + LocalName
                    + '",HSN_No:"' + HSN_No + '",MRP:"' + MRP + '",Selling_Price:"' + Selling_Price + '",GST_Percentage:"' + GST_Percentage
                    + '",GST_Included:"' + GST_Included + '",ImgSource:"' + ImgSource + '",Description:"' +
                    Description + '",selectedTags:"' + selectedTags + '",MID:"' + MID + '",Flag:"' + Flag + '",Barcode:"' + Barcode + '"}',
                beforeSend: function () {
                    $("#preload").show();

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#AddItemModal').modal('hide');
                    getAllCount();
                    if (Flag == 'ADD') {
                        showpopup('Item Added Successfully');
                        $('#example tbody').prepend(response.d);

                    }

                },
                complete: function () {
                    $("#preload").hide();

                },
            })
        }

        function createButton(buttonType, rowID, Name) {
            // var buttonText = buttonType == "edit" ? "Edit" : "Delete";
            if (buttonType == 'edit') {
                return '<i mid="' + rowID + '" name="' + Name + '" class="fa fa-edit editItem"></i> <i mid="' + rowID + '" name="' + Name + '" class="fa fa-tick d-none tickItem"></i>';
            }
            else if (buttonType == 'delete') {
                return '<i mid="' + rowID + '" name="' + Name + '" class="fa fa-trash deleteItem"></i></i>';
            }
            else {
                return "";
            }

            // return '<button class="' + buttonType + '" type="button">' + buttonText + '</button>';
        }


        function Availablility(buttonType, rowID, isavailable) {

            if (buttonType == 'Available') {
                if (isavailable == 'Y') {
                    return '<label class="switch"><input available="' + isavailable + '" mid="' + rowID + '" class=" avability" type = "checkbox" checked /><span class="slider round"></span></label>';
                }
                else {
                    return '<label class="switch"><input available="' + isavailable + '" mid="' + rowID + '" class=" avability" type = "checkbox"/><span class="slider round"></span></label>';
                }


            }
        }
        function MarkAvailablility(MID, VALUE) {
            if (VALUE.length > 0) {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "admin_items.aspx/fn_markAvailable",
                    data: '{MID: "' + MID + '",VALUE: "' + VALUE + '"}',
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                })
            }


        }


        $("#addStealDeals").click(function () {
            $("#addstealdeal").empty();
            $("#addStealDeals").attr('disabled', 'disabled');
            var SDID = '';
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/fnGetStealDealModal",
                data: '{SDID: "' + SDID + '"}',
                beforeSend: function () {

                    $("#preload").show();


                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    $("#addstealdeal").append(data.d);

                    window.location.hash = "modal";

                    $("#addstealdeal").modal();

                    $("#addStealDeals").removeAttr('disabled');
                    document.getElementById('datepicker').value = moment().format('YYYY-MM-DD');
                    document.getElementById('enddate').value = moment().add(30, 'days').format('YYYY-MM-DD');

                    $("#AddStealDealbtn").click(function (e) {
                        e.stopImmediatePropagation();
                        var Name = $("#stealitems").attr("Content_id");
                        var Portion = $("#stealportion").val();
                        var MRP = $("#regularprice").val();
                        var offer_price = $("#offerprice").val();
                        var start_date = $("#datepicker").val();
                        var end_date = $("#enddate").val();
                        var MIN_order = $("#minorder").val();
                        var SUN = $("#customCheck1:checked").val();
                        var MON = $("#customCheck2:checked").val();
                        var TUE = $("#customCheck3:checked").val();
                        var WED = $("#customCheck4:checked").val();
                        var THU = $("#customCheck5:checked").val();
                        var FRI = $("#customCheck6:checked").val();
                        var SAT = $("#customCheck7:checked").val();
                        var Odd = $("#odd:checked").val();
                        var Even = $("#even:checked").val();
                        var Order_selection = $("#offerselection option:selected").val();
                        if (Name.length == 0) {
                            showpopup("Name missing");
                        }

                        else if (MRP.length == 0) {
                            showpopup("MRP missing");
                        }
                        else if (offer_price.length == 0) {
                            showpopup("offer_price missing");
                        }
                        else if (start_date.length == 0) {
                            showpopup("start_date missing");
                        }
                        else if (end_date.length == 0) {
                            showpopup("end_date missing");
                        }
                        else if (MIN_order.length == 0) {
                            showpopup("MIN_order missing");
                        }

                        else {
                            addstealdealintodb(Name, Portion, MRP, offer_price, start_date, end_date, MIN_order, SUN, MON, TUE,
                                WED, THU, FRI, SAT, Odd, Even, Order_selection, 'ADD', '');
                        }
                    })
                    $('#stealitems').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#stealitems').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                value: data.d[key].MID,
                                                qty: data.d[key].Qty,
                                                price: data.d[key].Price,
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            $('#stealitems').val(ui.item.label)
                            $('#stealportion').val(ui.item.qty)
                            $('#stealitems').attr('Content_id', TempValue);
                            $('#regularprice').val(ui.item.price);
                        }
                    });
                },
                complete: function () {
                    $("#preload").hide();

                },
            })

        })
        function addstealdealintodb(Name, Portion, MRP, offer_price, start_date, end_date, MIN_order, SUN, MON, TUE,
            WED, THU, FRI, SAT, Odd, Even, Order_selection, Flag, SDID) {


            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/insertstealdealdata",
                data: '{Name: "' + Name + '",Portion: "' + Portion + '",MRP: "' + MRP + '",offer_price: "' + offer_price + '",start_date: "' + start_date
                    + '",end_date: "' + end_date + '",MIN_order: "' + MIN_order + '",SUN: "' + SUN + '",MON: "' + MON + '",TUE: "' + TUE
                    + '",WED: "' + WED + '",THU: "' + THU + '",FRI: "' + FRI + '",SAT: "' + SAT + '",Odd: "' + Odd
                    + '",Even: "' + Even + '",Order_selection: "' + Order_selection + '",Flag: "' + Flag + '",SDID: "' + SDID + '"}',
                beforeSend: function () {

                    $("#preload").show();


                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (Flag == 'ADD') {
                        showpopup('Record inserted successfully');
                    }
                    if (Flag == 'DELETE') {
                        showpopup('Record removed successfully');
                    }
                    if (Flag == 'EDIT') {
                        showpopup('Record updated successfully');
                    }
                    $("#addstealdeal").modal('hide');
                    getStealDeal();
                    getAllCount();
                },
                complete: function () {
                    $("#preload").hide();

                }
            })




        }

        $("#adddeals").click(function () {
            $("#adddeal").empty();
            $("#adddeals").attr('disabled', 'disabled');
            var Deal_ID = '';
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/gen_dealmodal",
                data: '{Deal_ID: "' + Deal_ID + '"}',
                beforeSend: function () {

                    $("#preload").show();


                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#adddeal").append(data.d);
                    window.location.hash = "modal";

                    $("#adddeal").modal();
                    $("#adddeals").removeAttr('disabled', 'disabled');
                    document.getElementById('datestart').value = moment().format('YYYY-MM-DD');
                    document.getElementById('dateend').value = moment().add(30, 'days').format('YYYY-MM-DD');

                    $('#createdeal').click(function (e) {
                        e.stopImmediatePropagation();
                        var dealname = $('#dealname').val();
                        var mid = $('#dealitems').attr('Content_id');
                        var dealitemsname = $('#dealitems').val();
                        var description = $('#Description').val();
                        var itmqty = $('#itmqty').val();
                        var reg_price = $('#itmprice').val();
                        var ofrprice = $('#ofrprice').val();
                        var instruction = $('#instruction').val();
                        var startdate = $('#datestart').val();
                        var enddate = $('#dateend').val();
                        var Flag = 'ADD', Deal_ID = '';
                        if (dealname.length == 0) {
                            showpopup('Please select Deal Name');
                        }
                        else if (startdate.length == 0) {
                            showpopup('Please select Start date');
                        }
                        else if (itmqty.length == 0) {
                            showpopup('Please select QTY');
                        }
                        else if (ofrprice.length == 0) {
                            showpopup('Please select Selling Price');
                        }
                        else if (enddate.length == 0) {
                            showpopup('Please select End date');
                        }
                        else {
                            insertdeal(dealname, mid, dealitemsname, description, itmqty, reg_price, ofrprice, instruction, startdate
                                , enddate, Flag, Deal_ID);
                        }
                    })
                    $('#dealitems').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#dealitems').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                value: data.d[key].MID,
                                                qty: data.d[key].Qty,
                                                price: data.d[key].Price,
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;

                            $('#dealitems').val(ui.item.label);
                            $('#dealitems').attr('Content_id', TempValue);
                            //$('#itmqty').val(ui.item.qty);
                            $('#itmprice').val(ui.item.price);

                        }
                    });
                },
                complete: function () {
                    $("#preload").hide();

                }
            });


        });
        function insertdeal(dealname, mid, dealitemsname, description, itmqty, reg_price, ofrprice, instruction, startdate
            , enddate, Flag, Deal_ID) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/insertdealitems",
                data: '{dealitemsname: "' + dealitemsname + '",dealname: "' + dealname + '",description: "' + description + '",itmqty: "' + itmqty + '",reg_price: "' + reg_price + '",ofrprice: "' + ofrprice
                    + '",instruction: "' + instruction + '",startdate: "' + startdate + '",enddate: "' + enddate + '",MID: "' + mid + '",Flag: "' + Flag + '",Deal_ID: "' + Deal_ID + '"}',
                beforeSend: function () {

                    $("#preload").show();


                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (Flag == 'ADD') {
                        showpopup('Record inserted successfully');
                    }
                    if (Flag == 'DELETE') {
                        showpopup('Record removed successfully');
                    }
                    if (Flag == 'EDIT') {
                        showpopup('Record updated successfully');
                    }
                    $("#adddeal").modal('hide');

                    getDeals();
                    getAllCount();
                },
                complete: function () {
                    $("#preload").hide();

                },
            })
        }

        $("#addOffers").click(function (e) {
            e.stopImmediatePropagation();
            var Offer_ID = '';
            $("#addoffersapnd").empty();
            $("#addOffers").attr('disabled', 'disabled');
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/fnGetofferModal",
                data: '{Offer_ID: "' + Offer_ID + '"}',
                beforeSend: function () {

                    $("#preload").show();

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#addoffersapnd").append(data.d);

                    window.location.hash = "modal";

                    $("#addoffersapnd").modal();
                    $("#addOffers").removeAttr('disabled', 'disabled');
                    document.getElementById('ofrstartdate').value = moment().format('YYYY-MM-DD');
                    document.getElementById('ofrenddate').value = moment().add(30, 'days').format('YYYY-MM-DD');

                    //image();
                    $('#Addoffersbtn').click(function (e) {
                        e.stopImmediatePropagation();
                        var ofrname = $('#ofr_name').val();
                        var ofr_original_price = $('#ofr_ori_price').val();
                        var ofr_Price = $('#ofrprices').val();
                        var sun = $('#ofrsun:checked').val();
                        var mon = $('#ofrmon:checked').val();
                        var tue = $('#ofrtue:checked').val();
                        var wed = $('#ofrwed:checked').val();
                        var thu = $('#ofrthu:checked').val();
                        var fri = $('#ofrfri:checked').val();
                        var sat = $('#ofrsat:checked').val();
                        var startdate = $('#ofrstartdate').val();
                        var enddate = $('#ofrenddate').val();
                        var instruction = $('#ofr_instruct').val();
                        var description = $('#ofr_description').val();
                        var gst = "N";
                        var gstpercent = $("#gstpercent").val().replace('%', '');
                        var imagesrc = $("#image").attr("src");
                        var offerSelectImg = "";
                        if ($(".offerImgbtn").hasClass("offerImgbtn_active")) {
                            offerSelectImg = $(".offerImgbtn_active").attr("imgname");
                        }  
                        var ImgSource = '',
                            Offer_ID = '';
                        Flag = 'ADD';
                        if (imagesrc != null || imagesrc != '' || imagesrc != undefined) {
                            ImgSource = imagesrc.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
                        }

                        if ($('#dateend:checked') != "N") {
                            gst = "Y";
                        }

                        if (ofrname.length == 0) {
                            showpopup('Please select offer Name');
                        }

                        else if (startdate.length == 0) {
                            showpopup('Please select start date');
                        }
                        else if (enddate.length == 0) {
                            showpopup('Please select End date');
                        }
                        else {
                            insertoffers(ofrname, ofr_original_price, ofr_Price, sun, mon, tue, wed, thu, fri, sat, startdate, enddate,
                                instruction, description, gst, gstpercent, Offer_ID, Flag, ImgSource, Offer_Data, offerSelectImg);
                        }
                    })
                    $('#ofr_items').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#ofr_items').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name + ' -  Rs. ' + data.d[key].Price,
                                                value: data.d[key].MID,

                                                price: data.d[key].Price,
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            var itemsdelected = "<span class=\"itmscss\" >" +
                                "<select price=\"" + ui.item.price + "\" mid=\"" + TempValue + "\" class=\"perticularqty\"><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option><option value=\"6\">6</option><option value=\"7\">7</option><option value=\"8\">8</option><option value=\"9\">9</option><option value=\"10\">10</option></select> " + ui.item.label.replace('|', '-') + "<i class=\"fa fa-times-circle deleteselectitms\" mid='" + TempValue + "' style=\"font-size:16px;margin-left:10px;\"></i></span > ";
                            $('#selecteditems').append(itemsdelected);
                            $('#ofr_items').val('');
                            getOfferItemsList(TempValue, '1', ui.item.price, 'ADD');
                            removeitems();
                            $('.perticularqty').change(function (e) {
                                e.preventDefault();
                                getOfferItemsList($(this).attr('mid'), $(this).find('option:selected').val(), $(this).attr('price'), 'SUB');
                            })

                        }
                    });

                    $(".offerImgbtn").click(function (e) {
                        e.stopImmediatePropagation();
                        $(".offerImgbtn").removeClass("offerImgbtn_active");
                        $(this).addClass("offerImgbtn_active");

                    })
                },
                complete: function () {
                    $("#preload").hide();

                },
            });


        });
        var Offer_Data = [];
        function removeitems() {
            $(".deleteselectitms").click(function () {
                $(this).parent().hide();
                $(this).parent().removeClass('itmscss');
                getOfferItemsList($(this).attr('mid'), '', '', 'DELETE')
            })
        }

        function insertoffers(ofrname, ofr_original_price, ofr_Price, sun, mon, tue, wed, thu, fri, sat, startdate, enddate,
            instruction, description, gst, gstpercent, Offer_ID, Flag, ImgSource, OfferData, offerSelectImg) {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_items.aspx/insertoffersitems",
                data: '{ofrname: "' + ofrname + '",ofr_original_price: "' + ofr_original_price + '",ofr_Price: "' + ofr_Price + '",sun: "' + sun + '",mon: "' + mon + '",tue: "' + tue
                    + '",wed: "' + wed + '",thu: "' + thu + '",fri: "' + fri + '",sat: "' + sat + '",startdate: "' + startdate + '",enddate: "' + enddate
                    + '",instruction: "' + instruction + '",description: "' + description + '",gst: "' + gst
                    + '",gstpercent:"' + gstpercent + '",Offer_ID:"' + Offer_ID + '",Flag:"' + Flag + '", ImgSource:"' + ImgSource + '", offerSelectImg:"' + offerSelectImg + '", OfferData:' + Offer_Data + '}',
                beforeSend: function () {

                    $("#preload").show();

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    getOffers();
                    getAllCount();
                    if (Flag == 'ADD') {
                        $('#addoffersapnd').modal('hide');
                        showpopup('Offer Added Successfully')
                    }
                    if (Flag == 'EDIT') {
                        showpopup('Offer Updated Successfully')
                    }
                    if (Flag == 'DELETE') {
                        showpopup('Offer Deleted Successfully')
                    }
                },
                complete: function () {
                    $("#preload").hide();

                }
            })
        }

        function inittialiseOrderData() {
            var FormData = {

            }
            if (Offer_Data == '')
                Offer_Data = JSON.stringify(FormData);
        }
        function getOfferItemsList(MID, QTY, Price, Flag) {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "admin_items.aspx/Update_Offer_Data",
                data: '{MID: "' + MID + '",Flag:"' + Flag + '", OfferData:' + Offer_Data + ', Qty:"' + QTY + '", Price:"' + Price + '"}',
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();

                },
                success: function (data) {
                    Offer_Data = JSON.stringify(data.d);
                },
                complete: function () {
                    $("#preload").hide();

                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })

        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image')
                        .attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
                $("#image").show();
            }
        }
        //function image() {
        //    var name = "";
        //    var modal, target;
        //    var cropper, img_input, status, size;
        //    var passurl = "";
        //    var Filter = {};
        //    Filter.tmpCanvas = document.createElement('canvas');
        //    Filter.tmpCtx = Filter.tmpCanvas.getContext('2d');
        //    $(".img-upload-input").on('change', function (event) {
        //        var shape = $(this).attr('pshape') != undefined ? $(this).attr('pshape') : 'square';
        //        modal = $(this).attr('editor');
        //        target = $(this).attr('target');
        //        status = $(this).attr('status');
        //        passurl = $(this).attr('passurl');
        //        size = $(this).attr('size');
        //        var w = $(this).attr('w') != undefined ? $(this).attr('w') : '300';
        //        var h = $(this).attr('h') != undefined ? $(this).attr('h') : '300';
        //        var file_reader = new FileReader();
        //        var file = this.files[0]
        //        if (file != undefined) {
        //            name = file.name;
        //            file_reader.readAsDataURL(file);
        //            var fileExtension = name.replace(/^.*\./, '');
        //            var validImageTypes = ["jpg", "jpeg", "png", "svg"];
        //            try {
        //                img_input = $(this);
        //                if (validImageTypes.includes(fileExtension)) {
        //                    cropper = $(modal).find('.img-edit-container').croppie({
        //                        enableExif: true,
        //                        viewport:
        //                        {
        //                            width: Number(w),
        //                            height: Number(h),
        //                            type: shape
        //                        },
        //                        boundary: { width: Number(w) + 100, height: Number(h) + 100 },
        //                        enableOrientation: true
        //                    });
        //                    file_reader.onload = function (event) {

        //                        cropper.croppie('bind', {
        //                            url: event.target.result

        //                        });

        //                        apply_filter();
        //                        $(modal).modal();

        //                    }
        //                }
        //                else {
        //                    if (status != undefined) {
        //                        console.log("not valid extension");
        //                        $(status).html("<div class=\"alert alert-danger\">Please Select Valid File Image File. <small>Supported Extensions are (.png .svg .jpg .jpeg) </small></div>");
        //                    }
        //                }
        //            }
        //            catch (e) {
        //                if (modal == undefined) {
        //                    console.log("No Editor Modal Found. Create a Editor modal. Refer to documentation for help.")
        //                }
        //                console.log(e);
        //            }
        //        }
        //    });
        //    $(".img-upload-btn").on('click', function (event) {
        //        Filter.original = undefined;
        //        Filter.previous = undefined;
        //        cropper.croppie('result', {
        //            type: 'canvas',
        //            size: size
        //        }).then(function (response) {
        //            $('#image1').attr('src', '');
        //            $('#image').attr('src', response);
        //            $(modal).modal('hide');

        //        });
        //        if (cropper != undefined) {
        //            cropper.croppie('destroy');
        //        }
        //        if (img_input != undefined)
        //            img_input.val('');
        //        event.preventDefault();
        //    });
        //    $(".img-remove-btn").on('click', function (event) {
        //        Filter.original = undefined;
        //        Filter.previous = undefined;
        //        if (img_input != undefined)
        //            img_input.val('');
        //        if (cropper != undefined) {
        //            cropper.croppie('destroy');
        //        }
        //        $(modal).modal('hide');
        //        event.preventDefault();
        //    });
        //    $(".img-rotate-right").on('click', function (event) {
        //        cropper.croppie('rotate', -90);
        //    });
        //    $(".img-rotate-left").on('click', function (event) {
        //        cropper.croppie('rotate', 90);
        //    });
        //    function clear_canvas(cropper_canvas) {
        //        var ctx = cropper_canvas.getContext("2d");
        //        ctx.setTransform(1, 0, 0, 1, 0, 0);
        //        ctx.clearRect(0, 0, cropper_canvas.width, cropper_canvas.height);
        //    }
        //    function draw_canvas(canvas, data) {
        //        var ctx = canvas.getContext("2d");
        //        ctx.putImageData(data, 0, 0);
        //    }
        //    function getPixels(canvas) {
        //        var ctx;
        //        ctx = canvas.getContext('2d');
        //        return ctx.getImageData(0, 0, canvas.width, canvas.height);
        //    }
        //    $(".img-clear-filter").on('click', function (event) {
        //        if (Filter.original != undefined) {
        //            canvas = $(modal).find('canvas')[0];
        //            clear_canvas(canvas);
        //            draw_canvas(canvas, Filter.original);
        //            Filter.previous = Filter.original;
        //        }
        //    });

        //    Filter.grayscale = function (pixels) {
        //        var d = pixels.data;
        //        for (var i = 0; i < d.length; i += 4) {
        //            var r = d[i];
        //            var g = d[i + 1];
        //            var b = d[i + 2];
        //            var v = 0.2126 * r + 0.7152 * g + 0.0722 * b;
        //            d[i] = d[i + 1] = d[i + 2] = v
        //        }
        //        return pixels;
        //    },
        //        Filter.brightness = function (pixels, adjustment) {
        //            var d = pixels.data;
        //            for (var i = 0; i < d.length; i += 4) {
        //                d[i] += adjustment;
        //                d[i + 1] += adjustment;
        //                d[i + 2] += adjustment;
        //            }
        //            return pixels;
        //        },
        //        Filter.threshold = function (pixels, threshold) {
        //            var d = pixels.data;
        //            for (var i = 0; i < d.length; i += 4) {
        //                var r = d[i];
        //                var g = d[i + 1];
        //                var b = d[i + 2];
        //                var v = (0.2126 * r + 0.7152 * g + 0.0722 * b >= threshold) ? 255 : 0;
        //                d[i] = d[i + 1] = d[i + 2] = v
        //            }
        //            return pixels;
        //        },
        //        Filter.blur = function (pixels) {
        //            var weights = [1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9, 1 / 9];
        //            return Filter.convolution(pixels, weights);
        //        },
        //        Filter.sharpen = function (pixels) {
        //            var weights = [0, -1, 0, -1, 5, -1, 0, -1, 0];
        //            return Filter.convolution(pixels, weights);
        //        }
        //    Filter.createImageData = function (w, h) {
        //        return this.tmpCtx.createImageData(w, h);
        //    };
        //    Filter.convolution = function (pixels, weights, opaque) {
        //        var side = Math.round(Math.sqrt(weights.length));
        //        var halfSide = Math.floor(side / 2);

        //        var src = pixels.data;
        //        var sw = pixels.width;
        //        var sh = pixels.height;

        //        var w = sw;
        //        var h = sh;
        //        var output = Filter.createImageData(w, h);
        //        var dst = output.data;

        //        var alphaFac = opaque ? 1 : 0;

        //        for (var y = 0; y < h; y++) {
        //            for (var x = 0; x < w; x++) {
        //                var sy = y;
        //                var sx = x;
        //                var dstOff = (y * w + x) * 4;
        //                var r = 0,
        //                    g = 0,
        //                    b = 0,
        //                    a = 0;
        //                for (var cy = 0; cy < side; cy++) {
        //                    for (var cx = 0; cx < side; cx++) {
        //                        var scy = Math.min(sh - 1, Math.max(0, sy + cy - halfSide));
        //                        var scx = Math.min(sw - 1, Math.max(0, sx + cx - halfSide));
        //                        var srcOff = (scy * sw + scx) * 4;
        //                        var wt = weights[cy * side + cx];
        //                        r += src[srcOff] * wt;
        //                        g += src[srcOff + 1] * wt;
        //                        b += src[srcOff + 2] * wt;
        //                        a += src[srcOff + 3] * wt;
        //                    }
        //                }
        //                dst[dstOff] = r;
        //                dst[dstOff + 1] = g;
        //                dst[dstOff + 2] = b;
        //                dst[dstOff + 3] = a + alphaFac * (255 - a);
        //            }
        //        }
        //        return output;
        //    };
        //    function apply_filter() {
        //        var ranges = $(modal).find('.filter');
        //        var canvas = $(modal).find('canvas')[0];
        //        if (ranges != undefined && canvas != undefined) {
        //            for (var i = 0; i < ranges.length; i++) {
        //                if (ranges[i].getAttribute('type') === "range") {
        //                    ranges[i].onchange = function (event) {
        //                        if (Filter.original == undefined) {
        //                            Filter.original = getPixels(canvas);
        //                            Filter.previous = Filter.original;
        //                        }
        //                        clear_canvas(canvas);
        //                        draw_canvas(canvas, Filter.previous);
        //                        pixels = getPixels(canvas);
        //                        result = Filter[$(this).attr('filter')](pixels, Number($(this).val()));
        //                        clear_canvas(canvas);
        //                        draw_canvas(canvas, result);
        //                    };
        //                }
        //                else {
        //                    ranges[i].onclick = function (event) {
        //                        if (Filter.original == undefined) {
        //                            Filter.original = getPixels(canvas);
        //                            Filter.previous = Filter.original;
        //                        }
        //                        clear_canvas(canvas);
        //                        draw_canvas(canvas, Filter.previous);
        //                        pixels = getPixels(canvas);
        //                        result = Filter[$(this).attr('filter')](pixels);
        //                        clear_canvas(canvas);
        //                        draw_canvas(canvas, result);
        //                    };
        //                }
        //            }
        //        }
        //    }
        //}
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
    </script>
</body>
</html>
