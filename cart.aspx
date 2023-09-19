<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Assest/css/category_main.css" rel="stylesheet" />
    <link href="swiper-master/packages/css/swiper.min.css" rel="stylesheet" />
    <script src="Assest/js/jquery-3.5.1.min.js"></script>
    <link href="Assest/css/cart_main.css" rel="stylesheet" />
    <link href="Assest/css/subcategory_main.css" rel="stylesheet" />
    <link href="Admin/css/textfield.css" rel="stylesheet" />
    <link href="Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="Assest/css/alert.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>
    <style>
        #addAddressWarning {
            z-index: 9999;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
            height: 100%;
            background: #00000047;
        }

        .warningAddress {
            margin-top: 161px !important;
            width: 400px;
            text-align: center;
            padding: 20px;
            margin: auto;
        }

        .delBox {
            background: #f5f5f5fc;
            border-radius: 10px;
        }

        .addressTitle {
            padding: 20px;
        }

        .addaddressbtn {
            border-top: 1px solid #d5d5d5;
        }

        @media screen and (max-width:767px) {
            .warningAddress {
                width: 100%;
                text-align: center;
                padding: 20px;
                margin: auto;
                margin-top: 235px;
            }
        }


        .roundcircle {
            border: 1px solid #ccc;
            float: right;
            border-radius: 50%;
            margin-top: -5px;
            padding-top: 3px;
            height: 26px;
            width: 26px;
        }

        ._ChangeStore_btn {
            font-size: 13px;
            font-weight: 400;
            background: #55e6c1;
            color: white;
            border-radius: 10px;
            width: 100px;
            margin-top: 32px;
            text-align: center;
            margin-left: -30px;
        }

        .changeaddressbtn a {
            border: .5px solid #16c7d7;
            padding: 1px;
            padding-right: 20px;
            padding-left: 20px;
            border-radius: 5px;
            padding-bottom: 2px;
            float: right;
            color: #16c7d7;
        }

        body {
            font-family: Arial, Helvetica, sans-serif !important;
            font-size: .9rem;
        }

        .h6, h6 {
            font-size: .9rem;
        }

        .card {
            box-shadow: none !important;
            transition: 1s;
        }

        /*.bg-light {
            background: #3f43fd !important;
            height: 80px;
        }*/

        ._menu_opt {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: black;
        }

        .footer {
            background: white !important;
        }

        .checkoutbtn {
            background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%);
        }

        .navbar-brand {
            margin-left: 50px;
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

        .day {
            /*padding: 5px;*/
            background: #ebebeb;
            margin: auto;
            font-weight: 700;
            text-align: center;
            justify-content: center;
            width: 58px;
            display: inline-table;
            padding-top: 10px;
        }

        .dayactive {
            background: #68e0eb;
            color: white;
            transition: 1s;
            justify-content: center;
            width: 58px;
            display: inline-table;
        }

        .triangle {
            /* display: inline-block;
    margin: 0 5px;
    vertical-align: middle;*/
            display: inline-block;
            vertical-align: middle;
            margin-top: 10px;
            /* z-index: 1; */
            /*  position: absolute;*/
            /* border: 0px; */
            margin-top: -8px;
            transition: 1s;
            display: none;
            margin-left: 17px;
        }


        .triangle-0 {
            width: 60px;
            height: 60px;
            border-bottom: solid 30px rgb(200,30,50);
            border-right: solid 30px rgb(200,30,50);
            border-left: solid 30px transparent;
            border-top: solid 30px transparent;
        }

        .triangle-1 {
            width: 60px;
            height: 60px;
            border-bottom: solid 30px rgb(200,30,50);
            border-left: solid 30px rgb(200,30,50);
            border-right: solid 30px transparent;
            border-top: solid 30px transparent;
        }

        .triangle-2 {
            width: 30px;
            height: 60px;
            border-right: solid 30px rgb(200,30,50);
            border-bottom: solid 30px transparent;
            border-top: solid 30px transparent;
        }

        .triangle-3 {
            width: 30px;
            height: 60px;
            border-left: solid 30px rgb(200,30,50);
            border-bottom: solid 30px transparent;
            border-top: solid 30px transparent;
        }

        .triangle-4 {
            width: 15px;
            height: 15px;
            border-bottom: solid 10px rgb(255,255, 255);
            border-left: solid 10px transparent;
            border-right: solid 10px transparent;
            transition: 1s;
        }

        .triangle-5 {
            width: 60px;
            height: 30px;
            border-top: solid 30px rgb(200,30,50);
            border-left: solid 30px transparent;
            border-right: solid 30px transparent;
        }


        .indishow {
            display: block !important;
            transition: 1s;
        }


        .timing_checked {
            margin: 10px;
            border-radius: 5px;
            color: white;
            padding: 5px;
            padding-top: 10px;
            padding-bottom: 10px;
            /* background: linear-gradient(90deg, rgb(116 116 116) 87%, rgb(149 149 149) 35%, rgba(85,230,193,1) 88%) !important;*/
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
        }

        .timing {
            margin: 10px;
            border-radius: 5px;
            color: #000;
            font-size: 14px;
            padding: 5px;
            font-weight: 500;
            background: #fff;
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #ffffff26, 0 0px 2px #00000026, 0 0px 0px #00000026;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .slots {
            height: 35vh;
            overflow: auto;
            box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;
        }


        .fa-check-circle {
            float: right;
            color: #68e0eb;
        }

        .header {
            padding: 15px;
            background: #3f43fd;
            color: white;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            position: fixed;
            z-index: 9;
            width: 100%;
        }

        #shedulersection {
            margin-top: 83px;
        }

        .itemcard {
            border: 1px solid #e1e1e1;
            background: #f7f7f7;
            border-radius: 5px;
        }

        .retailrdetails {
            padding-left: 25px;
        }

        .deliverslotbtn {
            margin: 10px;
            padding: 5px;
            background: #55e6c1;
            text-align: center;
            color: white;
            border-radius: 5px;
        }


        .ui-dialog {
            width: 100% !important;
            top: 213.149px !important;
            left: 0px !important;
            z-index: 101 !important;
            position: fixed !important;
        }

        .ui-widget-header {
            border: 1px solid #64cdb2 !important;
            background: #6fd4ba !important;
            color: #ffffff !important;
            font-weight: bold;
        }

        input {
            outline: none !important;
        }


        .changeaddressbtn a:hover {
            border: .5px solid #55e6c1;
            background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%);
            color: #fff;
        }
    </style>
