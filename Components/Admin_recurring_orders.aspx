<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_recurring_orders.aspx.cs" Inherits="Components_Admin_recurring_orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subscription</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />
    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <%--<link href="http://propeller.in/components/textfield/css/textfield.css" rel="stylesheet" />--%>
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <style>
        .md-modal {
            margin: auto;
            position: fixed;
            top: 0px;
            left: 0;
            right: 0;
            width: 100%;
            max-width: 630px;
            min-width: 320px;
            height: auto;
            z-index: 99999;
            visibility: hidden;
            -webkit-backface-visibility: hidden;
            -moz-backface-visibility: hidden;
            backface-visibility: hidden;
        }

        .md-show {
            visibility: visible;
        }

        .md-overlay {
            position: fixed;
            width: 100%;
            height: 100%;
            visibility: hidden;
            top: 0;
            left: 0;
            z-index: 1000;
            opacity: 0;
            background: rgba(#e4f0e3, 0.8);
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }

        .md-show ~ .md-overlay {
            opacity: 1;
            visibility: visible;
        }

        .md-effect-12 .md-content {
            -webkit-transform: scale(0.8);
            -moz-transform: scale(0.8);
            -ms-transform: scale(0.8);
            transform: scale(0.8);
            opacity: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }

        .md-show.md-effect-12 ~ .md-overlay {
            background-color: #fff;
            z-index: 9999;
        }

        .md-effect-12 .md-content h3,
        .md-effect-12 .md-content {
            background: transparent;
        }

        .md-show.md-effect-12 .md-content {
            -webkit-transform: scale(1);
            -moz-transform: scale(1);
            -ms-transform: scale(1);
            transform: scale(1);
            opacity: 1;
        }

        .relodbtncss {
            background: #34cec524;
            padding-top: 13px;
            padding-left: 5px;
            padding-right: 6px;
            border-radius: 50%;
            padding-bottom: 2px;
        }

        #Capa_1 {
            fill: #13c6da;
        }

        .md-content .title {
            color: #ffffff;
            background: #13c6d9;
            font-size: 14px;
        }

        .md-close {
            padding-top: 4px;
            background: #13c6d924;
            border-radius: 50%;
            padding-right: 9px;
            padding-left: 9px;
            padding-bottom: 4px;
            color: #11b8ca !important;
        }

        .md-close2 {
            padding-top: 4px;
            background: #13c6d924;
            border-radius: 50%;
            padding-right: 9px;
            padding-left: 9px;
            padding-bottom: 4px;
            color: #11b8ca !important;
        }

        ::-webkit-scrollbar {
            display: none !important;
        }

        .frequency {
            font-size: 12px;
            padding: 5px;
            margin: 5px;
            background: #e6e6e6;
            border-radius: 5px;
        }

        .frequency__selected {
            font-size: 12px;
            padding: 5px;
            margin: 5px;
            background: #def7fa;
            border-radius: 5px;
            color: #0caabb;
        }

        .weeks__qty {
            margin: 10px;
            font-size: 13px;
        }

        .Qty_selector {
            border: 1px solid #def7fa;
            border-radius: 5px;
        }

        .datepickerbox {
            background: #e6e6e6;
            border: none;
            padding: 5px;
            border-radius: 5px;
        }

        .productpic {
            width: 80px;
            height: 100%;
        }

            .productpic img {
                width: 100%;
                height: 100px;
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

        .itemcard {
            border: 1px solid #e4e4e4;
            background: white;
            border-radius: 5px;
        }

        .footer {
            position: fixed;
            bottom: 0px;
            left: 0px;
            width: 100%;
            z-index: 3;
            background: #ffffff !important;
        }

        .boxshadow {
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.35);
            border: none !important;
        }

        ._menu_opt {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: black;
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
            height: 85.98mm;
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
            height: 85.98mm;
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


        .onlinePay2 {
            font-size: 13px;
            padding-top: 2px;
            padding-bottom: 3px;
            border: 1px solid;
            padding-left: 15px;
            padding-right: 15px;
            border-radius: 5px;
            background: #384862;
            color: white !important;
            width: 100%;
        }

        .fa-trash {
            font-size: 18px;
            color: white;
        }

        .delete {
            background: #f45c5c;
            padding: 6px;
            border-radius: 25px;
            padding-left: 8px;
            padding-right: 8px;
        }

        @media (max-width:320px) {
            .paybtn {
                font-size: 10px;
            }
        }

        .orderdate__number {
            font-weight: 500;
            color: #2ab5b7;
        }

        .itemprice {
            font-weight: bold;
        }

        .itemdetails {
            font-size: 13px;
        }

        .rtname {
            background: #27cacc;
            color: white;
            padding: 2px;
            padding-left: 5px;
            border-radius: 5px;
        }

        .show__itemsmore {
            color: #17aaac;
        }

        .recurring_box {
            background: white;
            border-radius: 5px;
        }

        .title_subscription {
            color: grey;
        }

        .freq_subs {
            font-weight: 500;
        }

        .subscription_actions {
            font-size: 13px;
            font-weight: bold;
            color: #20b6b8;
        }

        .daycss {
            background: #e6e6e6;
            padding: 2px;
            border-radius: 3px;
            margin: 2px;
        }

        .itemcard {
            margin: 0 auto;
            width: 100%;
            color: #333;
            background: #fff;
            border-radius: 5px;
            font-family: sans-serif;
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
            margin-bottom: 15px;
            transition: transform .2s;
            padding: 5px;
        }

        .itm-amt {
            font-weight: 600;
        }

            .itm-amt .fa-inr, strike {
                color: black;
                font-size: 12px;
            }

        .offpercnt {
            color: red;
            float: right;
        }

        img {
            font-size: 8px !important;
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



        <nav class="navbar fixed-top navbar-light bg-light text-center">
            <a class="navbar-brand" href="javascript:void(0);" id="StoreName" runat="server" style="margin-left: 30px;">Customers' Subscriptions
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Repeat Orders</p>
            </a>
            <a href="My_Profile.aspx" style="color: white;"><span class="userpic" id="UserName_n_Pic" runat="server">&nbsp;&nbsp; <i class="fa fa-user-circle" style="font-size: 25px;"></i></span></a>

        </nav>


        <div id="Subscriptions_section" class="container" runat="server" style="margin-top: 90px;">
        </div>
        <div class="container mb-3">
            <div class="row text-right mt-2">
                <div class="col-11 col-sm-12">
                    <a class=" btnstyle btn text-white p-0 d-none" id="view_more" style="font-size: 13px;">View More</a>

                </div>
            </div>
        </div>
    </form>





    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <div id="frequencyModals" class="md-modal md-effect-12">
    </div>
    <div class="md-overlay"></div>


    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <script>

        $('#view_more').click(function (e) {
            e.stopImmediatePropagation()
            var Date = $("#reportrange span").text();
            Date = Date.split('-')
            $.ajax({
                type: "POST",
                async: true,
                url: "Admin_recurring_orders.aspx/Fn_getSchedulardataNextItems",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function () {
                    $("#preload").show();
                },
                success: function (data) {
                    if (data.d != "") {
                        $("#Subscriptions_section").append(data.d);
                        All_Actions();
                        $('#view_more').removeClass('d-none');
                    } else {
                        $('#view_more').addClass('d-none');
                    }
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        })

        $(document).ready(function () {
            getSchedulerdata();
        })

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
        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)
            $('#Alert_btn').trigger('click');
        }

        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }


        function ConfirmDialog1(message, Amount) {
            $('<div></div>').appendTo('body')
                .html('<div><h6>' + message + '?</h6></div>')
                .dialog({
                    modal: true,
                    title: 'Confirm Payment',
                    zIndex: 10000,
                    autoOpen: true,
                    width: 'auto',
                    resizable: false,
                    buttons: {
                        Yes: function () {
                            $(this).dialog("close");
                            ReceiveAmount(Amount)
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




        function getSchedulerdata() {

            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "Admin_recurring_orders.aspx/Fn_getSchedulardata",
                data: "{}",
                success: function (data) {
                    if (data.d != '') {
                        $("#Subscriptions_section").empty();
                        $("#Subscriptions_section").append(data.d);
                        $('#view_more').removeClass('d-none');
                    }
                    else {
                        $('#view_more').addClass('d-none');
                    }

                    Subscription_Actions();
                }
            });
        }


        function Subscription_Actions() {

            $('.modify_subscription').click(function (e) {
                e.stopImmediatePropagation();
                var line_id = $(this).attr("line_id");
                var Actual_Price = '';
                var MID = '';
                var Item_Name = '';
                $.ajax({
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "Admin_recurring_orders.aspx/EditItem",
                    data: "{'Line_id':'" + line_id + "'}",
                    success: function (data) {
                        $('#frequencyModals').empty();
                        $('#frequencyModals').append(data.d);
                        $('#frequencyModals').addClass('md-show');
                        $('.md-close').on('click', function () {
                            $('#frequencyModals').removeClass('md-show');
                            $('#frequencyModals').empty();
                        });

                        $("#datepicker").datepicker({
                            autoclose: true,
                            todayHighlight: true,
                            'startDate': new Date((new Date()).valueOf() + 1000 * 3600 * 24)
                        })
                        //}).datepicker('update', new Date((new Date()).valueOf() + 1000 * 3600 * 24));
                        var minVal12 = 0, maxVal12 = 20; // Set Max and Min values
                        // Increase product quantity on cart page
                        $(".qty_plus").on('click', function () {
                            var $parentElm = $(this).parents(".Qty_selector ");

                            $(this).addClass("clicked");
                            setTimeout(function () {
                                $(".clicked").removeClass("clicked");
                            }, 100);
                            var value = $parentElm.find(".qtyvalues").val();
                            if (value < maxVal12) {
                                value++;
                            }
                            $parentElm.find(".qtyvalues").val(value);

                        });
                        // Decrease product quantity on cart page
                        $(".qty_minus").on('click', function () {
                            var $parentElm = $(this).parents(".Qty_selector");
                            $(this).addClass("clicked");
                            setTimeout(function () {
                                $(".clicked").removeClass("clicked");
                            }, 100);
                            var value = $parentElm.find(".qtyvalues").val();
                            if (value >= 1) {
                                value--;
                            }

                            $parentElm.find(".qtyvalues").val(value);
                        });

                        $('.freq').click(function () {
                            $('.freq').removeClass('frequency__selected');
                            $('.freq').addClass('frequency');
                            $(this).removeClass('frequency');
                            $(this).addClass('frequency__selected');
                        })
                        $('#setRecurring').click(function (f) {
                            f.stopImmediatePropagation();

                            var Sun = 'N'
                            var Mon = 'N'
                            var Tue = 'N'
                            var Wed = 'N'
                            var Thu = 'N'
                            var Fri = 'N'
                            var Sat = 'N'
                            if ($.trim($('.sun').val()) != '0') {
                                Sun = 'Y'
                            }
                            if ($.trim($('.mon').val()) != '0') {
                                Mon = 'Y'
                            }
                            if ($.trim($('.tue').val()) != '0') {
                                Tue = 'Y'
                            }
                            if ($.trim($('.wed').val()) != '0') {
                                Wed = 'Y'
                            }
                            if ($.trim($('.thu').val()) != '0') {
                                Thu = 'Y'
                            }
                            if ($.trim($('.fri').val()) != '0') {
                                Fri = 'Y'
                            }
                            if ($.trim($('.sat').val()) != '0') {
                                Sat = 'Y'
                            }
                            var Date = $.trim($('#datepicker').val());
                            var Freq = $('.frequency__selected').attr('freq');
                            punchRecurring(Actual_Price, MID, Item_Name, '-1', '', 'SUB', '1', Sun, $.trim($('.sun').val()), Mon, $.trim($('.mon').val()), Tue, $.trim($('.tue').val()),
                                Wed, $.trim($('.wed').val()), Thu, $.trim($('.thu').val()), Fri, $.trim($('.fri').val()), Sat, $.trim($('.sat').val()), Date, Freq, line_id);
                            $('.md-modal').removeClass('md-show');
                            $('.md-modal').empty();
                            setTimeout(function () {
                                getSchedulerdata();
                            }, 1000)

                        })
                    }
                });
            })

            $(".delete_subscription").click(function (e) {
                e.stopImmediatePropagation();
                var line_id = $(this).attr("line_id");
                Delete_action_taken(line_id, '');
                showpopup('Item removed successfully');
                $(this).parent().parent().parent().parent().remove();

            })

            $(".pause_subscription").click(function (e) {

                e.stopImmediatePropagation();
                var line_id = $(this).attr("line_id");
                Delete_action_taken(line_id, 'Y');
                showpopup('Item paused successfully');
                $(this).addClass("d-none");
                $(this).parent().find(".play_subscription").removeClass("d-none");

            })
            $(".play_subscription").click(function (e) {
                e.stopImmediatePropagation();
                var line_id = $(this).attr("line_id");
                Delete_action_taken(line_id, 'N');
                showpopup('Item subscribed successfully');
                $(this).addClass("d-none");
                $(this).parent().find(".pause_subscription").removeClass("d-none");
            })
        }
        function Delete_action_taken(line_id, Flag) {
            $.ajax({
                type: "post",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                url: "Admin_recurring_orders.aspx/Fn_Deletesubscription",
                data: "{'Line_id':'" + line_id + "','Flag':'" + Flag + "'}",
                success: function (data) {

                }
            });
        }
        function punchRecurring(Price, MID, Item_Name, OID, Option_Name, Flag, Qty, Sun, Sun_Qty, Mon, Mon_Qty, Tue, Tue_Qty, Wed, Wed_Qty, Thu,
            Thu_Qty, Fri, Fri_Qty, Sat, Sat_Qty, Date, Freq, Line_ID) {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../Items/Items.aspx/fnInsertRecuring",
                data: '{MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag + '", Qty:"' + Qty + '", Option_Name:"' + Option_Name
                    + '", Sun:"' + Sun + '", Sun_Qty:"' + Sun_Qty + '", Mon:"' + Mon + '", Mon_Qty:"' + Mon_Qty + '", Tue:"' + Tue + '", Tue_Qty:"' + Tue_Qty
                    + '", Wed:"' + Wed + '", Wed_Qty:"' + Wed_Qty + '", Thu:"' + Thu + '", Thu_Qty:"' + Thu_Qty + '", Fri:"' + Fri + '", Fri_Qty:"' + Fri_Qty
                    + '", Sat:"' + Sat + '", Sat_Qty:"' + Sat_Qty + '", Date:"' + Date + '", Freq:"' + Freq + '", Line_ID:"' + Line_ID + '"}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    var confirmmodal = "<div class=\"modal-dialog modal-confirm\"><div class=\"modal-content\" style = \"height:auto;\">" +
                        "<div class=\"modal-header flex-column\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>" +
                        "</div><div class=\"modal-body text-justify\" ><h5 style=\"color: #087972; font-weight:200;\"><span style=\"font-size:17px;\">Your subscription for </span> <i>" + Item_Name + "</i><span style=\"font-size:17px;\"> is confirmed.</span> </h5>" +
                        "<p><h6>Please note :-</h6> The subscription prices are subject to change as per market rates. </p>" +
                        "<p>Don't forget to hang a bag at the door to receive your deliveries.</p></div>" +
                        "<div class=\"modal-footer justify-content-center\"><button type=\"button\" class=\"btn btn-success w-100\"data-dismiss=\"modal\">Ok</button></div></div ></div >";
                    $("#confirmation_modal").append(confirmmodal);
                    $("#confirmation_modal").modal();
                    showpopup('Modification is done successfully');
                },
                complete: function () {
                    $("#preload").hide();
                },
                error: function (e) {
                    alert(e.statusText);
                }
            })
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
