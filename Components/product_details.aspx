<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="Components_product_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />

    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

  
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/css/swiper.css" />
     <link href="Assest/css/alert.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
    <style>
        .swiper-slide {
            height:350px!important;
        }

        .cartcount {
            font-size: 14px;
            margin-top: -21px;
            margin-left: 45px;
            background: #0070c0;
            color: white;
            width: 20px;
            border-radius: 20px;
            z-index: 9999;
            /* box-shadow: 0 2.8px 1.2px rgb(0 0 0 / 3%), 0 -2.3px 5.3px rgb(0 0 0 / 5%), 0 0.5px 1px rgb(0 0 0 / 6%), 0 3.3px 17.9px rgb(0 0 0 / 7%), 0 11.8px 37.4px rgb(0 0 0 / 9%), 0 0px 0px rgb(0 0 0 / 12%); */
            box-shadow: 0 2px 8px 0 rgb(0 0 0 / 10%);
        }

        .swiper-container {
            width: 100%;
        }

        .swiper-slide {
            background-size: cover;
            background-position: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        #pageone {
            font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
        }

        .bg-light {
            background: #1428a9 !important;
        }

        .footer {
            position: fixed;
            bottom: 0px;
            left: 0px;
            width: 100%;
            z-index: 3;
        }

        ._menu_opt {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: black;
        }

        .footer {
            height: 25px;
            background: #fff;
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

        .navbar-brand {
            font-size: 1rem !important;
        }

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

        .Productimagebox {
            width: 100%;
            text-align: center !important;
            padding: 10px;
            margin-top: -40px;
            min-height:350px;
        }

           /* .Productimagebox img {
                height: 100%;
            }*/

        .sub_product_img {
            height: 70px;
            width: 70px;
            background: #ccc;
            margin: auto;
            border: 1px solid #00000026;
        }


        @media (max-width:768px) {
            .sub_product_img {
                height: 60px;
                width: 60px;
                background: #ccc;
                margin: auto;
                border: 1px solid #00000026;
            }

            .swiper-slide {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
            }

                .swiper-slide img {
                    width: 60%;
                }
        }

        .product_title {
            background: #55e6c1;
            padding: 5px;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
            margin-left: -7px;
            box-shadow: 0 8px 6px -6px black;
            padding-right: 15px;
            margin-bottom: 15px;
            z-index: 2;
        }

            .product_title h5 {
                color: white;
                font-weight: bold;
                margin-bottom: 0rem;
            }

            .product_title p {
                font-size: 15px;
            }

        .qtynumber {
            font-size: 20px;
            padding: 5px;
        }

        .qtybtns {
            text-align: center;
            padding: 5px;
        }

        .qtyminusbtn, .qtyplusbtn {
            color: #55e6c1;
            cursor: pointer;
        }

            .qtyminusbtn fa:hover, .qtyplusbtn fa:hover {
                box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
            }

        .qtyValue {
            width: 40px;
            border: none;
            text-align: center;
        }

        .abtitem h5 {
            margin-bottom: 0;
        }

        .abtitem {
            border-top: 7px solid #eeeeee;
            margin-top: 15px;
            width: 100%;
            padding: 3px;
            text-align: center;
        }



        .productprice label {
            font-size: 15px;
            margin-bottom: 0;
        }

        .productprice {
            padding: 10px;
        }

            .productprice p {
                color: #979797;
                margin-bottom: 0px !important;
            }

        .productName strong {
            font-size: 16px;
            padding-left: 10px;
            color: #4d4d4d;
        }

        .fa-angle-down {
            float: right;
        }

        .fa-angle-up {
            float: right;
        }

  /*      .textdiv {
            display: none;
        }*/

        ._addtinlimg {
            padding: 20px;
            height: 150px;
        }

        ._additiontext {
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .story-item .card {
            box-shadow: 0 0px 24px -15px rgba(0, 0, 0, 0.25) !important;
        }


        .story-item .qtyminusbtn2, .qtyplusbtn2 {
            width: 25%;
            padding: 10px !important;
            background: #55e6c1;
            color: white;
        }

        .story-item input {
            width: 50%;
            padding: 5px;
        }

        .owl-carousel .owl-item img {
            display: block;
            max-width: 100%;
            max-height: 100%;
        }

        .addbtn {
            padding: 10px;
            background: #55e6c1;
            color: white;
        }

        .story-item .qtybtns {
            display: none;
        }

        .show {
            display: block !important;
        }

        .qtyaddbtn {
            background: #55e6c1;
            border-radius: 10px;
            text-align: center;
            padding: 9px;
            color: white;
        }
        .bg-blue {
    background: #0070C0 !important;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    color: white;
    height: 80px;
}
        .navbar-light .navbar-brand {
    /* color: #1428a9 !important; */
    color: #ffffff !important;
    /* font-weight: 500; */
}
    </style>
</head>

<body id="pageone">
    <nav class="navbar fixed-top navbar-light bg-blue">
                <a class="navbar-brand" href="javascript:void(0);" id="StoreName" runat="server" style="padding-left: 50px;"></a>
                 
            </nav>

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

            <div id="shedulersection" class="container" runat="server" style="margin-top: 90px;">
                
            </div>





        </div>
    </form>

    <div style="height: 60px;"></div>
    <footer>
        <div class="footer boxshadow" style="height: auto;" id="active_balance">
            <div class="row">
                <div class="col-3 text-center menuopt">
                    <a class="_menu_opt" href="../home.aspx">
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            width="22.398px" height="22.398px" viewBox="0 0 495.398 495.398" style="enable-background: new 0 0 495.398 495.398; margin-bottom: -10px;"
                            xml:space="preserve">
                            <g>
                                <g>
                                    <g>
                                        <path d="M487.083,225.514l-75.08-75.08V63.704c0-15.682-12.708-28.391-28.413-28.391c-15.669,0-28.377,12.709-28.377,28.391
				            v29.941L299.31,37.74c-27.639-27.624-75.694-27.575-103.27,0.05L8.312,225.514c-11.082,11.104-11.082,29.071,0,40.158
				            c11.087,11.101,29.089,11.101,40.172,0l187.71-187.729c6.115-6.083,16.893-6.083,22.976-0.018l187.742,187.747
				            c5.567,5.551,12.825,8.312,20.081,8.312c7.271,0,14.541-2.764,20.091-8.312C498.17,254.586,498.17,236.619,487.083,225.514z"
                                            fill="gray" />
                                        <path d="M257.561,131.836c-5.454-5.451-14.285-5.451-19.723,0L72.712,296.913c-2.607,2.606-4.085,6.164-4.085,9.877v120.401
				            c0,28.253,22.908,51.16,51.16,51.16h81.754v-126.61h92.299v126.61h81.755c28.251,0,51.159-22.907,51.159-51.159V306.79
				            c0-3.713-1.465-7.271-4.085-9.877L257.561,131.836z"
                                            fill="gray" />
                                    </g>
                                </g>
                            </g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
                        <br />
                        <label class="p-0 m-0" style="font-weight: 500!important;">Home</label></a>
                </div>
                <div class="col-3 text-center menuopt" onclick="location.href='../Components/scheduler.aspx'">
                    <a class="_menu_opt">

                        <svg version="1.1" id="Capa_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 512 512" width="22.398px" height="22.398px" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M458.732,422.212l-22.862-288.109c-1.419-18.563-17.124-33.098-35.737-33.098h-45.164v66.917
			c0,8.287-6.708,14.995-14.995,14.995c-8.277,0-14.995-6.708-14.995-14.995v-66.917H187.028v66.917
			c0,8.287-6.718,14.995-14.995,14.995c-8.287,0-14.995-6.708-14.995-14.995v-66.917h-45.164c-18.613,0-34.318,14.535-35.737,33.058
			L53.265,422.252c-1.769,23.082,6.238,46.054,21.962,63.028C90.952,502.253,113.244,512,136.386,512h239.236
			c23.142,0,45.434-9.747,61.159-26.721C452.505,468.305,460.512,445.333,458.732,422.212z M323.56,275.493l-77.553,77.553
			c-2.929,2.929-6.768,4.398-10.606,4.398c-3.839,0-7.677-1.469-10.606-4.398l-36.347-36.347c-5.858-5.858-5.858-15.345,0-21.203
			c5.858-5.858,15.355-5.858,21.203,0l25.751,25.741l66.956-66.956c5.848-5.848,15.345-5.848,21.203,0
			C329.418,260.139,329.418,269.635,323.56,275.493z"
                                        fill="gray" />
                                </g>
                            </g>
                            <g>
                                <g>
                                    <path d="M256.004,0c-54.571,0-98.965,44.404-98.965,98.975v2.029h29.99v-2.029c0-38.037,30.939-68.986,68.976-68.986
			s68.976,30.949,68.976,68.986v2.029h29.989v-2.029C354.969,44.404,310.575,0,256.004,0z"
                                        fill="gray" />
                                </g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                        </svg>
                        <br />
                        <label class="p-0 m-0" style="font-weight: 500!important;">Order</label></a>
                </div>
                <div class="col-3 text-center _walletbtn">
                    <a class="_menu_opt">


                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            width="22.398px" height="22.398px" viewBox="0 0 890.5 890.5" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M208.1,180.56l355-96.9l-18.8-38c-12.3-24.7-42.3-34.9-67-22.6l-317.8,157.5H208.1z" fill="gray" />
                                    <path d="M673.3,86.46c-4.399,0-8.8,0.6-13.2,1.8l-83.399,22.8L322,180.56h289.1h126l-15.6-57.2
			C715.5,101.06,695.3,86.46,673.3,86.46z"
                                        fill="gray" />
                                    <path d="M789.2,215.56h-11.4h-15.5h-15.5H628.5H193.8h-57h-48h-8.9H50.1c-15.8,0-29.9,7.3-39.1,18.8c-4.2,5.3-7.4,11.4-9.2,18.1
			c-1.1,4.2-1.8,8.6-1.8,13.1v6v57v494.1c0,27.601,22.4,50,50,50h739.1c27.601,0,50-22.399,50-50v-139.5H542.4
			c-46.9,0-85-38.1-85-85v-45.8v-15.5v-15.5v-34.4c0-23,9.199-43.899,24.1-59.199c13.2-13.601,30.9-22.801,50.7-25.101
			c3.3-0.399,6.7-0.6,10.1-0.6h255.2H813h15.5h10.6v-136.5C839.2,237.96,816.8,215.56,789.2,215.56z"
                                        fill="gray" />
                                    <path d="M874.2,449.86c-5-4.6-10.9-8.1-17.5-10.4c-5.101-1.699-10.5-2.699-16.2-2.699h-1.3h-1h-15.5h-55.9H542.4
			c-27.601,0-50,22.399-50,50v24.899v15.5v15.5v55.4c0,27.6,22.399,50,50,50h296.8h1.3c5.7,0,11.1-1,16.2-2.7
			c6.6-2.2,12.5-5.8,17.5-10.4c10-9.1,16.3-22.3,16.3-36.899v-111.3C890.5,472.16,884.2,458.959,874.2,449.86z M646.8,552.36
			c0,13.8-11.2,25-25,25h-16.6c-13.8,0-25-11.2-25-25v-16.6c0-8,3.7-15.101,9.6-19.601c4.3-3.3,9.601-5.399,15.4-5.399h4.2H621.8
			c13.8,0,25,11.199,25,25V552.36L646.8,552.36z"
                                        fill="gray" />
                                </g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                        </svg>
                        <br />
                        <label class="p-0 m-0" style="font-weight: 500!important;">Wallet</label></a>
                </div>
                <div class="col-3 text-center menuopt" id="Mycart" onclick="location.href='../cart.aspx'">
                    <a class="_menu_opt">

                        <svg version="1.1" id="Capa_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 426.667 426.667" width="22.398px" height="22.398px" style="enable-background: new 0 0 446.853 446.853; margin-bottom: -13px;" xml:space="preserve">
                            <g>
                                <g>
                                    <g>
                                        <path d="M128,341.333c-23.573,0-42.453,19.093-42.453,42.667s18.88,42.667,42.453,42.667c23.573,0,42.667-19.093,42.667-42.667
				S151.573,341.333,128,341.333z"
                                            fill="gray" />
                                        <path d="M151.467,234.667H310.4c16,0,29.973-8.853,37.333-21.973L424,74.24c1.707-2.987,2.667-6.507,2.667-10.24
				c0-11.84-9.6-21.333-21.333-21.333H89.92L69.653,0H0v42.667h42.667L119.36,204.48l-28.8,52.267
				c-3.307,6.187-5.227,13.12-5.227,20.587C85.333,300.907,104.427,320,128,320h256v-42.667H137.067
				c-2.987,0-5.333-2.347-5.333-5.333c0-0.96,0.213-1.813,0.64-2.56L151.467,234.667z"
                                            fill="gray" />
                                        <path d="M341.333,341.333c-23.573,0-42.453,19.093-42.453,42.667s18.88,42.667,42.453,42.667
				C364.907,426.667,384,407.573,384,384S364.907,341.333,341.333,341.333z"
                                            fill="gray" />
                                    </g>
                                </g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                        </svg>
                        <br />
                        <div class="cartcount" id="Mycart2" runat="server" style="font-size: 14px;">0</div>
                        <label class="p-0 m-0 " style="font-weight: 500!important;">Cart</label></a>
                </div>
            </div>
        </div>
    </footer>
      <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <input type="hidden" id="RID" runat="server" value="" />
    <script src="Assest/js/ripple-effect.js"></script>
    <script src="Assest/js/alert.js"></script>

    <script src="Admin/js/textfield.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>


    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.3.3/js/swiper.js"></script>
    <script src="../jquery-helper/product-details-helper.js"></script>
    <script>
        $('#owl-carosel5').owlCarousel({
            center: false,
            items: 3,
            lazyLoad: true,
            responsiveClass: true,
            loop: false,
            margin: 10,
            stagePadding: 15,
            autoHeight: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            nav: false,
            responsive: {
                0: {
                    items: 2
                },

                600: {
                    items: 2
                },

                1024: {
                    items: 6
                },

                1366: {
                    items: 6
                }
            }
        });

        $(".textshow").click(function () {
            if ($(this).find("i").hasClass("fa fa-angle-down")) {
                $(this).find("i").removeClass("fa-angle-down");
                $(this).find("i").addClass("fa-angle-up");
            } else {
                $(this).find("i").addClass("fa-angle-down");
                $(this).find("i").removeClass("fa-angle-up");
            }
            $(this).find(".textdiv").slideToggle();
        });


        $(".addbtn").click(function () {
            $(this).parent().find(".qtybtns").toggleClass("show")
        })

        var Swipes = new Swiper('.swiper-container', {
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
            },
        });

        var minVal = 0, maxVal = 100; // Set Max and Min values
        // Increase product quantity on cart page
        $(".qtyplusbtn").on('click', function () {
            var $parentElm = $(this).parents(".qtybtns");
            $(this).addClass("clicked");
            setTimeout(function () {
                $(".clicked").removeClass("clicked");
            }, 100);
            var value = $parentElm.find(".qtyValue").val();
            if (value < maxVal) {
                value++;
            }

            $parentElm.find(".qtyValue").val(value);
        });
        // Decrease product quantity on cart page
        $(".qtyminusbtn").on('click', function () {
            var $parentElm = $(this).parents(".qtybtns");
            $(this).addClass("clicked");
            setTimeout(function () {
                $(".clicked").removeClass("clicked");
            }, 100);
            var value = $parentElm.find(".qtyValue").val();
            if (value >= 1) {
                value--;

            }
            if (value == '0') {
                $(this).parent().find(".qtybtns").hide();
                $(this).parent().parent().find(".addbtn").show();
            }
            $parentElm.find(".qtyValue").val(value);
        });





        var minVal = 0, maxVal = 100; // Set Max and Min values
        // Increase product quantity on cart page
        $(".qtyplusbtn2").on('click', function () {
            var $parentElm = $(this).parents(".qtybtns");
            $(this).addClass("clicked");
            setTimeout(function () {
                $(".clicked").removeClass("clicked");
            }, 100);
            var value = $parentElm.find(".qtyValue").val();
            if (value < maxVal) {
                value++;
            }
            $parentElm.find(".qtyValue").val(value);
        });
        // Decrease product quantity on cart page
        $(".qtyminusbtn2").on('click', function () {

            debugger;

            var $parentElm = $(this).parents(".qtybtns");
            $(this).addClass("clicked");
            setTimeout(function () {
                $(".clicked").removeClass("clicked");
            }, 100);
            var value = $parentElm.find(".qtyValue").val();
            if (value > 1) {
                value--;
                $(this).parent().parent().find(".qtybtns").hide();
                $(this).parent().parent().find(".addbtn").show();
            }
            $parentElm.find(".qtyValue").val(value);
        });



        $(".qtyaddbtn").click(function () {

            $(this).hide();
            var current = $(this).parent().parent().find(".qtybtns")
            if (current.hasClass("d-none")) {
                current.removeClass("d-none");

            }
            else {
                current.addClass("d-none");
            }
        })
    </script>
</body>
</html>

