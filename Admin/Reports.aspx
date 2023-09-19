<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <script src="https://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/scroller/2.0.3/css/scroller.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <!-- Include Date Range Picker -->

    <link rel="stylesheet" href="https://propeller.in/components/textfield/css/textfield.css" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
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
            white-space: nowrap;
            padding-left: 10px;
            padding-right: 10px;
        }

        table.dataTable thead tr th {
            word-wrap: break-word;
            word-break: break-all;
        }

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
            margin-top: 65px;
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

        .trDiv, .trhead {
            display: flex;
        }

        .trDiv {
            border-top: 1px solid #e5e5e5;
        }

        .trhead {
            font-weight: bold;
        }


        .col1 {
            width: 250px;
            white-space: break-spaces !important;
        }

        .col2, .col3 {
            width: 70px;
            text-align: center;
        }

        .col4 {
            width: 100px;
            text-align: center;
        }

        .itemsshow {
            padding: 5px;
            background: white;
            border-radius: 5px;
        }

        .trDiv .col1 {
            font-size: 11px;
        }

        /* .primaryStatus {
            background: #00b500;
            color: white;
            text-align: center;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
        }

        .primaryBox {
            background: #0070c0;
            color: white;
            text-align: center;
            padding: 5px;
            border-radius: 5px;
            font-weight: bold;
        }


       .primaryRCV {
            background: #ff5454;
    color: white;
    text-align: center;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
        }*/
    </style>
</head>

