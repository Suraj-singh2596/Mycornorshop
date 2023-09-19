<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_dashboard.aspx.cs" Inherits="Admin_admin_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
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
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />

    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>
<style>
    #shedulersection .card:hover {
        background: #d8d8d8 !important;
        transition: .5s;
    }

    .modal-dialog {
        margin-top: 110px;
    }

    #pageone {
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    }


    .footer {
        background: #384862 !important;
    }

    .switch {
        position: relative;
        display: inline-block;
        width: 50px;
        height: 20px;
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
        height: 13px;
        box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
    }

    .alldelecerdbtn {
        box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 20px;
        width: 20px;
        left: 2px;
        bottom: -3px;
        background-color: #fff;
        -webkit-transition: .4s;
        transition: .4s;
        box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
    }

    input:checked + .slider {
        background-color: #29b5a8;
        height: 13px;
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


    .btn-toggle {
        margin: 0 4rem;
        padding: 0;
        position: relative;
        border: none;
        height: 1.5rem;
        width: 3rem;
        border-radius: 1.5rem;
        color: #6b7381;
        background: #bdc1c8;
    }

        .btn-toggle:focus,
        .btn-toggle.focus,
        .btn-toggle:focus.active,
        .btn-toggle.focus.active {
            outline: none;
        }

        .btn-toggle:before,
        .btn-toggle:after {
            line-height: 1.5rem;
            width: 4rem;
            text-align: center;
            font-weight: 600;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: absolute;
            bottom: 0;
            transition: opacity 0.25s;
        }

        .btn-toggle:before {
            content: 'Pending';
            left: -4rem;
        }

        .btn-toggle:after {
            content: 'Delivered';
            right: -4rem;
            opacity: 0.5;
        }

        .btn-toggle > .handle {
            position: absolute;
            top: 0.1875rem;
            left: 0.1875rem;
            width: 1.125rem;
            height: 1.125rem;
            border-radius: 1.125rem;
            background: #fff;
            transition: left 0.25s;
        }

        .btn-toggle.active {
            transition: background-color 0.25s;
        }

            .btn-toggle.active > .handle {
                left: 1.6875rem;
                transition: left 0.25s;
            }

            .btn-toggle.active:before {
                opacity: 0.5;
            }

            .btn-toggle.active:after {
                opacity: 1;
            }

        .btn-toggle.btn-sm:before,
        .btn-toggle.btn-sm:after {
            line-height: -0.5rem;
            color: #fff;
            letter-spacing: 0.75px;
            left: 0.4125rem;
            width: 2.325rem;
        }

        .btn-toggle.btn-sm:before {
            text-align: right;
        }

        .btn-toggle.btn-sm:after {
            text-align: left;
            opacity: 0;
        }

        .btn-toggle.btn-sm.active:before {
            opacity: 0;
        }

        .btn-toggle.btn-sm.active:after {
            opacity: 1;
        }

        .btn-toggle.btn-xs:before,
        .btn-toggle.btn-xs:after {
            display: none;
        }

        .btn-toggle:before,
        .btn-toggle:after {
            color: #6b7381;
        }

        .btn-toggle.active {
            background-color: #29b5a8;
        }

        .btn-toggle.btn-lg {
            margin: 0 5rem;
            padding: 0;
            position: relative;
            border: none;
            height: 2.5rem;
            width: 5rem;
            border-radius: 2.5rem;
        }

            .btn-toggle.btn-lg:focus,
            .btn-toggle.btn-lg.focus,
            .btn-toggle.btn-lg:focus.active,
            .btn-toggle.btn-lg.focus.active {
                outline: none;
            }

            .btn-toggle.btn-lg:before,
            .btn-toggle.btn-lg:after {
                line-height: 2.5rem;
                width: 5rem;
                text-align: center;
                font-weight: 600;
                font-size: 1rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                position: absolute;
                bottom: 0;
                transition: opacity 0.25s;
            }

            .btn-toggle.btn-lg:before {
                content: 'Pending';
                left: -5rem;
            }

            .btn-toggle.btn-lg:after {
                content: 'Delivered';
                right: -5rem;
                opacity: 0.5;
            }

            .btn-toggle.btn-lg > .handle {
                position: absolute;
                top: 0.3125rem;
                left: 0.3125rem;
                width: 1.875rem;
                height: 1.875rem;
                border-radius: 1.875rem;
                background: #fff;
                transition: left 0.25s;
            }

            .btn-toggle.btn-lg.active {
                transition: background-color 0.25s;
            }

                .btn-toggle.btn-lg.active > .handle {
                    left: 2.8125rem;
                    transition: left 0.25s;
                }

                .btn-toggle.btn-lg.active:before {
                    opacity: 0.5;
                }

                .btn-toggle.btn-lg.active:after {
                    opacity: 1;
                }

            .btn-toggle.btn-lg.btn-sm:before,
            .btn-toggle.btn-lg.btn-sm:after {
                line-height: 0.5rem;
                color: #fff;
                letter-spacing: 0.75px;
                left: 0.6875rem;
                width: 3.875rem;
            }

            .btn-toggle.btn-lg.btn-sm:before {
                text-align: right;
            }

            .btn-toggle.btn-lg.btn-sm:after {
                text-align: left;
                opacity: 0;
            }

            .btn-toggle.btn-lg.btn-sm.active:before {
                opacity: 0;
            }

            .btn-toggle.btn-lg.btn-sm.active:after {
                opacity: 1;
            }

            .btn-toggle.btn-lg.btn-xs:before,
            .btn-toggle.btn-lg.btn-xs:after {
                display: none;
            }

        .btn-toggle.btn-sm {
            margin: 0 0.5rem;
            padding: 0;
            position: relative;
            border: none;
            height: 1.5rem;
            width: 6rem;
            border-radius: 1.5rem;
        }

            .btn-toggle.btn-sm:focus,
            .btn-toggle.btn-sm.focus,
            .btn-toggle.btn-sm:focus.active,
            .btn-toggle.btn-sm.focus.active {
                outline: none;
            }

            .btn-toggle.btn-sm:before,
            .btn-toggle.btn-sm:after {
                line-height: 1.5rem;
                width: 0.5rem;
                text-align: center;
                font-weight: 600;
                font-size: 0.55rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                position: absolute;
                bottom: 0;
                transition: opacity 0.25s;
            }

            .btn-toggle.btn-sm:before {
                content: 'Pending';
                left: -0.5rem;
            }

            .btn-toggle.btn-sm:after {
                content: 'Delivered';
                right: -0.5rem;
                opacity: 0.5;
            }

            .btn-toggle.btn-sm > .handle {
                position: absolute;
                top: 0.1875rem;
                left: 0.1875rem;
                width: 1.125rem;
                height: 1.125rem;
                border-radius: 1.125rem;
                background: #fff;
                transition: left 0.25s;
            }

            .btn-toggle.btn-sm.active {
                transition: background-color 0.25s;
            }

                .btn-toggle.btn-sm.active > .handle {
                    left: 4.5875rem;
                    transition: left 0.25s;
                }

                .btn-toggle.btn-sm.active:before {
                    opacity: 0.5;
                }

                .btn-toggle.btn-sm.active:after {
                    opacity: 1;
                }

            .btn-toggle.btn-sm.btn-sm:before {
                line-height: -0.5rem;
                color: #fff;
                letter-spacing: 0.75px;
                left: 2.4125rem;
                width: 2.325rem;
            }

            .btn-toggle.btn-sm.btn-sm:after {
                line-height: -0.5rem;
                color: #fff;
                letter-spacing: 0.75px;
                left: 0.4125rem;
                width: 2.325rem;
            }

            .btn-toggle.btn-sm.btn-sm:before {
                text-align: right;
            }

            .btn-toggle.btn-sm.btn-sm:after {
                text-align: left;
                opacity: 0;
            }

            .btn-toggle.btn-sm.btn-sm.active:before {
                opacity: 0;
            }

            .btn-toggle.btn-sm.btn-sm.active:after {
                opacity: 1;
            }

            .btn-toggle.btn-sm.btn-xs:before,
            .btn-toggle.btn-sm.btn-xs:after {
                display: none;
            }

        .btn-toggle.btn-xs {
            margin: 0 0;
            padding: 0;
            position: relative;
            border: none;
            height: 1rem;
            width: 2rem;
            border-radius: 1rem;
        }

            .btn-toggle.btn-xs:focus,
            .btn-toggle.btn-xs.focus,
            .btn-toggle.btn-xs:focus.active,
            .btn-toggle.btn-xs.focus.active {
                outline: none;
            }

            .btn-toggle.btn-xs:before,
            .btn-toggle.btn-xs:after {
                line-height: 1rem;
                width: 0;
                text-align: center;
                font-weight: 600;
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 2px;
                position: absolute;
                bottom: 0;
                transition: opacity 0.25s;
            }

            .btn-toggle.btn-xs:before {
                content: 'Pending';
                left: 0;
            }

            .btn-toggle.btn-xs:after {
                content: 'Delivered';
                right: 0;
                opacity: 0.5;
            }

            .btn-toggle.btn-xs > .handle {
                position: absolute;
                top: 0.125rem;
                left: 0.125rem;
                width: 0.75rem;
                height: 0.75rem;
                border-radius: 0.75rem;
                background: #fff;
                transition: left 0.25s;
            }

            .btn-toggle.btn-xs.active {
                transition: background-color 0.25s;
            }

                .btn-toggle.btn-xs.active > .handle {
                    left: 1.125rem;
                    transition: left 0.25s;
                }

                .btn-toggle.btn-xs.active:before {
                    opacity: 0.5;
                }

                .btn-toggle.btn-xs.active:after {
                    opacity: 1;
                }

            .btn-toggle.btn-xs.btn-sm:before,
            .btn-toggle.btn-xs.btn-sm:after {
                line-height: -1rem;
                color: #fff;
                letter-spacing: 0.75px;
                left: 0.275rem;
                width: 1.55rem;
            }

            .btn-toggle.btn-xs.btn-sm:before {
                text-align: right;
            }

            .btn-toggle.btn-xs.btn-sm:after {
                text-align: left;
                opacity: 0;
            }

            .btn-toggle.btn-xs.btn-sm.active:before {
                opacity: 0;
            }

            .btn-toggle.btn-xs.btn-sm.active:after {
                opacity: 1;
            }

            .btn-toggle.btn-xs.btn-xs:before,
            .btn-toggle.btn-xs.btn-xs:after {
                display: none;
            }

        .btn-toggle.btn-secondary {
            color: #6b7381;
            background: #bdc1c8;
        }

            .btn-toggle.btn-secondary:before,
            .btn-toggle.btn-secondary:after {
                color: #6b7381;
            }

            .btn-toggle.btn-secondary.active {
                background-color: #ff8300;
            }

    .recivedamt {
        padding: 5px;
        background: #1acc8d;
        color: white;
        border-radius: 5px;
        padding-left: 13px;
        padding-right: 12px;
        padding-top: 10px;
    }

    .totalamountbox {
        text-align: left;
        box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
        /*border: 1px solid #4a75cc;*/
        border-radius: 6px;
    }

    select:focus {
        outline: none !important;
    }

    select {
        border-radius: 5px;
    }

    .recivedamt:hover {
        background: #bfbfbf;
        color: black;
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
      /*  white-space: nowrap;*/
        padding-left: 10px;
        padding-right: 10px;
    }

   /* table.dataTable thead tr th {
        word-wrap: break-word;
        word-break: break-all;
    }*/

    .notification_count {
        position: absolute;
        top: 6px;
        right: 15px;
        font-size: 10px;
        background: red;
        width: 15px;
        height: 15px;
        border-radius: 100%;
        text-align: center;
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

    #COllection {
        color: #384862;
    }

    #SALes {
        color: #808182;
    }

    .searchbox_box {
        margin-top: -65px;
        position: fixed;
        width: 100%;
        z-index: 9999;
    }

    .serdiv {
        padding: 5px;
        border-radius: 5px;
    }

    .searchinput {
        border: none;
        outline: none;
    }

    input[type="radio"] {
        -webkit-appearance: checkbox; /* Chrome, Safari, Opera */
        -moz-appearance: checkbox; /* Firefox */
        -ms-appearance: checkbox; /* not currently supported */
    }
    .tooltips{
        display:none;
    }
