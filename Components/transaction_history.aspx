<%@ Page Language="C#" AutoEventWireup="true" CodeFile="transaction_history.aspx.cs" Inherits="Components_transaction_history" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction History</title>
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
            <div id="transaction_section" class="container" runat="server" style="margin-top: 15px;">
                <div id="total_wallet_box" class="wallet__Details boxshadow">
                    
                </div>
                <hr />
                <div class="trx__Btn">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6 text-center">
                            <button type="button" class="btn btnstyle w-75">Transaction</button>
                        </div>
                    </div>
                </div>
                <div id="Indivisual_wallets">
                    <%-- <div class="wallets__Details boxshadow mt-2">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-lg-6">
                            <div class="__details">
                                <table class="w-100" style="background: none;">
                                    <tr>
                                        <td class="store__Name">
                                            <h6>SuperMart</h6>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Overall wallets balance:</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; 5000</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Balance with shop</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; -1000</h6>
                                        </td>
                                    </tr>
                                </table>
                                <a href="javascript:void(0)">view overall transaction history</a>
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
                                            <h6>Doctorplus supply</h6>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Overall wallets balance:</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; 5000</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Balance with shop</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; -1000</h6>
                                        </td>
                                    </tr>
                                </table>
                                <a href="javascript:void(0)">view overall transaction history</a>
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
                                            <h6>Gupta General Store</h6>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Overall wallets balance:</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; 5000</h6>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="w-75">
                                            <h6>Balance with shop</h6>
                                        </td>
                                        <td>
                                            <h6>&#8377; -1000</h6>
                                        </td>
                                    </tr>
                                </table>
                                <a href="javascript:void(0)">view overall transaction history</a>
                            </div>
                        </div>
                    </div>
                </div>--%>
                </div>
               

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
    <script src="JS/trx_history.js"></script>
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
            Getwallet_details();
            

        })


        function Getwallet_details() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "transaction_history.aspx/fn_GetWallets",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#total_wallet_box").empty();
                        $("#total_wallet_box").append(data.d);

                       
                    }
                    $(".viewall_trx_btn").click(function () {
                    
                        var trx_rid = $(".viewall_trx_btn").attr("trxrid");
                        setCookie('viewrid', trx_rid, 365);
                        window.location.href = 'view_transactions.aspx';
                    })

                },
                complete: function () {
                    $("#preload").hide();
                },
            });
            Getindivisualwallet_details();
        }

        function Getindivisualwallet_details() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "transaction_history.aspx/Fn_Get_indivisual_wallets",
                data: '{}',
                beforeSend: function () {
                    $("#preload").show();
                },
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        $("#Indivisual_wallets").empty();
                        $("#Indivisual_wallets").append(data.d);

                        

                    }
                    $(".view_trx_btn").click(function () {
                        var trx_rid = $(this).attr("trxrid");
                        setCookie('viewrid', trx_rid, 365);
                        window.location.href = 'view_transactions.aspx';
                    })

                },
                complete: function () {
                    $("#preload").hide();
                },
            });
        }

        function setCookie(cname, cvalue, exdays) {
            var d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            var expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }
    </script>
</body>
</html>