</head>
<body id="pageone">
    <%-- loader start --%>

    <div id="preload" style="display: none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>

    <%-- loader end  --%>

    <form id="form1" runat="server">
        <div>

            <!--1. Navbar section-->
            <nav class="navbar fixed-top navbar-light bg-light">
                <a class="navbar-brand" href="javascript:void(0);" style="margin-left: 40px;" id="StoreName" runat="server"></a>
                <%--<a href="Components/store" style="color:white;"><span class="userpic" id="UserName_n_Pic" runat="server">&nbsp;&nbsp; <i class="fa fa-pencil" style="font-size: 25px;"></i></span></a>--%>
            </nav>

            <!--3. Category -->
            <div class="container" style="margin-top: 100px;">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <strong>Note!</strong> Your Order will be dispatched in 2-3 working days.   
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
  </button>
                        </div>
                    </div>
                </div>
            </div>
            <section id="categorysection" runat="server">
                <div class="container">

                    <div>
                        <span class="tag ">Your Cart</span> &nbsp;&nbsp;<span id="item_count">5 items</span>
                        <a href="javascript:void(0);"><span class="continue btnstyle ">Keep Shopping</span></a>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm-8 col-md-8">
                                <div class="checkoutitems" id="checkoutItems">
                                </div>
                            </div>

                            <div class="col-sm-4 col-md-4">
                                <div class="card p-2">
                                    <h5 class="ml-3">Total <span class="pull-right">500</span></h5>
                                    <hr class="m-0" />
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <a href="javascript:void(0);" class="btn checkoutbtn w-100 btnstyle ">Checkout now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card mt-1">
                        <div class="row mb-2">
                            <div class="col-sm-8 col-md-8 text-center">
                                <label>Your Cart is empty</label>
                            </div>
                            <div class="col-sm-4 col-md-4 text-center">
                                <a href="javascript:void(0);" class="btn checkoutbtn btnstyle  btnstyle ">Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section id="Section1" runat="server" style="margin-top: 50px;">
            </section>
        </div>
    </form>
    <div style="height: 50px;"></div>
    <%-- <footer>
        <div class="footer"></div>
    </footer>--%>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <div id="contactus" style="margin-top: -90px; text-align: center; background: white; padding: 10px;" runat="server">For any queries whatsapp :<a href="tel:+91 96675 50915">+91 96675 50915</a></div>
    <div class="cardatmcls atmcard">
        <div class="walletbtn" style="text-align: right; margin-right: 10px;">
            <i style="font-size: 22px; margin-top: 6px;"
                class="fa fa-times-circle "></i>
        </div>
        <div class="chip" style="visibility: hidden;">
            <div class="side left"></div>
            <div class="side right"></div>
            <div class="vertical top"></div>
            <div class="vertical bottom"></div>
        </div>
        <div class="data">
            <div class="pan" title="My Active balance" id="active_bal" runat="server"><span>Wallet Balance</span></div>
            <div class="first-digits d-none">4123</div>
            <div class="container">
                <div class="" style="width: 100%;">
                    <div class="" style="width: 100%;">
                        <label style="font-size: 15px; font-weight: 500; text-transform: initial;">Add money to my In-Store wallet</label>
                        <div style="height: 35px; background: white; margin-left: 5px; margin-right: 5px; border-radius: 5px; display: flex;">
                            <svg height='35px' width='35px' style="" fill="#000000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                                <path d="M57.127,41.981c0-1.104-0.896-2-2-2H30.873c-1.104,0-2,0.896-2,2s0.896,2,2,2h9.826c2.88,0,5.307,1.95,6.048,4.598H30.873  c-1.104,0-2,0.896-2,2c0,1.104,0.896,2,2,2H46.54c-0.922,2.328-3.19,3.981-5.841,3.981h-9.826c-0.818,0-1.554,0.498-1.857,1.258  c-0.304,0.761-0.113,1.629,0.48,2.191l16.271,15.451c0.387,0.368,0.881,0.55,1.377,0.55c0.528,0,1.058-0.209,1.449-0.622  c0.762-0.802,0.729-2.066-0.072-2.828l-12.638-12h4.815c4.877,0,8.963-3.416,10.015-7.98h4.413c1.104,0,2-0.896,2-2  c0-1.104-0.896-2-2-2h-4.294c-0.285-1.712-0.99-3.281-2.013-4.598h6.307C56.23,43.981,57.127,43.086,57.127,41.981z M77,38.5  c-1.104,0-2,0.896-2,2v39c0,4.411-3.589,8-8,8H21c-4.411,0-8-3.589-8-8v-48c0-4.411,3.589-8,8-8h36c1.104,0,2-0.896,2-2  s-0.896-2-2-2H21c-6.617,0-12,5.383-12,12v48c0,6.617,5.383,12,12,12h46c6.617,0,12-5.383,12-12v-39C79,39.396,78.104,38.5,77,38.5z   M89,19.5H79v-9c0-1.104-0.896-2-2-2s-2,0.896-2,2v9h-9.875c-1.104,0-2,0.896-2,2s0.896,2,2,2H75v9c0,1.104,0.896,2,2,2s2-0.896,2-2  v-9h10c1.104,0,2-0.896,2-2S90.104,19.5,89,19.5z"></path></svg>

                            <input id="addbal" type="number" style="width: 70%; font-size: 13px; height: 35px; padding-left: 5px; margin-left: -4px; border-radius: 20px; border: none;" placeholder="Amount" />
                            <a class="btn addmoneybtn2 MoneyAdd w-25">Add money</a>

                        </div>

                    </div>
                    <div class="" style="width: 100%;">
                        <label style="font-size: 15px; font-weight: 500; text-transform: initial;">Pay to Retailer from In-Store wallet</label>
                        <div style="background: white; height: 35px; margin-left: 5px; margin-right: 5px; border-radius: 5px; display: flex;">
                            <svg height='35px' width='35px' fill="#000000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                                <path d="M61.127,36.481c0-1.104-0.896-2-2-2H34.873c-1.104,0-2,0.896-2,2s0.896,2,2,2h9.826c2.88,0,5.307,1.95,6.048,4.598H34.873  c-1.104,0-2,0.896-2,2s0.896,2,2,2H50.54c-0.922,2.328-3.19,3.981-5.841,3.981h-9.826c-0.818,0-1.554,0.499-1.857,1.259  c-0.304,0.76-0.113,1.628,0.48,2.191l16.271,15.451c0.387,0.368,0.882,0.55,1.377,0.55c0.529,0,1.058-0.209,1.45-0.623  c0.761-0.801,0.728-2.066-0.073-2.827L39.884,55.061h4.815c4.877,0,8.963-3.417,10.015-7.981h4.413c1.104,0,2-0.896,2-2  s-0.896-2-2-2h-4.294c-0.285-1.712-0.99-3.281-2.012-4.598h6.306C60.231,38.481,61.127,37.586,61.127,36.481z M81,45  c-1.104,0-2,0.896-2,2v27c0,4.411-3.589,8-8,8H25c-4.411,0-8-3.589-8-8V26c0-4.411,3.589-8,8-8h37c1.104,0,2-0.896,2-2s-0.896-2-2-2  H25c-6.617,0-12,5.383-12,12v48c0,6.617,5.383,12,12,12h46c6.617,0,12-5.383,12-12V47C83,45.895,82.104,45,81,45z M95.589,20.76  L82.414,7.586c-0.75-0.75-2.078-0.75-2.828,0L66.412,20.76c-0.781,0.781-0.781,2.047,0,2.828c0.781,0.781,2.047,0.781,2.828,0  l9.76-9.76V40c0,1.104,0.896,2,2,2s2-0.896,2-2V13.829l9.761,9.76c0.391,0.391,0.902,0.586,1.414,0.586s1.023-0.195,1.414-0.586  C96.37,22.808,96.37,21.541,95.589,20.76z"></path></svg>

                            <input id="payment" type="number" style="width: 70%; font-size: 13px; height: 35px; padding-left: 5px; margin-left: -4px; border-radius: 20px; border: none;" placeholder="Amount" />
                            <a class=" btn addmoneybtn2 MoneyPay w-25">Pay </a>

                        </div>

                    </div>
                </div>


            </div>


        </div>
        <div class="lines-down"></div>
        <%--<div class="lines-up"></div>--%>
    </div>
    <footer>
        <div class="footer boxshadow" style="color: #000; height: auto;" id="active_balance">
            <div class="row">
                <div class="col-3 text-center menuopt" onclick="location.href='../home.aspx'">
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
                        <label class="p-0 m-0 " style="font-weight: 500!important;">Home</label></a>
                </div>
                <div class="col-3 text-center menuopt" onclick="location.href='../Components/scheduler.aspx'">
                    <a class="_menu_opt" href="../Components/scheduler.aspx">
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
                        <label class="p-0 m-0 " style="font-weight: 500!important;">Order</label></a>
                </div>
                <div class="col-3 text-center _walletbtn">
                    <a class="_menu_opt">

                        <%-- <svg id="Layer_1" enable-background="new 0 0 480 480" height="22.398px" viewBox="0 0 480 480" width="22.398px" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xmlns="http://www.w3.org/2000/svg">
                            <path d="m453 236.893v-95.393c0-22.056-17.944-40-40-40h-13.558l3.005-10.441c4.894-16.995-4.901-34.71-21.898-39.604l-90.771-26.13c-4.247-1.222-8.679 1.229-9.9 5.475-1.223 4.246 1.229 8.678 5.475 9.901l57.064 16.427c-7.059 13.752-7.317 30.155-.177 44.372h-167.24v-63c0-4.418-3.582-8-8-8s-8 3.582-8 8v63h-27v-63c0-4.418-3.582-8-8-8s-8 3.582-8 8v63h-35v-69c0-8.822 7.178-16 16-16h135c8.822 0 16 7.178 16 16v44c0 4.418 3.582 8 8 8s8-3.582 8-8v-44c0-17.645-14.355-32-32-32h-135c-17.645 0-32 14.355-32 32v69h-25c-22.056 0-40 17.944-40 40v298c0 22.056 17.944 40 40 40h373c22.056 0 40-17.944 40-40v-58.5c0-4.418-3.582-8-8-8s-8 3.582-8 8v58.5c0 13.233-10.767 24-24 24h-373c-13.233 0-24-10.767-24-24v-298c0-13.233 10.767-24 24-24h373c13.233 0 24 10.767 24 24v95h-66c-17.645 0-32 14.355-32 32v44c0 17.645 14.355 32 32 32h77.021c17.568 0 31.979-14.307 31.979-32v-44c0-15.944-11.722-29.199-27-31.607zm-94.77-175.212 17.893 5.151c8.499 2.447 13.394 11.303 10.949 19.801l-4.28 14.867h-21.384c-10.102-11.236-11.038-27.576-3.178-39.819zm105.77 250.819c0 8.822-7.178 16-16 16h-77c-8.822 0-16-7.178-16-16v-44c0-8.822 7.178-16 16-16h77c8.822 0 16 7.178 16 16zm-63-22c0 4.418-3.582 8-8 8h-12c-4.418 0-8-3.582-8-8s3.582-8 8-8h12c4.418 0 8 3.582 8 8z" fill="gray" />
                        </svg>--%>
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
                        <label class="p-0 m-0 " style="font-weight: 500!important;">Wallet</label></a>
                </div>

                <div class="col-3 text-center menuopt" id="Mycart" runat="server" onclick="location.href='../home.aspx'">
                    <a class="_menu_opt" href="../home.aspx">


                        <svg version="1.1" id="Capa_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 426.667 426.667" width="22.398px" height="22.398px" style="enable-background: new 0 0 446.853 446.853; margin-bottom: -13px; fill: #55e6c1;" xml:space="preserve">
                            <g>
                                <g>
                                    <g>
                                        <path d="M128,341.333c-23.573,0-42.453,19.093-42.453,42.667s18.88,42.667,42.453,42.667c23.573,0,42.667-19.093,42.667-42.667
				S151.573,341.333,128,341.333z"
                                            fill="#27cacc" />
                                        <path d="M151.467,234.667H310.4c16,0,29.973-8.853,37.333-21.973L424,74.24c1.707-2.987,2.667-6.507,2.667-10.24
				c0-11.84-9.6-21.333-21.333-21.333H89.92L69.653,0H0v42.667h42.667L119.36,204.48l-28.8,52.267
				c-3.307,6.187-5.227,13.12-5.227,20.587C85.333,300.907,104.427,320,128,320h256v-42.667H137.067
				c-2.987,0-5.333-2.347-5.333-5.333c0-0.96,0.213-1.813,0.64-2.56L151.467,234.667z"
                                            fill="#27cacc" />
                                        <path d="M341.333,341.333c-23.573,0-42.453,19.093-42.453,42.667s18.88,42.667,42.453,42.667
				C364.907,426.667,384,407.573,384,384S364.907,341.333,341.333,341.333z"
                                            fill="#27cacc" />
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

                        <label class="p-0 m-0 " style="font-weight: 500!important;">Add more</label>
                    </a>
                </div>
            </div>
        </div>
    </footer>



    <div class="modal fade" id="addressmodalpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class=" ">
                <div class=" ">
                    <div id="addAddressWarning">
                        <div class="warningAddress">
                            <div class="delBox">
                                <div class="addressTitle">
                                    <img style="width: 30%;" src="images/address.png" />
                                    <br />
                                    <br />
                                    <h5>Please add Delivery address.</h5>

                                </div>
                                <div style="width: 100%; display: flex;" class="addaddressbtn">
                                    <div style="width: 50%; border-right: 1px solid rgb(207, 207, 207); padding: 10px;"><a style="font-size: 17px;" class="cancelAddress">Cancel </a></div>
                                    <div onclick="location.href='../Components/address.aspx'" style="width: 50%; padding: 10px;"><a style="font-size: 17px;" href="../Components/address.aspx" class="add_address">Ok</a></div>


                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="Admin/js/global.js"></script>
    <script src="Assest/js/ripple-effect.js"></script>
    <script src="Assest/js/alert.js"></script>
    <script src="Admin/js/textfield.js"></script>
    <script src="Assest/js/owl.carousel.min.js"></script>
    <script src="Assest/bootstrap.js"></script>
    <script src="Assest/js/jquery-ui.min.js"></script>
    <script src="swiper-master/packages/js/swiper.min.js"></script>
    <script src="Items/Add_Balance.js"></script>
    <script src="jquery-helper/cart-helper.js"></script>
    <script>
        window.addEventListener("pageshow", function (event) {
            var historyTraversal = event.persisted || (typeof window.performance != "undefined" && window.performance.navigation.type === 2);
            if (historyTraversal) {
                // Handle page restore.
                //alert('refresh');
                window.location.reload();
            }
        });
        $(function () {
             
            getAllitemsofcart();

        });

        function getAllitemsofcart() {
            $("#categorysection").empty();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "cart.aspx/getMenuListdatatable",
                data: '{}',
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    if (data.d != "") {
                       
                        $("#categorysection").append(data.d);
                        Bindcartdata();
                        var swiper = new Swiper('.swiper-container', {
                            scrollbar: {
                                el: '.swiper-scrollbar',
                                hide: true,
                                autoplay: true,
                                lazyLoad: true,
                                responsiveClass: true,
                                loop: true,
                                margin: 5,
                                stagePadding: 15,
                                autoHeight: true,
                                autoplayTimeout: 7000,
                                smartSpeed: 800,
                            },
                            autoplay: { delay: 6000, }
                        });
                    }
                },
                complete: function () {
                    $("#preload").hide();
                }
            });
        }



        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }

        


        function Bindcartdata() {


           


            var minVal = 0, maxVal = 20; // Set Max and Min values
            // Increase product quantity on cart page
            $(".increaseQty").on('click', function (e) {
                supermario()
                e.preventDefault();
                e.stopImmediatePropagation();
                var $parentElm = $(this).parents(".qtySelector");

                $(this).addClass("clicked");
                setTimeout(function () {
                    $(".clicked").removeClass("clicked");
                }, 100);
                var value = $parentElm.find(".qtyValue").val();
                if (value < maxVal) {
                    value++;

                }
                $parentElm.find(".qtyValue").val(value);

                var Price = "";
                var MID = $(this).parent().parent().parent().parent().attr('mid');
                var Offer_ID = $(this).parent().parent().parent().parent().attr('offer_id');
                var Deal_ID = $(this).parent().parent().parent().parent().attr('deal_id');
                var SDID = $(this).parent().parent().parent().parent().attr('sdid');
                var Item_Name = '';
                var OID = '';
                var Option_Name = '';
                var Flag = 'SUB';
                var Qty = value;

                if (MID != "0" && Offer_ID == "" && Deal_ID == "" && SDID == "") {
                    getData(Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                }
                else if (MID == "0" && Offer_ID != "" && Deal_ID == "" && SDID == "") {
                    setOrderByOffer(Offer_ID, Flag, Qty);
                }
                else if (MID == "0" && Offer_ID == "" && Deal_ID != "" && SDID == "") {
                    setOrderByDeal(Deal_ID, Flag, Qty);
                }
                else if (MID != "0" && Offer_ID == "" && Deal_ID == "" && SDID != "") {
                    $parentElm.find(".qtyValue").val('1');
                }
                // getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                getAllitemsofcart();

            });
            // Decrease product quantity on cart page
            $(".decreaseQty").on('click', function (e) {
                supermario()
                e.preventDefault();
                e.stopImmediatePropagation();
                var $parentElm = $(this).parents(".qtySelector");
                var addbtnshow = $(this).parent().parent().parent().parent().find(".addbtn2");
                var addbtn2show = $(this).parent().parent().parent().parent().find(".addbtn");
                $(this).addClass("clicked");
                setTimeout(function () {
                    $(".clicked").removeClass("clicked");
                }, 100);

                var Price = '';
                var MID = $(this).parent().parent().parent().parent().attr('mid');
                var Item_Name = '';
                var OID = '';
                var Option_Name = '';
                var value = $parentElm.find(".qtyValue").val();

                var Offer_ID = $(this).parent().parent().parent().parent().attr('offer_id');
                var Deal_ID = $(this).parent().parent().parent().parent().attr('deal_id');
                var SDID = $(this).parent().parent().parent().parent().attr('sdid');
                if (value > 1) {
                    value--;
                    var Flag = 'SUB';
                }
                else {
                    var Flag = 'SUB';
                }
                $parentElm.find(".qtyValue").val(value);
                var Qty = value;
                if (MID != "0" && Offer_ID == "" && Deal_ID == "" && SDID == "") {
                    getData(Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                }
                else if (MID == "0" && Offer_ID != "" && Deal_ID == "") {
                    setOrderByOffer(Offer_ID, Flag, Qty);
                }
                else if (MID == "0" && Offer_ID == "" && Deal_ID != "") {
                    setOrderByDeal(Deal_ID, Flag, Qty);
                }
                else if (MID != "0" && Offer_ID == "" && Deal_ID == "" && SDID != "") {
                    $parentElm.find(".qtyValue").val('1');
                }
                //getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                getAllitemsofcart();
            });

            $('.deleteItem').click(function (e) {
                supermario()
                e.preventDefault();
                e.stopImmediatePropagation();
                var Price = "";
                var MID = $(this).parent().parent().parent().attr('mid');
                var Item_Name = '';
                var OID = '';
                var Option_Name = '';
                var Flag = 'DELETE';
                var Qty = "0";

                var Offer_ID = $(this).parent().parent().parent().attr('offer_id');
                var Deal_ID = $(this).parent().parent().parent().attr('deal_id');
                var SDID = $(this).parent().parent().parent().attr('sdid');
                $(this).parent().parent().parent().remove();


                //if (MID != "0" && Offer_ID == "" && Deal_ID == "" && SDID == "") {
                //    getData(Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                //}
                //else if (MID == "0" && Offer_ID != "" && Deal_ID == "") {
                //    setOrderByOffer(Offer_ID, Flag, Qty);
                //}
                //else if (MID == "0" && Offer_ID == "" && Deal_ID != "") {
                //    setOrderByDeal(Deal_ID, Flag, Qty);
                //}
                //else if (MID != "0" && Offer_ID == "" && Deal_ID == "" && SDID != "") {
                //    fnOrderPuchByStealDeal(SDID, Flag, Qty)
                //}

                if (MID != "0") {
                    getData(Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                }
                else if (Offer_ID != "") {
                    setOrderByOffer(Offer_ID, Flag, Qty);
                }
                else if (Deal_ID != "") {
                    setOrderByDeal(Deal_ID, Flag, Qty);
                }
                else if (SDID != "") {
                    fnOrderPuchByStealDeal(SDID, Flag, Qty)
                }
                getAllitemsofcart();


            })


            
            function fnOrderPuchByStealDeal(SDID, Flag, Qty) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../Items/Items.aspx/fnOrderPuchByStealDeal",
                    data: '{SDID: "' + SDID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        //if (Flag == 'DELETE') {
                        //    location.reload();
                        //}
                        //else {
                        var data_split = data.d;
                        data_split = data_split.split('|');
                        if (data_split[0] == "0") {
                            getAllitemsofcart();
                        }
                        $('#item_count').text('');
                        $('#item_count').text(data_split[0] + ' item(s)');
                        $('.sub_total').text(parseFloat(data_split[1]) + parseFloat(data_split[6]));
                        //$('.sub_total').text(data_split[1]);
                        $('.delvieryCharges').text(data_split[2]);
                        $('.total_amount').text(parseFloat(data_split[1]) + parseFloat(data_split[2]));
                        $('.discount').html(data_split[6])
                        var stealClass = "";
                        var minus = parseFloat(data_split[5]) - parseFloat(data_split[1]);
                        //var steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + data_split[5] +
                        //    "<br><br>Add items worth Rs " + minus + " to your cart to qualify for steal deal";

                        var steal_deal_line = "<br/>Add items worth Rs " + minus + " to your cart to qualify for steal deal <br/>";

                        if (data_split[5] == "0") {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        if (minus <= 0) {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        $('.stealclass').removeClass('d-none');
                        $('.stealclass').addClass(stealClass);
                        $('#minAmountStealDeal').html(steal_deal_line);

                        var MinFor_X = parseFloat(data_split[4]) - parseFloat(data_split[1]);
                        if (data_split[3] == 'N') {
                            $('.deliveryText').html('Free Delivery! you have achieved minimum order amount');
                        }
                        else if (data_split[3] == 'X') {
                            $('.deliveryText').html("Add Rs " + MinFor_X + " to get the free delivery");
                        }
                        else if (data_split[3] == 'Z') {
                            $('.deliveryText').html('Shop above Rs ' + data_split[4] + ' for free delivery');
                        }
                        else {
                            $('.deliveryText').html("You will be charged Rs " + data_split[2] + " as delivery charges");
                        }
                        // }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        showpopup(e.statusText);
                    }
                })
            }

            function supermario() {
                var userAgent = navigator.userAgent || navigator.vendor || window.opera;
                if (/android/i.test(userAgent)) {
                    navigator.vibrate([215,])
                }
            }

            function getData(Price, MID, Item_Name, OID, Option_Name, Flag, Qty) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../Items/Items.aspx/fnOrderPuch",
                    data: '{Price: "' + Price + '", MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag
                        + '", Qty:"' + Qty + '", Item_Name:"' + Item_Name
                        + '", Option_Name:"' + Option_Name + '"}',
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        var data_split = data.d;
                        data_split = data_split.split('|');
                        if (data_split[0] == "0") {
                            getAllitemsofcart();
                        }
                        $('#item_count').text('');
                        $('#item_count').text(data_split[0] + ' item(s)');
                        $('.sub_total').text(parseFloat(data_split[1]) + parseFloat(data_split[6]));
                        //$('.sub_total').text(data_split[1]);
                        $('.delvieryCharges').text(data_split[2]);
                        $('.total_amount').text(parseFloat(data_split[1]) + parseFloat(data_split[2]));
                        $('.discount').html(data_split[6])
                        var stealClass = "";
                        var minus = parseFloat(data_split[5]) - parseFloat(data_split[1]);
                        //var steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + data_split[5] +
                        //    "<br><br>Add items worth Rs " + minus + " to your cart to qualify for steal deal";

                        var steal_deal_line = "<br/>Add items worth Rs " + minus + " to your cart to qualify for steal deal <br/>";

                        if (data_split[5] == "0") {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        if (minus <= 0) {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        $('.stealclass').removeClass('d-none');
                        $('.stealclass').addClass(stealClass);
                        $('#minAmountStealDeal').html(steal_deal_line);


                        var MinFor_X = parseFloat(data_split[4]) - parseFloat(data_split[1]);
                        if (data_split[3] == 'N') {
                            $('.deliveryText').html('Free Delivery! you have achieved minimum order amount');
                        }
                        else if (data_split[3] == 'X') {
                            $('.deliveryText').html("Add Rs " + MinFor_X + " to get the free delivery");
                        }
                        else if (data_split[3] == 'Z') {
                            $('.deliveryText').html('Shop above Rs ' + data_split[4] + ' for free delivery');
                        }
                        else {
                            $('.deliveryText').html("You will be charged Rs " + data_split[2] + " as delivery charges");
                        }
                        // }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        alert(e.statusText);
                    }
                })
            }

            $('.checkOut').click(function (e) {
                e.stopImmediatePropagation();
                var Header_ID = $(this).attr('header_id');
                $('#Section1').empty();
                if ($('.notavailable').length > 0) {
                    showpopup('It seems there are some items are out of stock in your cart. Please remove them first');
                    return;
                }
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "cart.aspx/CheckStatusForLogin",
                    data: '{}',
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        $('#Section1').empty();

                        //if ((data.d).toLowerCase() == 'success') {
                        if ((data.d).toLowerCase() == 'success') {
                            if ($.trim($('.addaddressexists').length) > 0) {

                                //var body = $("html, body");
                                //body.stop().animate({ scrollTop: $(".add_address").top }, 2000, 'swing', function () {
                                //});
                                //if (navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)) {
                                //    $(window).scrollTop($(".add_address").position().top);
                                //} else {
                                //    $('html, body').animate({
                                //        scrollTop: $(".add_address").offset().top - 200
                                //    }, 2000);
                                //}


                                //$('.add_address').focus();
                                //$("#addAddressWarning").show();
                                $("#addressmodalpopup").modal();
                            }
                            else {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "cart.aspx/PlaceOrder1",
                                    data: '{Total:"' + $('.total_amount').text() + '"}',
                                    beforeSend: function () {

                                    },
                                    dataType: "json",
                                    success: function (data) {
                                        $('.checkOut').css('display', 'none');
                                        $('#Section1').append(data.d);


                                        if (navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)) {
                                            $(window).scrollTop($('#Section1').position().top);
                                        } else {
                                            $('html, body').animate({
                                                scrollTop: $("#Section1").offset().top - 200
                                            }, 2000);
                                        }



                                        //  $(window).scrollTop($('#Section1').position().top);
                                        $('input[name="customRadioInline1"]').change(function (e) {


                                            if ($(this).prop('checked')) {
                                                $('input[name="customRadioInline1"]').prop('checked', false);
                                                $('input[name="customRadioInline1"]').removeAttr('checked');
                                                $(this).prop('checked', true);
                                                $(this).attr('checked', 'checked');
                                            } else {
                                                $(this).prop('checked', false);
                                                $('input[name="customRadioInline1"]').prop('checked', false);
                                                $('input[name="customRadioInline1"]').removeAttr('checked');
                                            }

                                        });

                                        $('input[name="customRadioInline3"]').change(function (e) {


                                            if ($(this).prop('checked')) {
                                                $('input[name="customRadioInline3"]').prop('checked', false);
                                                $('input[name="customRadioInline3"]').removeAttr('checked');
                                                $(this).attr('checked', 'checked');
                                                $(this).prop('checked', true);
                                            } else {
                                                $(this).prop('checked', false);
                                                $(this).removeAttr('checked')
                                                $('input[name="customRadioInline3"]').prop('checked', false);
                                                $('input[name="customRadioInline3"]').removeAttr('checked');
                                            }

                                        });

                                        $('#customCheck1').change(function (e) {
                                            e.preventDefault();
                                            if ($(this).prop('checked')) {
                                                $(this).attr('checked', 'checked');
                                                $(this).prop('checked', true);
                                            } else {
                                                $(this).removeAttr('checked')
                                                $(this).prop('checked', false);
                                            }

                                            $('input[name="customRadioInline1"]').prop('checked', false);
                                            $('input[name="customRadioInline1"]').removeAttr('checked');

                                        })

                                        $('#Final_Submit').click(function (f) {
                                            f.stopImmediatePropagation();

                                            var Address_ID = $('.address_cust').attr('address_id');
                                            var Delivery_ID = $('.selectedTimeSlot').attr('bdid');
                                            var Prepaid_flag = '';
                                            var Other_Payment_flag = '';
                                            var OtherPaymentMethod = '';
                                            var Prepaid_Balance = $("label[for='customCheck1']").find('strong').text().replace(" Rs. ", "") || 0;
                                            var Flag = $("[name='customRadioInline3']:checked").attr('flag');
                                            var Instructions = $.trim($("#any_instructions").val());
                                            if (parseFloat(Prepaid_Balance) > 0) {
                                                if (parseFloat(Prepaid_Balance) - parseFloat($('.total_amount').text()) > 0 && $("#customCheck1:checked").length > 0 && $("[name='customRadioInline1']:checked").length == 0) {
                                                    Prepaid_flag = 'Y';
                                                    Other_Payment_flag = 'N';
                                                    OtherPaymentMethod = '';
                                                    if (!$('.stealclass').hasClass('d-none')) {
                                                        ConfirmDialog1('Oops! your order does not qualify for steal deal. Should we place it without the steal deal?', Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                    else {
                                                        placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }

                                                }
                                                else if ($("[name='customRadioInline1']:checked").length > 0 && parseFloat(Prepaid_Balance) - parseFloat($('.total_amount').text()) > 0 && $("#customCheck1:checked").length > 0) {
                                                    Prepaid_flag = 'Y';
                                                    Other_Payment_flag = 'Y';
                                                    OtherPaymentMethod = $("[name='customRadioInline1']:checked").parent().find('label').text();
                                                    if (!$('.stealclass').hasClass('d-none')) {
                                                        ConfirmDialog1('Oops! your order does not qualify for steal deal. Should we place it without the steal deal?', Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                    else {
                                                        placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                }
                                                else if ($("[name='customRadioInline1']:checked").length > 0 && parseFloat(Prepaid_Balance) - parseFloat($('.total_amount').text()) > 0 && $("#customCheck1:checked").length == 0) {
                                                    Prepaid_flag = 'N';
                                                    Other_Payment_flag = 'Y';
                                                    OtherPaymentMethod = $("[name='customRadioInline1']:checked").parent().find('label').text();
                                                    if (!$('.stealclass').hasClass('d-none')) {
                                                        ConfirmDialog1('Oops! your order does not qualify for steal deal. Should we place it without the steal deal?', Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                    else {
                                                        placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                }
                                                else if ($("[name='customRadioInline1']:checked").length > 0 && parseFloat(Prepaid_Balance) - parseFloat($('.total_amount').text()) <= 0) {
                                                    if (!$('#customCheck1').prop('checked')) {
                                                        Prepaid_flag = 'N';
                                                        Other_Payment_flag = 'Y';
                                                        OtherPaymentMethod = $("[name='customRadioInline1']:checked").parent().find('label').text();
                                                        if (!$('.stealclass').hasClass('d-none')) {
                                                            ConfirmDialog1('Oops! your order does not qualify for steal deal. Should we place it without the steal deal?', Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                        }
                                                        else {
                                                            placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                        }
                                                    }
                                                    else {
                                                        Prepaid_flag = 'Y';
                                                        Other_Payment_flag = 'Y';
                                                        OtherPaymentMethod = $("[name='customRadioInline1']:checked").parent().find('label').text();
                                                        if (!$('.stealclass').hasClass('d-none')) {
                                                            ConfirmDialog1('Oops! your order does not qualify for steal deal. Should we place it without the steal deal?', Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                        }
                                                        else {
                                                            placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                        }
                                                    }

                                                }

                                                else {
                                                    showpopup('please select mode of payment first');
                                                }
                                            }
                                            else {
                                                if ($("[name='customRadioInline1']:checked").length > 0) {
                                                    Prepaid_flag = 'N';
                                                    Other_Payment_flag = 'Y';
                                                    OtherPaymentMethod = $("[name='customRadioInline1']:checked").parent().find('label').text();
                                                    if (!$('.stealclass').hasClass('d-none')) {
                                                        ConfirmDialog1('Oops! your order does not qualify for steal deal. Should we place it without the steal deal?', Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                    else {
                                                        placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                                                    }
                                                }
                                                else {
                                                    showpopup('please select mode of payment first');
                                                }
                                            }
                                        })
                                    },
                                    complete: function () {
                                        $("#preload").hide();
                                    },
                                    error: function (e) {
                                        alert(e.statusText);
                                    }
                                })
                            }
                        }
                        else {

                            var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?status=login';
                            window.history.pushState({ path: newurl }, '', newurl);

                        }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        alert(e.statusText);
                    }
                })



            })

            function ConfirmDialog1(message, Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions) {
                $('<div></div>').appendTo('body')
                    .html('<div><h6>' + message + '?</h6></div>')
                    .dialog({
                        modal: true,
                        title: 'Order Confirmation',
                        zIndex: 10000,
                        autoOpen: true,
                        width: 'auto',
                        resizable: false,
                        buttons: {
                            Yes: function () {


                                $(this).dialog("close");

                                placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions);
                            },
                            No: function () {

                                $(this).dialog("close");

                            }
                        },
                        close: function (event, ui) {
                            $(this).remove();
                        }
                    });
            };



            function setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            }
            function isEmail(email) {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return regex.test(email);
            }

            function placeOrderHeader(Header_ID, Address_ID, Delivery_ID, Prepaid_flag, Other_Payment_flag, OtherPaymentMethod, Flag, Instructions) {
                var Instructions = $.trim($('#any_instructions').val());
                var Email = $.trim($('#Email').val());
                if (!isEmail(Email)) {
                    showpopup('Please enter correct email');
                    return;
                }
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "cart.aspx/placeorderForCustomer",
                    data: "{Header_ID:'" + Header_ID + "',Address_ID:'" + Address_ID + "',Delivery_ID:'" +
                        Delivery_ID + "',Prepaid_flag:'" + Prepaid_flag + "',Other_Payment_flag:'" + Other_Payment_flag + "',OtherPaymentMethod:'" +
                        OtherPaymentMethod + "',Flag:'" + Flag + "',Instructions:'" + Instructions + "',Email:'" + Email + "'}",
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        if (data.d != "") {
                            var current_data = data.d;
                            current_data = current_data.split('|');
                            if (current_data[1] != '-1') {

                                setCookie('item_count', '0', '365');
                                if (OtherPaymentMethod == 'Online' || OtherPaymentMethod.toUpperCase() == 'PAYTM') {
                                    setTimeout(function () { window.location.href = '../Payments/Payment_details.aspx/trxid/' + current_data[3]; }, 2000);
                                }
                                else {
                                    var link = window.location.origin;
                                    setCookie('orderconfirm', current_data[1], 50);
                                    showpopup('Your order has been generated. your order number is ' + current_data[1]);
                                    setTimeout(function () { window.location.href = '../home.aspx'; }, 2000);
                                }
                            }
                            else {
                                showpopup('Sorry we can not process your request as you have only added steal deal');
                            }

                        }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        alert(e.statusText);
                    }
                })
            }



            function setOrderByOffer(Offer_ID, Flag, Qty) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../Items/Items.aspx/fnOrderPuchByOffer",
                    data: '{Offer_ID: "' + Offer_ID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        var data_split = data.d;
                        data_split = data_split.split('|');
                        if (data_split[0] == "0") {
                            getAllitemsofcart();
                        }
                        $('#item_count').text('');
                        $('#item_count').text(data_split[0] + ' item(s)');
                        $('.sub_total').text(parseFloat(data_split[1]) + parseFloat(data_split[6]));
                        //$('.sub_total').text(data_split[1]);
                        $('.delvieryCharges').text(data_split[2]);
                        $('.total_amount').text(parseFloat(data_split[1]) + parseFloat(data_split[2]));
                        $('.discount').html(data_split[6])

                        var stealClass = "";
                        var minus = parseFloat(data_split[5]) - parseFloat(data_split[1]);
                        //var steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + data_split[5] +
                        //    "<br><br>Add items worth Rs " + minus + " to your cart to qualify for steal deal";

                        var steal_deal_line = "<br/>Add items worth Rs " + minus + " to your cart to qualify for steal deal <br/>";

                        if (data_split[5] == "0") {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        if (minus <= 0) {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        $('.stealclass').removeClass('d-none');
                        $('.stealclass').addClass(stealClass);
                        $('#minAmountStealDeal').html(steal_deal_line);


                        var MinFor_X = parseFloat(data_split[4]) - parseFloat(data_split[1]);
                        if (data_split[3] == 'N') {
                            $('.deliveryText').html('Free Delivery! you have achieved minimum order amount');
                        }
                        else if (data_split[3] == 'X') {
                            $('.deliveryText').html("Add Rs " + MinFor_X + " to get the free delivery");
                        }
                        else if (data_split[3] == 'Z') {
                            $('.deliveryText').html('Shop above Rs ' + data_split[4] + ' for free delivery');
                        }
                        else {
                            $('.deliveryText').html("You will be charged Rs " + data_split[2] + " as delivery charges");
                        }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        alert(e.statusText);
                    }
                })
            }

            function setOrderByDeal(Deal_ID, Flag, Qty) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../Items/Items.aspx/fnOrderPuchByDeal",
                    data: '{Deal_ID: "' + Deal_ID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        var data_split = data.d;
                        data_split = data_split.split('|');
                        if (data_split[0] == "0") {
                            getAllitemsofcart();
                        }
                        $('#item_count').text('');
                        $('#item_count').text(data_split[0] + ' item(s)');
                        $('.sub_total').text(parseFloat(data_split[1]) + parseFloat(data_split[6]));
                        // $('.sub_total').text(data_split[1]);
                        $('.delvieryCharges').text(data_split[2]);
                        $('.total_amount').text(parseFloat(data_split[1]) + parseFloat(data_split[2]));
                        $('.discount').html(data_split[6])
                        var stealClass = "";
                        var minus = parseFloat(data_split[5]) - parseFloat(data_split[1]);
                        //var steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + data_split[5] +
                        //    "<br><br>Add items worth Rs " + minus + " to your cart to qualify for steal deal";

                        var steal_deal_line = "<br/>Add items worth Rs " + minus + " to your cart to qualify for steal deal <br/>";

                        if (data_split[5] == "0") {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        if (minus <= 0) {
                            stealClass = "d-none";
                            steal_deal_line = "Free Delivery! you have achieved minimum order amount";
                        }
                        $('.stealclass').removeClass('d-none');
                        $('.stealclass').addClass(stealClass);
                        $('#minAmountStealDeal').html(steal_deal_line);

                        var MinFor_X = parseFloat(data_split[4]) - parseFloat(data_split[1]);
                        if (data_split[3] == 'N') {
                            $('.deliveryText').html('Free Delivery! you have achieved minimum order amount');
                        }
                        else if (data_split[3] == 'X') {
                            $('.deliveryText').html("Add Rs " + MinFor_X + " to get the free delivery");
                        }
                        else if (data_split[3] == 'Z') {
                            $('.deliveryText').html('Shop above Rs ' + data_split[4] + ' for free delivery');
                        }
                        else {
                            $('.deliveryText').html("You will be charged Rs " + data_split[2] + " as delivery charges");
                        }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                    error: function (e) {
                        alert(e.statusText);
                    }
                })
            }

            var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = window.location.search.substring(1),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                    }
                }
                return false;
            };
            $(document).ready(function () {

                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!
                var yyyy = today.getFullYear();

                if (dd < 10) {
                    dd = '0' + dd;
                }
                if (mm < 10) {
                    mm = '0' + mm;
                }

                today = yyyy + '-' + mm + '-' + dd;

                //document.getElementById("inputDate").value = today + "";
                $('#inputDate').val(today);
                $('#inputDate').attr('min', today);
                fngetDateSlots();

                if (getUrlParameter('status') == 'success') {
                    $('.checkOut').trigger('click');
                    var query = window.location.search.substring(1)

                    if (query.length) {
                        if (window.history != undefined && window.history.pushState != undefined) {
                            window.history.pushState({}, document.title, window.location.pathname);
                        }
                    }
                }

            })

            function fngetDateSlots() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "cart.aspx/fngetDateSlots",
                    data: '{}',
                    beforeSend: function () {

                    },
                    dataType: "json",
                    success: function (data) {
                        var current = data.d;
                        current = current.split('|');
                        $('#sub_category').append(current[0]);
                        $('#time_slot').empty();
                        $('#time_slot').append(current[1]);
                        timeClick();
                        //$(".slotsdiv").slideToggle(1500, "linear", "");
                        $(".slotsdiv").toggle();

                        $('.day').click(function (e) {

                            e.stopImmediatePropagation();
                            var dayName = $(this).find('span:first').text();
                            $('.day').removeClass('dayactive');
                            $(this).addClass('dayactive');

                            $(".triangle-4").removeClass("indishow");
                            $(this).find(".triangle-4").addClass("indishow");
                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "cart.aspx/fngetTimeSlots",
                                data: '{dayName: "' + dayName + '"}',
                                dataType: "json",
                                success: function (data) {
                                    $('#time_slot').empty();
                                    $('#time_slot').append(data.d);
                                    timeClick();
                                }
                            })
                        })
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                })
            }

            $(".day").click(function () {
                var text = $(this).text();
                $(".timing").empty();
                $(".timing").text(text);
                $(".day").removeClass("dayactive")
                $(".triangle").removeClass("indishow")
                if ($(this).hasClass("dayactive")) {
                    $(this).find(".triangle-4").removeClass("indishow");
                    $(this).find(".triangle-4").addClass("indishow");
                    $(this).removeClass("dayactive");
                    $(this).addClass("dayactive");

                }
                else {
                    $(this).find(".triangle-4").removeClass("indishow");
                    $(this).find(".triangle-4").addClass("indishow");

                    $(this).removeClass("dayactive");
                    $(this).addClass("dayactive");

                }

            });


            $(".walletbtn").click(function () {
                $(".atmcard").toggleClass("showcard");
                //alert('You donot have active wallet. Please call at 9315186419 for more details');
            });

            function timeClick() {
                $(".timeslot").click(function () {
                    $(".timeslot").removeClass("timing_checked");
                    $(".timeslot").find('i').addClass('d-none');
                    $(this).addClass('timing_checked');
                    //$(".slotsdiv").hide();
                    $(this).find('i').removeClass("d-none");
                    var Date = $('.dayactive').find('span:first-child').text() + ', ' + $('.dayactive').find('span:nth-child(3)').text();

                    $('.selectedTimeSlot').removeAttr('bdid');
                    $('.selectedTimeSlot').attr('bdid', $(this).attr('bdid'));
                    $('.selectedTimeSlot').html(Date + '  |  ' + $(this).find('span').text()
                        + '<i class=" fa fa-check-circle fa-2x" style="margin-top: -6px;"></i>')
                });
            }

            $(".walletbtn").click(function () {
                if ($(".cardatmcls").hasClass("atmcard")) {
                    $(".cardatmcls").removeClass("atmcard")
                    $(".cardatmcls").addClass("atmcardopen")
                } else {
                    $(".cardatmcls").addClass("atmcard")
                    $(".cardatmcls").removeClass("atmcardopen")
                    $("#Layer_1 path").attr('fill', 'gray');
                }
            });


            $('body').on('click', '.addaddressbtn', function (e) {
                e.stopImmediatePropagation();
                e.preventDefault();
                //$("#addAddressWarning").hide();
                $("#addressmodalpopup").modal('hide');
            });
        }




    </script>
</body>
</html>
