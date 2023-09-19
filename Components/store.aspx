<%@ Page Language="C#" AutoEventWireup="true" CodeFile="store.aspx.cs" Inherits="Components_store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>change store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="CSS/store.css" rel="stylesheet" />
    <link href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.min.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../swiper-master/Package/css/swiper.min.css" rel="stylesheet" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <script src="../Admin/js/global.js"></script>


    <style>
        .pac-container {
            z-index: 9999;
        }

        body {
            font-family: Arial, Helvetica, sans-serif !important;
            font-size: .9rem;
        }

        .title {
            border-bottom: 1px solid #8cc9f3;
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            color: #ffffff;
            background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;
        }

        /* .footer {
            height: 35px;
            background: #384862 !important;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
            text-align: center;
            font-size: 13px;
            padding-top: 5px;
        }*/

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 1;
        }

        .footer {
            height: 25px;
            background: #fff;
        }

        .boxshadow {
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
            border: none !important;
        }

        .fa-edit {
            float: right;
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
        }

        .offpercnt {
            color: red;
            float: right;
        }

        .ui-menu {
            z-index: 99999;
            width: 86% !important;
        }
        /*card design end---------------------------------------------------*/
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
            <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 30px; margin-top: -15px; color: white;">Select Store
                    <%--<p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Sector-14, Gurugram</p>--%>
                </a>
                <a href="My_Profile.aspx" style="color: white;"><span id="UserName_n_Pic" class="userpic">&nbsp;&nbsp; <i class="fa fa-user-circle" style="font-size: 25px;"></i></span></a>

            </nav>
            <section style="margin-top: 90px;">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-1 col-md-1"></div>
                        <div class="col-sm-10 col-md-10">
                            <div class="header__store">
                                <div class="row" style="padding-top: 10px; background: white; padding-bottom: 10px; margin-top: -12px;">
                                    <div class="col-2-5 pr-0"><span class="boldfont">For area: </span></div>
                                    <div class="col-6 pr-0 pl-0">
                                        <span class="lightgray-font " id="current_location"></span>
                                    </div>
                                    <div class="col-3-5 pl-0"><span><a class=" change__address btnstyle " style="color: white;">Change Location </a></span></div>
                                </div>
                                <div class="row d-none" id="searchsection">
                                    <div class="col-12">
                                        <a class=" searchbox" style="transition: 2s; padding: 0px; box-shadow: 0 2px 8px 0 rgba(0,0,0,.1); margin-top: 10px; border: none !important; right: 10px !important; background-color: #ffffff; position: fixed; display: flex; z-index: 9999; width: 94%; margin-bottom: 15px;">
                                            <div class="searchbox">
                                                <div class="form-group m-0">
                                                    <i class="fa fa-search"></i>
                                                    <input class="inputseacrh" placeholder="Search here..." id="search_for_menu" />

                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                </div>


                            </div>
                            <div class="store__section">
                                <div class="container">
                                    <div class="row" id="bindNearStores">
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="col-sm-1 col-md-1"></div>
                    </div>

                </div>

            </section>

        </div>
    </form>





    <div class="modal fade" id="findStoreModal" tabindex="-1" style="z-index: 9999;" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Find Store</h5>
                    <button class="close btn btn-primary" type="button" data-dismiss="modal" aria-label="Close">
                        <%--<span aria-hidden="true">×</span>--%> OK
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 ">
                            <input type="search" class="form-control" placeholder="Search address " id="pac-input" />
                        </div>
                        <div class="col-12">
                            <div class="container mt-2">
                                <div class="row">
                                    <button class="btn btnstyle current_location w-100">
                                        <img width="20" style="fill: white" src="https://mycornershop.in/Menu_Pics/precision.svg" alt="Location" />
                                        <span class="mt-1">&nbsp;&nbsp;Use current location</span>
                                    </button>


                                </div>
                            </div>


                        </div>
                        <div class="col-12 mt-4">
                            <div id="mapcanvas" style="width: 100%; height: 500px;"></div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <script src="../swiper-master/Package/js/swiper.min.js"></script>
    <script src="../Items/Add_Balance.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8KEha4w6awdeV8g4rEOMoLvSO1CrUkXg&libraries=places&v=3&sensor=false" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/geocomplete/1.7.0/jquery.geocomplete.min.js"></script>
    <%--<script>
        $(".walletbtn").click(function () {
            if ($(".cardatmcls").hasClass("atmcard")) {
                $(".cardatmcls").removeClass("atmcard")
                $(".cardatmcls").addClass("atmcardopen")


            } else {
                $(".cardatmcls").addClass("atmcard")
                $(".cardatmcls").removeClass("atmcardopen");
                $("#Layer_1 path").attr('fill', 'gray');

            }
        });
    </script>--%>

    <script type="text/javascript">

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
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

        function storeInCookie(Value,Name) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "store.aspx/storeInCookie",
                data: '{Value: "' + Value + '",Name: "' + Name + '"}',
                dataType: "json",
                success: function (data) {

                }
            })
        }

        $(document).ready(function () {
            if (getUrlParameter('ulid') != false) {
                storeInCookie(getUrlParameter('ulid'), 'user_id');
                //setCookie('user_id', getUrlParameter('ulid'), 365)
            }
            if (getUrlParameter('rid') != false) {
                storeInCookie(getUrlParameter('rid'), 'rid');
                //setCookie('rid', getUrlParameter('rid'), 365)
            }
            var query = window.location.search.substring(1)
            if (query.length) {
                if (window.history != undefined && window.history.pushState != undefined) {
                    window.history.pushState({}, document.title, window.location.pathname);
                }
            }

            if ($.cookie('user_id')) {
                getUserData();
            }

            initGeolocation();
            var geocoder = new google.maps.Geocoder();
            $("#pac-input").autocomplete({
                source: function (request, response) {
                    geocoder.geocode({
                        'address': request.term
                    }, function (results, status) {
                        response($.map(results, function (item) {
                            return {
                                label: item.formatted_address,
                                value: item.formatted_address,
                                lat: item.geometry.location.lat(),
                                lon: item.geometry.location.lng()
                            };
                        }));
                    });
                },
                select: function (event, ui) {

                    getNearStores(ui.item.lat, ui.item.lon);

                }
            });
        })

        function getUserData() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "store.aspx/getUserData",
                data: '{}',
                dataType: "json",
                success: function (data) {

                }
            })
        }

        $('.current_location').click(function (e) {
            e.stopImmediatePropagation();
            initGeolocation();
        })
        window.onpopstate = function () {
            let open_modal = document.querySelector('.modal.show')
            if (open_modal) {
                open_modal.dataset.pushback = 'true';
                $(open_modal).modal('hide')
            }
        }


        function initGeolocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(success, fail);
            }
            else {
                var cookieExist = $.cookie("user_id");
                if (cookieExist == "null") {
                    getUserLocation();
                }

            }
        }

        function success(position) {
            getNearStores(position.coords.latitude, position.coords.longitude);
            setCookie('user_lat', position.coords.latitude, 365);
            setCookie('user_long', position.coords.longitude, 365);
        }

        function fail() {
            var cookieExist = $.cookie("user_id");
            if (cookieExist == "null") {
                getUserLocation();
            }
            // Could not obtain location
        }

        function getUserLocation() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "store.aspx/getUserLocation",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        setCookie('user_lat', parsedData[0].LAT, 365);
                        setCookie('user_long', parsedData[0].LONG, 365);
                        getNearStores(parsedData[0].LAT, parsedData[0].LONG);
                    }
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        }

        function getNearStores(lattitude, longitude) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "store.aspx/getNearStores",
                data: '{lattitude: "' + lattitude + '",longitude: "' + longitude + '"}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    $('#bindNearStores').empty();
                    $('#bindNearStores').append(data.d);
                    $("#pac-input").blur();
                    getAddress(lattitude, longitude);
                    myMap(lattitude, longitude);
                    $('.visitstore').click(function (e) {
                        e.stopImmediatePropagation();
                        $("#preload").show();
                        setCookie('rid', $(this).attr('rid'), 365);
                        window.location.href = '../Home.aspx';
                    })
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
                        autoplay: { delay: 5000, }
                    });
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        }

        function getAddress(lattitude, longitude) {

            return new Promise(function (resolve, reject) {

                var request = new XMLHttpRequest();

                var method = 'GET';
                var url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lattitude + ',' + longitude + '&sensor=true&key=AIzaSyB8KEha4w6awdeV8g4rEOMoLvSO1CrUkXg';
                var async = true;

                request.open(method, url, async);
                request.onreadystatechange = function () {
                    if (request.readyState == 4) {
                        if (request.status == 200) {
                            var data = JSON.parse(request.responseText);
                            var address = data.results[0];
                            resolve(address);

                            $('#current_location').html(address.address_components[1].long_name + ' ' + address.address_components[4].long_name)
                        }
                        else {
                            reject(request.status);
                        }
                    }
                };
                request.send();
            });
        };

        $('.change__address').click(function (e) {
            e.stopImmediatePropagation();
            $('#findStoreModal').modal();

        })

        var map = '';
        function myMap(latitude, longitude) {

            map = new google.maps.Map(document.getElementById('mapcanvas'), {
                zoom: 15,
                center: new google.maps.LatLng(latitude, longitude),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            var infowindow = new google.maps.InfoWindow();

            var marker, i;


            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "store.aspx/getRetailersLatLong",
                data: '{lattitude: "' + latitude + '",longitude: "' + longitude + '"}',
                dataType: "json",
                success: function (data) {
                    var locations = data.d;
                    for (i = 0; i < locations.length; i++) {
                        marker = new google.maps.Marker({
                            position: new google.maps.LatLng(locations[i].lattitude, locations[i].longitude),
                            map: map,
                            //title: locations[i].NAME,
                            title: "<p><strong>" + locations[i].NAME + "</strong><br/>" + locations[i].Address + "</p>",
                            icon: {
                                url: "https://mycornershop.in/menu_pics/mapicon.png", // url
                                scaledSize: new google.maps.Size(40, 50), // scaled size
                                origin: new google.maps.Point(0, 0), // origin
                                anchor: new google.maps.Point(0, 0) // anchor},
                            },

                            animation: google.maps.Animation.DROP,
                        });

                        var StartPoint = parseFloat(latitude) + ',' + parseFloat(longitude);
                        var EndPoint = parseFloat(locations[i].lattitude) + ',' + parseFloat(locations[i].longitude);
                        bindInfoWindow(marker, map, infowindow, "<p>" + locations[i].NAME + "<br/>" + locations[i].Address + "</p>", locations[i].NAME, StartPoint, EndPoint);

                    }
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(latitude, longitude),
                        map: map,
                        // title: 'Your current location',  //$('#current_location')
                        title: "<p><strong>Your current location</strong><br/>" + $('#current_location').text() + "</p>",
                        draggable: true,
                        animation: google.maps.Animation.DROP,
                    });
                    bindInfoWindow(marker, map, infowindow, "<p><strong>Your current location</strong><br/>" + $('#current_location').text() + "</p>", 'Your current location', '', '');
                }
            })

        }

        function bindInfoWindow(marker, map, infowindow, html, Ltitle, StartPoint, EndPoint) {
            google.maps.event.addListener(map, 'mouseover', function () {
                infowindow.setContent(html);
                infowindow.open(map, marker);

            });
            google.maps.event.addListener(marker, 'dragend', function () {
                infowindow.setContent(html);
                infowindow.open(map, marker);

                getNearStores(marker.position.lat(), marker.position.lng());
            });
            google.maps.event.addListener(map, 'mouseout', function () {
                infowindow.close();

            });
            google.maps.event.addListener(map, "click", function (e) {


                infowindow.setContent(html);
                getNearStores(e.latLng.lat(), e.latLng.lng());

            });

            window.google.maps.event.addListener(marker, 'click', function () {

                infowindow.setContent(this.get('title'));
                infowindow.open(map, this);
            });
        }

        function init() {
            var autocomplete = new google.maps.places.Autocomplete($("#pac-input")[0], {});
            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();

                getNearStores(place.geometry.location.lat(), place.geometry.location.lng());
            });

        }


        function initialize(startPoint, endPoint) {
            var cur_lat = "";
            var cur_lng = ""
            var vLatitude = "";
            var vLongitude = "";
            var directionDisplay;
            var directionsService = new google.maps.DirectionsService();
            var mapp;

            directionsDisplay = new google.maps.DirectionsRenderer();
            var myOptions = {
                mapTypeId: google.maps.MapTypeId.ROADMAP,
            }
            mapp = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);
            directionsDisplay.setMap(mapp);

            var start = startPoint;
            var end = endPoint;

            //var start = cur_lat+","+cur_lng;
            // var end = vLatitude+","+vLongitude;

            var request = {
                origin: start,
                destination: end,
                travelMode: google.maps.DirectionsTravelMode.DRIVING
            };
            directionsService.route(request, function (response, status) {
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                    var myRoute = response.routes[0];

                    /* instructions */


                    var txtDir = '<div><strong>Total Distance : ' + myRoute.legs[0].distance.text + '</strong></div><div><strong>Total Duration : ' + myRoute.legs[0].duration.text + '</strong></div><ol>';
                    for (var i = 0; i < myRoute.legs[0].steps.length; i++) {
                        if (myRoute.legs[0].steps[i].maneuver.length > 0)
                            maneuver = '<img src="img/' + myRoute.legs[0].steps[i].maneuver + '.png" style="margin-right:10px;width:12px; height:12px;" >'
                        else
                            maneuver = "";
                        txtDir += '<li>' + maneuver + myRoute.legs[0].steps[i].instructions + ' <br><strong style="float:right;">' + myRoute.legs[0].steps[i].distance.text + '</strong></li>';
                        //showpopup(myRoute.legs[0].steps[i].maneuver.length)
                        //google.maps.geometry.encoding.decodePath(myRoute.legs[0].steps[i].polyline.points)straight
                    }
                    txtDir += '</ol>';
                    document.getElementById('tGetDirection').innerHTML = txtDir;
                    $('#tGetDirection').show();

                    //$.mobile.hidePageLoadingMsg();
                }
            });
        }
    </script>
</body>
</html>