</style>
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
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 30px;">
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Sector-14 Gurgaon</p>
                </a>
                <a id="Notif_seenBtn" href="../Components/Notifications.aspx" style="color: white; position: fixed; right: 0; top: 10px;">
                    <span class="" id="Notificationpic" runat="server" style="padding-right: 10px;">&nbsp;&nbsp; 
                       <svg version="1.1" id="Notification" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                           viewBox="0 0 512 512" style="enable-background: new 0 0 512 512; width: 15px; height: 15px; fill: #fff;" xml:space="preserve">
                           <g>
                               <g>
                                   <path d="M467.812,431.851l-36.629-61.056c-16.917-28.181-25.856-60.459-25.856-93.312V224c0-67.52-45.056-124.629-106.667-143.04
			            V42.667C298.66,19.136,279.524,0,255.993,0s-42.667,19.136-42.667,42.667V80.96C151.716,99.371,106.66,156.48,106.66,224v53.483
			            c0,32.853-8.939,65.109-25.835,93.291l-36.629,61.056c-1.984,3.307-2.027,7.403-0.128,10.752c1.899,3.349,5.419,5.419,9.259,5.419
			            H458.66c3.84,0,7.381-2.069,9.28-5.397C469.839,439.275,469.775,435.136,467.812,431.851z" />
                               </g>
                           </g><g><g><path d="M188.815,469.333C200.847,494.464,226.319,512,255.993,512s55.147-17.536,67.179-42.667H188.815z" /></g>
                           </g><g></g><g></g><g></g>
                           <g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg></span>
                    <div class="notification_count" id="Notif_count" runat="server">99</div>
                </a>
            </nav>
            <div class="searchbox_box">
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

            <div class="container" style="margin-top: 120px;">
            </div>
            <div id="shedulersection" class="container" runat="server" style="margin-top: 15px; margin-bottom: 20px;">
                <div class="row">
                    <div id="TotalOrders" runat="server" class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div nametxt="Orders" class="card-body TotalOrders">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Orders</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="total_orders"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-calendar fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="RunningOrders" runat="server" nametxt="Delivered Orders" class="col-xl-3 col-md-6 mb-4 RunningOrders">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Delivered Orders
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="delivered"></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-shopping-basket fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="DeliveredOrder" runat="server" nametxt="Pending Deliveries" class="col-xl-3 col-md-6 mb-4 DeliveredOrder">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold   text-uppercase mb-1" style="color: #45bed0!important;">
                                            Pending Deliveries
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="pending_deliveries"></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-shopping-cart  fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="salesCollection" runat="server" nametxt="Collection vs Sales" class="col-xl-3 col-md-6 mb-4 salesCollection">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Collection vs Sales 

                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                            <span id="COllection"></span>/ <span id="SALes"></span>
                                        </div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-exclamation-triangle fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="addwallet" runat="server" class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-primary shadow h-100 py-2">
                            <div nametxt="Add Money Into Wallet" class="card-body addwallet">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Add Money Into Wallet</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">

                                        <img width="30" style="fill: gray!important;" src="img/wallet-filled-money-tool.svg" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div  id="Add_Sales" runat="server"  class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div nametxt="Add Sales" class="card-body" id="addsalesbtn" runat="server">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Add Sales
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-plus-circle fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                    <div  id="Reports" runat="server" onclick="location.href='Reports.aspx'"  class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Reports
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-file fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="Receive_Payments" runat="server" class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div nametxt="Receive Payments" class="card-body ReceivePaymentsbtn">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Receive Payments
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-rupee fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Customer_Ledger" runat="server" class="col-xl-3 col-md-6 mb-4 ">
                        <div nametxt="Customer Ledger" class="card border-left-warning shadow h-100 py-2 customer_ledger">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Customer Ledger
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-file fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Account_Receivable" runat="server" class="col-xl-3 col-md-6 mb-4 " onclick="location.href='../Components/Account_receivable.aspx'">
                        <div class="card border-left-primary shadow h-100 py-2  Account_Receivable">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Account Receivable
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-renren fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Stock_Inventory" runat="server" class="col-xl-3 col-md-6 mb-4 " onclick="location.href='../Admin/Inventory_Report.aspx'">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Stock & Inventory
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-th-large fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Trigger_Notification" runat="server" nametxt="Collection vs Sales" class="col-xl-3 col-md-6 mb-4 TriggerNotification">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Trigger Notification
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        </div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-bell fa-2x text-gray-300" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="SearchCustomer" runat="server" onclick="location.href='../Components/PendingDelivery.aspx'"  class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Search For Customer
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-file fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div id="AddCatalouge" runat="server" onclick="location.href='../Admin/admin_items.aspx'"  class="col-xl-3 col-md-6 mb-4 ">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                            Menu Catalogue
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fa fa-shopping-basket fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mb-5 d-none" id="myDiv1">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="row PersonalDetails">
                            </div>
                            <div class="trxhistory">
                                <label class="titleapnd">
                                    Report</label>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTableTotalOrders" width="100%" cellspacing="0">
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mb-5 d-none" id="myDiv2">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="row PersonalDetails">
                            </div>
                            <div class="trxhistory">
                                <label class="titleapnd">
                                    Report</label>
                            </div>
                            <div class="table-responsive">

                                <table class="table table-bordered" id="dataTableDeliveryOrders" width="100%" cellspacing="0">
                                </table>

                            </div>


                        </div>

                    </div>

                </div>
            </div>
            <div class="container-fluid mb-5 d-none" id="myDiv3">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="row PersonalDetails">
                            </div>
                            <div class="trxhistory">
                                <label class="titleapnd">
                                    Report</label>
                            </div>
                            <div class="table-responsive">

                                <table class="table table-bordered" id="dataTablePendingOrders" width="100%" cellspacing="0">
                                </table>
                            </div>


                        </div>

                    </div>

                </div>
            </div>
            <div class="container-fluid mb-5 d-none" id="myDiv4">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="row PersonalDetails">
                            </div>
                            <div class="trxhistory">
                                <label class="titleapnd">
                                    Report</label>
                            </div>
                            <div class="table-responsive">

                                <table class="table table-bordered" id="dataTableSalesCollection" width="100%" cellspacing="0">
                                </table>

                            </div>


                        </div>

                    </div>

                </div>
            </div>
            <div class="container-fluid mb-5 d-none" id="myDiv5">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="row PersonalDetails">
                            </div>
                            <div class="trxhistory">
                                <label class="titleapnd">
                                    Report</label>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTableLedger" width="100%" cellspacing="0">
                                </table>
                            </div>


                        </div>

                    </div>

                </div>
            </div>
        </div>
    </form>


    <footer>
        <div class="footer" style="color: white; position: fixed; width: 100%; bottom: 0; padding-top: 5px; padding-left: 10px;"></div>
    </footer>




    <div class="modal fade" id="addwalletpopup" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background: #394963;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelss" style="color: lightgrey;">Add Money to Wallet</h5>
                    <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="walletbox" style="background: #ffffff29; padding: 5px; border-radius: 5px;">
                        <div class="container">

                            <div class="row p-0">
                                <div class="col-1 p-0">
                                    <div style="padding-top: 6px;">
                                        <span style="color: lightgrey;">+91</span>
                                    </div>
                                </div>
                                <div class="col-8 p-0">
                                    <div class="inputbox">
                                        <input id="mobile_num" type="number" class="form-control labelclor" placeholder="Number" style="width: 100%; color: lightgrey; border: none; background: #fff0;" />
                                    </div>

                                </div>
                                <div class="col-3 p-0">
                                    <div class="button" style="color: lightgrey;">
                                        <button id="btnRechargeFindNumber" class="btn w-100" type="button" style="background: #394963; color: lightgrey;">
                                            <i class="fa fa-arrow-right"></i>
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div id="rechargeContainer"></div>

                </div>

            </div>
        </div>
    </div>


    <div class="modal fade" id="addsalespopup" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background: #394963;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelsss" style="color: lightgrey;">Add Sales</h5>
                    <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="walletbox" style="background: #ffffff29; padding: 5px; border-radius: 5px;">
                        <div class="container">

                            <div class="row p-0">
                                <div class="col-1 p-0">
                                    <div style="padding-top: 6px;">
                                        <span style="color: lightgrey;">+91</span>
                                    </div>
                                </div>
                                <div class="col-8 p-0">
                                    <div class="inputbox">
                                        <input id="mobile_num2" type="number" class="form-control labelclor" placeholder="Number" style="width: 100%; color: lightgrey; border: none; background: #fff0;" />
                                    </div>

                                </div>
                                <div class="col-3 p-0">
                                    <div class="button" style="color: lightgrey;">
                                        <button id="btnAddSalesFindNumber" class="btn w-100" type="button" style="background: #394963; color: lightgrey;">
                                            <i class="fa fa-arrow-right"></i>
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div id="customer_section">
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="ReceivePayments" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background: #394963;">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelssss" style="color: lightgrey;">Receive Payments</h5>
                    <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="walletbox" style="background: #ffffff29; padding: 5px; border-radius: 5px;">
                        <div class="container">

                            <div class="row p-0">
                                <div class="col-1 p-0">
                                    <div style="padding-top: 6px;">
                                        <span style="color: lightgrey;">+91</span>
                                    </div>
                                </div>
                                <div class="col-8 p-0">
                                    <div class="inputbox">
                                        <input id="mobile_num3" type="number" class="form-control labelclor" placeholder="Number" style="width: 100%; color: lightgrey; border: none; background: #fff0;" />
                                    </div>

                                </div>
                                <div class="col-3 p-0">
                                    <div class="button" id="btnReceiveData" style="color: lightgrey;">
                                        <button class="btn w-100" type="button" style="background: #394963; color: lightgrey;">
                                            <i class="fa fa-arrow-right"></i>
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div id="getReceiveData"></div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="customer_ledger_popup" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background: #394963;">
                <div class="modal-header">
                    <h5 class="modal-title" style="color: lightgrey;">Get Customer Ledger</h5>
                    <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="walletbox" style="background: #ffffff29; padding: 5px; border-radius: 5px;">
                        <div class="container">

                            <div class="row p-0">
                                <div class="col-1 p-0">
                                    <div style="padding-top: 6px;">
                                        <span style="color: lightgrey;">+91</span>
                                    </div>
                                </div>
                                <div class="col-8 p-0">
                                    <div class="inputbox">
                                        <input id="mobile_num_led" type="number" class="form-control labelclor" placeholder="Number" style="width: 100%; color: lightgrey; border: none; background: #fff0;" />
                                    </div>

                                </div>
                                <div class="col-3 p-0">
                                    <div class="button" style="color: lightgrey;">
                                        <button id="btnFindNumber_led" class="btn w-100" type="button" style="background: #394963; color: lightgrey;">
                                            <i class="fa fa-arrow-right"></i>
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="GeneralPopup" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="background: #394963;">
                <div class="modal-header">
                    <h6 class="modal-title" style="color: lightgrey;">Send Notification to customer(s)</h6>
                    <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="walletbox" style="padding: 5px; border-radius: 5px;">
                        <div class="container">
                            <div class="row p-0">
                                <div class="col-sm-12 col-12 p-0">
                                    <div class="inputbox">
                                        <label style="color: lightgrey;">
                                            <input type="radio" name="radio" flag="N" checked /><span> Send to One</span>
                                        </label>
                                        &nbsp;&nbsp;&nbsp;
                                        <label style="color: lightgrey;">
                                            <input type="radio" flag="Y" name="radio" />
                                            <span>Send to All</span></label>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-12 p-0 mt-2">
                                    <div class="inputbox">
                                        <input type="number" title="Click to add title" class="form-control labelclor" id="Mobile_no" style="width: 100%; border: 1px solid white;" placeholder="Mobile Number" />
                                    </div>
                                </div>
                                <div class="col-sm-12 col-12 p-0 mt-2">
                                    <div class="inputbox">
                                        <input type="text" title="Click to add title" class="form-control labelclor" id="title" style="width: 100%; border: 1px solid white;" placeholder="Title" />
                                    </div>
                                </div>
                                <div class="col-sm-12 col-12 p-0 mt-2">
                                    <div class="inputbox">
                                        <textarea class="form-control labelclor" rows="5" id="Comment" style="width: 100%; border: 1px solid white; background: " placeholder="Description"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btnstyle" id="send_notification">
                        Send Notification</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ShowItemsModal" style="z-index: 99999;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h6 class="modal-title">Show Items Details</h6>
                    <button class="close" type="button"  data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                     <div id="appenditems">

                     </div>
                </div>
                 
            </div>
        </div>
    </div>


    <input type="hidden" id="LedgerMob" />
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <input type="hidden" id="RID" runat="server" value="" />
    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
    <script>
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
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
        $(function () {
            //var start = moment().subtract(29, "days");
            var start = moment();
            var end = moment();
            cb(start, end);
            $("#reportrange").daterangepicker(
                {
                    startDate: start,
                    endDate: end,
                    ranges: {
                        "Next 7 Days": [moment().add(7, "days"), moment()],
                        "Tomorrow": [moment(), moment().add(1, "days")],
                        Today: [moment(), moment()],
                        Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
                        "Last 7 Days": [moment().subtract(6, "days"), moment()],
                        "Last 30 Days": [moment().subtract(29, "days"), moment()],
                        "This Month": [moment().startOf("month"), moment().endOf("month")],
                        "Last Month": [
                            moment().subtract(1, "month").startOf("month"),
                            moment().subtract(1, "month").endOf("month")
                        ]
                    }

                },
            );
            $('.ranges ul li').click(function (e) {
                if ($(this).text() == 'Today') {
                    cb(moment(), moment());
                }
                else if ($(this).text() == 'Next 7 Days') {
                    cb(moment(), moment().add(7, "days"), moment());
                }
                else if ($(this).text() == 'Tomorrow') {
                    cb(moment().add(1, "days"), moment().add(1, "days"));
                }
                else if ($(this).text() == 'Yesterday') {
                    cb(moment().subtract(1, "days"), moment().subtract(1, "days"));
                }
                else if ($(this).text() == 'Last 7 Days') {
                    cb(moment().subtract(6, "days"), moment());
                }
                else if ($(this).text() == 'Last 30 Days') {
                    cb(moment().subtract(29, "days"), moment());
                }
                else if ($(this).text() == 'This Month') {
                    cb(moment().startOf("month"), moment().endOf("month"));
                }
                else if ($(this).text() == 'Last Month') {
                    cb(moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month"));
                }

                if (!$('#myDiv1').hasClass('d-none')) {
                    getAllTotalOrders('Orders');
                }
                if (!$('#myDiv2').hasClass('d-none')) {
                    allRunningOrdes('Delivered Orders');
                }
                if (!$('#myDiv3').hasClass('d-none')) {
                    getAllDeliveredOrders('Pending Deliveries');
                }
                if (!$('#myDiv4').hasClass('d-none')) {
                    getAllSalesCollection('Collection vs Sales');
                }
                if (!$('#myDiv5').hasClass('d-none')) {
                    var Date = $('#reportrange span').text();
                    var Mob = $('#LedgerMob').val();
                    getLedgerCustomer(Date, Mob, 'Customer Ledger');
                }
            })

            $('.applyBtn').click(function (e) {
                cb(moment($("input[name='daterangepicker_start']").val()), moment($("input[name='daterangepicker_end']").val()));
                if (!$('#myDiv1').hasClass('d-none')) {
                    getAllTotalOrders('Orders');
                }
                if (!$('#myDiv2').hasClass('d-none')) {
                    allRunningOrdes('Delivered Orders');
                }
                if (!$('#myDiv3').hasClass('d-none')) {
                    getAllDeliveredOrders('Pending Deliveries');
                }
                if (!$('#myDiv4').hasClass('d-none')) {
                    getAllSalesCollection('Collection vs Sales');
                }
                if (!$('#myDiv5').hasClass('d-none')) {
                    var Date = $('#reportrange span').text();
                    var Mob = $('#LedgerMob').val();
                    getLedgerCustomer(Date, Mob, 'Customer Ledger');
                }

            })
            cb(start, end);
        });
        function cb(start, end) {
            $("#reportrange span").html(start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY"));
            getData(start.format("MMMM D, YYYY"), end.format("MMMM D, YYYY"));
        }
        $(".addwallet").click(function () {
            var title_name = $(this).attr("nametxt");

            $("#rechargeContainer").empty();
            window.location.hash = "modal";
            $("#addwalletpopup").modal();
            $('#mobile_num').focus();
            $('#btnRechargeFindNumber').click(function (e) {
                e.stopImmediatePropagation();
                var Mobile = $.trim($('#mobile_num').val());
                if (Mobile.length != 10) {
                    showpopup('Please enter 10 digits');
                }
                else {
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "admin_dashboard.aspx/getAddMoneyToWallet",
                        data: '{Mobile:"' + Mobile + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.d != "") {
                                $("#rechargeContainer").empty();
                                $("#rechargeContainer").append(data.d);
                                $('.add_money').click(function (f) {
                                    f.stopImmediatePropagation();
                                    var Amount = $.trim($('#Amount4').val());
                                    var Flag = $(this).attr('flag');
                                    var CID = $(this).attr('cid');
                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "admin_dashboard.aspx/fnReceivePayment",
                                        data: '{Mobile:"' + Mobile + '",Amount:"' + Amount + '",Flag:"' + Flag + '",CID:"' + CID + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (data) {
                                            $("#titleapnd").empty();
                                            $("#titleapnd").append(title_name);
                                            showpopup('Wallet Recharged successfully');
                                            $("#rechargeContainer").empty();
                                            $('#mobile_num').val('');
                                            $("#addwalletpopup").modal('hide');
                                        }
                                    })
                                })

                            }
                            else {
                                showpopup('Could not find this mobile number');
                            }
                        }
                    })
                }
            })

        });
        //$(".addsalesbtn").click(function () {
        //    window.location.href = '../Components/Purchase.aspx';
             
        //});
        $(".ReceivePaymentsbtn").click(function () {
            $("#getReceiveData").empty();
            window.location.hash = "modal";
            $("#ReceivePayments").modal();
            $('#mobile_num3').focus();
            var title_name = $(this).attr("nametxt");

            $('#btnReceiveData').click(function (e) {
                e.stopImmediatePropagation();
                var Mobile = $.trim($('#mobile_num3').val());
                if (Mobile.length != 10) {
                    showpopup('Please enter 10 digits');
                }
                else {
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "admin_dashboard.aspx/getReceivePaymentModal",
                        data: '{Mobile:"' + Mobile + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            if (data.d != "") {
                                $("#getReceiveData").empty();
                                $("#getReceiveData").append(data.d);
                                $("#titleapnd").empty();
                                $("#titleapnd").append(title_name);

                                $('.receive_payment').click(function (f) {
                                    f.stopImmediatePropagation();
                                    var Amount = $.trim($('#Amount3').val());
                                    var Flag = $(this).attr('flag');
                                    var CID = $(this).attr('cid');
                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "admin_dashboard.aspx/fnReceivePayment",
                                        data: '{Mobile:"' + Mobile + '",Amount:"' + Amount + '",Flag:"' + Flag + '",CID:"' + CID + '"}',
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function (data) {
                                            if (Flag == 'Y') {
                                                showpopup('Wallet Recharged successfully');
                                            }
                                            else {
                                                showpopup('Payment Received successfully');
                                            }
                                            $("#getReceiveData").empty();
                                            $('#mobile_num3').val('');
                                            $("#ReceivePayments").modal('hide');
                                        }
                                    })
                                })

                            }
                            else {
                                showpopup('Could not find this mobile number');
                            }
                        }
                    })
                }
            })

        });
        $("#Charge").click(function () {
            $(".otpbox").slideToggle("slow");
        })
        function getData(start, end) {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getOverAllData",
                data: '{start:"' + start + '",end:"' + end + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var current = data.d;
                        current = current.split('|');
                        $('#total_orders').html(current[0]);
                        $('#delivered').html(current[1]);
                        $('#pending_deliveries').html(current[2]);
                        $('#COllection').html(current[3]);
                        $('#SALes').html(current[4]);


                    }
                }
            });
        }
        $('.TotalOrders').click(function (e) {
            e.stopImmediatePropagation();
            var title_name = $(this).attr("nametxt");
            getAllTotalOrders(title_name);

        })
        function getAllTotalOrders(title_name) {
            $('#dataTableTotalOrders').empty();

            $('#myDiv1').removeClass('d-none');
            $('#myDiv2').addClass('d-none');
            $('#myDiv3').addClass('d-none');
            $('#myDiv4').addClass('d-none');
            $('#myDiv5').addClass('d-none');

            $('.PersonalDetails').empty();
            var Date = $('#reportrange span').text();
            Date = Date.split('-');
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getTotalOrders",
                data: '{start:"' + $.trim(Date[0]) + '",end:"' + $.trim(Date[1]) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $(".titleapnd").empty();
                    $(".titleapnd").append(title_name);
                    $('#dataTableTotalOrders').append(data.d);
                    $('#dataTableTotalOrders').dataTable({
                        stateSave: true,
                        "bDestroy": true
                    });
                     
                    $('html, body').animate({
                        scrollTop: $("#myDiv1").offset().top - 100
                    }, 2000);
                }
            });
        }

        function ItemListIcon(current) {
            const button = current;
            const tooltip = current;
            Popper.createPopper(button, tooltip, {
                placement: 'right',
            });
        }

        $('.RunningOrders').click(function (e) {
            e.stopImmediatePropagation();
            var title_name = $(this).attr("nametxt");

            allRunningOrdes(title_name);
        })

       

        function allRunningOrdes(title_name) {
            var Date = $('#reportrange span').text();
            Date = Date.split('-');
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getDeliveredOrders",
                data: '{start:"' + $.trim(Date[0]) + '",end:"' + $.trim(Date[1]) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $(".titleapnd").empty();
                    $(".titleapnd").append(title_name);

                    $('#dataTableDeliveryOrders').empty();


                    $('#myDiv1').addClass('d-none');
                    $('#myDiv2').removeClass('d-none');
                    $('#myDiv3').addClass('d-none');
                    $('#myDiv4').addClass('d-none');
                    $('#myDiv5').addClass('d-none');

                    $('.PersonalDetails').empty();
                    $('#dataTableDeliveryOrders').append(data.d);
                    $('#dataTableDeliveryOrders').dataTable({
                        stateSave: true,
                        "bDestroy": true
                    });
                    $('html, body').animate({
                        scrollTop: $("#myDiv2").offset().top - 100
                    }, 2000);
                }
            });
        }
        $('.DeliveredOrder').click(function (e) {
            e.stopImmediatePropagation();
            var title_name = $(this).attr("nametxt");
            getAllDeliveredOrders(title_name);

        })
        function getAllDeliveredOrders(title_name) {
            var Date = $('#reportrange span').text();
            Date = Date.split('-');
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getPendingOrders",
                data: '{start:"' + $.trim(Date[0]) + '",end:"' + $.trim(Date[1]) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $(".titleapnd").empty();
                    $(".titleapnd").append(title_name);

                    $('#dataTablePendingOrders').empty();


                    $('#myDiv1').addClass('d-none');
                    $('#myDiv2').addClass('d-none');
                    $('#myDiv3').removeClass('d-none');
                    $('#myDiv4').addClass('d-none');
                    $('#myDiv5').addClass('d-none');

                    $('.PersonalDetails').empty();
                    $('#dataTablePendingOrders').append(data.d);
                    $('#dataTablePendingOrders').dataTable({
                        stateSave: true,
                        "bDestroy": true
                    });
                    $('html, body').animate({
                        scrollTop: $("#myDiv3").offset().top - 100
                    }, 2000);
                }
            });
        }
        $('.salesCollection').click(function (e) {
            e.stopImmediatePropagation();
            var title_name = $(this).attr("nametxt");
            getAllSalesCollection(title_name);
        })
        function getAllSalesCollection(title_name) {
            $(".titleapnd").empty();
            $(".titleapnd").append(title_name);
            var Date = $('#reportrange span').text();
            Date = Date.split('-');
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getSalesAndCollection",
                data: '{start:"' + $.trim(Date[0]) + '",end:"' + $.trim(Date[1]) + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    $('#dataTableSalesCollection').empty();


                    $('#myDiv1').addClass('d-none');
                    $('#myDiv2').addClass('d-none');
                    $('#myDiv3').addClass('d-none');
                    $('#myDiv4').removeClass('d-none');
                    $('#myDiv5').addClass('d-none');

                    $('.PersonalDetails').empty();
                    $('#dataTableSalesCollection').append(data.d);
                    $('#dataTableSalesCollection').dataTable({
                        stateSave: true,
                        "bDestroy": true
                    });
                    $('html, body').animate({
                        scrollTop: $("#myDiv4").offset().top - 100
                    }, 2000);
                }
            });
        }
        $('.customer_ledger').click(function (e) {
            e.stopImmediatePropagation();
            var title_name = $(this).attr("nametxt");
            $(".titleapnd").empty();
            $(".titleapnd").empty(title_name);
            window.location.hash = "modal";
            $('#customer_ledger_popup').modal();
            $('#btnFindNumber_led').click(function (e) {
                e.stopImmediatePropagation();
                var Date = $('#reportrange span').text();
                var Mob = $.trim($('#mobile_num_led').val());
                getLedgerCustomer(Date, Mob, title_name);
            })
        })
        function getLedgerCustomer(Date, Mob, title_name) {
            Date = Date.split('-');
            $('#LedgerMob').val(Mob);
            $.ajax({
                type: "POST",
                async: true,
                url: "admin_dashboard.aspx/getCustomerLedger",
                data: '{start:"' + $.trim(Date[0]) + '",end:"' + $.trim(Date[1]) + '",Mob:"' + Mob + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $(".titleapnd").empty();
                    $(".titleapnd").append(title_name);
                    $('#customer_ledger_popup').modal('hide');
                    $('#mobile_num_led').val('');

                    $('#dataTableLedger').empty();

                    $('#myDiv1').addClass('d-none');
                    $('#myDiv2').addClass('d-none');
                    $('#myDiv3').addClass('d-none');
                    $('#myDiv4').addClass('d-none');
                    $('#myDiv5').removeClass('d-none');

                    $('.PersonalDetails').empty();
                    var getData = data.d;
                    getData = getData.split('|');
                    $('#dataTableLedger').append(getData[0]);

                    $('.PersonalDetails').append(getData[1]);
                    $('#dataTableLedger').dataTable({
                        stateSave: true,
                        "bDestroy": true
                    });
                    $('html, body').animate({
                        scrollTop: $("#myDiv5").offset().top - 100
                    }, 2000);
                }
            });
        }
        $("#Notif_seenBtn").click(function (e) {
            e.stopImmediatePropagation();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "admin_dashboard.aspx/Fn_updateSeenFlag",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    location.href = "../Components/Notifications.aspx";
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        })
        $(document).ready(function () {
            getmenuname();
        })
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

        $('.TriggerNotification').click(function (e) {
            e.stopImmediatePropagation();
            window.location.hash = "modal";
            $('#GeneralPopup').modal();
            $('input[name=radio]').change(function (g) {
                g.stopImmediatePropagation();
                g.preventDefault();
                if ($(this).attr('flag') == 'N') {
                    $('#Mobile_no').show();
                } else {
                    $('#Mobile_no').hide();
                }
            })
            $('#send_notification').click(function (g) {
                g.stopImmediatePropagation();
                var Title = escapeHtml($.trim($('#title').val()));
                var Comment = escapeHtml($.trim($('#Comment').val()));
                var Mobile = $.trim($('#Mobile_no').val());
                var Flag = $('input[name=radio]:checked').attr('flag');

                if (Title.length == 0) {
                    showpopup('Please enter title');
                    $('#title').focus();
                }
                else if (Comment.length == 0) {
                    showpopup("Please enter description");
                    $('#Comment').focus();
                }
                else if (Flag == "N" && Mobile.length != 10) {
                    showpopup("Please enter valid mobile number");
                    $('#Mobile_no').focus();
                }
                else {
                    showpopup('Notified to customer successfully');
                    $('#GeneralPopup').modal('hide');
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "admin_dashboard.aspx/SendNotificationToCustomer",
                        data: '{Title:"' + Title + '",Comment:"' + Comment + '",Mobile:"' + Mobile + '",Flag:"' + Flag + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                        }
                    })
                }
            })
        })
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


        function fnseeitemsdetails(current) {
            var items = current.parent().find('.tooltips').html();
            $("#appenditems").empty();
            $("#appenditems").append(items);
            $("#ShowItemsModal").modal();
        }

    </script>
</body>
</html>
