<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment_details_web.aspx.cs" Inherits="Payments_payment_details_web" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Corner Shop | Payment Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <%-- <link href="../Admin/css/textfield.css" rel="stylesheet" />

    <script src="../Admin/js/global.js"></script>--%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <style>
        

        .title {
            border-bottom: 1px solid #8cc9f3;
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            color: #215890;
            background: #add9f4;
        }
      
.footer {
    position: fixed;
    bottom: 0px;
    left: 0px;
    width: 100%;
    z-index: 3;
     height: 20px;
}
.boxshadow {
    box-shadow: 0 2px 8px 0 rgba(0,0,0,.35);
    border: none !important;
}

 
    </style>
    <style>
        .content {
            box-sizing: border-box;
            position: relative;
            padding: 5px;
            z-index: 1;
            border: none;
            background: #fff;
            border-radius: 5px;
        }

        .bg-dark {
            background-color: #ed394d !important;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }

        body {
            background: white;
        }

        a {
            color: #ffffff !important;
            text-decoration: none !important;
            background-color: transparent;
        }

        .contbg {
            background: url("table-with-ingredients-prepare-italian-pasta_23-2147606548.jpg");
            background-size: cover;
            position: relative;
            height: 100vh;
            align-items: center;
            justify-content: center;
        }


        .contents {
            bottom: 0;
            background: rgb(0, 0, 0);
            background: rgba(0, 0, 0, 0.5);
            color: #f1f1f1;
            width: 100%;
            padding: 20px;
            height: 100%;
        }


        .signupbox {
            padding: 10px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            margin-top: 20%;
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.25);
        }

        .login-form {
            background: #fff;
            display: -webkit-box;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            flex-direction: column;
            border-radius: 4px;
            box-shadow: 0 2px 25px rgba(0, 0, 0, 0.2);
        }

            .login-form h1 {
                padding: 35px 35px 0 35px;
                font-weight: 300;
            }

            .login-form .content {
                padding: 35px;
            }

            .login-form .input-field {
                padding: 12px 5px;
            }


            .login-form a.link {
                text-decoration: none;
                color: #747474;
                letter-spacing: 0.2px;
                text-transform: uppercase;
                display: inline-block;
                margin-top: 20px;
            }

            .login-form .action {
                display: -webkit-box;
                display: flex;
                -webkit-box-orient: horizontal;
                -webkit-box-direction: normal;
                flex-direction: row;
            }

                .login-form .action button {
                    width: 100%;
                    border: none;
                    padding: 18px;
                    cursor: pointer;
                    text-transform: uppercase;
                    background: #ed394d;
                    color: #fff;
                    font-weight: bold;
                    border-bottom-left-radius: 4px;
                    border-bottom-right-radius: 0;
                    letter-spacing: 0.2px;
                    outline: 0;
                    -webkit-transition: all .3s;
                    transition: all .3s;
                    border-radius: 5px;
                }

                    .login-form .action button:hover {
                        background: #00a1df;
                    }

                    .login-form .action button:nth-child(2) {
                        background: #2d3b55;
                        color: #fff;
                        border-bottom-left-radius: 0;
                        border-bottom-right-radius: 4px;
                    }

                        .login-form .action button:nth-child(2):hover {
                            background: #3c4d6d;
                        }

        @media (max-width:768px) {
        }

        .login-form h1 {
            color: #00a1df;
        }



        .inputcss {
            transition: .4s;
            margin-top: 0px !important;
        }

        .content input {
            text-align: left !important;
        }

        .managerfield {
            text-align: center;
        }

        .manager {
            text-align: center;
            font-size: 19px;
            font-weight: 500;
            cursor: pointer;
            margin-top: 10px;
        }

        #numberComplete {
            font-weight: bold;
        }

        .scan {
            font-weight: bold;
        }

        .Paymentcard {
            margin-top: 20% !important;
            padding: 10px;
            margin: 0 auto;
            color: #333;
            /* background: white; */
            border-radius: 5px;
            font-family: sans-serif;
            overflow: hidden;
            box-shadow: 0 2px 8px -1px rgba(0, 0, 0, 0.25);
            position: relative;
        }

        .pay-title {
            border-left: 7px solid #2fcdc7;
            padding-left: 10px;
            margin-left: 10px;
            color: #384862;
            text-shadow: 2px 2px 4px #00000042;
        }

        @media only screen and (max-width: 768px) {

            .Paymentcard {
                margin-top: 20% !important;
            }

            .btn-primary {
                margin-top: 10px;
            }

            .btn-danger {
                margin-top: 10px;
            }

            .form-group {
                margin-bottom: 0px;
            }
        }

        input {
            outline: none !important;
        }

        .col-form-label {
            font-size: 20px;
            color: #384862;
        }

        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #ffffff;
            width: 100%;
        }

        .btn-danger {
            width: 100%;
        }

        .form-control:focus {
            border-color: #80bdff00;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgb(0 123 255 / 0%);
        }

        #txtamount {
            font-weight: bold;
        }

        
    </style>