<body id="pageone">
    <div id="preload" style="display: none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <nav class="navbar fixed-top navbar-light bg-light">
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;">Reports
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;">Sector-14 Gurgaon</p>
        </a>
        <i class="wave d-none"></i>
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

    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 ">
                <div clas="card table-responsive" style="border-radius: 10px; user-select: auto; background: white; padding: 10px; overflow: auto; margin-top: 130px;">
                    <table class="table table-bordered" id="dataTableReports" width="100%" cellspacing="0">
                        <thead></thead>
                        <tbody></tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>


    <script type="text/javascript" src="https://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>

    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/2.0.3/js/dataTables.scroller.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="../Assest/bootstrap.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <%-- <script src="js/imguploader.minify.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-jcrop/0.9.15/js/jquery.Jcrop.min.js" integrity="sha512-KKpgpD20ujD3yJ5gIJqfesYNuisuxguvTMcIrSnqGQP767QNHjEP+2s1WONIQ7j6zkdzGD4zgBHUwYmro5vMAw==" crossorigin="anonymous"></script>

    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8KEha4w6awdeV8g4rEOMoLvSO1CrUkXg&libraries=places&v=3" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/gh/linways/table-to-excel@v1.0.4/dist/tableToExcel.js"></script>
    <script>
        function getCookie(key) {
            var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
            return keyValue ? keyValue[2] : null;
        }
        $(function () {
            var rid = getCookie('rid');
            if (rid == "48") {
                $('.navbar').removeClass('bg-light');
                $('.navbar').addClass('bg-blue');
                $("#Mycart2").removeClass('cartcount');
                $("#Mycart2").addClass('cartcounts');
                $('.topshow').removeClass('grad2');
                $('.additem .addbtn').removeClass('btnstyle');
                $('.additem .addbtn').addClass('btnstyles');
                $('.checkoutbtn').removeClass('btnstyle');


            }
        });

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


            })

            $('.applyBtn').click(function (e) {
                cb(moment($("input[name='daterangepicker_start']").val()), moment($("input[name='daterangepicker_end']").val()));


            })
            cb(start, end);
        });
        function cb(start, end) {
            $("#reportrange span").html(start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY"));
            GetdataReports(start.format("MMMM D, YYYY"), end.format("MMMM D, YYYY"));
        }

        function GetdataReports(start, end) {

            $.ajax({
                type: "POST",
                async: true,
                url: "Reports.aspx/getOverAllSalesData",
                data: '{start:"' + start + '",end:"' + end + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var Result = JSON.parse(data.d);
                        var tr = '';
                        var TotalSUm = 0, TotalDelivery = 0, Totalqty = 0, Totalamtsum = 0, TotalbasepriceSum = 0;
                        var footer = "";
                        for (var i = 0; Result.length > i; i++) {
                            var DivRow = '', Divfoot = '';
                            var qtySum = 0, amtsum = 0, basepriceSum = 0;
                            if (Result[i].ITEMS != "") {
                                
                                var ItemRow = Result[i].ITEMS.split(",");
                                for (var j = 0; ItemRow.length > j; j++) {
                                    var column = ItemRow[j].split("~");
                                    DivRow = DivRow + '<div class="trDiv"><div class="col1">' + column[0] + '</div><div class="col2">' + column[1] + '</div><div class="col3">' + parseInt(parseInt(column[1]) * parseInt(column[2])) + '</div><div class="col4">' + parseInt(parseInt(column[1]) * parseInt(column[3])) + '</div></div>';
                                    qtySum += parseInt(column[1]);
                                    amtsum += parseInt(parseInt(column[1]) * parseInt(column[2]));
                                    basepriceSum += parseInt(parseInt(column[1]) * parseInt(column[3]));
                                }
                            }

                            var name = Result[i].C_NAME == "" ? Result[i].PersonName : Result[i].C_NAME;
                            var statuss = "";
                            if (Result[i].STATUS.toLowerCase() == "paid") {
                                statuss = "Paid/Not Dispatched";
                            } else {
                                statuss = Result[i].STATUS;
                            }

                            tr = tr + "<tr>" +
                                "<td>" + Result[i].ORDER_DATE + "</td>" +
                                "<td>" + Result[i].HEADER_ID + "</td>" +
                                "<td>" + name + "</td>" +
                                "<td><div class='primaryBox'>" + Result[i].TOTAL_AMOUNT + "</div></td>" +
                                "<td>" + Result[i].DELIVERY_CHARGES + "</td>" +
                                "<td><div class='primaryStatus'>" + statuss + "</div></td>" +
                                "<td style='padding: 5px;'><div class='itemsshow'><div class='trhead'><div class='col1'>Name</div><div class='col2'>Qty</div><div class='col3'>Price <i class='fa fa-rupee'></i></div><div class='col4'>Base Price <i class='fa fa-rupee'></i></div></div>" + DivRow + "<div class='trhead'></div></div></td>" +
                                "</tr>";

                            //if (statuss.toLowerCase() != "order cancelled") {
                                TotalSUm += parseInt(Result[i].TOTAL_AMOUNT);
                                TotalDelivery += parseInt(Result[i].DELIVERY_CHARGES);
                                Totalqty += parseInt(qtySum);
                                Totalamtsum += parseInt(amtsum);
                                TotalbasepriceSum += parseInt(basepriceSum);
                           // }
                            
                        }


                        footer = "<tr><td></td><td></td><td style=\"width:200px;\"></td><th>" + TotalSUm + "</th><th>" + TotalDelivery + " </th><td style=\"width:200px!important;\"></td>" +
                            "<td><div class='itemsshow'><div class='trhead'><div class='col1'>Name</div><div class='col2'>" + Totalqty + "</div><div class='col3'>" + Totalamtsum + "</div><div class='col4'>" + TotalbasepriceSum + "</div></div></div></td></tr>";

                        var Header = "<tr><th>Date</th><th>Order#</th><th style=\"width:200px;\">Name</th><th>Total Amt <i class='fa fa-rupee'></i></th><th>Delivery Chg <i class='fa fa-rupee'></i></th><th style=\"width:200px!important;\">Status</th>" +
                            "<th>Items</th></tr>";

                        destoryDataTable('#dataTableReports');
                        $('#dataTableReports thead').append(Header);
                        $('#dataTableReports tbody').append(tr);
                        $('#dataTableReports tfoot').append(footer);

                        $('#dataTableReports').dataTable();
                        //exportReportToExcel();
                    }
                }
            });
        }

        function exportReportToExcel() {
            let table = $('#dataTableReports'); // you can use document.getElementById('tableId') as well by providing id to the table tag
            TableToExcel.convert(table[0], { // html code may contain multiple tables so here we are refering to 1st table tag
                name: 'Reports.xlsx', // fileName you could use any name
                sheet: {
                    name: 'Sheet 1' // sheetName
                }
            });
        }


        function destoryDataTable(Current) {
            if ($.fn.DataTable.isDataTable(Current)) {
                $(Current).DataTable().clear().destroy();
                $(Current).find('thead').empty();
                $(Current).find('tbody').empty();
                $(Current).find('tfoot').empty();
            }

        }
    </script>
</body>
</html>
