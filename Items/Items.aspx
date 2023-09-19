<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Items.aspx.cs" Inherits="Items_Items" %>

<!doctype html>
<html lang="en">
<head>
    <title>ITEMS</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="newCss.css" rel="stylesheet" />
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link href="../Assest/css/subcategory_main.css" rel="stylesheet" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.3.11/tiny-slider.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Passion+One" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="../Admin/js/global.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />

    <style>
        .second-section {
            padding-top: 0px !important;
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

        .w-25 {
            width: 30% !important;
        }

        .itm-amt .fa-inr, strike {
            color: black;
            font-size: 12px;
        }

        .select_dateBox {
            margin-top: 10px;
        }

        .quantity__Box {
            margin-bottom: 20px;
        }

        .ui-widget-content {
            left: 0 !important;
            /*top: 909.3px;*/
            width: 100% !important;
            position: absolute;
            font-size: 13px;
            line-height: 44px;
        }

        .ui-dialog .ui-dialog-buttonpane {
            margin-top: 0em !important;
        }

        .ui-menu-item-wrapper:hover {
            background: #ddd !important;
        }

        #sub_category1 div {
            white-space: nowrap;
            padding: 2px;
            margin: 5px;
            border-radius: 5px;
            padding-left: 15px;
            padding-right: 15px;
            /* box-shadow: 0 2.8px 1.2px rgba(0, 0, 0, 0.034), 0 -2.3px 5.3px rgba(0, 0, 0, 0.048), 0 0.5px 1px rgba(0, 0, 0, 0.06), 0 3.3px 17.9px rgba(0, 0, 0, 0.072), 0 11.8px 37.4px rgba(0, 0, 0, 0.086), 0 0px 0px rgba(0, 0, 0, 0.12); */
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        }

        .sticky-footer {
            display: block;
            height: 40px;
            background: #fff;
            position: fixed;
            bottom: -50px;
            left: 0px;
            width: 100%;
            z-index: 3;
            box-shadow: 0 1px 20px rgb(96, 93, 93), 0 0 40px rgb(255, 255, 255) inset;
        }

            .sticky-footer .one-fourth {
                width: 50%;
                float: left;
                color: #fff;
                text-align: center;
                height: 40px;
                position: relative;
                cursor: pointer;
                padding-top: 2px;
            }

        .sticky-search,
        .sticky-filters,
        .sticky-map,
        .sticky-radius {
            width: 25px;
            height: 25px;
            margin: auto;
            margin-top: 11px;
        }

        .sticky-footer .one-fourth p {
            font-size: 10px;
            margin-top: 3px;
        }

        .btn-bottom {
            background: #6a6a6a;
            width: 98%;
            padding: 5px;
        }

        .btn-secondary {
            color: #fff;
            background-color: #035fb1;
            border-color: #005aab;
        }
        /*@media (max-width: 768px) {
            .img-item img {
                width: 100px !important;
                margin: 10px !important;
            }
        }*/

        #sub_category div {
            white-space: nowrap;
            padding: 2px;
            margin: 5px;
            border-radius: 5px;
            padding-left: 15px;
            padding-right: 15px;
            /*box-shadow: 0 2.8px 1.2px rgba(0, 0, 0, 0.034), 0 -2.3px 5.3px rgba(0, 0, 0, 0.048), 0 0.5px 1px rgba(0, 0, 0, 0.06), 0 3.3px 17.9px rgba(0, 0, 0, 0.072), 0 11.8px 37.4px rgba(0, 0, 0, 0.086), 0 0px 0px rgba(0, 0, 0, 0.12);*/
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        }


        .subactive {
            /*background: #1acc8d;*/
            background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;
            color: white;
            /*box-shadow: 0 2.8px 1.2px rgba(0, 0, 0, 0.034), 0 -2.3px 5.3px rgba(0, 0, 0, 0.048), 0 0.5px 1px rgba(0, 0, 0, 0.06), 0 3.3px 17.9px rgba(0, 0, 0, 0.072), 0 11.8px 37.4px rgba(0, 0, 0, 0.086), 0 0px 0px rgba(0, 0, 0, 0.12);*/
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        }


        #sub_category::-webkit-scrollbar {
            display: none;
        }

        .owl-item > div {
            cursor: pointer;
            margin: 1% 2%;
            transition: margin 0.4s ease;
        }

        .owl-item.center > div {
            cursor: auto;
            margin: 0;
        }

        .owl-item:not(.center) > div:hover {
            opacity: 0.75;
        }

        .topshow .row {
            height: 80px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            margin-top: -2px;
        }

        .subcategory-name {
            top: 40%;
        }

        .cartcount {
            font-size: 14px;
            margin-top: -21px;
            margin-left: 52px;
            background: #384862;
            color: white;
            width: 20px;
            border-radius: 20px;
            z-index: 9999;
            /*box-shadow: 0 2.8px 1.2px rgba(0, 0, 0, 0.034), 0 -2.3px 5.3px rgba(0, 0, 0, 0.048), 0 0.5px 1px rgba(0, 0, 0, 0.06), 0 3.3px 17.9px rgba(0, 0, 0, 0.072), 0 11.8px 37.4px rgba(0, 0, 0, 0.086), 0 0px 0px rgba(0, 0, 0, 0.12);*/
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        }

        .footer {
            height: 25px;
            background: #fff;
        }

        .boxshadow {
            border: none;
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
            /*box-shadow: 0 0.5px 0.5px #00000000, 0 0px 0px #00000026, 0 0px 4px #00000026, 0 0px 0px #00000026;*/
        }

        ._menu_opt {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: black;
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
        /*card design end---------------------------------------------------*/


        .subcategory-name {
            color: white;
            font-size: 22px;
            font-weight: bold;
        }

        #searchResult {
            list-style: none;
            padding: 0px;
            position: inherit;
            margin: 0;
            margin-top: 150px;
            z-index: 1;
            background: white;
            width: 100%;
        }

            #searchResult li {
                background: #fff;
                padding: 10px;
                margin-bottom: 1px;
                border-bottom: .5px solid #eaeaea;
            }


            
        .subcategorydetails {
            min-height: 100px;
            background: white;
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .subcatname {
            position: absolute;
            margin-top: -14px;
            margin-left: 20px;
            background: #eeeeee;
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: bold;
        }

        .subcatdescription {
            margin-top: 25px;
            text-align: justify;
            line-height: 1.4;
            margin-bottom: 15px;
        }

        .viewdetailsbtn {
            padding: 5px 15px;
            background: #1cc8d3;
            color: white !important;
            border-radius: 5px;
            cursor: pointer;
        }

            .viewdetailsbtn:active {
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            }

        .detailsdescription {
            text-align: justify;
            margin-bottom: 15px;
            display:none;
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


    <nav class="navbar fixed-top navbar-light  text-center grad2">
        <div class="topshow  grad2">
            <div class="row  ">

                <div class="col-12">
                    <div class="subcategory-name text-center w-100">
                        <select id="header_html1" style="width: 95%; background: transparent; font-weight: bold; color: white; box-shadow: none; font-size: 20px; text-align-last: center;">
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container" style="padding-left: 0px; padding-right: 0px;">
        <%-- <ul id="searchResult"></ul>--%>
        <div id="menusection" runat="server" style="display: none;">
            <div class="container">
                <div class="topbox">
                    <div class="row">
                        <div class="top-card" style="width: 100%">
                            <div class="checkboxsec">
                                <fieldset id="aspectRatio--group" class="inputGroup">

                                    <div id="radiobtnsselect" runat="server" class="segmentedControl">
                                        <span class="segmentedControl--group">
                                            <input class="menutype" type="radio" name="aspectRatio" id="aspectRatio--16x9" checked />
                                            <label class="label" for="aspectRatio--16x9">Food</label>
                                        </span>
                                        <span class="segmentedControl--group">
                                            <input class="menutype" type="radio" name="aspectRatio" id="aspectRatio--1x1" />
                                            <label class="label" for="aspectRatio--1x1">Liquor</label>
                                        </span>
                                        <span class="segmentedControl--group">
                                            <input class="menutype" type="radio" name="aspectRatio" id="aspectRatio--4x5" />
                                            <label class="label" for="aspectRatio--4x5">Takeaway</label>
                                        </span>

                                    </div>
                                </fieldset>

                            </div>
                        </div>
                        <div class="top-card" style="width: 20%; display: none;">
                            <div class="togglebtnboxsec">
                                <button type="button" class="btn btn-sm btn-toggle active" data-toggle="button" aria-pressed="true" autocomplete="off">
                                    <div class="handle"></div>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">

                    <div class="slider-container">
                        <div id="offerslider" runat="server" class="my-slider">
                            <div class="slider-item">
                                <div class="card tablebottomcurve  occupied">
                                    <img src="imges/offer1.jpg" />
                                </div>
                            </div>
                            <div class="slider-item">
                                <div class="card tablebottomcurve unoccupied">
                                    <img src="imges/offer2.jpg" />
                                </div>
                            </div>
                            <div class="slider-item">
                                <div class="card tablebottomcurve unoccupied">
                                    <img src="imges/offer3.jpg" />
                                </div>
                            </div>
                            <div class="slider-item">
                                <div class="card tablebottomcurve unoccupied">
                                    <img src="imges/offer4.jpg" />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="container">
                <div class="row">
                    <div style="width: 100%">
                        <div class="card-holder">
                            <div id="foodcategories" runat="server" class="theme1">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div id="footer1" runat="server" class="sticky-footer">

                    <div class="one-fourth" id="search">
                        <a class="btn btn-bottom" id="bill_the_table" runat="server">Get the Bill</a>
                    </div>

                    <div class="one-fourth" id="filters">
                        <a id="view_order" class="btn btn-bottom" runat="server">View Order</a>
                    </div>



                </div>
            </div>
        </div>


        <%-- section 2 start --%>
        <div class="container">
            <ul id="searchResult"></ul>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 p-0">
                    <div id="menusection2" runat="server">
                        <div class="second-section">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-12 p-0 m-0">
                                        <div style="background: white; display: none; padding: 10px; text-align: center; position: fixed; width: 100%; top: 73px; padding-top: 30px;"
                                            id="deliveyFreeAmount" runat="server">
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="theme1-1">
                                <a class=" searchbox" style="transition: 2s; padding: 0px; top: 63px; box-shadow: 0 2.8px 1.2px rgba(0, 0, 0, 0.034), 0 -2.3px 5.3px rgba(0, 0, 0, 0.048), 0 0.5px 1px rgba(0, 0, 0, 0.06), 0 3.3px 17.9px rgba(0, 0, 0, 0.072), 0 11.8px 37.4px rgba(0, 0, 0, 0.086), 0 0px 0px rgba(0, 0, 0, 0.12); right: 10px !important; background-color: #ffffff; position: fixed; display: flex; z-index: 9999; width: 94%; margin-bottom: 15px;">
                                    <div class="searchbox">
                                        <div class="form-group m-0">
                                            <i class="fa fa-search"></i>
                                            <input class="inputseacrh" placeholder="Search here..." id="search_for_menu" />

                                        </div>
                                    </div>
                                </a>

                                <div class="row">
                                    <div class="col-sm-12 p-0 m-0">
                                        <div id="sub_category1" style="display: flex; overflow-x: auto; overflow-y: hidden; background: white; position: fixed; width: 100%; top: 95px; border-top: 5px solid #eeeeee; border-bottom: 5px solid #ededed; padding-bottom: 1px;">
                                        </div>
                                    </div>
                                </div>


                                <marquee id="moveabletext" behavior="scroll" direction="left" scrollamount="80" scrolldelay="1000" style="background: white;">
                                    <span style="color: #ed394d;font-weight: bold;">Prices shown above are applicable for a combo of 10 QTYs.</span>
                                </marquee>
                                 <div id="rid52only">
                                    <%--<div class="subcategorydetails">
                                        <span class="subcatname">Sub Categry</span>
                                        <div class="subcatdescription">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. 
                                        </div>
                                        <div style="text-align: right;">
                                            <a class="viewdetailsbtn">Details</a>
                                        </div>
                                    </div>--%>
                                </div> 

                                <div id="appenditems" runat="server">

                                    <div class="row">
                                        <div class="col-sm-12 p-0 m-0">
                                            <div id="sub_category" style="display: flex; overflow-x: auto; overflow-y: hidden; background: white; border-top: 5px solid #e5dfdf6b;">
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div style="height: 30px;">
                                </div>
                            </div>

                        </div>
                        <div class="container">
                            <div class="sticky-footer">
                                <div class="one-fourth" style="width: 100%">
                                    <a id="placeorder" class="btn btn-bottom">Place Order
                                        <div class="cart  text-center">
                                            <i class="fa fa-shopping-cart fa-2x"></i>
                                            <div class="itemcounts" style="margin-left: 8px; color: #6a6a6a; font-weight: bold;">
                                                <span class="qtydisplay" id="total_items" runat="server"></span>
                                            </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>

        <%-- section 3 start --%>
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
                        <div class="" style="width: 100%; margin-top: -20px;">
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

        <%-- section 4 start --%>
    </div>

    <input type="button" class="btn d-none" id="clicktrigger" />

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>

    <div class="modal fade right" id="myModalFullscreen" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
    </div>
    <div class="modal fade right" id="getTableBill" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
    </div>
    <%--<div class="modal fade right" id="addpaymentpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Custome Details</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12">
                            <label style="font-size: 14px;">Customer Name: &nbsp Jatin Kansal</label>

                        </div>

                        <div class="col-12">
                            <label style="font-size: 14px;">Customer No: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9953075912</label>
                        </div>
                        <div class="col-12">
                            <label for="total_amount_toPay">Amount to Pay</label>
                            <input type="number" readonly="readonly" class="form-control" id="total_amount_toPay" value="500" />
                        </div>
                        <div class="col-12">
                            <label for="tip">Tip</label>
                            <input type="number" class="form-control" id="tip" />
                        </div>
                        <div class="col-12">
                            <label for="amount">MOP</label>
                            <select class="form-control" id="mop">
                                <option value="Cash">Cash</option>
                                <option value="Card">Card</option>
                                <option value="UPI">UPI</option>
                            </select>
                        </div>
                    </div>
                    <div class="row" style="padding: 20px;">
                        <button id="PayAmount" class="btn btn-success " style="width: 100%;">Pay</button>
                    </div>
                </div>

            </div>
        </div>
    </div>--%>



    <div class="modal" id="showimage" style="height: 250px; top: 180px;">
        <div class="modal-dialog" style="border: none; border-top: 1px solid #9ea2a200 !important; background-color: #ececec00 !important;">
            <div class="modal-content" style="height: 250px; background-color: #fff0; border: 1px solid rgba(0, 0, 0,  0);">
                <button type="button" class="close" data-dismiss="modal" style="text-align: right; color: white; z-index: 1;">&times;</button>
                <div class="modal-body">

                    <div class="carousel-wrap">
                        <div id="owlcarousel" runat="server" class="owl-carousel">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div id="frequencyModal" class="md-modal md-effect-12">
    </div>

    <div id="basicExampleModal" class="md-modal md-effect-12">
        <div class="md-content" style="height: 300px;">
            <div class="w-100" style="margin-top: 100px; margin-left: 20px;">
                <a class="md-close2" style=""><i class="fa fa-times"></i></a>
            </div>


            <div class="content_body">
                Your content here.
            </div>



        </div>
    </div>

    <div class="md-overlay"></div>
    <%-- confirmation modal --%>
    <div id="confirmation_modal" class="modal fade" style="z-index: 99999;">
    </div>
    <%-- confirmation modal end --%>
    <input type="hidden" id="rest_id" runat="server" />
    <input type="hidden" id="TableNo" runat="server" />
    <input type="hidden" id="Mobile_No" runat="server" />
    <input type="hidden" id="header_id" runat="server" />
    <input type="hidden" id="Cust_Name" runat="server" />
    <input type="hidden" id="popup_value" runat="server" />
    <input type="hidden" id="Manager_Value" runat="server" />
    <input type="hidden" id="DeliveryFlag" runat="server" />
    <script src="MyMenu.js"></script>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <a href="javascript:void(0);" id="clickLink" style="display: none;">Download</a>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--%>


    <%-- datepicker js --%>


    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="jquery/jquery-3.2.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>

    <script src="../Admin/assets2/js/core/popper.min.js"></script>
    <script src="jquery/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.3.11/min/tiny-slider.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

    <script src="Add_Balance.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>

    <script>

        const slider = tns({
            container: '.my-slider',
            loop: false,
            items: 1,
            slideBy: 'page',
            nav: false,
            autoplay: false,
            speed: 400,
            autoplayButtonOutput: false,
            mouseDrag: true,
            lazyload: false,
            controlsContainer: "#customize-controls",
            responsive: {
                360: {
                    items: 3,
                },
                640: {
                    items: 4,
                },

                768: {
                    items: 6,
                }
            }

        });
    </script>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>--%>

    <script type="text/javascript">
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        function CreatePDFfromHTML() {
            var HTML_Width = $("#myModalFullscreen").width();
            var HTML_Height = $("#myModalFullscreen").height();
            var top_left_margin = 15;
            var PDF_Width = HTML_Width + (top_left_margin * 2);
            var PDF_Height = (PDF_Width * 1.5) + (top_left_margin * 2);
            var canvas_image_width = HTML_Width;
            var canvas_image_height = HTML_Height;

            var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

            html2canvas($("#bill_download")[0]).then(function (canvas) {
                var imgData = canvas.toDataURL("image/jpeg", 1.0);
                var pdf = new jsPDF('p', 'pt', [PDF_Width, PDF_Height]);
                pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin, canvas_image_width, canvas_image_height);
                for (var i = 1; i <= totalPDFPages; i++) {
                    pdf.addPage(PDF_Width, PDF_Height);
                    pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height * i) + (top_left_margin * 4), canvas_image_width, canvas_image_height);
                }
                pdf.save("Your_PDF_Name.pdf");
                $("#myModalFullscreen").hide();
            });
        }

        $(".md-close2").click(function () {
            $("#basicExampleModal").removeClass('md-show');
        })

        $(document).ready(function () {

            //$("#basicExampleModal").addClass('md-show');

            $('.download_bill').click(function (e) {
                e.stopImmediatePropagation();
                $.ajax({
                    url: "../ScantoDine_main/manager.aspx/viewInvoice",
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'RID':'" + $(this).attr('rid') + "','TID':'" + $(this).attr('tid') + "','Header_ID':'" + $(this).attr('header_id') + "','Flag':'" + 'N' + "'}",
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    success: function (result) {

                        if (result.d != '') {
                            $('#myModalFullscreen').empty();
                            $('#myModalFullscreen').append(result.d)
                            $('#myModalFullscreen').modal();
                            //CreatePDFfromHTML();

                            //var doc = new jsPDF();
                            //var specialElementHandlers = {
                            //    '#elementH': function (element, renderer) {
                            //        return true;
                            //    }
                            //};
                            //doc.fromHTML($('#myModalFullscreen').html(), 15, 15, {
                            //    'width': 170,
                            //    'elementHandlers': specialElementHandlers
                            //});
                            //doc.save('sample-file.pdf');
                        }
                        else {
                            showpopup('No Invoice generated yet');
                        }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                })
            })

            $('#PayAmountSection').click(function (e) {
                e.stopImmediatePropagation();
                var Header_ID = $(this).attr('header_id');
                var RID = $(this).attr('rid');
                var Amount = $.trim($('#total_amount_toPay').val());
                var Tip = $.trim($('#tip').val()) || 0;

                $.ajax({
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    url: "../Restaurant/My_menu.aspx/GenerateTrxID",
                    data: "{'RID':'" + RID + "','Header_ID':'" + Header_ID + "','Amount':'" + Amount + "','Tip':'" +
                        Tip + "'}",
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    success: function (result) {
                        if (result.d != '') {
                            window.location.href = result.d;
                        }
                        else {
                            showpopup('Some Error occured. Please refresh the page and try again');
                        }
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                });
            })
            $(".opentipbox").click(function () {
                $(".showtip").slideToggle("slow", function () {
                });
            })



        })
        $('#PayAmountcard').click(function () {
            showpopup('Please Pay at the counter');
        });



        var $owl = $(".owl-carousel");

        $owl.children().each(function (index) {
            $(this).attr("data-position", index); // NB: .attr() instead of .data()
        });



        $(document).on("click", ".owl-item>div", function () {
            // see https://owlcarousel2.github.io/OwlCarousel2/docs/api-events.html#to-owl-carousel
            var $speed = 300; // in ms
            $owl.trigger("to.owl.carousel", [$(this).data("position"), $speed]);
        });

        $(".openimage").click(function () {
            $("#showimage").modal();
        })

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
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }


        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }
    </script>

</body>
</html>
