<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delivery_Registration.aspx.cs" Inherits="Admin_Delivery_Registration" %>

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
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/scroller/2.0.3/css/scroller.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <!-- Include Date Range Picker -->

    <link rel="stylesheet" href="http://propeller.in/components/textfield/css/textfield.css" />

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

    <form>

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
                            <input type="text" required="required" id="Mobile" class="form-control" />
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
                            <input type="text" required id="Pincode" class="form-control" />
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label otplabel d-none">
                            <div class="row">
                                <div class="col-8">
                                    <label for="Email" class="control-label">
                                        OTP 
                                    </label>
                                    <input type="text" id="OTP" class="form-control" />
                                </div>
                                <div class="col-4">
                                    <label for="Email" class="control-label" style="visibility: hidden;">
                                        OTP 
                                    </label>
                                    <button type="button" id="SubmitOTP" class="btn btnstyle w-100">Verify</button>
                                </div>
                            </div>

                        </div>

                        <div class="form-group pmd-textfield pmd-textfield-floating-label mt-2">
                            <button type="button" id="SendOTP" class="btn btnstyle w-100 d-none">Send OTP</button>
                            <button type="button" id="SubmitDetails" disabled class="btn btnstyle w-100 d-none">Submit and Proceed</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>



    </form>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>


    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>
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
                            showpopup('This number is already registered with us. Kindly contact at 9650601555 for any assistance');
                            $('#Mobile').focus();
                        }
                        else {
                            $('#Mobile').attr('readonly', 'readonly');
                            $('#SendOTP').removeClass('d-none');
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
                        showpopup('OTP matched successfully');
                        $('#SubmitDetails').removeClass('d-none');
                        $('#SubmitDetails').removeAttr('disabled');
                        $('.otplabel').addClass('d-none');
                        $('#SendOTP').addClass('d-none');
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
                    nextElem.html('Resend OTP after ' + toTimeString(seconds) + ' Seconds');
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
            //alert("Jatin Kansal".split(" ").map((n) => n[0]).join(""));
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
                        setTimeout(function () {
                            window.location.href = window.location.href;
                        },2000)
                    }
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

    </script>

</body>
</html>
