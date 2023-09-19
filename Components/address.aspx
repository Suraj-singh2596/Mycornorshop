<%@ Page Language="C#" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="Components_address" %>



<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Address</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="../Admin/css/textfield.css" rel="stylesheet" />
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="../Admin/css/sb-admin-2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
    <script src="../Admin/js/global.js"></script>

    <style>
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


        body {
            font-family: Arial, Helvetica, sans-serif !important;
        }

        .topbar {
            height: 3.375rem;
        }



        .sidebar-brand-text {
            color: white;
        }

        .navbar-light .navbar-brand {
            color: rgb(255, 255,255) !important;
        }

        #dashbordsection {
            margin-top: 100px;
        }

        footer.sticky-footer {
            padding: 1rem 0;
        }

        .form-control:focus {
            border-color: none;
            box-shadow: none;
        }

        .bg-light {
            background: #384862 !important;
            border-bottom-left-radius: 5px !important;
            border-bottom-right-radius: 5px !important;
            color: white !important;
            height: 80px !important;
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

        .footer {
            background: #fff !important;
            position: fixed;
            width: 100%;
            bottom: 0;
            text-align: center;
        }

        ._menu_opt {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: gray !important;
        }

        .boxshadow {
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.35);
            border: none !important;
        }
    </style>
</head>

