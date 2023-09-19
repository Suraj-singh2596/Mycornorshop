<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymentStatus.aspx.cs" Inherits="Payments_PaymentStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Corner Shop | Payment Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="http://propeller.in/components/textfield/css/textfield.css" rel="stylesheet" />
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
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


        .title {
            border-bottom: 1px solid #8cc9f3;
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            color: #215890;
            background: #add9f4;
        }

        .footer {
            background: white !important;
        }

        .footer {
            position: fixed;
            bottom: 0px;
            left: 0px;
            width: 100%;
            z-index: 3;
        }

        .boxshadow {
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.35);
            border: none !important;
        }

        .cartcount {
            font-size: 14px;
            margin-top: -21px;
            margin-left: 40px;
            background: #384862;
            color: white;
            width: 20px;
            border-radius: 20px;
            z-index: 9999;
            box-shadow: 0 2.8px 1.2px rgba(0, 0, 0, 0.034), 0 -2.3px 5.3px rgba(0, 0, 0, 0.048), 0 0.5px 1px rgba(0, 0, 0, 0.06), 0 3.3px 17.9px rgba(0, 0, 0, 0.072), 0 11.8px 37.4px rgba(0, 0, 0, 0.086), 0 0px 0px rgba(0, 0, 0, 0.12);
        }

        ._menu_opt {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: black !important;
        }
    </style>
    <style>
        .content {
            box-sizing: border-box;
            position: relative;
            padding: 5px;
            z-index: 1;
            border: none;
            background: #fff;
            border-radius: 5px;
        }

        .bg-dark {
            background-color: #ed394d !important;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }

        body {
            background: white;
        }

        a {
            color: #ffffff !important;
            text-decoration: none !important;
            background-color: transparent;
        }

        .contbg {
            background: url("table-with-ingredients-prepare-italian-pasta_23-2147606548.jpg");
            background-size: cover;
            position: relative;
            height: 100vh;
            align-items: center;
            justify-content: center;
        }


        .contents {
            bottom: 0;
            background: rgb(0, 0, 0);
            background: rgba(0, 0, 0, 0.5);
            color: #f1f1f1;
            width: 100%;
            padding: 20px;
            height: 100%;
        }


        .signupbox {
            padding: 10px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            margin-top: 20%;
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.25);
        }

        .login-form {
            background: #fff;
            display: -webkit-box;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            flex-direction: column;
            border-radius: 4px;
            box-shadow: 0 2px 25px rgba(0, 0, 0, 0.2);
        }

            .login-form h1 {
                padding: 35px 35px 0 35px;
                font-weight: 300;
            }

            .login-form .content {
                padding: 35px;
            }

            .login-form .input-field {
                padding: 12px 5px;
            }


            .login-form a.link {
                text-decoration: none;
                color: #747474;
                letter-spacing: 0.2px;
                text-transform: uppercase;
                display: inline-block;
                margin-top: 20px;
            }

            .login-form .action {
                display: -webkit-box;
                display: flex;
                -webkit-box-orient: horizontal;
                -webkit-box-direction: normal;
                flex-direction: row;
            }

                .login-form .action button {
                    width: 100%;
                    border: none;
                    padding: 18px;
                    cursor: pointer;
                    text-transform: uppercase;
                    background: #ed394d;
                    color: #fff;
                    font-weight: bold;
                    border-bottom-left-radius: 4px;
                    border-bottom-right-radius: 0;
                    letter-spacing: 0.2px;
                    outline: 0;
                    -webkit-transition: all .3s;
                    transition: all .3s;
                    border-radius: 5px;
                }

                    .login-form .action button:hover {
                        background: #00a1df;
                    }

                    .login-form .action button:nth-child(2) {
                        background: #2d3b55;
                        color: #fff;
                        border-bottom-left-radius: 0;
                        border-bottom-right-radius: 4px;
                    }

                        .login-form .action button:nth-child(2):hover {
                            background: #3c4d6d;
                        }

        @media (max-width:768px) {
        }

        .login-form h1 {
            color: #00a1df;
        }



        .inputcss {
            transition: .4s;
            margin-top: 0px !important;
        }

        .content input {
            text-align: left !important;
        }

        .managerfield {
            text-align: center;
        }

        .manager {
            text-align: center;
            font-size: 19px;
            font-weight: 500;
            cursor: pointer;
            margin-top: 10px;
        }

        #numberComplete {
            font-weight: bold;
        }

        .scan {
            font-weight: bold;
        }

        .Paymentcard {
            margin-top: 20% !important;
            padding: 10px;
            margin: 0 auto;
            color: #333;
            /* background: white; */
            border-radius: 5px;
            font-family: sans-serif;
            overflow: hidden;
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.25);
            position: relative;
        }

        .pay-title {
            border-left: 7px solid #34cec3;
            padding-left: 10px;
            margin-left: 10px;
            color: #384862;
            text-shadow: 2px 2px 4px #00000042;
        }

        @media only screen and (max-width: 768px) {

            .Paymentcard {
                margin-top: 20% !important;
            }

            .btn-primary {
                margin-top: 10px;
            }

            .btn-danger {
                margin-top: 10px;
            }

            .form-group {
                margin-bottom: 0px;
            }
        }

        input {
            outline: none !important;
        }

        .col-form-label {
            font-size: 20px;
            color: #00a1df;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #ffffff;
            width: 100%;
        }

        .btn-danger {
            width: 100%;
        }

        .form-control:focus {
            border-color: #80bdff00;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 0%);
        }

        #txtamount {
            font-weight: bold;
        }

        /*card design---------------------------------------------------*/
        @font-face {
            font-family: 'Iceland';
            font-style: normal;
            font-weight: 400;
            src: local('Iceland'), local('Iceland-Regular'), url(https://fonts.gstatic.com/s/iceland/v9/rax9HiuFsdMNOnWPaKtMBA.ttf) format('truetype');
        }

        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 400;
            src: local('Open Sans Regular'), local('OpenSans-Regular'), url(https://fonts.gstatic.com/s/opensans/v18/mem8YaGs126MiZpBA-UFVZ0e.ttf) format('truetype');
        }

        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 800;
            src: local('Open Sans ExtraBold'), local('OpenSans-ExtraBold'), url(https://fonts.gstatic.com/s/opensans/v18/mem5YaGs126MiZpBA-UN8rsOUuhs.ttf) format('truetype');
        }

        .atmcard {
            position: fixed;
            /* top: 0; */
            left: 0;
            bottom: -100%;
            right: 0;
            margin: auto;
            width: 100%;
            height: 92.98mm;
            color: #fff;
            /*font: 22px/1 'Iceland', monospace;*/
            background: #55e6c1;
            border: 1px solid #53e4bf;
            -webkit-border-radius: 10px;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 10px;
            -moz-background-clip: padding;
            border-radius: 10px;
            background-clip: padding-box;
            overflow: hidden;
            z-index: 1;
            transition: 1s;
        }

        .atmcardopen {
            position: fixed;
            /* top: 0; */
            left: 0;
            bottom: 46px;
            right: 0;
            margin: auto;
            width: 100%;
            height: 92.98mm;
            color: #fff;
            /*font: 22px/1 'Iceland', monospace;*/
            background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;
            border: 1px solid #53e4bf;
            -webkit-border-radius: 10px;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 10px;
            -moz-background-clip: padding;
            border-radius: 10px;
            background-clip: padding-box;
            overflow: hidden;
            z-index: 1;
            transition: 1s;
        }

        .bank-name {
            float: right;
            margin-top: 15px;
            margin-right: 30px;
            font: 800 18px 'Open Sans', Arial, sans-serif;
            visibility: hidden;
        }

        .chip {
            position: relative;
            z-index: 1000;
            width: 50px;
            /*height: 40px;*/
            margin-top: 50px;
            margin-bottom: 10px;
            margin-left: 30px;
            background: #fffcb1;
            /* Old browsers */
            background: -moz-linear-gradient(-45deg, #fffcb1 0%, #b4a365 100%);
            /* FF3.6+ */
            background: -webkit-gradient(linear, left top, right bottom, color-stop(0%, #fffcb1), color-stop(100%, #b4a365));
            /* Chrome,Safari4+ */
            background: -webkit-linear-gradient(-45deg, #fffcb1 0%, #b4a365 100%);
            /* Chrome10+,Safari5.1+ */
            background: -o-linear-gradient(-45deg, #fffcb1 0%, #b4a365 100%);
            /* Opera 11.10+ */
            background: -ms-linear-gradient(-45deg, #fffcb1 0%, #b4a365 100%);
            /* IE10+ */
            background: linear-gradient(135deg, #fffcb1 0%, #b4a365 100%);
            /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#fffcb1", endColorstr="#b4a365", GradientType=1);
            /* IE6-9 fallback on horizontal gradient */
            border: 1px solid #322d28;
            -webkit-border-radius: 10px;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 10px;
            -moz-background-clip: padding;
            border-radius: 10px;
            background-clip: padding-box;
            -webkit-box-shadow: 0 1px 2px #322d28, 0 0 5px 0 0 5px rgba(144, 133, 87, 0.25) inset;
            -moz-box-shadow: 0 1px 2px #322d28, 0 0 5px 0 0 5px rgba(144, 133, 87, 0.25) inset;
            box-shadow: 0 1px 2px #322d28, 0 0 5px 0 0 5px rgba(144, 133, 87, 0.25) inset;
            overflow: hidden;
        }

            .chip .side {
                position: absolute;
                top: 8px;
                width: 12px;
                height: 24px;
                border: 1px solid #322d28;
                -webkit-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1), 0 0 4px rgba(0, 0, 0, 0.1) inset;
                -moz-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1), 0 0 4px rgba(0, 0, 0, 0.1) inset;
                box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1), 0 0 4px rgba(0, 0, 0, 0.1) inset;
            }

                .chip .side.left {
                    left: 0;
                    border-left: none;
                    -webkit-border-radius: 0 2px 2px 0;
                    -webkit-background-clip: padding-box;
                    -moz-border-radius: 0 2px 2px 0;
                    -moz-background-clip: padding;
                    border-radius: 0 2px 2px 0;
                    background-clip: padding-box;
                }

                .chip .side.right {
                    right: 0;
                    border-right: none;
                    -webkit-border-radius: 2px 0 0 2px;
                    -webkit-background-clip: padding-box;
                    -moz-border-radius: 2px 0 0 2px;
                    -moz-background-clip: padding;
                    border-radius: 2px 0 0 2px;
                    background-clip: padding-box;
                }

                .chip .side:after {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    bottom: 0;
                    right: 0;
                    display: inline-block;
                    width: 100%;
                    height: 0px;
                    margin: auto;
                    border-top: 1px solid #322d28;
                    -webkit-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1);
                    -moz-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1);
                    box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1);
                }

            .chip .vertical {
                position: absolute;
                left: 0;
                right: 0;
                margin: 0 auto;
                width: 8.66666667px;
                height: 12px;
                border: 1px solid #322d28;
                -webkit-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1), 0 0 4px rgba(0, 0, 0, 0.1) inset;
                -moz-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1), 0 0 4px rgba(0, 0, 0, 0.1) inset;
                box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1), 0 0 4px rgba(0, 0, 0, 0.1) inset;
            }

                .chip .vertical.top {
                    top: 0;
                    border-top: none;
                }

                    .chip .vertical.top:after {
                        top: 12px;
                        width: 17.33333333px;
                    }

                .chip .vertical.bottom {
                    bottom: 0;
                    border-bottom: none;
                }

                    .chip .vertical.bottom:after {
                        bottom: 12px;
                    }

                .chip .vertical:after {
                    content: '';
                    position: absolute;
                    left: -8.66666667px;
                    display: inline-block;
                    width: 26px;
                    height: 0px;
                    margin: 0;
                    border-top: 1px solid #322d28;
                    -webkit-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1);
                    -moz-box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1);
                    box-shadow: 0 0 5px rgba(144, 133, 87, 0.25) inset, 0 0 5px rgba(144, 133, 87, 0.25), 0 0 4px rgba(0, 0, 0, 0.1);
                }

        .data {
            position: relative;
            z-index: 100;
            text-transform: uppercase;
            margin-top: -65px
        }

            .data .pan,
            .data .month,
            .data .year,
            .data .year:before,
            .data .name-on-card,
            .data .date {
                position: relative;
                z-index: 20;
                letter-spacing: 1px;
                /*text-shadow: 1px 1px 1px #000;*/
            }

                .data .pan:before,
                .data .month:before,
                .data .year:before,
                .data .year:before:before,
                .data .name-on-card:before,
                .data .date:before,
                .data .pan:after,
                .data .month:after,
                .data .year:after,
                .data .year:before:after,
                .data .name-on-card:after,
                .data .date:after {
                    position: absolute;
                    z-index: -10;
                    content: attr(title);
                    color: rgba(0, 0, 0, 0.2);
                    text-shadow: none;
                }

                    .data .pan:before,
                    .data .month:before,
                    .data .year:before,
                    .data .year:before:before,
                    .data .name-on-card:before,
                    .data .date:before {
                        top: -1px;
                        left: -1px;
                        color: rgba(0, 0, 0, 0.1);
                    }

                        .data .pan:after,
                        .data .month:after,
                        .data .year:after,
                        .data .year:before:after,
                        .data .name-on-card:after,
                        .data .date:after {
                            top: 1px;
                            left: 1px;
                            z-index: 10;
                        }

            .data .pan {
                position: relative;
                z-index: 50;
                margin: 20px;
                letter-spacing: 1px;
                font-size: 30px;
                text-align: center;
                background: #00000030;
                border-radius: 10px;
            }

            .data .first-digits {
                margin: 0;
                font: 400 10px/1 'Open Sans', Arial, sans-serif;
            }

            .data .exp-date-wrapper {
                margin-top: 5px;
                line-height: 1;
                *zoom: 1;
            }

                .data .exp-date-wrapper:before,
                .data .exp-date-wrapper:after {
                    content: " ";
                    display: table;
                }

                .data .exp-date-wrapper:after {
                    clear: both;
                }

                .data .exp-date-wrapper .left-label {
                    float: left;
                    display: contents;
                    width: 40px;
                    font: 400 13px/8px 'Open Sans', Arial, sans-serif;
                    letter-spacing: 0.5px;
                    visibility: hidden;
                }

                .data .exp-date-wrapper .exp-date {
                    display: inline-block;
                    float: left;
                    margin-top: -10px;
                    margin-left: 10px;
                    text-align: center;
                }

                    .data .exp-date-wrapper .exp-date .upper-labels {
                        font: 400 7px/1 'Open Sans', Arial, sans-serif;
                    }

                    .data .exp-date-wrapper .exp-date .year:before {
                        content: '/';
                    }

            .data .name-on-card {
                margin-top: 10px;
            }

        .lines-down:before {
            content: '';
            position: absolute;
            top: 80px;
            left: -200px;
            z-index: 10;
            width: 550px;
            height: 400px;
            border-top: 2px solid #4ddbb7;
            -webkit-border-radius: 40% 60% 0 0;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 40% 60% 0 0;
            -moz-background-clip: padding;
            border-radius: 40% 60% 0 0;
            background-clip: padding-box;
            box-shadow: 1px 1px 100px #219679;
            background: #2d21a6;
            background: -moz-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 100%, #2d21a6 100%);
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(45, 33, 166, 0)), color-stop(100%, #2d21a6));
            background: -webkit-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 100%, #2d21a6 100%);
            background: -o-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 44%, #2d21a6 100%);
            background: -ms-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 44%, #2d21a6 100%);
            background: radial-gradient(ellipse at center, rgba(45, 33, 166, 0) 44%, #54dcc0 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="rgba(45, 33, 166, 0)", endColorstr="#2d21a6", GradientType=1);
        }

        .lines-down:after {
            content: '';
            position: absolute;
            top: 20px;
            left: -100px;
            z-index: 10;
            width: 350px;
            height: 400px;
            border-top: 2px solid #26c9cc;
            -webkit-border-radius: 20% 80% 0 0;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 20% 80% 0 0;
            -moz-background-clip: padding;
            border-radius: 20% 80% 0 0;
            background-clip: padding-box;
            box-shadow: inset -1px -1px 44px #2cbeb2;
            background: #2d21a6;
            background: -moz-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 100%, #2d21a6 100%);
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(45, 33, 166, 0)), color-stop(100%, #2d21a6));
            background: -webkit-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 100%, #2d21a6 100%);
            background: -o-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 44%, #2d21a6 100%);
            background: -ms-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 44%, #2d21a6 100%);
            background: radial-gradient(ellipse at center, rgba(45, 33, 166, 0) 44%, #d5d5d5 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="rgba(45, 33, 166, 0)", endColorstr="#2d21a6", GradientType=1);
        }

        .lines-up:before {
            content: '';
            position: absolute;
            top: -110px;
            left: -70px;
            z-index: 2;
            width: 480px;
            height: 300px;
            border-bottom: 2px solid #51e0bc;
            -webkit-border-radius: 0 0 60% 90%;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 0 0 60% 90%;
            -moz-background-clip: padding;
            border-radius: 0 0 60% 90%;
            background-clip: padding-box;
            box-shadow: inset 1px 1px 44px #6dd9c0;
            background: #4031b2;
            background: -moz-radial-gradient(center, ellipse cover, rgba(64, 49, 178, 0) 100%, #23189a 100%);
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(64, 49, 178, 0)), color-stop(100%, #23189a));
            background: -webkit-radial-gradient(center, ellipse cover, rgba(64, 49, 178, 0) 100%, #23189a 100%);
            background: -o-radial-gradient(center, ellipse cover, rgba(64, 49, 178, 0) 44%, #23189a 100%);
            background: -ms-radial-gradient(center, ellipse cover, rgba(64, 49, 178, 0) 44%, #23189a 100%);
            background: radial-gradient(ellipse at center, rgba(64, 49, 178, 0) 44%, #53e2be 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="rgba(64, 49, 178, 0)", endColorstr="#23189a", GradientType=1);
        }


        .lines-up:after {
            content: '';
            position: absolute;
            top: -180px;
            left: -200px;
            z-index: 1;
            width: 530px;
            height: 420px;
            border-bottom: 2px solid #53e3be;
            -webkit-border-radius: 0 40% 50% 50%;
            -webkit-background-clip: padding-box;
            -moz-border-radius: 0 40% 50% 50%;
            -moz-background-clip: padding;
            border-radius: 0 40% 50% 50%;
            background-clip: padding-box;
            box-shadow: inset 1px 1px 44px #52e1bc;
            background: #2d21a6;
            background: -moz-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 100%, #2d21a6 100%);
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(45, 33, 166, 0)), color-stop(100%, #2d21a6));
            background: -webkit-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 100%, #2d21a6 100%);
            background: -o-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 44%, #2d21a6 100%);
            background: -ms-radial-gradient(center, ellipse cover, rgba(45, 33, 166, 0) 44%, #2d21a6 100%);
            background: radial-gradient(ellipse at center, rgba(45, 33, 166, 0) 44%, #51dfbb 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="rgba(45, 33, 166, 0)", endColorstr="#2d21a6", GradientType=1);
        }


        .addmoneybtn {
            border: 1px solid white;
            padding: 3px;
            border-radius: 27px;
            padding-right: 10px;
            padding-left: 5px;
        }

        .addmoneyinput {
            border: 1px solid white;
            border-radius: 27px;
            padding: 2.7px;
            padding-right: 10px;
        }

        .showcard {
            display: block;
            transition: 1s;
        }

        .pan span {
            font-size: 17px;
            font-weight: bold;
        }

        .addmoneybtn2 {
            padding-right: 10px;
            padding-left: 10px;
            background: #384862;
            padding-top: 7px;
            padding-bottom: 7px;
            border-radius: 5px;
            font-size: 14px;
        }

        .offpercnt {
            color: red;
            float: right;
        }

        label {
            margin-top: 15px;
            margin-left: 15px;
            font-weight: bold;
        }

        label {
            display: inline-block;
            margin-bottom: .5rem;
        }

        .w-25 {
            width: 30% !important;
        }
        /*card design end---------------------------------------------------*/
    </style>
</head>
<body id="pageone">
    <form id="form1" runat="server">
        <div>

            <!--1. Navbar section-->
            <%--<nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#"></a>
         
            </nav>--%>

            <nav class="navbar fixed-top navbar-light text-center bg-blue">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 50px;">ecoDENT
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Dental Equipment & Supplies Gurugram</p>
                </a>
                <span id="UserName_n_Pic" runat="server" class="userpic">&nbsp;&nbsp; <i class="fa fa-pencil" style="font-size: 25px;"></i></span>
            </nav>
            <section style="margin-top: 50px;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2 col-md-2"></div>
                        <div class="col-sm-8 col-md-8">
                            <div class="Paymentcard">
                                <h2 class="pay-title" style="font-size: 25px;" id="Status" runat="server">
                                    <i class="fa fa-times-circle-o" aria-hidden="true"></i>Payment of Rs. 500 is pending !
                                    <i class="fa fa-check-circle-o" aria-hidden="true"></i>Payment of Rs. 500 is successfull !
                                </h2>
                                <div class="row">
                                    <div class="col-12" style="text-align: center;">
                                        <button type="button" class="btn btn-primary border-0 pull-right btnstyle" style="display:none;" id="TryAgain">Try Again</button>
                                        <button type="button" class="btn btn-primary border-0 pull-right btnstyle" style="display:none;" id="GoToHome">Go to Home</button>
                                        <button type="button" class="btn btn-primary border-0 pull-right btnstyle" style="display:none;" id="MyOrders">My Orders</button>
                                    </div>
                                </div>
                                <hr />
                                <br />
                                <br />
                            </div>
                        </div>
                        <div class="col-sm-2 col-md-2"></div>
                    </div>
                </div>

            </section>

        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script>
        var link = window.location.origin;
        $('#MyOrders').click(function (e) {
            e.stopImmediatePropagation();
            window.location.href = link + '/Components/scheduler.aspx';
        })
        $('#GoToHome').click(function (e) {
            e.stopImmediatePropagation();
            var HeaderId = $(this).attr('headerid');
            setCookie('orderconfirm', HeaderId, 1);
            window.location.href = link + '/Home.aspx';
        })

        $('#TryAgain').click(function (e) {
            e.stopImmediatePropagation();
            var TrxId = $(this).attr('trxid');
            window.location.href = link + '/Payments/Payment_details.aspx/trxid/' + TrxId;
        })

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

    </script>
</body>
</html>