</head>
<body id="pageone" runat="server">
    <form id="form1" runat="server">
        <div>

            <!--1. Navbar section-->
            <%-- <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#"></a>
       
            </nav>--%>

            <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 50px;"><p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Sector-14 Gurgaon</p>
                </a>
                <%--<span id="UserName_n_Pic" runat="server" class="userpic">&nbsp;&nbsp; <i class="fa fa-pencil" style="font-size: 25px;"></i></span>--%>
            </nav>
            <section style="margin-top: 18px;margin-bottom: 50px;">

                <div class="container">

                    <div class="row">
                        <div class="col-sm-2 col-md-2"></div>
                        <div class="col-sm-8 col-md-8">

                            <div class="Paymentcard">
                                <h2 class="pay-title"  style="font-size: 25px;">Payment Details</h2>

                                <div class="row">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-10">
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="txtName" class="col-form-label">Name</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <input name="txtName" type="text" runat="server" id="txtName" class="form-control" readonly="true" placeholder="Customer Name" />
                                            </div>

                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="txtMobile" class="col-form-label">Mobile Number</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <input name="txtMobile" type="text" runat="server" id="txtMobile" class="form-control" readonly="true" placeholder="Customer Mobile" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="txtRestaurantName" class="col-form-label">Payee Name</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <input name="txtRestaurantName" runat="server" type="text" id="txtRestaurantName" class="form-control" readonly="true" placeholder="Retailer Name" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <label for="txtamount" class="col-form-label">Amount</label>
                                            </div>
                                            <div class="col-sm-8">
                                                <input name="txtamount" runat="server" type="text" id="txtamount" class="form-control" readonly="true" placeholder="Amount" />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-4">
                                                <button type="button" class="btn btn-primary border-0  pull-left btnstyle" onclick="goBack()">Cancel</button>
                                            </div>
                                            <div class="col-8">
                                                <asp:Button ID="Button1" CssClass="btn btn-primary  border-0 pull-right btnstyle" runat="server" OnClick="btnCheckout_Click" Text="Proceed" />
                                            </div>
                                        </div>
                                        <div class="col-sm-2"></div>
                                    </div>
                                    <div class="col-sm-1"></div>

                                </div>
                            </div>



                        </div>
                        <div class="col-sm-2 col-md-2"></div>
                    </div>
                </div>

            </section>

        </div>
        <input type="hidden" id="transaction_id" runat="server" />
           <input type="hidden" id="txtMID" runat="server" />
           <input type="hidden" id="txtMKEY" runat="server" />
        <input type="hidden" id="hash" runat="server" />
    </form>
  
          
                 <div class="footer container" style="font-size:11px; text-align:center;"> 
                     <div class="row">
                         <div class="col-12">
                                 Copyright © mycornershop.in. All rights reserved

                         </div>
                     </div>
                 
                 </div>
             
    
    

 
     <script src="../Items/Add_Balance.js"></script>

    <%--      <script src="../Admin/js/textfield.js"></script>--%>
    <script src="../Assest/bootstrap.js"></script>
    <%--   <script src="../Assest/js/jquery-ui.min.js"></script>--%>
  
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
