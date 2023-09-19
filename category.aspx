<%@ Page Language="C#" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="category" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <%--  <link href="Assest/css/bootstrap-grid.min.css" rel="stylesheet" />--%>
    <link href="Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="Assest/css/alert.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Assest/css/category_main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

     <link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>
    <style>
        .bg-light {
            background: #384862 !important;
        }



        .dropdown-menu.show {
            transform: translate3d(-82px, 5px, 0px) !important;
        }


        .circlecard {
            /*border: .5px solid #ececec;*/
            height: 100px;
            /*background: white;*/
            border-radius: 10px;
            padding: 10px;
            width: 100%;
            box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.25) !important;
            background: linear-gradient(107deg, rgba(20,197,254,1) 0%, rgba(61,209,208,1) 62%, rgba(91,218,174,1) 100%);
        }

        .owl-height {
            height: 100% !important;
        }

        .circlecard t {
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            left: 0;
            font-size: 13px;
            text-shadow: 2px 3px 4px rgba(150, 150, 150, 1);
            color: white;
            font-weight: 500;
        }

        .circlecard img {
            width: 50px !important;
            margin: 10px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 1;
        }

        .footer {
            background: #fff !important;
        }

        .boxshadow {
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
            border: none !important;
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
            background: linear-gradient(107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%)!important;
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
            font-size:14px;
        }

        .offpercnt {
            color: red;
            float: right;
        }
        /*card design end---------------------------------------------------*/

         .backshow {
            background: white;
            border-top-left-radius: 50px;
            /* border-top-right-radius: 20px;*/
            box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
            padding-top: 10px;
        }

        .card {
            border: none !important;
        }

        .card-img img {
            width: 100% !important;
        }

        #categorysection {
            background: #384862;
        }


        .bgclor {
            background: #3848620a;
        }

        .location {
            font-size: 13px;
            color: darkgrey;
        }


        .visitbtn{
            float:right;
            font-size: 13px;
        }

        .crdimg{

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

        .ui-dialog-buttonset button{
            border:none!important;
             box-shadow: 0 2px 8px 0 rgba(0,0,0,.1);
        }

        .ui-dialog-titlebar-close{
            display:none;
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
    width: 30%!important;
}

    </style>
</head>
<body id="pageone">

     <%-- loader start --%>

    <div id="preload" style="display:none;">
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
            <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#" style="margin-left: 12%;"><span>
                    <%-- <svg style="position: absolute;" height="10pt" viewBox="0 0 512 512" width="8pt" xmlns="http://www.w3.org/2000/svg">
                        <path d="m135 512h-120c-8.285156 0-15-6.714844-15-15v-361.996094c0-74.441406 60.5625-135.003906 135.003906-135.003906h361.996094c8.285156 0 15 6.714844 15 15v120c0 8.285156-6.714844 15-15 15h-347v347c0 8.285156-6.714844 15-15 15zm0 0" fill="gold" />
                        <path d="m497 0h-346.96875v150h346.96875c8.285156 0 15-6.714844 15-15v-120c0-8.285156-6.714844-15-15-15zm0 0" fill="gold" />
                    </svg>--%>
                </span>
                    <img height="40" src="Home/assets/img/My%20corner%20Shop%20logo%20white.png" /><%--<span style="margin-left: 7px;">ᎷᎽ CᏫᏒႶᏋᏒ<sup>ᎴᏲᏫᎮ</sup></span>--%></a>
                <span class="userpic">
                    <div class="dropdown show" style="text-align: right;">
                        <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle-o "></i>
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="#">My Profile</a>
                            <a class="dropdown-item" href="#">Logout</a>
                        </div>
                    </div>
                </span>
            </nav>

            <!--2. Seacrch Section-->

            <div id="mobile-view" class="container p-0 mt-4">
                <div class="card searchdiv">
                    <div class="container">
                        <div class="card searchbox">
                            <div class="form-group m-0">
                                <input class="inputseacrh" placeholder="Search here..." />
                                <i class="fa fa-search"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      

            <!--3. Category -->
            <section id="categorysection" runat="server" style="padding-top: 60px;">
                <div class="container">
                    <div class="row">
                        <div class="col-6 col-md-4 col-sm-4 p-2">
                            <div class="card hover m-1 mt-2">
                                <div class="card-img">
                                    <img src="Assest/images/carts.png" />
                                </div>
                                <div class="card-content">General Store</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4 hover col-sm-4 p-2">
                            <div class="card m-1 mt-2">
                                <div class="card-img">
                                    <img src="Assest/images/pharmacy.png" />
                                </div>
                                <div class="card-content">Pharmacist</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4 hover col-sm-4 p-2">
                            <div class="card m-1 mt-2">
                                <div class="card-img">
                                    <img src="Assest/images/washing-machine.png" />
                                </div>
                                <div class="card-content">Dry Cleaner</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4 hover col-sm-4 p-2">
                            <div class="card m-1 mt-2">
                                <div class="card-img">
                                    <img src="Assest/images/washing-clothes.png" />
                                </div>
                                <div class="card-content">Dhoobi</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4  hover col-sm-4 p-2 ">
                            <div class="card m-1 mt-2">
                                <div class="card-img">
                                    <img src="Assest/images/car-wash.png" />
                                </div>
                                <div class="card-content">Car Cleaner</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4  hover col-sm-4 p-2 ">
                            <div class=" addbusinessbtn card m-1 mt-2">
                                <div class="card-img"><i class="fa fa-plus-circle" style="font-size: 50px;"></i></div>
                                <div class="card-content">Add More</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--4. Sheduled Section-->

             <div id="exploremore" runat="server" style="display:none;">
                 <div class="container mb-2">
                        <div class="card">
                            <div class="head explorebtn p-2" style="background: azure;" >
                                 <div class="row">
                                    <div class="col-10">
                                 <span>Explore More </span>
                                 </div>
                                      <div class="col-2">
                                            <span style="text-align:right;"> <i class="fa fa-angle-down"></i></span>
                                      </div>
                                  </div>
                            </div>
                            <div class="exploreitms" style="display:none;">
                                <div class="container">
                                     <div class="row">
                                    <div class="col-sm-12"> <input class="form-control mt-1 mb-1" placeholder="Search"  style="padding:3px;"/>
                                    </div>
                                </div>
                                </div>
                                 <div class="card p-1 m-1"> explore 1</div>
                                  <div class="card p-1 m-1">explore 2</div>
                                 <div class="card p-1 m-1">explore 3</div>
                                 <div class="card p-1 m-1">explore 4</div>
                            </div>
                                 
                        
                     </div>
                     
                 </div>
            </div>

            <div id="shedulersection" class="container" runat="server">
            </div>


            <!--5. Transaction history-->
            <div class="container" id="TransactionContainer" runat="server">
                <div class="row">
                    <div class="col-md-3  col-sm-3"></div>
                    <div class="col-md-6 col-sm-6">
                        <div class="card p-3 mt-3 mb-3">
                            <div class="trxhistory">
                                <label><i class="fa fa-money"></i>View Transaction History</label>
                            </div>


                            <table class=" text-center table-bordered">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Business </th>
                                        <th>Amount </th>
                                        <th>Staus </th>
                                    </tr>
                                </thead>
                                <tbody id="transaction_History" runat="server">
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <div class="col-md-3 col-sm-3"></div>
                </div>
            </div>

        </div>
    </form>


    <footer>
        <div class="footer boxshadow" style="color: #000; height: auto;" id="active_balance">
            <div class="row">
                <div class="col-3 text-center">
                    <a class="_menu_opt" id="homeCall" runat="server">
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
                                            fill="#55e6c1" />
                                        <path d="M257.561,131.836c-5.454-5.451-14.285-5.451-19.723,0L72.712,296.913c-2.607,2.606-4.085,6.164-4.085,9.877v120.401
				            c0,28.253,22.908,51.16,51.16,51.16h81.754v-126.61h92.299v126.61h81.755c28.251,0,51.159-22.907,51.159-51.159V306.79
				            c0-3.713-1.465-7.271-4.085-9.877L257.561,131.836z"
                                            fill="#55e6c1" />
                                    </g>
                                </g>
                            </g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
                        <br />
                        Home</a>
                </div>
                <div class="col-3 text-center">
                    <a class="_menu_opt" href="../Components/scheduler.aspx">
                        <svg version="1.1" id="Capa_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            width="22.398px" height="22.398px" viewBox="0 0 512 512" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M458.737,422.218l-22.865-288.116c-1.425-18.562-17.123-33.103-35.739-33.103H354.97v-2.03
			C354.97,44.397,310.573,0,256.001,0s-98.969,44.397-98.969,98.969v2.03H111.87c-18.617,0-34.316,14.54-35.736,33.064
			L53.262,422.257c-1.77,23.075,6.235,46.048,21.961,63.026C90.949,502.261,113.242,512,136.385,512h239.231
			c23.142,0,45.436-9.738,61.163-26.717C452.505,468.304,460.509,445.332,458.737,422.218z M187.022,98.969
			c0-38.035,30.945-68.979,68.979-68.979s68.979,30.945,68.979,68.979v2.03H187.022V98.969z M414.776,464.905
			c-10.218,11.03-24.124,17.105-39.16,17.105h-239.23c-15.036,0-28.942-6.075-39.16-17.105
			c-10.217-11.031-15.211-25.363-14.063-40.315l22.87-288.195c0.232-3.032,2.796-5.406,5.837-5.406h45.162v36.935
			c0,8.281,6.714,14.995,14.995,14.995c8.281,0,14.995-6.714,14.995-14.995v-36.935H324.98v36.935
			c0,8.281,6.714,14.995,14.995,14.995s14.995-6.714,14.995-14.995v-36.935h45.163c3.04,0,5.604,2.375,5.84,5.446l22.865,288.115
			C429.988,439.542,424.993,453.873,414.776,464.905z"
                                        fill="gray" />
                                </g>
                            </g><g><g>
                                <path d="M323.556,254.285c-5.854-5.856-15.349-5.856-21.204,0l-66.956,66.956l-25.746-25.746c-5.855-5.856-15.35-5.856-21.206,0
			c-5.856,5.856-5.856,15.35,0,21.206l36.349,36.349c2.928,2.928,6.766,4.393,10.602,4.393s7.675-1.464,10.602-4.393l77.558-77.558
			C329.412,269.635,329.412,260.141,323.556,254.285z"
                                    fill="gray" />
                            </g>
                            </g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                        </svg>
                        <br />
                        Order</a>
                </div>
                <div class="col-3 text-center">
                    <a class="_menu_opt walletbtn">

                        <svg id="Layer_1" enable-background="new 0 0 480 480" height="22.398px" viewBox="0 0 480 480" width="22.398px" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xmlns="http://www.w3.org/2000/svg">
                            <path d="m453 236.893v-95.393c0-22.056-17.944-40-40-40h-13.558l3.005-10.441c4.894-16.995-4.901-34.71-21.898-39.604l-90.771-26.13c-4.247-1.222-8.679 1.229-9.9 5.475-1.223 4.246 1.229 8.678 5.475 9.901l57.064 16.427c-7.059 13.752-7.317 30.155-.177 44.372h-167.24v-63c0-4.418-3.582-8-8-8s-8 3.582-8 8v63h-27v-63c0-4.418-3.582-8-8-8s-8 3.582-8 8v63h-35v-69c0-8.822 7.178-16 16-16h135c8.822 0 16 7.178 16 16v44c0 4.418 3.582 8 8 8s8-3.582 8-8v-44c0-17.645-14.355-32-32-32h-135c-17.645 0-32 14.355-32 32v69h-25c-22.056 0-40 17.944-40 40v298c0 22.056 17.944 40 40 40h373c22.056 0 40-17.944 40-40v-58.5c0-4.418-3.582-8-8-8s-8 3.582-8 8v58.5c0 13.233-10.767 24-24 24h-373c-13.233 0-24-10.767-24-24v-298c0-13.233 10.767-24 24-24h373c13.233 0 24 10.767 24 24v95h-66c-17.645 0-32 14.355-32 32v44c0 17.645 14.355 32 32 32h77.021c17.568 0 31.979-14.307 31.979-32v-44c0-15.944-11.722-29.199-27-31.607zm-94.77-175.212 17.893 5.151c8.499 2.447 13.394 11.303 10.949 19.801l-4.28 14.867h-21.384c-10.102-11.236-11.038-27.576-3.178-39.819zm105.77 250.819c0 8.822-7.178 16-16 16h-77c-8.822 0-16-7.178-16-16v-44c0-8.822 7.178-16 16-16h77c8.822 0 16 7.178 16 16zm-63-22c0 4.418-3.582 8-8 8h-12c-4.418 0-8-3.582-8-8s3.582-8 8-8h12c4.418 0 8 3.582 8 8z" fill="gray" />
                        </svg>
                        <br />
                        Wallet</a>
                </div>
                <div class="col-3 text-center" id="Mycart" runat="server">
                    <a class="_menu_opt" id="addMore" runat="server">

                        <svg version="1.1" id="Capa_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            width="22.398px" height="22.398px" viewBox="0 0 446.853 446.853" style="enable-background: new 0 0 446.853 446.853; margin-bottom: -10px;" xml:space="preserve">
                            <g>
                                <path d="M444.274,93.36c-2.558-3.666-6.674-5.932-11.145-6.123L155.942,75.289c-7.953-0.348-14.599,5.792-14.939,13.708
		c-0.338,7.913,5.792,14.599,13.707,14.939l258.421,11.14L362.32,273.61H136.205L95.354,51.179
		c-0.898-4.875-4.245-8.942-8.861-10.753L19.586,14.141c-7.374-2.887-15.695,0.735-18.591,8.1c-2.891,7.369,0.73,15.695,8.1,18.591
		l59.491,23.371l41.572,226.335c1.253,6.804,7.183,11.746,14.104,11.746h6.896l-15.747,43.74c-1.318,3.664-0.775,7.733,1.468,10.916
		c2.24,3.184,5.883,5.078,9.772,5.078h11.045c-6.844,7.617-11.045,17.646-11.045,28.675c0,23.718,19.299,43.012,43.012,43.012
		s43.012-19.294,43.012-43.012c0-11.028-4.201-21.058-11.044-28.675h93.777c-6.847,7.617-11.047,17.646-11.047,28.675
		c0,23.718,19.294,43.012,43.012,43.012c23.719,0,43.012-19.294,43.012-43.012c0-11.028-4.2-21.058-11.042-28.675h13.432
		c6.6,0,11.948-5.349,11.948-11.947c0-6.6-5.349-11.948-11.948-11.948H143.651l12.902-35.843h216.221
		c6.235,0,11.752-4.028,13.651-9.96l59.739-186.387C447.536,101.679,446.832,97.028,444.274,93.36z M169.664,409.814
		c-10.543,0-19.117-8.573-19.117-19.116s8.574-19.117,19.117-19.117s19.116,8.574,19.116,19.117S180.207,409.814,169.664,409.814z
		 M327.373,409.814c-10.543,0-19.116-8.573-19.116-19.116s8.573-19.117,19.116-19.117s19.116,8.574,19.116,19.117
		S337.916,409.814,327.373,409.814z"
                                    fill="gray" />
                            </g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g>
                            <g></g><g></g><g></g><g></g><g></g></svg>

                        <br />

                        Add more </a>
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

            <div id="active_bal" class="pan" title="My Active balance"><span>Your Balance</span><br> ₹ 0</div>
            
            <div class="first-digits d-none">4123</div>
           <div class="container">
                <div class="" style="width: 100%;">
                <div class="" style="width: 100%;">
                     <label style="font-size: 15px;font-weight: 500;text-transform: initial;">Add money to my In-Store wallet</label>
                    <div style="height: 35px; background: white; margin-left: 5px; margin-right: 5px; border-radius: 5px; display: flex;">
                        <svg height='35px' width='35px' style="" fill="#000000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                            <path d="M57.127,41.981c0-1.104-0.896-2-2-2H30.873c-1.104,0-2,0.896-2,2s0.896,2,2,2h9.826c2.88,0,5.307,1.95,6.048,4.598H30.873  c-1.104,0-2,0.896-2,2c0,1.104,0.896,2,2,2H46.54c-0.922,2.328-3.19,3.981-5.841,3.981h-9.826c-0.818,0-1.554,0.498-1.857,1.258  c-0.304,0.761-0.113,1.629,0.48,2.191l16.271,15.451c0.387,0.368,0.881,0.55,1.377,0.55c0.528,0,1.058-0.209,1.449-0.622  c0.762-0.802,0.729-2.066-0.072-2.828l-12.638-12h4.815c4.877,0,8.963-3.416,10.015-7.98h4.413c1.104,0,2-0.896,2-2  c0-1.104-0.896-2-2-2h-4.294c-0.285-1.712-0.99-3.281-2.013-4.598h6.307C56.23,43.981,57.127,43.086,57.127,41.981z M77,38.5  c-1.104,0-2,0.896-2,2v39c0,4.411-3.589,8-8,8H21c-4.411,0-8-3.589-8-8v-48c0-4.411,3.589-8,8-8h36c1.104,0,2-0.896,2-2  s-0.896-2-2-2H21c-6.617,0-12,5.383-12,12v48c0,6.617,5.383,12,12,12h46c6.617,0,12-5.383,12-12v-39C79,39.396,78.104,38.5,77,38.5z   M89,19.5H79v-9c0-1.104-0.896-2-2-2s-2,0.896-2,2v9h-9.875c-1.104,0-2,0.896-2,2s0.896,2,2,2H75v9c0,1.104,0.896,2,2,2s2-0.896,2-2  v-9h10c1.104,0,2-0.896,2-2S90.104,19.5,89,19.5z"></path></svg>
                       
                        <input id="addbal" type="number" style="width: 70%;font-size: 13px; height: 35px; padding-left: 5px; margin-left: -4px; border-radius: 20px; border: none;" placeholder="Amount" />
                         <a class="btn addmoneybtn2 MoneyAdd w-25">Add money</a>

                    </div>
                     
                </div>
                <div class="" style="width: 100%; ">
                     <label style="font-size: 15px;font-weight: 500;text-transform: initial;">Pay to Retailer from In-Store wallet</label>
                    <div style="background: white; height: 35px; margin-left: 5px; margin-right: 5px; border-radius: 5px; display: flex;">
                        <svg height='35px' width='35px' fill="#000000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                            <path d="M61.127,36.481c0-1.104-0.896-2-2-2H34.873c-1.104,0-2,0.896-2,2s0.896,2,2,2h9.826c2.88,0,5.307,1.95,6.048,4.598H34.873  c-1.104,0-2,0.896-2,2s0.896,2,2,2H50.54c-0.922,2.328-3.19,3.981-5.841,3.981h-9.826c-0.818,0-1.554,0.499-1.857,1.259  c-0.304,0.76-0.113,1.628,0.48,2.191l16.271,15.451c0.387,0.368,0.882,0.55,1.377,0.55c0.529,0,1.058-0.209,1.45-0.623  c0.761-0.801,0.728-2.066-0.073-2.827L39.884,55.061h4.815c4.877,0,8.963-3.417,10.015-7.981h4.413c1.104,0,2-0.896,2-2  s-0.896-2-2-2h-4.294c-0.285-1.712-0.99-3.281-2.012-4.598h6.306C60.231,38.481,61.127,37.586,61.127,36.481z M81,45  c-1.104,0-2,0.896-2,2v27c0,4.411-3.589,8-8,8H25c-4.411,0-8-3.589-8-8V26c0-4.411,3.589-8,8-8h37c1.104,0,2-0.896,2-2s-0.896-2-2-2  H25c-6.617,0-12,5.383-12,12v48c0,6.617,5.383,12,12,12h46c6.617,0,12-5.383,12-12V47C83,45.895,82.104,45,81,45z M95.589,20.76  L82.414,7.586c-0.75-0.75-2.078-0.75-2.828,0L66.412,20.76c-0.781,0.781-0.781,2.047,0,2.828c0.781,0.781,2.047,0.781,2.828,0  l9.76-9.76V40c0,1.104,0.896,2,2,2s2-0.896,2-2V13.829l9.761,9.76c0.391,0.391,0.902,0.586,1.414,0.586s1.023-0.195,1.414-0.586  C96.37,22.808,96.37,21.541,95.589,20.76z"></path></svg>
                        
                        <input id="payment" type="number" style="width: 70%;font-size: 13px; height: 35px; padding-left: 5px; margin-left: -4px; border-radius: 20px; border: none;" placeholder="Amount" />
                          <a class=" btn addmoneybtn2 MoneyPay w-25">Pay </a>

                    </div>
                    
                </div>
            </div>
                

            </div>
            

        </div>
        <div class="lines-down"></div>
        <%--<div class="lines-up"></div>--%>
    </div>

    <div class="modal fade" id="addbussnesstypemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Business type</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                <label for="Business_name" class="control-label pmd-input-group-label">Business Name</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="material-icons md-dark pmd-sm">business</i></div>
                                    <input type="text" class="form-control" id="Business_name" />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                <label for="Business_name" class="control-label pmd-input-group-label">Business Type</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="material-icons md-dark pmd-sm">perm_contact_calendar</i></div>
                                    <input type="text" class="form-control" id="Business_type" />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                <label for="Business_name" class="control-label pmd-input-group-label">Name</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="material-icons md-dark pmd-sm">perm_identity</i></div>
                                    <input type="text" class="form-control" id="Contact_PersonName" />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                <label for="Business_name" class="control-label pmd-input-group-label">Contact Number</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="material-icons md-dark pmd-sm">call</i></div>
                                    <input type="text" class="form-control" id="Contact_PersonNumber" />
                                </div>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                <label for="Business_name" class="control-label pmd-input-group-label">Address</label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="material-icons md-dark pmd-sm">contact_mail</i></div>
                                    <input type="text" class="form-control" id="Address" />
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save </button>
                </div>
            </div>
        </div>
    </div>

       <button type="button" id="Alert_btn" style="display: none;background:lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
     <script src="Admin/js/global.js"></script>
    <script src="Assest/js/ripple-effect.js"></script>
    <script src="Assest/js/alert.js"></script>
      <script src="Assest/js/owl.carousel.min.js"></script>
    
<%--    <script src="Assest/js/jquery-ui.min.js"></script>--%>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script> 
    $(document).ready(function () {
        $(".explorebtn").click(function () {
            $(".exploreitms").slideToggle("slow");
        });
    });

    function showpopup(msg) {
        $('#Alert_btn').attr("data-message", msg)

        $('#Alert_btn').trigger('click');
    }
</script>

    <script>
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        $(".stopbtn").click(function () {
            $(this).hide();
            $(this).parent().find(".playbtn").show();
            $(this).parent().parent().parent().parent().parent().parent().parent().addClass('pauseorder');
        })


        $(".playbtn").click(function () {
            $(this).hide();
            $(this).parent().find(".stopbtn").show();
            $(this).parent().parent().parent().parent().parent().parent().parent().removeClass('pauseorder');
        })

        $(".addbusinessbtn").click(function () {
            $("#addbussnesstypemodal").modal('show')

        })
        $('.showmore').click(function (e) {
            if ($(this).text() == 'Show More') {
                $('.showmore').text('Show Less');
                $('.hideshowclass').removeClass('d-none');
            }
            else {
                $('.showmore').text('Show More');
                $('.hideshowclass').addClass('d-none');
            }
        })
        $('#viewHistory').click(function () {
            var nodePosition = $(this).position();
            $('#TransactionContainer').animate({
                top: nodePosition.top + 30
            }, 1000);
        })


        $('.owl-carosel5').owlCarousel({
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
                    items: 3
                },

                600: {
                    items: 3
                },

                1024: {
                    items: 3
                },

                1366: {
                    items: 6
                }
            }
        });

        $(".walletbtn").click(function () {
            if ($(".cardatmcls").hasClass("atmcard")) {
                $(".cardatmcls").removeClass("atmcard")
                $(".cardatmcls").addClass("atmcardopen")
            } else {
                $(".cardatmcls").addClass("atmcard")
                $(".cardatmcls").removeClass("atmcardopen")
            }
        });



    </script>
</body>
</html>