<body id="page-top">
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
    <!-- Page Wrapper -->
    <div id="wrapper">



        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">


                <nav class="navbar fixed-top navbar-light bg-light">

                    <a class="navbar-brand" href="javascript:void(0);" id="StoreName" runat="server" style="padding-left: 35px; margin-top: -15px;">Address(s)</a>
                    <%--<a href="store.aspx" style="color:white;"> <span class="userpic" id="UserName_n_Pic" runat="server">&nbsp;&nbsp; <i class="fa fa-pencil" style="font-size: 25px;"></i></span></a>--%>
                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <section id="dashbordsection">
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4" style="display: flex;">
                            <%--<h1 class="h3 mb-0 text-gray-800">Address(s)</h1>--%>

                            <br />
                            <a href="javascript:void(0);" id="addaddress" class=" d-sm-inline-block btn btn-sm btn-primary border-0 shadow-sm btnstyle"><i class="fa fa-plus fa-sm text-white-50"></i>Add Address</a>
                        </div>

                        <!-- Content Row -->
                        <div class="row" id="BindAddress">

                            <!-- Earnings (Monthly) Card Example -->

                        </div>
                        <div class="row mb-5"></div>

                    </div>
                </section>

                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer style="position: fixed; bottom: 0; width: 100%;">
                <div class="footer boxshadow " style="height: auto;" id="active_balance">
                    <div class="row">
                        <div class="col-sm-12">
                            <button id="setaddress" class="btn btnstyle w-100 text-white">Ok</button>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>

    <div class="modal fade" id="addaddressmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="">Add Address</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="username" class="control-label">
                            Name
                        </label>
                        <input type="text" id="username" runat="server" value="" class="form-control" />
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="usermobile" class="control-label">
                            Preferred Mobile
                        </label>
                        <input type="text" id="usermobile" maxlength="10" onkeydown="NumberOnly(event)" runat="server" value="" class="form-control" />
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Address / Flat no.
                        </label>
                        <input type="text" id="Address" value="Flat No-" class="form-control" />
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Tower no / Location
                        </label>
                        <input type="text" value="Tower" id="towerno" class="form-control">
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Building Name / Sector
                        </label>
                        <input type="text" id="buildingname" class="form-control">
                    </div>

                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            City     
                        </label>
                        <input id="City" class="form-control" type="text" />
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            State
                        </label>
                        <input id="state" type="text" class="form-control" />
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Pincode
                        </label>
                        <input type="number" id="pincode" class="form-control">
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Near By Landmark
                        </label>
                        <input id="Landmark" value="Near " class="form-control" type="text" />
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <button class="btn btn-secondary w-100 btnstyle" type="button" data-dismiss="modal">Cancel</button>
                        </div>
                        <div class="col-6"><a class="btn btn-primary w-100 btnstyle" id="SubmitAddress" href="javascript:void(0);">Submit</a></div>
                    </div>

                </div>

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


    <div class="modal fade" id="Updateaddaddressmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <script src="../Items/Add_Balance.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>
    <script src="../Admin/js/textfield.js"></script>

    <script src="../Admin/vendor/jquery/jquery.min.js"></script>
    <script src="../Admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../Admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../Admin/js/sb-admin-2.min.js"></script>

    <script src="../Admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="../Admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="../Admin/js/demo/datatables-demo.js"></script>

    <script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8KEha4w6awdeV8g4rEOMoLvSO1CrUkXg" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/geocomplete/1.7.0/jquery.geocomplete.min.js"></script>
     
    <script>
         
        $(document).ready(function () {

            //$("#addaddressmodel").modal();
            getAllAddress();

          
        });

        $("#addaddress").click(function () {
            $("#addaddressmodel").modal();
        })
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }


        function getAllAddress() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "address.aspx/fnGetAllAddress",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $('#BindAddress').empty();
                        $('#BindAddress').append(data.d);

                        //$(".defaultaddress").click(function () {
                        //    $(".defaultaddress").removeClass("fa-heart");
                        //    $(".defaultaddress").addClass("fa-heart-o");
                        //    $(".defaultaddress").removeClass("text-danger");
                        //    if ($(this).hasClass("fa-heart-o")) {
                        //        $(this).removeClass("fa-heart-o");
                        //        $(this).toggleClass("fa-heart");
                        //        $(this).addClass("text-danger");

                        //        var Address_ID = $(this).attr('add_id');

                        //        $.ajax({
                        //            type: "POST",
                        //            contentType: "application/json; charset=utf-8",
                        //            url: "address.aspx/updateDefaultAddress",
                        //            data: '{Address_ID: "' + Address_ID + '"}',
                        //            dataType: "json",
                        //            success: function (data) {
                        //                showpopup('Default address changed successfully');

                        //                setTimeout(function (e) {
                        //                    window.history.back();
                        //                }, 2000)

                        //            }
                        //        })

                        //    } else {
                        //        $(this).removeClass("fa-heart");
                        //        $(this).toggleClass("fa-heart-o");
                        //    }
                        //})
                        $('.defaultaddress').each(function () {
                            if ($(this).hasClass("fa-heart")) {
                                var addid = $(this).attr("add_id");
                                $("#setaddress").attr("addid", addid);

                                return false;
                            }
                        })
                        $(".defaultaddress").click(function () {
                            $(".defaultaddress").removeClass("fa-heart");
                            $(".defaultaddress").addClass("fa-heart-o");
                            $(".defaultaddress").removeClass("text-danger");
                            if ($(this).hasClass("fa-heart-o")) {
                                $(this).removeClass("fa-heart-o");
                                $(this).toggleClass("fa-heart");
                                $(this).addClass("text-danger");

                                var Address_ID = $(this).attr('add_id');
                                $("#setaddress").attr("Addid", Address_ID);

                                //$.ajax({
                                //    type: "POST",
                                //    contentType: "application/json; charset=utf-8",
                                //    url: "address.aspx/updateDefaultAddress",
                                //    data: '{Address_ID: "' + Address_ID + '"}',
                                //    dataType: "json",
                                //    success: function (data) {
                                //        showpopup('Default address changed successfully');

                                //        setTimeout(function (e) {
                                //            window.history.back();
                                //        }, 2000)

                                //    }
                                //})

                            } else {
                                $(this).removeClass("fa-heart");
                                $(this).toggleClass("fa-heart-o");
                            }
                        })
                        $("#setaddress").click(function (e) {
                            e.stopImmediatePropagation();
                            e.preventDefault();
                            var addid = $(this).attr("addid");

                            //$('.defaultaddress').each(function () {
                            //    if ($(this).hasClass("fa-heart")) {
                            //        addid = $(this).attr("addid");
                            //        return false;
                            //    }
                            //})
                            if (addid != '') {
                                Updateaddress(addid)

                            }
                            else {
                                showpopup('Please select address');
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
                },
                complete: function () {
                    $("#preload").hide();
                },
            })
        }
        function Updateaddress(Address_ID) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "address.aspx/updateDefaultAddress",
                data: '{Address_ID: "' + Address_ID + '"}',
                dataType: "json",
                success: function (data) {
                    showpopup('Default address changed successfully');

                    setTimeout(function (e) {
                        window.history.back();
                    }, 2000)

                }
            })
        }

        $('#SubmitAddress').click(function (e) {
            e.stopImmediatePropagation();
            var Name = escapeHtml($.trim($('#username').val()));
            var Mobile = escapeHtml($.trim($('#usermobile').val()));
            var Address = escapeHtml($.trim($('#Address').val()));
            var Location = escapeHtml($.trim($('#towerno').val()));
            var Area = escapeHtml($.trim($('#buildingname').val()));
            var City = escapeHtml($.trim($('#City').val()));
            var State = escapeHtml($.trim($('#state').val()));
            var Pincode = escapeHtml($.trim($('#pincode').val()));
            var Landmark = escapeHtml($.trim($('#Landmark').val()));

            if (Address.length == 0) {
                showpopup('Address field cannot empty');
                $('#Address').focus();
            }
            else if (Name.length == 0) {
                showpopup('Location field cannot empty');
                $('#towerno').focus();
            }
            else if (Location.length == 0) {
                showpopup('Location field cannot empty');
                $('#towerno').focus();
            }
            else if (City.length == 0) {
                showpopup('City field cannot empty');
                $('#City').focus();
            }
            else if (State.length == 0) {
                showpopup('State field cannot empty');
                $('#state').focus();
            }
            else if (Pincode.length == 0) {
                showpopup('Pincode field cannot empty');
                $('#pincode').focus();
            }
            else {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "address.aspx/fnInsertAddress",
                    data: '{Name: "' + Name + '",Mobile: "' + Mobile + '",Address: "' + Address + '",Location: "' + Location + '",Area: "' + Area + '",City: "' +
                        City + '",State: "' + State + '",Pincode: "' + Pincode + '",Landmark: "' + Landmark + '"}',
                    beforeSend: function () {
                        $("#preload").show();
                    },
                    dataType: "json",
                    success: function (data) {
                        showpopup('Address added successfully');
                        $("#addaddressmodel").modal('hide');
                        getAllAddress();

                        $('#Address').val('');
                        $('#towerno').val('');
                        $('#buildingname').val('');
                        $('#City').val('');
                        $('#state').val('');
                        $('#pincode').val('');
                        $('#Landmark').val('');
                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                })
            }
        })

        var entityMap = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;',
            '/': '&#x2F;',
            '`': '&#x60;',
            '=': '&#x3D;'
        };

        function escapeHtml(string) {
            return String(string).replace(/[&<>"'`=\/]/g, function (s) {
                return entityMap[s];
            });
        }


        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
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
                        $("#preload").show();
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
                            var tower = $("#etowerno").val();
                            if (add_id.length == 0) {
                                showpopup("! Something went wrong Please try again later")
                            } else {
                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "address.aspx/fnUpdatedaddress",
                                    data: '{add_id:"' + add_id + '",Name:"' + Name + '",mobile:"' + mobile + '",addressflat:"' + addressflat
                                        + '",buildingname:"' + buildingname + '",city:"' + city + '",state:"' + state + '",pincode:"' + pincode
                                        + '",nearby:"' + nearby + '",tower:"' + tower + '"}',
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

                    },
                    complete: function () {
                        $("#preload").hide();
                    },
                })
            })
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

        function NumberOnly(e) {
            var event = e || window.event

            var key_code = event.keyCode;
            var oElement = e ? e.target : window.event.srcElement;
            if (!event.shiftKey && !event.ctrlKey && !event.altKey) {
                if ((key_code > 47 && key_code < 58) ||
                    (key_code > 95 && key_code < 106)) {

                    if (key_code > 95)
                        key_code -= (95 - 47);
                    oElement.value = oElement.value;
                } else if (key_code == 8) {
                    oElement.value = oElement.value;
                } else if (key_code != 9) {
                    event.returnValue = false;
                }
            }
        }

    </script>

</body >

</html >
