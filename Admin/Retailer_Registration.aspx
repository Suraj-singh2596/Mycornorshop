<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Retailer_Registration.aspx.cs" Inherits="Admin_Retailer_Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Retailer Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <link href="js/croppie.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <script src="https://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/scroller/2.0.3/css/scroller.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <!-- Include Date Range Picker -->

    <link rel="stylesheet" href="https://propeller.in/components/textfield/css/textfield.css" />

    <style>
        .form-group {
            margin-bottom: 0px !important;
        }

        sup {
            color: red;
        }

        .wave {
            position: absolute;
            top: 0;
            left: 50%;
            width: 800px;
            height: 800px;
            margin-top: -720px;
            margin-left: -400px;
            background: #384862;
            border-radius: 40%;
            -webkit-animation: shift 20s infinite linear;
            animation: shift 20s infinite linear;
            z-index: 0;
        }

        @-webkit-keyframes shift {
            from {
                transform: rotate(360deg);
            }
        }

        @keyframes shift {
            from {
                transform: rotate(360deg);
            }
        }

        #card {
            position: relative;
            display: block;
            margin-top: 100px;
            text-align: center;
            font-family: source sans pro,sans-serif
        }

        #upper-side {
            padding: 2em;
            background: linear-gradient( 107deg, rgba(18,198,218,1) 0%, rgba(57,207,193,1) 100%) !important;
            display: block;
            color: #fff;
            border-top-right-radius: 8px;
            border-top-left-radius: 8px
        }

        #checkmark {
            font-weight: lighter;
            fill: #fff;
            margin: -3.5em auto auto 20px
        }

        #status {
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-size: 1em;
            margin-top: -.2em;
            margin-bottom: 0
        }

        #lower-side {
            padding: 2em 2em 5em;
            background: #fff;
            display: block;
            border-bottom-right-radius: 8px;
            border-bottom-left-radius: 8px
        }

        #message {
            margin-top: -.5em;
            color: #757575;
            letter-spacing: 1px
        }

        #contBtn {
            position: relative;
            top: 1.5em;
            text-decoration: none;
            color: #fff;
            margin: auto;
            padding: .8em 3em;
            -webkit-box-shadow: 0 15px 30px rgba(50,50,50,.21);
            -moz-box-shadow: 0 15px 30px rgba(50,50,50,.21);
            box-shadow: 0 15px 30px rgba(50,50,50,.21);
            border-radius: 25px;
            -webkit-transition: all .4s ease;
            -moz-transition: all .4s ease;
            -o-transition: all .4s ease;
            transition: all .4s ease
        }

            #contBtn:hover {
                -webkit-box-shadow: 0 15px 30px rgba(50,50,50,.41);
                -moz-box-shadow: 0 15px 30px rgba(50,50,50,.41);
                box-shadow: 0 15px 30px rgba(50,50,50,.41);
                -webkit-transition: all .4s ease;
                -moz-transition: all .4s ease;
                -o-transition: all .4s ease;
                transition: all .4s ease
            }

        *:before, *:after {
            box-sizing: inherit
        }

        article, header, section, aside, details, figcaption, figure, footer, header, hgroup, main, nav, section, summary {
            display: block
        }

        body {
            background: #e5e5e5 none repeat scroll 0 0;
            color: #222;
            font-size: 100%;
            line-height: 24px;
            margin: 0;
            padding: 0;
            font-family: raleway,sans-serif
        }

        a {
            font-family: raleway,sans-serif;
            text-decoration: none;
            outline: none
        }

            a:hover, a:focus {
                color: #373e18
            }

        section {
            float: left;
            width: 100%;
            padding-bottom: 3em
        }

        h2 {
            color: #1a0e0e;
            font-size: 26px;
            font-weight: 700;
            margin: 0;
            line-height: normal;
            text-transform: uppercase
        }

            h2 span {
                display: block;
                padding: 0;
                font-size: 18px;
                opacity: .7;
                margin-top: 5px;
                text-transform: uppercase
            }

        #float-right {
            float: right
        }

        .ScriptTop {
            background: #fff none repeat scroll 0 0;
            float: left;
            font-size: .69em;
            font-weight: 600;
            line-height: 2.2;
            padding: 12px 0;
            text-transform: uppercase;
            width: 100%
        }

            .ScriptTop ul {
                margin: 24px 0;
                padding: 0;
                text-align: left
            }

            .ScriptTop li {
                list-style: none;
                display: inline-block
            }

                .ScriptTop li a {
                    background: #6a4aed none repeat scroll 0 0;
                    color: #fff;
                    display: inline-block;
                    font-size: 14px;
                    font-weight: 600;
                    padding: 5px 18px;
                    text-decoration: none;
                    text-transform: capitalize
                }

                    .ScriptTop li a:hover {
                        background: #000;
                        color: #fff
                    }

        .ScriptHeader {
            float: left;
            width: 100%;
            padding: 2em 0
        }

        .rt-heading {
            margin: 0 auto;
            text-align: center
        }

        .Scriptcontent {
            line-height: 28px
        }

        .ScriptHeader h1 {
            font-family: brandon-grotesque,brandon grotesque,source sans pro,segoe ui,Frutiger,frutiger linotype,dejavu sans,helvetica neue,Arial,sans-serif;
            text-rendering: optimizeLegibility;
            -webkit-font-smoothing: antialiased;
            color: #6a4aed;
            font-size: 26px;
            font-weight: 700;
            margin: 0;
            line-height: normal
        }

        .ScriptHeader h2 {
            color: #312c8f;
            font-size: 20px;
            font-weight: 400;
            margin: 5px 0 0;
            line-height: normal
        }

        .ScriptHeader h1 span {
            display: block;
            padding: 0;
            font-size: 22px;
            opacity: .7;
            margin-top: 5px
        }

        .ScriptHeader span {
            display: block;
            padding: 0;
            font-size: 22px;
            opacity: .7;
            margin-top: 5px
        }

        .rt-container {
            margin: 0 auto;
            padding-left: 12px;
            padding-right: 12px
        }

        .rt-row:before, .rt-row:after {
            display: table;
            line-height: 0;
            content: ""
        }

        .rt-row:after {
            clear: both
        }

        [class^=col-rt-] {
            box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -o-box-sizing: border-box;
            -ms-box-sizing: border-box;
            padding: 0 15px;
            min-height: 1px;
            position: relative
        }

        @media(min-width:768px) {
            .rt-container {
                width: 750px
            }

            [class^=col-rt-] {
                float: left;
                width: 49.9999999999%
            }

            .col-rt-6, .col-rt-12 {
                width: 100%
            }
        }

        @media(min-width:1200px) {
            .rt-container {
                width: 1170px
            }

            .col-rt-1 {
                width: 16.6%
            }

            .col-rt-2 {
                width: 30.33%
            }

            .col-rt-3 {
                width: 50%
            }

            .col-rt-4 {
                width: 67.664%
            }

            .col-rt-5 {
                width: 83.33%
            }
        }

        @media only screen and (min-width:240px) and (max-width:768px) {
            .ScriptTop h1, .ScriptTop ul {
                text-align: center
            }

            .ScriptTop h1 {
                margin-top: 0;
                margin-bottom: 15px
            }

            .ScriptTop ul {
                margin-top: 12px
            }

            .ScriptHeader h1, .ScriptHeader h2, .scriptnav ul {
                text-align: center
            }

            .scriptnav ul {
                margin-top: 12px
            }

            #float-right {
                float: none
            }
        }

        #registrationsuccess {
            display: none;
        }
    </style>
