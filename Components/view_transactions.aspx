<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_transactions.aspx.cs" Inherits="Components_view_transactions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View History</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />

    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>
<style>
    .wallet__Details {
        margin-top: 100px;
        background: white;
        border-radius: 5px;
        padding: 10px;
    }

    .wallets__Details {
        background: white;
        border-radius: 5px;
        padding: 10px;
    }

    tbody tr:nth-child(odd) {
        background-color: #fff;
        color: #000;
    }

    tbody tr:nth-child(even) {
        background-color: #fff;
        color: #000;
    }

    .boxshadow {
        box-shadow: 0 0px 2px -1px rgba(0, 0, 0, 0.25);
    }


    .wallets__Details:hover {
        border: 1px solid #384862;
        border-radius: 5px;
    }

    h6 {
        font-size: .8rem;
        margin-bottom: .1rem;
    }

    #shedulersection {
        margin-bottom: 0px;
    }

    .wallet__Details a {
        color: #25adb9;
        font-size: 10px;
        font-weight: 600;
    }

    .wallets__Details a {
        color: #25adb9;
        font-size: 10px;
        font-weight: 600;
    }

      .purchase{
            background: #384862;
    color: white;
    padding: 0px;
    margin-right: -10px;
    border-top-left-radius: 15px;
    border-bottom-left-radius: 15px;
    text-align: center;
    font-size: 9px;
    padding-left: 5px;
    padding-right: 5px;
        }
      .Payment{
          background: #37cfc3;
    color: white;
    padding: 0px;
    margin-right: -10px;
    border-top-left-radius: 15px;
    border-bottom-left-radius: 15px;
    text-align: center;
    font-size: 9px;
     padding-left: 5px;
    padding-right: 5px;
      }
</style>

<body id="pageone">
    <div id="preload" style="display:none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar fixed-top navbar-light bg-light">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;margin-top: -15px;">Transaction History</a>
            </nav>



            <!--4. Sheduled Section-->
            <div class="container" style="margin-top: 18px;">
            </div>
            <div id="shedulersection" class="container" runat="server" style="margin-top: 100px;">
                
                <div class="trx__Btn">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6 text-center">
                            <button type="button" class="btn btnstyle w-100">All Transactions</button>
                        </div>
                    </div>
                </div>
                <div id="all_trx_history">

                </div>

             <%--   <div class="wallets__Details boxshadow mt-2">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <div class="__details">
                                <table class="w-100" style="background: none;">
                                    <tr>
                                        <td class="store__Name w-75">
                                            <h6>date</h6>
                                        </td>
                                        <td><div class="purchase">Purchase</div></td>
                                    </tr>
                                     
                                    <tr>
                                        <td class="w-75">
                                            <h6>MOP</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; -1000</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Store Name</h6>
                                        </td>
                                        <td>
                                             
                                        </td>
                                    </tr>
                                </table>
                             
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wallets__Details boxshadow mt-2">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <div class="__details">
                                <table class="w-100" style="background: none;">
                                    <tr>
                                        <td class="store__Name w-75">
                                            <h6>date</h6>
                                        </td>
                                        <td><div class="Payment">Payment</div></td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="w-75">
                                            <h6>MOP</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; -1000</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Store Name</h6>
                                        </td>
                                        <td>
                                             
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wallets__Details boxshadow mt-2">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <div class="__details">
                                <table class="w-100" style="background: none;">
                                    <tr>
                                        <td class="store__Name">
                                            <h6>date</h6>
                                        </td>
                                        <td></td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="w-75">
                                            <h6>MOP</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; -1000</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Store Name</h6>
                                        </td>
                                        <td>
                                         </td>
                                    </tr>
                                </table>
                                
                            </div>
                        </div>
                    </div>
                </div>--%>
                 

            </div>
        </div>
    </form>


    <div style="height: 60px;"></div>
    <%-- <footer>
        <div class="footer" style="color: white; position: fixed; width: 100%; bottom: 0; padding-top: 5px; padding-left: 10px;"><span>Total Collection : <span id="Today_colection" runat="server"></span></span></div>
    </footer>--%>
    <input type="hidden" id="RID" runat="server" value="" />
    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
 
    <script>
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        $(function () {
            var start = moment().subtract(29, "days");
            var end = moment();

            function cb(start, end) {
                $("#reportrange span").html(
                    start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY")
                );
            }

            $("#reportrange").daterangepicker(
                {
                    startDate: start,
                    endDate: end,
                    ranges: {
                        Today: [moment(), moment()],
                        Yesterday: [moment().subtract(1, "days"), moment().subtract(1, "days")],
                        "Last 7 Days": [moment().subtract(6, "days"), moment()],
                        "Last 30 Days": [moment().subtract(29, "days"), moment()],
                        "This Month": [moment().startOf("month"), moment().endOf("month")],
                        "Last Month": [
                            moment().subtract(1, "month").startOf("month"),
                            moment().subtract(1, "month").endOf("month")
                        ]
                    }
                },
                cb
            );

            cb(start, end);
        });

        $(document).ready(function () {
        
            var rid = getCookie('viewrid');
            if (rid == "-1") {
                GetallTrx_details()
            }
            else {
                GetallTrx_details_byRID(rid)
            }


        })

        function GetallTrx_details() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "view_transactions.aspx/Fn_all_trxhistory",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#all_trx_history").empty();
                        $("#all_trx_history").append(data.d);
                    }

                },
                complete: function () {
                    $("#preload").hide();
                },
            });
        }

        function GetallTrx_details_byRID(rid) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "view_transactions.aspx/Fn_all_trxhistory_rid",
                data: '{rid:"' + rid + '"}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#all_trx_history").empty();
                        $("#all_trx_history").append(data.d);
                    }

                },
                complete: function () {
                    $("#preload").hide();
                },
            });
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
    </script>
</body>
</html>
