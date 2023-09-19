<%@ Page Language="C#" AutoEventWireup="true" CodeFile="My_Profile.aspx.cs" Inherits="Components_My_Profile" %>



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
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;">My Profile
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;">details</p>
                </a>
                <%-- <span id="UserName_n_Pic" class="userpic">&nbsp;&nbsp; <i class="fa fa-user-circle" style="font-size: 25px;"></i></span>--%>
            </nav>
            <section style="margin-top: 90px;">
                <div class="container">

                    <div class="row">
                        <div class="col-sm-2 col-md-2"></div>
                        <div class="col-sm-8 col-md-8">
                            <div class="card mt-3">
                                <label class="title m-0 editpersonal">Personal Details <i class="fa fa-plus pull-right angledown "></i></label>

                                <div class="container personal__details" style="display: none;">
                                    <hr class="m-0 p-0" />
                                    <div class="card border-left-primary shadow mt-2 mb-2">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-12 "><i style="float: right; font-size: 13px; color: #17c3d4;" class="fa fa-pencil editpersonal_btn "></i><i style="float: right; font-size: 13px; color: #17c3d4; display: none;" class="fa fa-times cancelpersonal_btn "></i></div>
                                            </div>
                                            <%--<div class="row">
								<div class="col-xs-12" style="margin: auto;">
									<label class="cabinet center-block " style="height: 80px;width: 80px;">
										<figure style="height:80px;width:80px;">
											<img src="" class="gambar img-responsive img-thumbnail" id="item_img_output" runat="server" />
                                            <img src="" class="gambar img-responsive img-thumbnail" style="display:none" id="item_img_output2" runat="server" />
										  <figcaption id="uploadcamera" style="display:none;">
                                              <input type="file" style="display:none;"  />
                                              <i class="fa fa-camera"></i></figcaption>
								    </figure>
									 
                                         
									</label>
								</div>
							</div> --%>

                                            <div class="avatar-upload">
                                                <div class="avatar-edit">
                                                    <input type='file' id="imageUpload" accept="image/*" capture="camera" />
                                                    <label for="imageUpload"></label>
                                                </div>
                                                <div class="avatar-preview">
                                                    <div id="imagePreview" runat="server" >
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-4">
                                                    <span><span>Name</span></span>
                                                </div>
                                                <div class="col-8 mb-2">
                                                    <span id="username" class="personal__lable" runat="server"></span>
                                                    <input id="username__input" runat="server" class="personal__input w-100 " value="" style="display: none;" />
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    <span><span>Mobile</span></span>
                                                </div>
                                                <div class="col-8 mb-2">
                                                    <span id="mobile" class="personal__lable" runat="server"></span>
                                                    <input id="mobile__input" runat="server" class="personal__input w-100 " value="" style="display: none;" />
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    <span><span>Email</span></span>
                                                </div>
                                                <div class="col-8 mb-2">
                                                    <span id="email" class="personal__lable" runat="server"></span>
                                                    <input id="email__input" runat="server" class="personal__input w-100" value="" style="display: none;" />
                                                </div>

                                            </div>
                                            <div class="row">

                                                <div class="col-12 mb-2 mt-2">
                                                    <button id="submituserbtn" type="button" class="btn btnstyle  w-100" style="display: none;">Submit</button>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                            <div class="card mt-3">
                                <label class="title m-0 editpersonal">Address <i class="fa fa-plus editaddress pull-right angledown"></i></label>
                                <div class="container personal__details" style="display: none;">
                                    <hr class="m-0 p-0" />
                                    <div class="row">

                                        <div class="col-12">

                                            <div id="addressbindhere">
                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>
                            <div class="card mt-3 text-center d-none" style="margin-bottom: 50px;font-size:17px;">
                                <label class="title m-0">Contact us</label>
                                 <span class="contactnumber" id="retailer_number" runat="server">0987654321</span>
                                 <span class="">Query not solved ? <a href="https://www.mycornershop.in">click here</a></span>
                                <hr />
                                Reach out to our customer care on
                                <span class="email mb-2"><i class="fa fa-envelope"></i> contactus@mycornershop.in</span>
                                <%--<span class="number"><i class="fa fa-phone"></i> +91 9650601555</span>--%>
                            </div>


                        </div>
                        <div class="col-sm-2 col-md-2"></div>
                    </div>
                </div>

            </section>

        </div>
    </form>
     

    <%-- <footer>
        <div class="footer"><span>Copyright &copy; MyCornnerShop 2020</span></div>
    </footer>--%>
    <div class="footer boxshadow d-none" style="color: #000; height: auto;" id="active_balance">
        <div class="row">
            <div class="col-3 text-center menuopt" onclick="location.href='../Home.aspx'">
                <a href="../Home.aspx" class="_menu_opt">
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
                    Home</a>
            </div>
            <div class="col-3 text-center menuopt"  onclick="location.href='../Components/scheduler.aspx'">
                <a class="_menu_opt " href="javascript:void(0);">

                    <svg version="1.1" id="Capa_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                        viewBox="0 0 512 512" width="22.398px" height="22.398px" style="enable-background: new 0 0 512 512; margin-bottom: -10px; fill: gray" xml:space="preserve">
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
                                    fill="#gray" />
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
                    Order</a>
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
                    Wallet</a>
            </div>
            <div class="col-3 text-center menuopt" id="Mycart" onclick="location.href='../cart.aspx'">
                <a class="_menu_opt" href="../cart.aspx">


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
                    Cart</a>
            </div>
        </div>
    </div>
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



    <div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content" style="width: 92%;">
							<div class="modal-header">
							  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							  <h4 class="modal-title" id="myModalLabel"><?=multiLanguage( "Edit Foto" , "Edit Photo" )?></h4>
							</div>
							<div class="modal-body">
				            <div id="upload-demo" class="center-block"></div>
				      </div>
							 <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="cropImageBtn" class="btn btn-primary">Crop</button>
      </div>
						    </div>
						  </div>
						</div>


    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/0.8.1/cropper.min.js"></script>
    <%--    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>--%>

    <%--<script src="../Assest/js/Main_script.js"></script>--%>
    <%-- <script src="../Assest/js/owl.carousel.min.js"></script>--%>

    <input type="hidden" id="custid" runat="server"/>
    <input type="hidden" id="imgurl" runat="server"/>
    <script src="../Items/Add_Balance.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script>
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

        $(document).ready(function () {

            //$("#addaddressmodel").modal();
            initGeolocation();
            getAllAddress();
        });

        function initGeolocation() {
            if (navigator.geolocation) {
                // Call getCurrentPosition with success and failure callbacks
                navigator.geolocation.getCurrentPosition(success, fail);
            }
            else {
                //showpopup("Sorry, your browser does not support geolocation services.");
            }
        }

        function success(position) {
          //  showpopup('Lat- ' + position.coords.latitude + ' , Long- ' + position.coords.longitude)
            //document.getElementById('long').value = position.coords.longitude;
            //document.getElementById('lat').value = position.coords.latitude
        }

        function fail() {
            // Could not obtain location
          //  showpopup('Failed to get location');
        }


        function getAllAddress() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "My_Profile.aspx/fnGetAllAddress",
                data: '{}',
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $('#addressbindhere').empty();
                        $('#addressbindhere').append(data.d);

                        $(".defaultaddress").click(function () {
                            $(".defaultaddress").removeClass("fa-heart");
                            $(".defaultaddress").addClass("fa-heart-o");
                            $(".defaultaddress").removeClass("text-danger");
                            if ($(this).hasClass("fa-heart-o")) {
                                $(this).removeClass("fa-heart-o");
                                $(this).toggleClass("fa-heart");
                                $(this).addClass("text-danger");
                                var Address_ID = $(this).attr('add_id');
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "address.aspx/updateDefaultAddress",
                                    data: '{Address_ID: "' + Address_ID + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        showpopup('Default address changed successfully');

                                        setTimeout(function (e) {
                                            // window.history.back();
                                            location.reload();
                                        }, 2000)

                                    }
                                });
                            } else {
                                $(this).removeClass("fa-heart");
                                $(this).toggleClass("fa-heart-o");
                            }

                        })

                        $('input[name="optradio"]').change(function (e) {

                            var Flag = $(this).attr('flag');
                            var Address_ID = $(this).attr('add_id');

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "address.aspx/updateAddressType",
                                data: '{Address_ID: "' + Address_ID + '",Flag: "' + Flag + '"}',
                                dataType: "json",
                                success: function (data) {

                                }
                            })
                        });

                    }

                    editaddress();
                }
            })
        }
        function editaddress() {

            $(".editaddress_btn").click(function () {

                var custaddid = $(this).attr("add_id");
                $('#Updateaddaddressmodel').empty();
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "address.aspx/fnUpdateaddress",
                    data: '{custaddid:"' + custaddid + '"}',
                    beforeSend: function () {

                    },
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#Updateaddaddressmodel').append(data.d);
                        $('#Updateaddaddressmodel').modal();
                        $("#UpdateAddress").click(function () {
                            var add_id = $(this).attr("address_id");
                            var Name = $("#usernames").val();
                            var mobile = $("#usermobiles").val();
                            var addressflat = $("#Addresss").val();
                            var buildingname = $("#buildingnames").val();
                            var city = $("#Citys").val();
                            var state = $("#states").val();
                            var pincode = $("#pincodes").val();
                            var nearby = $("#Landmarks").val();
                            if (add_id.length == 0) {
                                showpopup("! Something went wrong Please try again later")
                            } else {
                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "address.aspx/fnUpdatedaddress",
                                    data: '{add_id:"' + add_id + '",Name:"' + Name + '",mobile:"' + mobile + '",addressflat:"' + addressflat
                                        + '",buildingname:"' + buildingname + '",city:"' + city + '",state:"' + state + '",pincode:"' + pincode
                                        + '",nearby:"' + nearby + '"}',
                                    beforeSend: function () {

                                    },
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (data) {
                                        getAllAddress();
                                        $('#Updateaddaddressmodel').modal('hide');
                                    }
                                });
                            }


                        })

                    }
                })
            })
        }

        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }


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






        //function readURL(input) {
        //    if (input.files || input[0].files) {
        //        var reader = new FileReader();
        //        reader.onload = function (e) {
        //            $("#item_img_output2").removeAttr('src');
        //            $("#item_img_output2").attr("src", "../Menu_Pics/" + e.target.result);
        //        };
        //        reader.readAsDataURL(input[0].files);

        //    }
        //}

        //$(".upload-button").on('click', function () {
        //    $("#uploadBtn").click();
        //});

        //$("#uploadBtn").change(function () {
        //    readURL(this);


        //});
        //var url2 = '';
        //$("#uploadBtn").change(function () {

        //    readURL3(this);

        //});

        //function readURL3(input) {
        //    if (input.files && input.files[0]) {
        //        var reader = new FileReader();
        //        reader.onload = function (e) {
        //            url2 = e.target.result;
        //        };

        //        reader.readAsDataURL(input.files[0]);
        //    }
        //}
        //function ConvChar(str) {
        //    c = {
        //        '<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;', "'": '&#039;',
        //        '#': '&#035;'
        //    };
        //    return str.replace(/[<&>'"#]/g, function (s) { return c[s]; });
        //}

        // Start upload preview image 
        //$("#item_img_output").attr("src", "../Menu_Pics/" + $('#imgurl').val());
        //$("#item_img_output2").attr("src", "../Menu_Pics/" + $('#imgurl').val());
        //var $uploadCrop,
        //    tempFilename,
        //    rawImg,
        //    imageId;
        //function readFile(input) {
        //    if (input.files && input.files[0]) {
        //        var reader = new FileReader();
        //        reader.onload = function (e) {
        //            //$('.upload-demo').addClass('ready');
        //            //$('#cropImagePop').modal('show');
        //            //rawImg = e.target.result;
        //            $("#item_img_output2").attr("src", "../Menu_Pics/" + e.target.result);
        //        }
        //        reader.readAsDataURL(input.files[0]);
        //    }
        //    else {
        //        swal("Sorry - you're browser doesn't support the FileReader API");
        //    }
        //}

        //$uploadCrop = $('#upload-demo').croppie({
        //    viewport: {
        //        width: 150,
        //        height: 200,
        //    },
        //    enforceBoundary: false,
        //    enableExif: true
        //});
        //$('#cropImagePop').on('shown.bs.modal', function () {
        //    // alert('Shown pop');
        //    $uploadCrop.croppie('bind', {
        //        url: rawImg
        //    }).then(function () {
        //        console.log('jQuery bind complete');
        //    });
        //});

        //$('.item-img').on('change', function () {
        //    imageId = $(this).data('id'); tempFilename = $(this).val();
        //    $('#cancelCropBtn').data('id', imageId); readFile(this);
        //});

        //$("#uploadcamera").change(function () {

        //var input = $(document.createElement("input"));
        //input.attr("type", "file");
        //// add onchange handler if you wish to get the file :)
        //input.trigger("click"); // opening dialog
        // readURL($(this).find('input'));
        //return false; // avoiding navigation
        // });


        //$('#cropImageBtn').on('click', function (ev) {
        //    $uploadCrop.croppie('result', {
        //        type: 'base64',
        //        format: 'jpeg',
        //        size: { width: 150, height: 200 }
        //    }).then(function (resp) {
        //        showpopup('1')
        //        $('#item_img_output2').removeAttr('src');
        //        $('#item_img_output2').attr('src', resp);
        //        $('#cropImagePop').modal('hide');
        //    });
        //});
        // End upload preview image



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

        if (button) {
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
        }

        if (fileInput) {
            // affiche un retour visuel dès que input:file change
            fileInput.addEventListener("change", function (event) {
                //the_return.innerHTML = this.value;
                $('#labelFU').text("Choosen file : " + this.value);
            });
        }


        $("#submituserbtn").click(function (e) {
            e.stopImmediatePropagation();
            $("#submituserbtn").attr('disabled', 'disabled');
            var imagesrc = $("#imagePreview").css("background-image").replace('url(', '').replace(')', '').replace(/\"/gi, "");;
            var ImgSource = '';
            if (imagesrc != null || imagesrc != undefined) {
                ImgSource = imagesrc.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
            }
            else if (imagesrc == "../Menu_Pics/default-user-avatar.png") {
                ImgSource = "";
            }
            var username = $("#username__input").val();
            var usermobile = $("#mobile__input").val();
            var useremail = $("#email__input").val();
            var custid = $("#custid").val();

            $.ajax({
                type: "POST",
                async: true,
                url: "My_Profile.aspx/Updateuserdata",
                data: '{ImgSource:"' + ImgSource + '",username:"' + username + '",usermobile:"' + usermobile + '",useremail:"' + useremail + '",custid:"' + custid + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    showpopup('Updated successfully');
                    location.reload();
                }

            })

        })


    </script>
</body>
</html>
