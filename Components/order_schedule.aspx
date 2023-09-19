<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order_schedule.aspx.cs" Inherits="Components_order_schedule" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oredr Schedule</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oxygen:400,700" />
    <link href="../Assest/css/orderschedul_maiin.css" rel="stylesheet" />
    <style>
        .itemcard {
            border: 1px solid #e1e1e1;
            background: #f7f7f7;
            border-radius: 5px;
        }

        .retailrdetails {
            padding-left: 25px;
        }

        .deliverslotbtn {
            margin: 10px;
            padding: 5px;
            background: #55e6c1;
            text-align: center;
            color: white;
            border-radius: 5px;
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
            <%-- <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#"></a>
                <span class="userpic"><span>Welcome Mr.ABC</span> &nbsp;&nbsp;<i class="fa fa-user-circle-o "></i></span>
            </nav>--%>

            <nav id="slide-menu">
                <ul>
                    <li class="timeline">Timeline</li>
                    <li class="events">Events</li>
                    <li class="calendar">Calendar</li>
                    <li class="sep settings">Settings</li>
                    <li class="logout">Logout</li>
                </ul>
            </nav>



            <!--2. Seacrch Section-->
            <div id="content">
                <div class="header">
                    <div class="menu-trigger"></div>
                    <div class="row">
                        <div class="col-2">
                        </div>
                        <div class="col-8">
                            <div class="storename">Gupta General Store
                                <div style="font-size: 10px;">Sector-14</div>
                            </div>
                        </div>
                        <div class="col-2">
                            <i class="fa fa-user-circle  " style="float: right; font-size: 25px;"></i>
                        </div>
                    </div>
                </div>
                <div id="shedulersection" class="container pr-0 pl-0" runat="server">
                    <div class="card itemcard p-2">
                        <div class="card p-1 mt-2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="text-center" style="border-bottom: 1px solid #ddd; margin-bottom: 5px;">
                                                <strong>Delivery Address</strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-7 col-md-7 ">
                                            <div class="retailrdetails">
                                                Home
                                            </div>
                                        </div>
                                        <div class="col-5 col-md-5 ">
                                            <div class="sheduledtime">
                                                <div class="rounded">
                                                    <div class="datetime"><span>Change Address </span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="itembox m-2">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-12">
                                                    <label>
                                                        Bryar Pitts 5543 Aliquet St. Fort Dodge GA 20783 (717) 450-4729</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="card p-1 mt-2">
                            <div class="row">
                                <div class="col-12">
                                    <div class="text-center">
                                        <strong>Choose delivery slot for this address</strong>
                                    </div>

                                </div>
                                <div class="col-12">
                                    <div class="day_date">
                                        <div id="sub_category" style="display: flex; overflow-x: auto; overflow-y: hidden; background: white;">
                                            <div class="day dayactive">
                                                MON
                                                <div class="triangle triangle-4 indishow"></div>
                                            </div>
                                            <div class="day">
                                                TUE
                                                <div class="triangle triangle-4"></div>
                                            </div>
                                            <div class="day">
                                                WED
                                                <div class="triangle triangle-4"></div>
                                            </div>
                                            <div class="day">
                                                THU
                                                <div class="triangle triangle-4"></div>
                                            </div>
                                            <div class="day">
                                                FRI
                                                <div class="triangle triangle-4"></div>
                                            </div>
                                            <div class="day">
                                                SAT
                                                <div class="triangle triangle-4"></div>
                                            </div>
                                            <div class="day">
                                                SUN
                                                <div class="triangle triangle-4"></div>
                                            </div>
                                        </div>
                                        <div class="timeslots">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-12 slots">
                                                        <div class="timeslot timing_checked">7:00 AM - 10:00 AM <i class="fa fa-check-circle fa-2x"></i></div>
                                                        <div class="timeslot timing">12:00 AM - 2:00 PM </div>
                                                        <div class="timeslot timing">3:00 PM - 5:00 PM</div>
                                                        <div class="timeslot timing">6:00 PM - 8:00 PM</div>
                                                        <div class="timeslot timing">9:00 PM - 10:00 PM</div>
                                                        <!-- Material unchecked -->

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="deliverslotbtn">
                                                        <span>Submit</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--3. Category -->

            <!--4. Sheduled Section-->




            <!--5. Transaction history-->


        </div>
    </form>


    <footer>
        <div class="footer"></div>
    </footer>
    <script src="../Assest/js/hammer.min.js"></script>

    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script>

        $(".day").click(function () {
            var text = $(this).text();
            $(".timing").empty();
            $(".timing").text(text);
            $(".day").removeClass("dayactive")
            $(".triangle").removeClass("indishow")
            if ($(this).hasClass("dayactive")) {
                $(this).find(".triangle-4").removeClass("indishow");
                $(this).find(".triangle-4").addClass("indishow");
                $(this).removeClass("dayactive");
                $(this).addClass("dayactive");

            }
            else {
                $(this).find(".triangle-4").removeClass("indishow");
                $(this).find(".triangle-4").addClass("indishow");

                $(this).removeClass("dayactive");
                $(this).addClass("dayactive");

            }

        });



        $(".timeslot").click(function () {
            $(".timeslot").removeClass("timing_checked");
            if ($(this).hasClass("timing_checked")) {
                $(this).removeClass("timing_checked");
                $(this).addClass("timing");
            }
            else {
                $(this).addClass("timing");
                $(this).removeClass("timing_checked");

            }

        });







        (function () {
            var $body = document.body,
                $menu_trigger = $body.getElementsByClassName("menu-trigger")[0];

            if (typeof $menu_trigger !== "undefined") {
                $menu_trigger.addEventListener("click", function () {
                    $body.className = $body.className == "menu-active" ? "" : "menu-active";
                });
            }

            var options = {
                dragLockToAxis: true,
                dragBlockHorizontal: true,
                preventDefault: true
            };

            Hammer(document.getElementById("content")).on(
                "swipeleft swiperight",
                function (ev) {
                    $body.className = $body.className == "menu-active" ? "" : "menu-active";
                },
                options
            );
        }.call(this));


    </script>
</body>
</html>
