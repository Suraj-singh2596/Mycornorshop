<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delivered_Orders.aspx.cs" Inherits="Components_Delivered_Orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery</title>
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
    <script src="https://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>
<style>
    .chatnowbtn {
            background: #384862;
            color: white;
            border: none;
            padding: 3px;
            border-radius: 5px;
            margin-top:10px;
        }
    .trackorderbtn {
        background: #384862;
        color: white !important;
        padding: 1px;
        border-radius: 5px;
        float: right;
        width: 100%;
        text-align: center;
        margin-top: 5px;
        font-size:13px;
    }

    .addbtnstyle {
        color: white !important;
        font-size: 15px;
        font-weight: bold;
        padding-left: 5px;
        padding-right: 5px;
        float: right;
        height: 20px;
        width: 20px;
        border-radius: 30px;
    }

    .notifybtnshow {
        color: white !important;
        background: #27cacc;
    }

    #pageone {
        font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
    }


    .footer {
        background: #384862 !important;
        font-size: 12px;
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
        background-color: #666666;
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
        background: #666666;
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
            /* content: 'NA';*/
            left: -4rem;
        }

        .btn-toggle:after {
            /*content: 'A';*/
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
                /*  content: 'NA';*/
                left: -5rem;
            }

            .btn-toggle.btn-lg:after {
                /*  content: 'A';*/
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
            height: .7rem;
            width: 2.2rem;
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
                /* content: 'NA';*/
                left: -0.5rem;
            }

            .btn-toggle.btn-sm:after {
                /* content: 'A';*/
                right: -0.5rem;
                opacity: 0.5;
            }

            .btn-toggle.btn-sm > .handle {
                position: absolute;
                top: -4px;
                left: 0rem;
                width: 1.125rem;
                height: 1.125rem;
                border-radius: 1.125rem;
                background: #fff;
                transition: left 0.25s;
                font-size: 10px;
                padding-top: 2px;
                color: black;
                font-weight: 600;
                box-shadow: 0 2px 8px 0 rgba(0,0,0,.8) !important;
            }

            .btn-toggle.btn-sm.active {
                transition: background-color 0.25s;
            }

                .btn-toggle.btn-sm.active > .handle {
                    left: 1.0975rem;
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
                left: .125rem;
                width: 2.325rem;
            }

            .btn-toggle.btn-sm.btn-sm:after {
                line-height: -0.5rem;
                color: #fff;
                letter-spacing: 0.75px;
                left: 0.725rem;
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
                /* content: 'NA';*/
                left: 0;
            }

            .btn-toggle.btn-xs:after {
                /*content: 'A';*/
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
        background: #1acc8d;
        color: white;
        border-radius: 5px;
        padding-left: 13px;
        padding-right: 13px;
        /*padding-top: 3px;*/
        font-size: 13px;
    }

    .itemdetails {
        font-size: 11px;
        padding: 10px;
    }

    .totalamountbox {
        text-align: left;
        /*   box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;*/
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
        box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        border: none !important;
    }



    .totalamountbox select {
        width: 55px;
        border: none;
        /* box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;*/
    }

    .totalamountbox input {
        text-align: center;
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

    /* .retailrdetails{
        font-weight: bold;
    background: #e5e6ea;
    color: #000000;
    border-radius: 5px;
    box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
    }*/

    .itemcard {
        border: 1px solid #e4e4e4;
        background: white;
        border-radius: 5px;
    }

    .orderdate__number {
        font-weight: 500;
        color: #2ab5b7;
    }

    .itemprice {
        font-weight: bold;
    }


    .rtname {
        background: #27cacc;
        padding: 2px;
        padding-left: 5px;
        border-radius: 5px;
    }

    .show__itemsmore {
        color: #17aaac;
    }

    input:focus {
        outline: none !important;
    }

    .assigntodiv {
        border: 1px solid;
        border-radius: 5px;
    }

    .notifybtn {
        font-size: 10px;
        border: 1px solid;
        padding: 3px;
        padding-left: 3px;
        padding-right: 3px;
        border-radius: 20px;
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

    .refundvalueinput {
        color: white;
        width: 80px;
        background: #8080807d;
        border: none;
        margin: 2px;
        border-radius: 5px;
        text-align: center;
    }


    .searchbox_box {
        position: fixed;
        z-index: 9999;
        width: 100%;
        top: 65px;
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

    <div id="preload" style="display: none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <form id="form1" runat="server">
        <div>


            <nav class="navbar fixed-top navbar-light bg-light ">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 30px;"></a>
                <a href="My_Profile.aspx" style="color: white;"><span id="UserName_n_Pic" class="userpic">&nbsp;&nbsp; <i class="fa fa-user-circle" style="font-size: 25px;"></i></span></a>

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
            <!--2. Seacrch Section-->



            <!--3. Category -->

            <!--4. Sheduled Section-->
            <div class="container" style="margin-top: 120px;">
            </div>
            <div id="shedulersection" class="container" runat="server" style="margin-top: 25px; margin-bottom: 0px !important;">
            </div>
            <div class="container">
                <div class="row text-right mt-2">
                    <div class="col-11 col-sm-12">
                        <a class=" btnstyle btn text-white p-0 d-none" id="view_more" style="font-size: 13px;">View More</a>

                    </div>
                </div>
            </div>


            <!--5. Transaction history-->
            <div class="container d-none">
                <div class="row">
                    <div class="col-md-3  col-sm-3"></div>
                    <div class="col-md-6 col-sm-6">
                        <div class="card p-3 mt-3 mb-3">
                            <div class="trxhistory">
                                <label><i class="fa fa-money"></i>View Transaction History</label>
                            </div>


                            <table class=" text-center table-bordered">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Business </th>
                                        <th>Amount </th>
                                        <th>Staus </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>12-Jun-20 </td>
                                        <td>Milk man </td>
                                        <td>300 </td>
                                        <td>Paid </td>
                                    </tr>
                                    <tr>
                                        <td>12-Jun-20 </td>
                                        <td>Cleaner </td>
                                        <td>300 </td>
                                        <td>Purchase </td>
                                    </tr>
                                    <tr>
                                        <td>12-Jun-20 </td>
                                        <td>Dobhi </td>
                                        <td>300 </td>
                                        <td>Purchase </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="col-md-3 col-sm-3"></div>
                </div>
            </div>

        </div>
    </form>
    <div class="sticky-footer_close footer_close" id="stick_footer_filter" runat="server">

        <div class="one-fourth" style="width: 100%;">
            <div>
                <ul>
                    <li>Tower 1</li>
                    <li>Tower 2</li>
                    <li>Tower 3</li>
                    <li>Tower 4</li>
                    <li>Tower 5</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="sticky-sort_close " id="sortdiv" runat="server">

        <div class="one-fourth" style="width: 100%;">
            <div>
                <ul>
                    <li>by date</li>
                    <li>by Tower no</li>
                    <li>max item</li>
                    <li>min item 4</li>
                    <li>Ascending </li>
                    <li>Descending</li>
                </ul>
            </div>
        </div>
    </div>
    <div style="height: 60px;"></div>
    <footer>
        <div class="footer" style="color: white; position: fixed; width: 100%; bottom: 0; padding-top: 5px; padding-left: 10px;"><span>Total Collection : <span id="Today_colection" runat="server"></span></span></div>
    </footer>
    <input type="hidden" id="RID" runat="server" value="" />

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <div class="modal fade" id="paymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>

    <div class="modal fade" id="notifymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>

    <div class="modal fade" id="refundconfirmmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>

    <div class="modal fade" id="trackordermodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Track Order</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div id="ImagePreview">
              
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script>
        $('#view_more').click(function (e) {
            e.stopImmediatePropagation()
            var Date = $("#reportrange span").text();
            Date = Date.split('-')
            $.ajax({
                type: "POST",
                async: true,
                url: "Delivered_Orders.aspx/getCustomerOrdersbydatesNextRecords",
                data: '{startdate:"' + Date[0] + '",enddate:"' + Date[1] + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    if (data.d != "") {
                        $("#shedulersection").append(data.d);
                        All_Actions();
                    } else {
                        $('#view_more').addClass('d-none');
                    }
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        })
        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        $(".stopbtn").click(function () {
            $(this).hide();
            $(this).parent().find(".playbtn").show();
            $(this).parent().parent().parent().parent().parent().parent().parent().addClass('pauseorder');
        })


        $(".playbtn").click(function () {
            $(this).hide();
            $(this).parent().find(".stopbtn").show();
            $(this).parent().parent().parent().parent().parent().parent().parent().removeClass('pauseorder');
        })

        $(".addbusinessbtn").click(function () {
            $("#addbussnesstypemodal").modal('show')

        })
        $('.showmore').click(function (e) {
            if ($(this).text() == 'Show More') {
                $('.showmore').text('Show Less');
                $('.hideshowclass').removeClass('d-none');
            }
            else {
                $('.showmore').text('Show More');
                $('.hideshowclass').addClass('d-none');
            }
        })


        function cb(start, end) {
            $("#reportrange span").html(start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY"));
            getData(start.format("MMMM D, YYYY"), end.format("MMMM D, YYYY"));
        }

        function getData(startdate, enddate) {
            $.ajax({
                type: "POST",
                async: true,
                url: "Delivered_Orders.aspx/getCustomerOrdersbydates",
                data: '{startdate:"' + startdate + '",enddate:"' + enddate + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    if (data.d != "") {
                        $("#shedulersection").empty();
                        $("#shedulersection").append(data.d);
                        $('#view_more').removeClass('d-none');
                        All_Actions();

                    } else {
                        $("#shedulersection").empty();
                        $("#shedulersection").append("Data Not Found");

                    }




                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        }

        $(".filterbox").click(function () {
            if ($("#stick_footer_filter").hasClass("sticky-footer_close")) {
                $("#stick_footer_filter").removeClass("sticky-footer_close");
                $("#stick_footer_filter").addClass("sticky-footer_open");

            } else {
                $("#stick_footer_filter").addClass("sticky-footer_close");
                $("#stick_footer_filter").removeClass("sticky-footer_open");
            }
        })

        $(".sortbox").click(function () {
            if ($("#sortdiv").hasClass("sticky-sort_close")) {
                $("#sortdiv").removeClass("sticky-sort_close");
                $("#sortdiv").addClass("sticky-sort_open");

            } else {
                $("#sortdiv").addClass("sticky-sort_close");
                $("#sortdiv").removeClass("sticky-sort_open");
            }
        })

        $(function () {
            var start = moment().subtract(6, "days");
            var end = moment();
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
            })

            $('.applyBtn').click(function (e) {
                cb(moment($("input[name='daterangepicker_start']").val()), moment($("input[name='daterangepicker_end']").val()))
            })

        });
        $(document).ready(function () {
            cb(moment().subtract(6, "days"), moment());
            todaysCollection();
        });

        function switchToggle() {
            $('.switcher input').change(function (e) {
                e.preventDefault();
                //e.stopImmediatePropagation();
                var Header_ID = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().attr('header_id');
                var current = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.show__itemsmore');

                if ($(this).prop('checked')) {
                    fnParticularItemCheckedUnchecked(Header_ID, $(this).attr('lineid'), 'Y', '');

                }
                else {
                    fnParticularItemCheckedUnchecked(Header_ID, $(this).attr('lineid'), 'N', '');

                }

                //current.trigger('click');
                //setTimeout(function () {
                //    current.parent().parent().parent().find(".items__append").slideToggle("slow", function () {
                //    });
                //},1500)

            })
        }

        function All_Actions() {
            $('[data-toggle="tooltip"]').tooltip();
            $(".trackorderbtn").click(function (e) {
                e.stopImmediatePropagation();
                e.preventDefault();
                var url = $(this).attr('imgurl');
                var cmnt = $(this).attr('comnt');

                var a = '<img src="/DispatchOrderPicture/' + url + '" style="width:100%"/><p>' + cmnt + '</p>';
                $("#ImagePreview").empty();
                $("#ImagePreview").append(a);
                $("#trackordermodal").modal();
            })

            //$(".show__itemsmore").each(function () {
            //    var current = $(this);
            //    $.ajax({
            //        type: "POST",
            //        async: true,
            //        url: "Admin_Delivery.aspx/getItemsByHeader",
            //        data: '{Header_ID:"' + $(this).attr('header_id') + '"}',
            //        contentType: "application/json; charset=utf-8",
            //        dataType: "json",
            //        success: function (data) {
            //            current.parent().parent().parent().find(".items__append").empty();
            //            current.parent().parent().parent().find(".items__append").append(data.d);
            //            switchToggle();
            //        }
            //    });
            //})
            $(".show__itemsmore").click(function () {
                var current = $(this);
                if ($.trim(current.parent().parent().parent().find(".items__append").html()).length == 0) {
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Delivered_Orders.aspx/getItemsByHeader",
                        data: '{Header_ID:"' + $(this).attr('header_id') + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            $("#preload").show();
                        },
                        success: function (data) {
                            current.parent().parent().parent().find(".items__append").empty();
                            current.parent().parent().parent().find(".items__append").append(data.d);
                            switchToggle();
                            current.parent().parent().parent().find(".items__append").slideToggle("slow", function () {
                            });

                        },
                        complete: function () {
                            $("#preload").hide();
                        },
                    });

                }
                else {
                    current.parent().parent().parent().find(".items__append").slideToggle("slow", function () {
                    });

                }
            })

            $(".show_subscribed_items").click(function () {
                var current = $(this);
                if ($.trim(current.parent().parent().parent().find(".items__append").html()).length == 0) {
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Delivered_Orders.aspx/getItemsBySchedule",
                        data: '{CID:"' + $(this).attr('cid') + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            $("#preload").show();
                        },
                        success: function (data) {
                            current.parent().parent().parent().find(".items__append").empty();
                            current.parent().parent().parent().find(".items__append").append(data.d);
                            switchToggle();
                            current.parent().parent().parent().find(".items__append").slideToggle("slow", function () {
                            });

                        },
                        complete: function () {
                            $("#preload").hide();
                        },
                    });

                }
                else {
                    current.parent().parent().parent().find(".items__append").slideToggle("slow", function () {
                    });

                }
            })

            $(".alldelecerdbtn").click(function () {
                if ($(this).attr('aria-pressed') == "false") {
                    $(this).find('.handle').text('A');
                    fnParticularItemCheckedUnchecked($(this).attr('headerid'), '', 'Y', $(this).attr('order_no'));
                    $(this).parent().parent().parent().parent().parent().find("input").each(function () {
                        $(this).prop('checked', true);
                    });
                } else {
                    $(this).find('.handle').text('NA');
                    fnParticularItemCheckedUnchecked($(this).attr('headerid'), '', 'N', $(this).attr('order_no'));
                    $(this).parent().parent().parent().parent().parent().find("input").each(function () {
                        $(this).prop('checked', false);
                        //alert($(this).attr('headerid'));
                    });
                }
            })

            $(".totalamutsec").click(function () {
                $(this).parent().parent().parent().find(".recievingamount").slideToggle("slow");
            })

            $("#filter").keyup(function () {
                // Retrieve the input field text and reset the count to zero
                var filter = $(this).val(),
                    count = 0;
                // Loop through the comment list
                $('.card').each(function () {
                    // If the list item does not contain the text phrase fade it out
                    if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                        $(this).hide();  // MY CHANGE

                        // Show the list item if the phrase matches and increase the count by 1
                    } else {
                        $(this).show(); // MY CHANGE
                        count++;
                    }

                });
            });


            $(".recivedamt").click(function (e) {
                e.stopImmediatePropagation();
                var current = $(this).parent().parent().parent().parent().parent().parent().parent().parent();
                var recievedamt = $.trim($(this).parent().parent().parent().find(".totalamountbox").find('input').val());
                var MOP = $(this).parent().parent().parent().find(".totalamountbox").find('select').find('option:selected').text();
                var headrid = $(this).attr('header_id');
                var paymodalD = '<div class="modal-dialog" role="document">' +
                    '<div class="modal-content" style="margin-top: 40%; background-color: #343a40; color: white;" >' +
                    '<div class="modal-header border-0">' +
                    '<h5 class="modal-title" id="exampleModalLabel">Payment Receipt</h5>' +
                    '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
                    '<span aria-hidden="true">&times;</span>' +
                    '</button>' +
                    '</div>' +
                    '<div class="modal-body text-center" style="background: #ffffff14; margin: 10px; border-radius: 10px;">' +
                    '<h6>Receiving ' + recievedamt + ' as ' + MOP + ' </h6>' +
                    '</div>' +
                    '<div class="modal-footer border-0">' +
                    '<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>' +
                    '<a  href="javascript:void(0);" class="btn btnstyle proceedpaybtn" recievedamt="' + recievedamt + '"modeofpay="' + MOP + '" headerid="' + headrid + '">Proceed</a>' +
                    '</div></div ></div >';


                $("#paymodal").empty();
                $("#paymodal").append(paymodalD);
                $("#paymodal").modal();

                $(".proceedpaybtn").click(function () {
                    payamountfunction($(this).attr("recievedamt"), $(this).attr("modeofpay"), $(this).attr("headerid"));
                    getDataByHeaderID($(this).attr("headerid"), current);
                })

                function payamountfunction(recievedamt, MOP, Header_ID) {
                    if (recievedamt == '0') {
                        showpopup('Please enter amount');
                    }
                    else if (recievedamt == '') {
                        showpopup('Please enter amount');
                    }
                    else if (parseFloat(recievedamt) < 0) {
                        showpopup('Amount can not be in negative');
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Delivered_Orders.aspx/AmountReceived",
                            data: '{Header_ID:"' + Header_ID + '",Amount:"' + recievedamt + '",MOP:"' + MOP + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            beforeSend: function () {
                                $("#preload").show();
                            },
                            success: function (data) {
                                showpopup('Amount received successfully');
                                $("#paymodal").modal('hide');
                                todaysCollection();
                                //var Date = $("#reportrange span").text();
                                //Date = Date.split('-')
                                //getData($.trim(Date[0]), $.trim(Date[1]));

                            },
                            complete: function () {
                                $("#preload").hide();
                            },
                        });
                    }
                }


            })


            function getDataByHeaderID(Header_ID, current) {

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Delivered_Orders.aspx/getCustomerOrdersbydatesRefresh",
                    data: '{Header_ID:"' + Header_ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    success: function (data) {

                        current.empty();
                        current.append(data.d);
                        All_Actions();

                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                })
            }

            $('.assign_to_select').click(function (e) {
                e.stopImmediatePropagation();
                var current = $(this);
                var Name = $(this).text();
                if (current.find('option').length == 1) {

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Delivered_Orders.aspx/getDeliveryBoysList",
                        data: '{Name:"' + Name + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        beforeSend: function () {
                            $("#preload").show();
                        },
                        success: function (data) {
                            if (data.d != '') {

                                $('.assign_to_select').each(function () {

                                    if ($(this).find('option').length == 1) {
                                        $(this).empty();
                                        $(this).append(data.d);
                                        var Delivery_Boy = $(this).attr('name');
                                        $(this).find('option:contains(' + Delivery_Boy + ')').attr('selected', 'selected')
                                    }

                                })

                            }
                        },
                        complete: function () {
                            $("#preload").hide();
                        },
                    });
                }
            })

            $('.assign_to_select').change(function (f) {
                f.stopImmediatePropagation();
                var Delivery_Boy_ID = $(this).find('option:selected').attr('user_id');
                var Delivery_Boy_Name = $(this).find('option:selected').text();
                var Header_ID = $(this).parent().parent().parent().parent().parent().parent().attr('header_id');
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Delivered_Orders.aspx/AssignDeliveryBoy",
                    data: '{Header_ID:"' + Header_ID + '",Delivery_Boy_ID:"' + Delivery_Boy_ID + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    success: function (data) {
                        showpopup('Order assigned to ' + Delivery_Boy_Name);
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                });
            })
            $('.notifybtnshow').click(function (e) {
                e.stopImmediatePropagation();

                var cust_number = $(this).attr('custnumber');
                var Header_ID = $(this).parent().parent().parent().parent().parent().parent().attr('header_id');
                var numberChecked = $(this).parent().parent().parent().parent().parent().parent().find('.switch input:checkbox:not(":checked")').length;
                var totalitems = $(this).parent().parent().parent().parent().parent().parent().find('.itmdetails strong').text();
                var orderid = $(this).parent().parent().parent().parent().parent().parent().attr('orderid');
                var availableitems = parseFloat(totalitems) - parseFloat(numberChecked);
                var current = $(this).parent().parent().parent().parent().parent().parent();
                if (availableitems > 1) {
                    var bodytext = '<label class="textboxdiv">Order# ' + orderid + ' : <span>' + numberChecked + ' of ' + totalitems + ' items are unavailable. </span></label>';
                    var Msg = 'Order%23 ' + orderid + ' :' + numberChecked + ' of ' + totalitems + ' items are unavailable.'
                }

                else {
                    var bodytext = '<label class="textboxdiv">Order# ' + orderid + ' : <span>' + numberChecked + ' of ' + totalitems + ' items is unavailable. </span></label>';
                    var Msg = 'Order%23 ' + orderid + ' :' + numberChecked + ' of ' + totalitems + ' item is unavailable.'
                }


                var notifmodalD = '<div class="modal-dialog" role="document">' +
                    '<div class="modal-content" style="margin-top: 40%;" >' +
                    '<div class="modal-header border-0">' +
                    '<h5 class="modal-title" id="exampleModalLabel">Unavailability Notification</h5>' +
                    '<button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
                    '<span aria-hidden="true">&times;</span>' +
                    '</button>' +
                    '</div>' +
                    '<div class="modal-body text-center" style="background: #ffffff14; margin: 10px; border-radius: 10px;">' +
                    bodytext +
                    '</div>' +
                    '<div class="modal-footer border-0">' +
                    '<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>' +
                    '<a  href="javascript:void(0);" class="btn btnstyle notifycustbtn" orderid="' + orderid + '"   headerid="' + Header_ID + '">Notify Customer </a>' +
                    '</div></div ></div >';
                $("#notifymodal").empty();
                $("#notifymodal").append(notifmodalD);
                $("#notifymodal").modal();

                $(".notifycustbtn").click(function (e) {
                    e.stopImmediatePropagation();
                    showpopup('Notified to customer successfully');
                    $("#notifymodal").modal('hide');
                    $(this).attr('disabled', true);
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Delivered_Orders.aspx/NotifyCustomer",
                        data: '{Header_ID:"' + Header_ID + '",Msg:"' + Msg + '",cust_number:"' +
                            cust_number + '",availableitems:"' + availableitems + '",Order_No:"' + orderid + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            getDataByHeaderID(Header_ID, current);
                            //var Date = $("#reportrange span").text();
                            //Date = Date.split('-')
                            //getData($.trim(Date[0]), $.trim(Date[1]));

                        }
                    });
                })

            })

            $('.invoice').click(function (e) {
                e.stopImmediatePropagation();
                Invoice($(this).attr('header_id'), $(this).attr('invoice'), $(this).attr('flag'));
            })



            $('.vieweditbtn').click(function (e) {
                e.stopImmediatePropagation();
                var Header_ID = $(this).parent().attr('header_id');
                var Amount = $.trim($(this).parent().find('.refundvalueinput').val())
                var Order_No = $(this).parent().attr('order_no');
                var current = $(this).parent().parent().parent().parent().parent();
                $('<div></div>').appendTo('body')
                    .html('<div><h6>Are you sure ?</h6></div>').dialog({
                        modal: true,
                        title: 'Confirm Refund',
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

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Delivered_Orders.aspx/InitiateRefund",
                                    data: '{Header_ID:"' + Header_ID + '",Amount:"' + Amount + '",Order_No:"' + Order_No + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        showpopup("Fund Amount of Rs " + Amount + " against order no " + Order_No + " is transferred successfully");
                                        getDataByHeaderID(Header_ID, current);



                                    }
                                });

                            }
                        },
                        close: function (event, ui) {
                            $(this).remove();
                        }
                    });
            })


        }




        function fnParticularItemCheckedUnchecked(Header_ID, Line_ID, Flag, Order_No) {


            $.ajax({
                type: "POST",
                async: true,
                url: "Delivered_Orders.aspx/MarkDelivered",
                data: '{Header_ID:"' + Header_ID + '",Line_ID:"' + Line_ID + '",Flag:"' + Flag + '",Order_No:"' + Order_No + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //var Date = $("#reportrange span").text();
                    //Date = Date.split('-')
                    //getData($.trim(Date[0]), $.trim(Date[1]));
                }
            });
        }

        function todaysCollection() {
            $.ajax({
                type: "POST",
                async: true,
                url: "Delivered_Orders.aspx/todaysCollection",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#Today_colection').html('&#8377;' + data.d);
                }
            });
        }

        function Invoice(Header_ID, Invoice, Flag) {
            $.ajax({
                type: "POST",
                async: true,
                url: "Delivered_Orders.aspx/Invoice",
                data: '{Header_ID:"' + Header_ID + '",Invoice:"' + Invoice + '",Flag:"' + Flag + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (Flag == 'Y') {
                        if (data.d != '0') {
                            //showpopup('Invoice generated successfully');
                            window.location.href = '../Invoice/Invoices.aspx?invoice=' + data.d;
                        }
                        else {
                            showpopup('Some error occured. Please try again later!');
                        }

                    }
                    else {
                        if (data.d != '0') {
                            showpopup('Invoice generated successfully');
                            window.location.href = '../Invoice/Invoices.aspx?invoice=' + data.d;
                        }
                        else {
                            showpopup('Some error occured. Please try again later!');
                        }
                        //var Date = $("#reportrange span").text();
                        //Date = Date.split('-')
                        //getData($.trim(Date[0]), $.trim(Date[1]));
                    }

                }
            });
        }


        $(document).ready(function () {
            getmenuname();
        })
        function getmenuname() {
            $.ajax({
                type: "POST",
                async: true,
                url: "../Admin/admin_dashboard.aspx/getMenulist",
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