</head>

<body id="pageone">



    <div id="preload" style="display: none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <nav class="navbar fixed-top navbar-light bg-light">
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;">Registration form
                    <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;">Sector-14 Gurgaon</p>
        </a>
        <i class="wave d-none"></i>
    </nav>

    <form id="registrationform">

        <div class="container" style="margin-top: 96px; margin-bottom: 20px;">
            <div class="row">
                <div class="col-sm-6" style="margin: auto">
                    <div class="card p-2">
                        <h5>Fill Details</h5>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Name" class="control-label">
                                Name <sup>*</sup>
                            </label>
                            <input type="text" required id="Name" class="form-control" />
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Name" class="control-label">
                                Business Name <sup>*</sup>
                            </label>
                            <input type="text" required id="Business" class="form-control" />
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="business_category" class="control-label">
                                Business Category  
                            </label>
                            <select class="form-control" id="business_category">
                                <option value="General_Store">Grocery Store</option>
                            </select>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Mobile" class="control-label">
                                Mobile <sup>*</sup>
                            </label>
                            <input type="text" runat="server" required id="Mobile" class="form-control" />
                        </div>

                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Address" class="control-label">
                                Address <sup>*</sup>
                            </label>
                            <input type="text" required id="Address" class="form-control" />
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="City" class="control-label">
                                City <sup>*</sup>
                            </label>
                            <input type="text" required id="City" class="form-control" />
                        </div>

                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Pincode" class="control-label">
                                Pincode <sup>*</sup>
                            </label>
                            <input type="number" required id="Pincode" class="form-control" />
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label otplabel" id="Otp_Area" runat="server">
                            <div class="row">
                                <div class="col-6">
                                    <label for="Email" class="control-label">
                                        OTP 
                                    </label>
                                    <input type="number" id="OTP" class="form-control" />
                                </div>
                                <div class="col-6">
                                    <label for="Email" class="control-label" style="visibility: hidden;">
                                        OTP 
                                    </label>
                                    <button type="button" id="SendOTP" class="btn btnstyle w-100">Send OTP</button>
                                </div>
                            </div>

                        </div>

                        <div class="form-group pmd-textfield pmd-textfield-floating-label mt-2">
                            <button type="button" runat="server" id="SubmitDetails" flag="N" class="btn btnstyle w-100">Verify & Proceed</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </form>

    <div class="container">
        <section id="registrationsuccess">
            <div class="">
                <div class="col-sm-12">
                    <div class="Scriptcontent">

                        <div id="card" class="animated fadeIn">
                            <div id="upper-side">



                                <svg version="1.1" id="checkmark" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" xml:space="preserve">
                                    <path d="M131.583,92.152l-0.026-0.041c-0.713-1.118-2.197-1.447-3.316-0.734l-31.782,20.257l-4.74-12.65
	c-0.483-1.29-1.882-1.958-3.124-1.493l-0.045,0.017c-1.242,0.465-1.857,1.888-1.374,3.178l5.763,15.382
	c0.131,0.351,0.334,0.65,0.579,0.898c0.028,0.029,0.06,0.052,0.089,0.08c0.08,0.073,0.159,0.147,0.246,0.209
	c0.071,0.051,0.147,0.091,0.222,0.133c0.058,0.033,0.115,0.069,0.175,0.097c0.081,0.037,0.165,0.063,0.249,0.091
	c0.065,0.022,0.128,0.047,0.195,0.063c0.079,0.019,0.159,0.026,0.239,0.037c0.074,0.01,0.147,0.024,0.221,0.027
	c0.097,0.004,0.194-0.006,0.292-0.014c0.055-0.005,0.109-0.003,0.163-0.012c0.323-0.048,0.641-0.16,0.933-0.346l34.305-21.865
	C131.967,94.755,132.296,93.271,131.583,92.152z">
                                    </path>
                                    <circle fill="none" stroke="#ffffff" stroke-width="5" stroke-miterlimit="10" cx="109.486" cy="104.353" r="32.53"></circle>
                                </svg>
                                <h3 id="status">Success
                                </h3>
                            </div>
                            <div id="lower-side">
                                <p id="message">
                                    Congratulations, your business has been successfully registered with us.
                                </p>
                                <a href="https://mycornershop.in/Components/Retailer_profile.aspx" class="btnstyle" id="contBtn">Continue</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </div>

    <div class="modal fade" id="generalPopupForAll" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center PopupHeader">
                    <h6 class="modal-title w-100 " style="">Your Mobile No already exists</h6>
                    <button class="close" type="button" style="color: lightgrey;" data-dismiss="modal" aria-label="Close">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </button>
                </div>
                <div class="modal-body ">
                    <div class="row">
                        <div class="col-6 col-sm-6">
                            <button type="button" class="btn btnstyle w-100" id="login">Login</button>
                        </div>
                        <div class="col-6 col-sm-6">
                            <button type="button" class="btn btnstyle" id="changeNumber">Change Number</button>
                        </div>

                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label otplabel" style="display: none;" id="login_section">
                        <div class="row">
                            <div class="col-6">
                                <label for="Email" class="control-label">
                                    OTP 
                                </label>
                                <input type="number" id="OTP_login" class="form-control" />
                            </div>
                            <div class="col-6">
                                <label for="Email" class="control-label" style="visibility: hidden;">
                                    OTP 
                                </label>
                                <button type="button" id="verifyOtp" class="btn btnstyle w-100">Verify OTP</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>


    <script type="text/javascript" src="https://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Assest/js/alert.js"></script>

    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/scroller/2.0.3/js/dataTables.scroller.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

    <script src="../Assest/bootstrap.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <%-- <script src="js/imguploader.minify.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-jcrop/0.9.15/js/jquery.Jcrop.min.js" integrity="sha512-KKpgpD20ujD3yJ5gIJqfesYNuisuxguvTMcIrSnqGQP767QNHjEP+2s1WONIQ7j6zkdzGD4zgBHUwYmro5vMAw==" crossorigin="anonymous"></script>

    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script defer="defer" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8KEha4w6awdeV8g4rEOMoLvSO1CrUkXg&libraries=places&v=3" type="text/javascript"></script>
    <script>

        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }

        var Latitude = '';
        var Longitude = '';

        $(document).ready(function () {

            navigator.geolocation.getCurrentPosition(
                function (position) {
                    //showpopup("Lat: " + position.coords.latitude + "\nLon: " + position.coords.longitude);
                    Latitude = position.coords.latitude;
                    Longitude = position.coords.longitude;
                },
                function (error) {
                    // showpopup(error.message);
                }, {
                enableHighAccuracy: true
                , timeout: 5000
            }
            );
        })

        $('#Mobile').change(function (e) {
            e.preventDefault();
            var Mobile = $.trim($('#Mobile').val());
            if (Mobile.length != 10) {
                showpopup('Please enter 10 digit mobile number');
                $('#Mobile').focus();
            }
            else {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Retailer_Registration.aspx/CheckMobile",
                    data: '{Mobile: "' + Mobile + '"}',
                    dataType: "json",
                    success: function (data) {
                        if (data.d == 'Y') {
                            showpopup('This number is already registered with us');
                            $('#generalPopupForAll').modal();

                            $('#login').click(function (g) {
                                g.stopImmediatePropagation();
                                showpopup('OTP sent successfully');
                                $('#login_section').show();
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "../../Home.aspx/sendOTP",
                                    data: '{Mobile: "' + Mobile + '"}',
                                    dataType: "json",
                                    success: function (data) {

                                        $('#verifyOtp').click(function (c) {
                                            c.stopImmediatePropagation();
                                            var OTP = $.trim($('#OTP_login').val());
                                            if (OTP.length == 4) {
                                                verifyOTP(Mobile, OTP);
                                            }
                                            else {
                                                showpopup("Please enter 4 digits");
                                                $('#OTP_login').focus();
                                            }
                                        })
                                    }
                                })
                            })

                            $('#changeNumber').click(function (g) {
                                g.stopImmediatePropagation();
                                $('#generalPopupForAll').modal('hide');
                                $('#Mobile').val('');
                                $('#Mobile').focus();
                            })
                        }

                    }
                })
            }
        })
        $('#SendOTP').click(function (e) {
            e.stopImmediatePropagation();
            var Mobile = $.trim($('#Mobile').val());
            if (Mobile.length != 10) {
                showpopup('Please enter 10 digit mobile number');
                $('#Mobile').focus();
            }
            else {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "../../Home.aspx/sendOTP",
                    data: '{Mobile: "' + Mobile + '"}',

                    dataType: "json",
                    success: function (data) {
                        showpopup('OTP sent successfully');
                        $('#SendOTP').attr('disabled', true);
                        $('#SendOTP').val('Resend OTP after 30 Seconds');
                        $('#Mobile').attr('readonly', 'readonly');
                        $('.otplabel').removeClass('d-none');

                        startTimer();
                    }
                })
            }
        })
        $('#SubmitOTP').click(function (e) {
            e.stopImmediatePropagation();
            var Mobile = $.trim($('#Mobile').val());
            var OTP = $.trim($('#OTP').val());
            if (OTP.length == 4) {
                verifyOTP(Mobile, OTP);
            }
            else {
                showpopup("Please enter 4 digits");
                $('#OTP').focus();
            }
        })
        function verifyOTP(Mobile, OTP) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Retailer_Registration.aspx/generateUserLogin",
                data: '{Mobile: "' + Mobile + '",OTP: "' + OTP + '"}',
                dataType: "json",
                success: function (data) {
                    var current = data.d;
                    current = current.split('|');
                    if (current[0] == "N") {
                        showpopup('Please enter correct OTP');
                    }
                    else {
                        showpopup('OTP matched successfully');
                        window.location.href = current[1]
                    }
                }
            })
        }
        function toTimeString(seconds) {
            var Time = (new Date(seconds * 1000)).toUTCString().match(/(\d\d:\d\d:\d\d)/)[0];
            Time = Time.split(':');
            // return (new Date(seconds * 1000)).toUTCString().match(/(\d\d:\d\d:\d\d)/)[0];
            return Time[2];
        }
        function startTimer() {
            var nextElem = $('#SendOTP');
            var duration = nextElem.val();
            var a = 30;
            var seconds = 30;
            setInterval(function () {
                seconds--;
                if (seconds >= 0) {
                    nextElem.html('<i class="fa fa-share-square"></i> ' + toTimeString(seconds) + ' sec');
                }
                if (seconds === 0) {
                    $('#SendOTP').attr('disabled', false);
                    nextElem.html('Resend OTP');
                    clearInterval(seconds);
                }
            }, 1000);
        }

        $('#SubmitDetails').click(function (e) {
            e.stopImmediatePropagation();
            if ($(this).attr('flag') == "Y") {
                if ($.trim($('#Name').val()).length == 0) {
                    showpopup('Please enter your name');
                    $('#Name').focus();
                }
                else if ($.trim($('#Business').val()).length == 0) {
                    showpopup('Please enter your business name');
                    $('#Business').focus();
                }
                else if ($.trim($('#Address').val()).length == 0) {
                    showpopup('Please enter your business address');
                    $('#Address').focus();
                }
                else if ($.trim($('#City').val()).length == 0) {
                    showpopup('Please enter your business city');
                    $('#City').focus();
                }
                else if ($.trim($('#Pincode').val()).length == 0) {
                    showpopup('Please enter your business pincode');
                    $('#Pincode').focus();
                }
                else {
                    showpopup('You are registred with us now. Please start adding your items to sell');
                    $("#registrationsuccess").show();
                    $("#registrationform").hide();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Retailer_Registration.aspx/ProceedForRegistration",
                        data: '{Mobile: "' + $.trim($('#Mobile').val()) + '",Name: "' + escapeHtml($.trim($('#Name').val())) + '",Business_Name: "' + escapeHtml($.trim($('#Business').val())) + '",Address: "' +
                            escapeHtml($.trim($('#Address').val())) + '",City: "' + escapeHtml($.trim($('#City').val())) + '",Pincode: "' + escapeHtml($.trim($('#Pincode').val())) + '",Latitude: "' + Latitude + '",Longitude: "' +
                            Longitude + '",Business_Category: "' + $('#business_category option:selected').val() + '"}',
                        dataType: "json",
                        success: function (data) {

                            //setTimeout(function () {
                            //    window.location.href = '../retialer_itemsadd.aspx';
                            //}, 2000)
                        }
                    })
                }
            }
            else if ($(this).attr('flag') == "N") {
                var Mobile = $.trim($('#Mobile').val());
                var OTP = $.trim($('#OTP').val());
                if (OTP.length == 4) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "../../Home.aspx/generateUserLogin",
                        data: '{Mobile: "' + Mobile + '",OTP: "' + OTP + '"}',
                        dataType: "json",
                        success: function (data) {
                            var current = data.d;
                            current = current.split('|');
                            if (current[0] == "N") {
                                showpopup('Please enter correct OTP');
                            }
                            else {
                                if ($.trim($('#Name').val()).length == 0) {
                                    showpopup('Please enter your name');
                                    $('#Name').focus();
                                }
                                else if ($.trim($('#Business').val()).length == 0) {
                                    showpopup('Please enter your business name');
                                    $('#Business').focus();
                                }
                                else if ($.trim($('#Address').val()).length == 0) {
                                    showpopup('Please enter your business address');
                                    $('#Address').focus();
                                }
                                else if ($.trim($('#City').val()).length == 0) {
                                    showpopup('Please enter your business city');
                                    $('#City').focus();
                                }
                                else if ($.trim($('#Pincode').val()).length == 0) {
                                    showpopup('Please enter your business pincode');
                                    $('#Pincode').focus();
                                }
                                else {
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "Retailer_Registration.aspx/ProceedForRegistration",
                                        data: '{Mobile: "' + $.trim($('#Mobile').val()) + '",Name: "' + escapeHtml($.trim($('#Name').val())) + '",Business_Name: "' + escapeHtml($.trim($('#Business').val())) + '",Address: "' +
                                            escapeHtml($.trim($('#Address').val())) + '",City: "' + escapeHtml($.trim($('#City').val())) + '",Pincode: "' + escapeHtml($.trim($('#Pincode').val())) + '",Latitude: "' + Latitude + '",Longitude: "' +
                                            Longitude + '",Business_Category: "' + $('#business_category option:selected').val() + '"}',
                                        dataType: "json",
                                        success: function (data) {
                                            showpopup('You are registred with us now. Please start adding your items to sell');
                                            $("#registrationsuccess").show();
                                            $("#registrationform").hide();

                                        }
                                    })
                                }
                            }
                        }
                    })
                }
                else {
                    showpopup("Please enter 4 digits");
                    $('#OTP').focus();
                }


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

    </script>

</body>
</html>
