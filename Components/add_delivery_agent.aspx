<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_delivery_agent.aspx.cs" Inherits="Components_add_delivery_agent" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Delivery Slots</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />

    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link href="../Admin/css/textfield.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link href="CSS/purchase_main.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <style>
        body {
            background: #ededed;
        }

        .panel {
            display: block;
            height: 278px;
        }

        .freeBird {
            margin-top: 80px;
        }

        .small-text {
            font-size: 12px;
        }

        .deep-purple {
            background-color: #37517e !important;
        }

        .border-none {
            border: none;
            border-bottom: 1px solid lightgrey;
        }

        .content {
            background: #fff;
            border-radius: 3px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.075), 0 2px 4px rgba(0, 0, 0, 0.0375);
            padding: 15px 15px 10px;
        }

        .bootstrap-datetimepicker-widget.dropdown-menu {
            border-radius: 0;
            box-shadow: none;
            margin: 0px;
            padding: 0;
            min-width: 200px;
            max-width: 100%;
            width: auto;
        }

            .bootstrap-datetimepicker-widget.dropdown-menu.bottom:before, .bootstrap-datetimepicker-widget.dropdown-menu.bottom:after {
                display: none;
            }

            .bootstrap-datetimepicker-widget.dropdown-menu table td,
            .bootstrap-datetimepicker-widget.dropdown-menu table th {
                border-radius: 0;
            }

                .bootstrap-datetimepicker-widget.dropdown-menu table td.old, .bootstrap-datetimepicker-widget.dropdown-menu table td.new {
                    color: #bbb;
                }

                .bootstrap-datetimepicker-widget.dropdown-menu table td.today:before {
                    border-bottom-color: #0095ff;
                }

                .bootstrap-datetimepicker-widget.dropdown-menu table td.active,
                .bootstrap-datetimepicker-widget.dropdown-menu table td.active:hover,
                .bootstrap-datetimepicker-widget.dropdown-menu table td span.active {
                    background-color: #0095ff;
                    text-shadow: none;
                }

                    .bootstrap-datetimepicker-widget.dropdown-menu table td.active.today:before,
                    .bootstrap-datetimepicker-widget.dropdown-menu table td.active:hover.today:before,
                    .bootstrap-datetimepicker-widget.dropdown-menu table td span.active.today:before {
                        border-bottom-color: #fff;
                    }

            .bootstrap-datetimepicker-widget.dropdown-menu table th {
                height: 30px;
                padding: 0;
                width: 30px;
            }

                .bootstrap-datetimepicker-widget.dropdown-menu table th.picker-switch {
                    width: auto;
                }

            .bootstrap-datetimepicker-widget.dropdown-menu table tr:first-of-type th {
                border-bottom: 1px solid #34495e;
            }

            .bootstrap-datetimepicker-widget.dropdown-menu table td.day {
                height: 32px;
                line-height: 16px;
                padding: 0;
                width: auto;
            }

            .bootstrap-datetimepicker-widget.dropdown-menu table td span {
                border-radius: 0;
                height: 77px;
                line-height: 77px;
                margin: 0;
                width: 20%;
            }

            .bootstrap-datetimepicker-widget.dropdown-menu .datepicker-months tbody tr td,
            .bootstrap-datetimepicker-widget.dropdown-menu .datepicker-years tbody tr td,
            .bootstrap-datetimepicker-widget.dropdown-menu .datepicker-decades tbody tr td {
                padding: 0;
            }

            .bootstrap-datetimepicker-widget.dropdown-menu .datepicker-decades tbody tr td {
                height: 27px;
                line-height: 27px;
            }

                .bootstrap-datetimepicker-widget.dropdown-menu .datepicker-decades tbody tr td span {
                    display: block;
                    float: left;
                    width: 50%;
                    height: 46px;
                    line-height: 46px !important;
                    padding: 0;
                }

                    .bootstrap-datetimepicker-widget.dropdown-menu .datepicker-decades tbody tr td span:not(.decade) {
                        display: none;
                    }

            .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td {
                padding: 0;
                width: 30%;
                height: 20px;
                line-height: 20px;
            }

                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td:nth-child(2) {
                    width: 10%;
                }

                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td a,
                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td span,
                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td button {
                    border: none;
                    border-radius: 0;
                    height: 40px;
                    line-height: 40px;
                    padding: 0;
                    width: 40px !important;
                    width: 100%;
                }

                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td .btn-primary {
                    color: #333;
                    background-color: #ffffff !important;
                }


                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td span {
                    color: #333;
                    margin-top: -1px;
                }

                .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td button {
                    background-color: #fff;
                    color: #333;
                    font-weight: bold;
                    font-size: 1.2em;
                }

                    .bootstrap-datetimepicker-widget.dropdown-menu .timepicker-picker table td button:hover {
                        background-color: #eee;
                    }

            .bootstrap-datetimepicker-widget.dropdown-menu .picker-switch table td {
                border-top: 1px solid #34495e;
            }

                .bootstrap-datetimepicker-widget.dropdown-menu .picker-switch table td a, .bootstrap-datetimepicker-widget.dropdown-menu .picker-switch table td span {
                    display: block;
                    height: 40px;
                    line-height: 40px;
                    padding: 0;
                    width: 100%;
                }

        .todayText:before {
            content: "Today's Date";
        }


        .daysname {
            background: #fdfdfd;
            padding: 2px;
            border-radius: 5px;
            margin: 3px;
        }

        .daysnames {
            background: aliceblue;
            padding: 2px;
            border-radius: 5px;
            margin: 3px;
        }

        .dayremove {
            float: right;
        }

        #weekdays {
            display: none;
        }

        .weekactive {
            display: block !important;
        }

        .appendtime {
            font-size: 14px;
            padding-left: 25px;
            font-weight: 400;
        }

        .dayremove {
            padding-left: 30px;
        }

        .slotsshow {
            background: white;
            border-radius: 5px;
            padding: 10px;
            font-size: 14px;
            padding-left: 25px;
            display: none;
        }




        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 13px;
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
                height: 20px;
                width: 20px;
                left: 0px;
                bottom: -3px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(30px);
            -ms-transform: translateX(30px);
            transform: translateX(30px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

            .slider.round:before {
                border-radius: 50%;
            }

        .jumbotron {
            padding: 2rem 1rem;
            margin-bottom: 2rem;
            background-color: #ffffff;
            border-radius: .3rem;
            margin-top: 20px;
        }

        #appendslots .row {
            background: aliceblue;
            padding: 2px;
            border-radius: 5px;
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
    <%-- header section  --%>

    <nav class="navbar fixed-top navbar-light bg-light" id="headertextappend">
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px; margin-top: -15px;">Add Delivery Agent
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>


    <main class="freeBird">
        <%-- <div style="position: absolute; right: 0; position: absolute; right: 0; background: white; z-index: 1; border-radius: 50%; height: 30px; width: 30px;">
            <a href="javascript:void(0);" onclick="history.back()" style="margin: auto;"><i class="fa fa-times" style="margin: 8px;"></i></a>
        </div>--%>

        <div class="container">
            <div class="row">
                <div class="col-md-10 m-x-auto pull-xs-none" style="margin: auto;">
                    <div class="jumbotron">
                        <div class="row">
                            <div class="col-8">
                                <h4 class="h2-responsive" style="font-size: 20px;color: #17c3d1;"><strong>Add Delivery Agent</strong></h4>
                            </div>
                            <div class="col-4 " style="text-align: right;">
                                <button id="adddeliverySlotbtn" class="btn btn btnstyle m-0 p-2" style="width: 40px!important; height: 40px; border-radius: 100%;"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <div id="mark_div" runat="server">
                        </div>



                        <!--Naked Form-->
                        <div class="card-block mt-3">
                            <div class="displaydeliverycharges" runat="server" style="overflow: auto;">

                                <div>
                                    <div id="appendslots"  class="container">
                                        <%--<div class="row mt-2">
                                            <div style="width: 40%">name</div>
                                            <div style="width: 40%">Mobile</div>
                                            <div style="width: 20%">Delete</div>
                                        </div>--%>
                                    </div>


                                </div>

                            </div>

                        </div>


                    </div>
                </div>
            </div>

        </div>
    </main>



    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Add Delivery Slot</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="md-form">
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Name" class="control-label">
                                Name<sup>*</sup>
                            </label>
                            <input type="text" required id="Name" value=" " class="form-control" />
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <label for="Name" class="control-label">
                                MOBILE<sup>*</sup>
                            </label>
                            <input type="text" required id="MOBILE" value=" " class="form-control" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn  " data-dismiss="modal" style="background: #787878; color: white;">Cancel</button>
                    <button id="finalsubmit" type="button" class="btn  btn-primary">Submit</button>
                </div>
            </div>

        </div>
    </div>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Admin/js/textfield.js"></script>


    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/eonasdan-bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <script>

        $("#adddeliverySlotbtn").click(function (e) {
            e.stopImmediatePropagation();
            $("#basicModal").modal();
        })


        $(document).ready(function () {
            GetDeliveryagents();
        })

        $("#finalsubmit").click(function (e) {
            e.stopImmediatePropagation();
            var name = $("#Name").val();
            var mobile = $("#MOBILE").val();
            if (name == "") {
                showpopup("Please enter name")
            }
            else if (mobile == "") {
                showpopup("Please enter Mobile")
            }
            else {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "add_delivery_agent.aspx/basicdetails",
                    data: '{"name":"' + name + '","mobile":"' + mobile + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        showpopup("Delivery Agent added successfully")

                        $("#basicModal").modal('hide');
                        GetDeliveryagents();
                    }
                });
            }
        })




        function GetDeliveryagents() {
            $.ajax({
                type: "POST",
                async: true,
                url: "add_delivery_agent.aspx/GetDeliveryagents",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $("#appendslots").empty();
                    $("#appendslots").append(data.d);

                    $('.deleteAgent').click(function (e) {
                        var mobile = $(this).attr('username');
                        e.stopImmediatePropagation();
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "add_delivery_agent.aspx/DeleteDeliveryAgent",
                            data: '{"Mobile":"' + mobile + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {

                                showpopup("Delivery Agent removed successfully")

                        
                                GetDeliveryagents();
                            }
                        });
                    })
                }
            });
        }

        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)
            $('#Alert_btn').trigger('click');
        }

    </script>
</body>
</html>
