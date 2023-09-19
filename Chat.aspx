<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chat.aspx.cs" Inherits="Chat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chat</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .order-body {
            max-height: 50vh;
            overflow: auto;
            display: none;
        }

        .sectionbox {
            margin-top: 100px;
        }

        .card {
            background: white;
            box-shadow: none !important;
            border: none;
        }

        .chatreplay {
            display: flex;
            width: 100%;
        }

        .replay__input {
            width: 80%;
            padding: 5px;
            display: flex;
        }

        .send__btn {
            width: 20%;
            padding: 5px;
        }

        .image-upload > input {
            display: none;
        }

        .image-upload i {
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
        }

        .fa-paperclip {
            padding: 5px 7px;
            border-radius: 21px;
        }

        @media screen and (max-width:768px) {
            .sendtext {
                display: none;
            }
        }

        .replayinput {
            width: 90%;
        }

        .image-upload {
            width: 10%;
            text-align: center;
        }

            .image-upload label {
                margin-bottom: 0px !important;
                margin-top: 5px !important;
            }


        .replayinput {
            border: none;
        }

            .replayinput:focus {
                box-shadow: none !important;
            }

        .chatreplay {
            border: 1px solid #ebebeb;
            border-radius: 10px;
        }

        .chatheader {
            padding: 15px;
            box-shadow: 0 1px 20px 0 rgb(69 90 100 / 8%);
            display:none;
        }

        .chatfooter {
            padding: 15px;
            margin-top: 15px;
            box-shadow: 0 1px 20px 0 rgb(69 90 100 / 8%);
        }

        .chatheader h4 {
            margin-bottom: 0px;
        }

        .activelight {
            width: 15px;
            height: 15px;
            background: #00e800;
            border-radius: 10px;
            margin-top: 5px;
            margin-right: 10px;
        }

        .activedot {
            display: flex;
        }

        .chatbody {
            height: 65vh;
            overflow: auto;
        }

        .order__details {
            background: aliceblue;
            height: 100%;
        }

        .order-header {
            background: white;
            border-radius: 10px;
            margin-bottom: 10px;
        }

            .order-header h4 {
                margin-bottom: 0px;
            }

        .itemrow {
            display: flex;
            width: 100%;
            padding: 5px;
            background: white;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        .item-img {
            width: 30%;
        }

        .item-details {
            width: 70%;
        }

        .item-img img {
            width: 100%;
            height: 100px;
            border-radius: 15px;
        }

        .itemtitle {
            font-size: 16px;
            font-weight: bold;
        }

        .ordertotalprice {
            display: flex;
            width: 100%;
        }

        .total-text {
            width: 40%;
        }

        .total-amount {
            width: 60%;
        }

        .order-footer {
            padding: 15px;
            display: none;
        }

        .replayfrom {
            width: 90%;
            margin: 10px;
            float: left;
        }

        .replayto {
            width: 90%;
            float: right;
            margin: 10px;
        }

        .replayfrom .fromdiv {
            background: aliceblue;
            padding: 10px;
            border-radius: 15px 15px 15px 0px;
            float: left;
        }

        .replayto .todiv {
            background: #f8f8f8;
            padding: 10px;
            border-radius: 15px 15px 0px 15px;
            float: right;
        }

        .chatbody {
            padding: 10px;
        }

        /*.replayfromtime {
            margin-left: 15px;
            font-size: 13px;
            float: left;
            position: absolute;
            left: 30px;
            margin-top: 10px;
        }

        .replaytotime {
            float: right;
            margin-right: 15px;
            font-size: 13px;
            position: absolute;
            right: 35px;
           margin-top: 10px;
        }*/

        .chatdate {
            background: gray;
            color: white;
            font-weight: bold;
            padding: 4px 10px 4px 10px;
            border-radius: 16px;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar {
            width: 6px;
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar-thumb {
            background-color: #000000;
        }

        .rowdate {
            width: 100%;
        }

        .imagepreviewbox {
            padding: 15px;
            background: white;
        }
    </style>
    <style>
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
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
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #ff0018;
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

        .viewordersdetails {
            padding: 2px;
            text-align: center;
            cursor: pointer;
        }

        #appendchatbox {
            margin-bottom: 15px;
        }

        @media screen and (max-width:768px) {
            .chatfooter {
                position: fixed;
                bottom: 0;
                background: white;
                left: 0;
                right: 0;
            }

            .sectionbox {
                margin-top: 81px;
            }

            .chatbody {
                height: 53vh;
            }

            /* .chatheader {
                position: fixed;
                top: 75px;
                left: 0;
                right: 0;
                background: white;
            }*/
        }

        .chatheader label:before {
            content: 'Active'
        }

        .chatheader label::after {
            content: 'Closed'
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
                content: 'Off';
                left: -4rem;
            }

            .btn-toggle:after {
                content: 'On';
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
                    content: 'Off';
                    left: -5rem;
                }

                .btn-toggle.btn-lg:after {
                    content: 'On';
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
                    content: 'Active';
                    left: -0.5rem;
                    font-size: 14px;
                }

                .btn-toggle.btn-sm:after {
                    content: 'Closed';
                    right: -0.5rem;
                    opacity: 0.5;
                    font-size: 14px;
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
                        left: 4.6875rem;
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
                    left: 1.4125rem;
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
                    content: 'Active';
                    left: 0;
                }

                .btn-toggle.btn-xs:after {
                    content: 'Closed';
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
                background: #0add00;
            }

                .btn-toggle.btn-secondary:before,
                .btn-toggle.btn-secondary:after {
                    color: #6b7381;
                }

                .btn-toggle.btn-secondary.active {
                    background-color: #ff8300 !important;
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
    <nav class="navbar fixed-top navbar-light text-center bg-blue">
        <a href="javascript:void(0);" id="StoreName" class="navbar-brand" style="margin-left: 40px;">Concern
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;">details</p>
        </a>
        <a href="My_Profile.aspx" style="color: white;"><span id="UserName_n_Pic" class="userpic">&nbsp;&nbsp; <i class="fa fa-user-circle" style="font-size: 25px;"></i></span></a>

    </nav>
    <section class="sectionbox">
        <div class="container">
            <div class="card  border-radius">
                <div class="row">
                    <div class="col-sm-5 col-md-4 col-lg-4">
                        <div class="order__details">
                            <div id="appendorderdetails" class="orderbox p-2">
                                <%-- <div class="order-header p-2">
                                    <h4>Order no #2788</h4>
                                </div>
                                <div class="order-body">
                                    <div class="itemrow">
                                        <div class="item-img">
                                            <img src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2R1Y3R8ZW58MHx8MHx8&w=1000&q=80" />
                                        </div>
                                        <div class="item-details">
                                            <p class="mb-0 itemtitle">Apple Watch</p>
                                            <div>Qty: 1 pc</div>
                                            <div>Price: Rs. 25000</div>
                                        </div>
                                    </div>
                                    <div class="itemrow">
                                        <div class="item-img">
                                            <img src="https://images.unsplash.com/photo-1546868871-7041f2a55e12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2R1Y3R8ZW58MHx8MHx8&w=1000&q=80" />
                                        </div>
                                        <div class="item-details ">
                                            <p class="mb-0 itemtitle">Apple Watch</p>
                                            <div>Qty: 1 pc</div>
                                            <div>Price: Rs. 25000</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="order-footer">
                                    <div class="ordertotalprice">
                                        <div class="total-text">
                                            <div>Delivery Charge</div>
                                            <div>Other Charge</div>
                                            <h4>Total:</h4>
                                        </div>
                                        <div class="total-amount">
                                            <div>Rs 100</div>
                                            <div>Rs 50</div>
                                            <h4>Rs 50150</h4>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7 col-md-8 col-lg-8">
                        <div id="appendchatbox" class="chatbox">
                            <%--<div class="chatheader">
                                <div>
                                    <h4>Ticket id #2788</h4>
                                    <div>
                                        <div class="activedot">
                                            <div class="activelight"></div>
                                            active
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="chatbody">
                                <div id="appendchatbody" class="chatshow">
                                    <div class="replayfrom">
                                        <div class="fromdiv">
                                            <div class="replayfromtime"><strong>Support Team</strong> &nbsp;&nbsp;<span class="float-right" style="font-size: 12px;">12:00 PM</span></div>
                                            Lorem ipsum may be used as a placeholder before final copy is available.
                                        </div>
                                    </div>
                                    <div class="replayto">
                                        <div class="todiv">
                                            <div class="replaytotime"><strong>Customer</strong> &nbsp;&nbsp;<span class="float-right" style="font-size: 12px;">12:00 PM</span></div>
                                            Lorem ipsum may be used as a placeholder before final copy is available.
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="chatfooter">
                                <div class="chatreplay">
                                    <div class="replay__input">
                                        <input id="replaytext" class="form-control replayinput replaytext" placeholder="Write here..." />
                                        <div class="image-upload">
                                            <label for="file-input">
                                                <i class="fa fa-paperclip" aria-hidden="true"></i>
                                            </label>
                                            <input id="file-input" type="file" />
                                        </div>
                                    </div>
                                    <div class="send__btn">
                                        <button onclick="fnsendreplay($(this))" class="btn btn-primary w-100"><span class="sendtext">Send</span>  <i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="ImagePreviewModalpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Preview</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="imagepreviewbox">
                        <div id="ImagePreviewModal"></div>
                        <div>
                            <input id="replayimgtext" class="form-control replaytext" placeholder="write here..." />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button id="sendreplymodalbtn" type="button" onclick="fnsendreplay($(this));" class="btn btn-primary"><span class="">Send</span>&nbsp;&nbsp;<i class="fa fa-paper-plane" aria-hidden="true"></i></button>

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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(function () {
            Page();
        });

        function Page() {
            if (getCookie('user_type').toLowerCase() == "customer") {
                GetOrderDetailsByHeaderId();
                GetTicketidorgenerateticket();
            }
            else {
                RetailerGetOrderDetailsByHeaderId();
                RetailerGetTicketidorgenerateticket();
            }
            setTimeout(function () {
                Interval = setInterval(checkMsg, 20000);
            },3000)
        }

        function fnsendreplay(current) {
            var text = "", img = "", chatrow = "";
            var dt = new Date();
            var imgurl = $(".imagepreviews img").attr('src');
            var imgsrc = "";
            var mimetype = "";
            var imgtext = $("#replayimgtext").val();
            var replaytext = $("#replaytext").val();
            if (imgurl != undefined) {
                img = '<div style="width: 200px;height: 200px;"><img style="width:100%; height:100%;" src="' + imgurl + '"/></div>';
                imgsrc = $(".imagepreviews img").attr('srcurl');
                mimetype = $(".imagepreviews img").attr('mimetype');
            }
            text = imgtext == "" ? replaytext : imgtext;
            var date = dt.getDate() + "-" + (dt.getMonth() + 1) + "-" + dt.getFullYear();

            //if (img != "" && text == "") {
            //    chatrow = '<div class="replayto"><div class="todiv">\
            //        <div class="replaytotime"><strong>Customer</strong> &nbsp;&nbsp;\
            //        <span class="float-right" style="font-size: 12px;">'+ date + ' ,\
            //        ' + dt.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
            //        + '</span></div><div>' + img + '</div>\
            //        '+ text + '</div></div>'
            //}
            //else if (text != "" && img != "") {
            //    chatrow = '<div class="replayto"><div class="todiv">\
            //        <div class="replaytotime"><strong>Customer</strong> &nbsp;&nbsp;\
            //        <span class="float-right" style="font-size: 12px;">'+ date + ' ,\
            //        ' + dt.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
            //        + '</span></div><div>' + img + '</div>\
            //        '+ text + '</div></div>'
            //} else if (text == "" && img == "") {
            //    alert('Please write something');
            //} else {
            //    chatrow = '<div class="replayto"><div class="todiv">\
            //        <div class="replaytotime"><strong>Customer</strong> &nbsp;&nbsp;\
            //        <span class="float-right" style="font-size: 12px;">'+ date + ' ,\
            //        ' + dt.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
            //        + '</span></div><div>' + img + '</div>\
            //        '+ text + '</div></div>'
            //}
           /* $("#appendchatbody").append(chatrow);*/
            $('.chatbody').animate({ scrollTop: $('.chatbody').prop("scrollHeight") }, 500);
            $("#replaytext").val('');
            $("#ImagePreviewModal").empty();
            $("#ImagePreviewModalpopup").modal('hide');
            var receiverid = "";
            var custreceiver = $('.order-header').attr('custid');
            var retailerrecever = $(".replayfrom").last().attr('responseby');
            if (retailerrecever == undefined || retailerrecever == "") {
                receiverid = custreceiver;
            } else {
                receiverid = retailerrecever;
            }
            InsertMsg(text, imgsrc, current.attr("chatid"), mimetype, dt.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true }), getUrlParameter('headerid'), receiverid);
            Page();
            
        }
        var Interval;
        function checkMsg() {
            var chatid = $('.chatmsg:last').attr('chattrxid');
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Chat.aspx/checkMsg",
                data: JSON.stringify({ HeaderId: getUrlParameter('headerid'), chatid: chatid }),
                dataType: "json",
                success: function (data) {
                    if (data.d == 'Y') {
                        Page();
                       // clearInterval(Interval);
                    }
                }
            });
        }

        function readURLemployeepage(input, type) {
            var url = "", docmime = "";
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    if (type > 0) {
                        docmime = "pdf";
                        url = e.target.result.replace(/^data:application\/(pdf);base64,/, "");

                    } else {
                        docmime = "";
                        url = e.target.result.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
                    }
                    var tr = '<div class="imagepreviews"><img mimetype="' + docmime + '" srcurl="' + url + '" style="width:100%;border-radius: 5px; height:100%;" src="' + e.target.result + '"/></div>';


                    $("#ImagePreviewModal").empty();
                    $("#ImagePreviewModal").prepend(tr);
                    $("#ImagePreviewModalpopup").modal();
                    $('body').on('click', '.dltimg', function (e) {
                        e.stopImmediatePropagation();
                        e.preventDefault();
                        $(this).parent().parent().remove();
                    });
                };
                reader.readAsDataURL(input.files[0]);

            }

        }
        $("#file-input").change(function () {
            readURLemployeepage(this, $(this).val().toLowerCase().indexOf(".pdf"));
        });


        var getUrlParameter = function getUrlParameter(sParam) {
            var sPageURL = window.location.search.substring(1),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
            return false;
        };

        function GetOrderDetailsByHeaderId() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Chat.aspx/Method_GetOrderDetailsByHeaderId",
                data: JSON.stringify({ HeaderId: getUrlParameter('headerid') }),
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#appendorderdetails").empty();
                        $("#appendorderdetails").append(data.d);
                        $(".viewordersdetails").click(function () {
                            if ($(this).text().toLowerCase() == "view order") {
                                $(this).text('Hide Order');
                            } else {
                                $(this).text('View Order');
                            }
                            $(".order-body").slideToggle();
                            $(".order-footer").slideToggle();
                        })


                    }
                }
            });
        }

        function GetTicketidorgenerateticket() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Chat.aspx/Method_GetTicketidorgenerateticket",
                data: JSON.stringify({ HeaderId: getUrlParameter('headerid') }),
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#appendchatbox").empty();
                        $("#appendchatbox").append(data.d);
                        $("#file-input").change(function () {
                            readURLemployeepage(this, $(this).val().toLowerCase().indexOf(".pdf"));
                        });
                        $('.chatbody').animate({ scrollTop: $('.chatbody').prop("scrollHeight") }, 500);

                        $("#sendreplymodalbtn").attr('chatid', $("#sendbutton").attr('chatid'));
                    }
                }
            });
        }


        function InsertMsg(Msg, ImageUrl, chatid, mimetype, ResponseTime, header_id, receiverid) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Chat.aspx/Method_InsertMsg",
                data: JSON.stringify({
                    Msg: escapeHtml($.trim(Msg)),
                    ImageUrl: ImageUrl,
                    chatid: chatid,
                    mimetype: mimetype,
                    ResponseTime: ResponseTime,
                    header_id: header_id,
                    receiverid: receiverid
                }),
                dataType: "json",
                success: function (data) {

                }
            });
        }



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

        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }
        function getCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }



        function RetailerGetOrderDetailsByHeaderId() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Chat.aspx/Method_RetailerGetOrderDetailsByHeaderId",
                data: JSON.stringify({ HeaderId: getUrlParameter('headerid') }),
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#appendorderdetails").empty();
                        $("#appendorderdetails").append(data.d);
                        $(".viewordersdetails").click(function () {
                            if ($(this).text().toLowerCase() == "view order") {
                                $(this).text('Hide Order');
                            } else {
                                $(this).text('View Order');
                            }
                            $(".order-body").slideToggle();
                            $(".order-footer").slideToggle();
                        })
                    }
                }
            });
        }

        function RetailerGetTicketidorgenerateticket() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Chat.aspx/Method_RetailerGetTicketidorgenerateticket",
                data: JSON.stringify({ HeaderId: getUrlParameter('headerid') }),
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#appendchatbox").empty();
                        $("#appendchatbox").append(data.d);
                        $("#file-input").change(function () {
                            readURLemployeepage(this, $(this).val().toLowerCase().indexOf(".pdf"));
                        });
                        $('.chatbody').animate({ scrollTop: $('.chatbody').prop("scrollHeight") }, 500);
                        $("#sendreplymodalbtn").attr('chatid', $("#sendbutton").attr('chatid'));
                    }
                }
            });
        }

        function fnclosechat(current, chatid) {

            Swal.fire({
                title: 'Are you sure you want to Close this?',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Close',
                denyButtonText: `Don't save`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Chat.aspx/Method_fnclosechat",
                        data: JSON.stringify({ HeaderId: getUrlParameter('headerid'), chatid: chatid }),
                        dataType: "json",
                        success: function (data) {
                            Swal.fire('Closed!', '', 'success');
                            location.reload();
                        }
                    });
                }
                else if (result.isDenied) {
                    current.removeClass('active');
                    Swal.fire('Changes are not saved', '', 'info');
                }
                else {
                    current.removeClass('active');
                }
            })

        }

        function fnopenticketagain(current, chatid) {

            Swal.fire({
                title: 'Are you sure you want to again activate this ticket?',
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: 'Activate',
                denyButtonText: `Don't save`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Chat.aspx/Method_fnactivatechat",
                        data: JSON.stringify({ HeaderId: getUrlParameter('headerid'), chatid: chatid }),
                        dataType: "json",
                        success: function (data) {
                            Swal.fire('Activated!', '', 'success');
                            location.reload();
                        }
                    });
                }
                else if (result.isDenied) {
                    Swal.fire('Changes are not saved', '', 'info');
                }

            })

        }

        function fnopenimage(current) {
            var img_to_load = current[0].src,
                imgWindow = window.open(img_to_load);
        }

    </script>

</body>
</html>
