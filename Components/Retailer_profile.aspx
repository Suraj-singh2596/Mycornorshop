<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Retailer_profile.aspx.cs" Inherits="Components_Retailer_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <%--    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />--%>
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <%--<link href="http://propeller.in/components/textfield/css/textfield.css" rel="stylesheet" />--%>
    <%--<script src="http://propeller.in/components/global/js/global.js"></script>--%>
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <script src="../Admin/js/global.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />



    <link href="https://foliotek.github.io/Croppie/croppie.css" rel="stylesheet" />
    <script src="https://foliotek.github.io/Croppie/croppie.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif !important;
            font-size: .9rem;
        }

        .title {
            /*border-bottom: 1px solid #8cc9f3;*/
            padding: 10px;
            font-size: 16px;
            font-weight: 600;
            color: #17c3d1;
            /*background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;*/
            border-radius: 3px;
            padding: 25px;
        }

        .footer {
            background: #fff !important;
            position: fixed;
            width: 100%;
            bottom: 0;
            text-align: center;
        }

        .fa-edit {
            float: right;
        }

        .rounded-circle {
            width: 100px;
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
            padding-left: 5px;
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

        #fulladdress {
            padding: 10px;
        }

        .boxshadow {
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.35);
            border: none !important;
        }

        .img-circle {
            height: 80px;
            width: 80px;
            border-radius: 50%;
            border: 1px solid grey;
        }

        .personal__input {
            border: none;
            background: #ececec;
            border-radius: 5px;
        }

        #uploadBtn {
            display: none;
        }

        .p-image {
            position: absolute;
            right: 90px;
            color: #666666;
            transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
            top: -15px;
        }

            .p-image:hover {
                transition: all .3s cubic-bezier(.175, .885, .32, 1.275);
            }


        label.cabinet {
            display: block;
            cursor: pointer;
        }

            label.cabinet input.file {
                position: relative;
                height: 100%;
                width: auto;
                opacity: 0;
                -moz-opacity: 0;
                filter: progid:DXImageTransform.Microsoft.Alpha(opacity=0);
                margin-top: -30px;
            }

        #upload-demo {
            width: 250px;
            height: 250px;
            padding-bottom: 25px;
        }

        figure figcaption {
            position: absolute;
            top: 108px;
            left: 190px;
            color: #fff;
            padding-left: 9px;
            padding-bottom: 5px;
            text-shadow: 0 0 10px #000;
        }

        .img-thumbnail {
            height: 100%;
            width: 100%;
            border-radius: 50%;
        }

        .cr-vp-square {
            width: 200px !important;
        }

        .avatar-upload {
            position: relative;
            max-width: 205px;
            margin: 50px auto;
        }

            .avatar-upload .avatar-edit {
                position: absolute;
                right: 35px;
                z-index: 1;
                top: -10px;
            }

                .avatar-upload .avatar-edit input {
                    display: none;
                }

                    .avatar-upload .avatar-edit input + label {
                        display: inline-block;
                        width: 30px;
                        height: 30px;
                        margin-bottom: 0;
                        border-radius: 100%;
                        background: #FFFFFF;
                        border: 1px solid transparent;
                        box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
                        cursor: pointer;
                        font-weight: normal;
                        transition: all 0.2s ease-in-out;
                        margin: auto;
                    }

                        .avatar-upload .avatar-edit input + label:hover {
                            background: #f1f1f1;
                            border-color: #d6d6d6;
                        }

                        .avatar-upload .avatar-edit input + label:after {
                            content: "\f040";
                            font-family: 'FontAwesome';
                            color: #757575;
                            position: absolute;
                            top: 5px;
                            left: 0;
                            right: 0;
                            text-align: center;
                            margin: auto;
                        }

            .avatar-upload .avatar-preview {
                width: 100px;
                height: 100px;
                position: relative;
                border-radius: 100%;
                border: 6px solid #F8F8F8;
                box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
                margin: auto;
            }

                .avatar-upload .avatar-preview > div {
                    width: 100%;
                    height: 100%;
                    border-radius: 100%;
                    background-size: cover;
                    background-repeat: no-repeat;
                    background-position: center;
                }

        #divHabilitSelectors.input-file-container {
            position: relative;
            width: 100%;
            text-align: center;
        }

        #divHabilitSelectors .input-file-trigger {
            display: block;
            padding: 5px 15px;
            color: white;
            font-size: 1em;
            transition: all 0.4s;
            cursor: pointer;
            border-radius: 10px;
        }

        #divHabilitSelectors .input-file {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            opacity: 0;
            cursor: pointer;
        }

            /* quelques styles d'interactions */
            #divHabilitSelectors .input-file:hover + .input-file-trigger,
            #divHabilitSelectors.input-file:focus + .input-file-trigger,
            #divHabilitSelectors .input-file-trigger:hover,
            #divHabilitSelectors .input-file-trigger:focus {
                text-decoration: none !important;
            }

        /* styles du retour visuel */
        .file-return {
            margin: 0;
        }

            .file-return:not(:empty) {
                margin: 1em 0;
            }

        #divHabilitSelectors .file-return {
            font-style: italic;
            font-size: 0.9em;
            font-weight: bold;
        }

        #imagePreview2 {
            width: 100%;
            height: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        #avatar-preview {
            width: 100%;
            height: 150px;
            position: relative;
            border: 6px solid #F8F8F8;
            box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            margin: auto;
            display: none;
        }

        .bannerimg {
            width: 100%;
            height: 100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .bannerpic {
            width: 100%;
            height: 100px;
            position: relative;
            border: 6px solid #F8F8F8;
            box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
            margin: auto;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .deletebannerbtn {
            position: absolute;
            background: #f8f9fa;
            height: 25px;
            width: 25px;
            border-radius: 100%;
            left: -5px;
            top: -5px;
        }

            .deletebannerbtn .fa {
                position: absolute;
                top: 5px;
                left: 6px;
                color: red;
            }

        .uploadbtn {
            display: none;
        }

        .ddownloadbtn {
            position: absolute;
            top: 0;
            right: 0;
            background: aliceblue;
            padding: 5px;
            border-bottom-left-radius: 10px;
        }

        .fa-download {
            color: #17a2b8;
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
            <%-- <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#"></a>
                <span class="userpic" id="usernametop" runat="server"><span>Welcome Mr.ABC</span> &nbsp;&nbsp;<i class="fa fa-user-circle-o "></i></span>
            </nav>--%>
            <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;">Profile
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;">details</p>
                </a>
                <%-- <span id="UserName_n_Pic" class="userpic">&nbsp;&nbsp; <i class="fa fa-user-circle" style="font-size: 25px;"></i></span>--%>
            </nav>
            <section style="margin-top: 90px;">
                <div class="container">

                    <div class="row">
                        <div class="col-sm-3 col-md-3"></div>
                        <div class="col-sm-6 col-md-6">
                            <div class="card mt-3" onclick="location.href='Basic_details.aspx'">
                                <label class="title m-0 editpersonal"><i class="fa fa-user"></i>&nbsp;Basic Details <i class="fa fa-plus pull-right angledown "></i></label>

                            </div>
                            <div class="card mt-3">
                                <label class="title m-0 editpersonal" id="bannerbtn"><i class="fa fa-picture-o" aria-hidden="true"></i>&nbsp;Add Banner image <i class="fa fa-plus editaddress pull-right angledown"></i></label>
                                <div class="container personal__details" style="display: none;">
                                    <hr class="m-0 p-0" />
                                    <div class="row">
                                        <div class="col-12">
                                            <div id="">
                                                <div id='divHabilitSelectors' class="input-file-container btnstyle">
                                                    <input class="input-file" id="fileupload" name="files" type="file" multiple />
                                                    <label for="fileupload" class="input-file-trigger" id='labelFU' tabindex="0">Upload banner</label>
                                                </div>
                                                <div id="avatar-preview" class="avatar-preview">
                                                    <img id="imagePreview2" src="" />
                                                </div>
                                                <div class="container">
                                                    <div class="row p-2">
                                                        <button type="button" class="btn btnstyle w-100 uploadbtn">Upload banner</button>
                                                    </div>
                                                </div>

                                                <div id="appendbanner" class="uploadedbanner">
                                                </div>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="card mt-3" onclick="location.href='Delivery_charges.aspx'">
                                <label class="title m-0 editpersonal"><i class="fa fa-truck" aria-hidden="true"></i>&nbsp;Delivery Charges<i class="fa fa-plus editaddress pull-right angledown"></i></label>
                            </div>
                            <div class="card mt-3" onclick="location.href='Delivery_slots.aspx'">
                                <label class="title m-0"><i class="fa fa-clock-o"></i>&nbsp;Delivery Slot Set up<i class="fa fa-plus editaddress pull-right angledown"></i></label>


                            </div>
                            <div class="card mt-3 mb-3" onclick="location.href='add_delivery_agent.aspx'">
                                <label class="title m-0 editpersonal"><i class="fa fa-user"></i>&nbsp;Add Delivery Agent <i class="fa fa-plus pull-right angledown "></i></label>

                            </div>
                            <div class="card mt-3 mb-3" onclick="location.href='../Admin/retialer_itemsadd.aspx'">
                                <label class="title m-0 editpersonal"><i class="fa fa-th-large"></i>&nbsp;Setup Items Catalogue <i class="fa fa-plus pull-right angledown "></i></label>
                            </div>
                            <div class="card mt-3 d-none">
                                <label class="title m-0 editpersonal"><i class="fa fa-refresh"></i>&nbsp;Subscription Set up<i class="fa fa-plus editaddress pull-right angledown"></i></label>
                                <div class="container personal__details" style="display: none;">
                                    <hr class="m-0 p-0" />
                                    <div class="row">

                                        <div class="col-12">
                                            <div class="p-2">
                                                <span>Delivery cutoff time</span>
                                                <input name="perPrice" type="time" id="cutofftime" placeholder="10:00 PM" class="personal__input w-100 mb-2" style="" />
                                                <span>Subscription delivery time</span>
                                                <input name="abovePrice" type="time" id="deliverytime" placeholder="05:00 AM" class="personal__input w-100 mb-2 " style="" />

                                                <div class="container">
                                                    <div class="row p-2">
                                                        <button type="button" class="btn btnstyle w-100 deliverycharges">Save Changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="row">

                                        <div class="col-12">

                                            <div class="p-2">
                                                <div>
                                                <span>Delivery Frequency</span>
                                                <div class="row mt-3 mb-3">
                                                     <div class="col-6"> <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Daily"/>
                                                    <label class="custom-control-label m-0" for="Daily">Daily</label>
                                                </div></div>
                                                    <div class="col-6"> <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Weekly"/>
                                                    <label class="custom-control-label m-0" for="Weekly">Weekly</label>
                                                </div></div>
                                                    <div class="col-6"> <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Monthly"/>
                                                    <label class="custom-control-label m-0" for="Monthly">Monthly</label>
                                                </div></div>
                                                </div>
                                                </div>
                                                <span>Delivery Slots</span>
                                                <div class="row mb-3 mt-3">
                                                    <div class="col-6"> <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="monday"/>
                                                    <label class="custom-control-label m-0" for="monday">Monday</label>
                                                </div></div>
                                               <div class="col-6">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="tues"/>
                                                    <label class="custom-control-label m-0" for="tues">Tuesday</label>
                                                </div>
                                                   </div>
                                                    <div class="col-6">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Wednesday"/>
                                                    <label class="custom-control-label m-0" for="Wednesday">Wednesday</label>
                                                </div>
                                                        </div>
                                                     <div class="col-6">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Thursday"/>
                                                    <label class="custom-control-label m-0" for="Thursday">Thursday</label>
                                                </div>
                                                         </div>
                                                     <div class="col-6">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Friday"/>
                                                    <label class="custom-control-label m-0" for="Friday">Friday</label>
                                                </div>  </div>
                                                    <div class="col-6">
                                                 <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Saturday"/>
                                                    <label class="custom-control-label m-0" for="Saturday">Saturday</label>
                                                </div></div>
                                                    <div class="col-6">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="Sunday"/>
                                                    <label class="custom-control-label m-0" for="Sunday">Sunday</label>
                                                </div>
                                                        </div>
                                                </div>
                                                <div>
                                                <span>Delivery Timing</span>
                                                <div class="row mt-3 mb-3">
                                                    
                                                    <div class="col-5 pr-0">
                                                        <input name="perPrice" type="text" id="delivstarttime" placeholder="05:00 AM" class="personal__input w-100 mb-2" style="" /></div>
                                                    <div class="col-2">to</div>
                                                    <div class="col-5 pl-0">
                                                        <input name="perPrice" type="text" id="delivendtime" placeholder="08:00 AM" class="personal__input w-100 mb-2" style="" /></div>
                                                </div>
                                                </div>



                                                <div class="container">
                                                    <div class="row p-2">
                                                        <button type="button" class="btn btnstyle w-100 deliverycharges">Save Changes</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>--%>
                                        </div>

                                    </div>

                                </div>

                            </div>
                            <div class="card mt-3  d-none">
                                <label class="title m-0 editpersonal"><i class="fa fa-users"></i>&nbsp;My Customer<i class="fa fa-plus editaddress pull-right angledown"></i></label>
                                <div class="container personal__details" style="display: none;">
                                    <hr class="m-0 p-0" />
                                    <div class="row">

                                        <div class="col-12">
                                            <div class="addcustomer">
                                                <span>Name</span>
                                                <input name="perPrice" type="text" id="cname" class="personal__input w-100 mb-2" style="" />
                                                <span>Mobile</span>
                                                <input name="perPrice" type="text" id="cmobile" class="personal__input w-100 mb-2" style="" />
                                                <span>Address</span>
                                                <input name="perPrice" type="text" id="caddress" class="personal__input w-100 mb-2" style="" />
                                                <div class="container">
                                                    <div class="row p-2">
                                                        <button type="button" class="btn btnstyle w-100 addcustomerbtn">Save Changes</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div id="mycustomers">
                                                <div class="card mt-2 mb-2 p-2" style="font-size:12px;">
                                                    <div class="cust_name"><strong>Rahul Kumar</strong> - (0987654321)</div>
                                                     <div class="cust_name">Address - modal town sector 89 abc def</div>

                                                </div>

                                                <div class="card mt-2 mb-2 p-2" style="font-size:12px;">
                                                    <div class="cust_name"><strong>Amit Kumar</strong> - (0987654321)</div>
                                                     <div class="cust_name">Address - modal town sector 89 abc def</div>

                                                </div>
                                            </div>--%>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3"></div>
                    </div>
                </div>

            </section>

        </div>
    </form>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/0.8.1/cropper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <%--    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>--%>

    <%--<script src="../Assest/js/Main_script.js"></script>--%>
    <%-- <script src="../Assest/js/owl.carousel.min.js"></script>--%>

    <input type="hidden" id="custid" runat="server" />
    <input type="hidden" id="imgurl" runat="server" />
    <script src="../Items/Add_Balance.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script>
        /*const { func } = require("prop-types");*/


        $(".editpersonal").click(function () {

            $(this).parent().find(".personal__details").slideToggle("slow", function () {
                if ($(this).parent().find(".angledown").hasClass("fa-plus")) {
                    $(this).parent().find(".fa-plus").removeClass("fa-plus").toggleClass("fa-minus");
                }
                else {
                    $(this).parent().find(".fa-minus").removeClass("fa-minus").toggleClass("fa-plus");
                }
            });

        })

        $(".editpersonal_btn").click(function (e) {
            $(this).hide()
            $(".cancelpersonal_btn").show();
            $(".personal__lable").hide();
            $(".personal__input").show();
            $("#submituserbtn").show();
            $('#uploadcamera').show();
            $("#item_img_output2").show();
            $("#item_img_output").hide();

        });

        $(".cancelpersonal_btn").click(function (e) {
            $(this).hide()
            $(".editpersonal_btn").show();
            $(".personal__lable").show();
            $(".personal__input").hide();
            $("#submituserbtn").hide();
            $('#uploadcamera').hide();
            $("#item_img_output2").hide();
            $("#item_img_output").show();
        });


        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                    $('#imagePreview').hide();
                    $('#imagePreview').fadeIn(650);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        function readURL2(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imagePreview2').attr('src', e.target.result);
                    $('#imagePreview2').hide();
                    $('#imagePreview2').fadeIn(650);
                    $('#avatar-preview').show();
                    $('.uploadbtn').show();


                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $("#imageUpload").change(function () {
            readURL(this);
        });


        $("#fileupload").change(function () {
            readURL2(this);
        });

        // initialisation des variables
        var fileInput = document.querySelector(".input-file"),
            button = document.querySelector(".input-file-trigger"),
            the_return = document.querySelector(".file-return");

        // action lorsque la "barre d'espace" ou "Entrée" est pressée
        button.addEventListener("keydown", function (event) {
            if (event.keyCode == 13 || event.keyCode == 32) {
                fileInput.focus();
            }
        });

        // action lorsque le label est cliqué
        button.addEventListener("click", function (event) {
            fileInput.focus();
            return false;
        });

        // affiche un retour visuel dès que input:file change
        fileInput.addEventListener("change", function (event) {
            //the_return.innerHTML = this.value;
            $('#labelFU').text("Choosen file : " + this.value);
        });




        $("#bannerbtn").click(function (e) {
            e.stopImmediatePropagation();
            $.ajax({
                type: "POST",
                async: true,
                url: "Retailer_profile.aspx/GetBanners",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#appendbanner").empty();
                        $("#appendbanner").append(data.d);

                        $(".deletebannerbtn").click(function (e) {
                            e.stopImmediatePropagation();
                            $(this).parent().remove();
                            var bbid = $(this).attr("bbid");
                            $.ajax({
                                type: "POST",
                                async: true,
                                url: "Retailer_profile.aspx/Deletbaner",
                                data: '{"bbid":"' + bbid + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (data) {
                                    if (data.d != "") {
                                        showpopup("Banner Deleted successfully");

                                    }

                                }
                            });
                        })

                        $('.fa-download').click(function (g) {
                            g.stopImmediatePropagation();
                            let imagePath = $(this).attr('img');
                            let fileName = getFileName(imagePath);
                            saveAs(imagePath, fileName);
                        })
                    }

                }
            });

        })
        function getFileName(str) {
            return str.substring(str.lastIndexOf('/') + 1)
        }

        $(".uploadbtn").click(function (e) {
            e.stopImmediatePropagation();
            var imagesrc = $("#imagePreview2").attr("src");
            var ImgSource = '';
            if (imagesrc != null || imagesrc != undefined) {
                ImgSource = imagesrc.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
            }

            $.ajax({
                type: "POST",
                async: true,
                url: "Retailer_profile.aspx/InsertBanner",
                data: '{"ImgSource":"' + ImgSource + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        showpopup("Banner added successfully")
                        $(this).hide();

                    }

                }
            });

        })



    </script>
</body>
</html>
