<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payment_failed_web.aspx.cs" Inherits="Payments_payment_failed_web" %>

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
    <link href="http://propeller.in/components/textfield/css/textfield.css" rel="stylesheet" />
    <script src="http://propeller.in/components/global/js/global.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <style>
   
.footer {
    position: fixed;
    bottom: 0px;
    left: 0px;
    width: 100%;
    z-index: 3;
    height:20px;
}
.boxshadow {
    box-shadow: 0 2px 8px 0 rgba(0,0,0,.35);
    border: none !important;
}
 


        .title {
            border-bottom: 1px solid #8cc9f3;
            padding: 10px;
            font-size: 16px;
            font-weight: 500;
            color: #215890;
            background: #add9f4;
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
            border-left: 7px solid #31cdc6;
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
            color: #00a1df;
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
<body id="pageone">
    <form id="form1" runat="server">
        <div>

            <!--1. Navbar section-->
           <%-- <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#"></a>
        
            </nav>--%>

            <nav class="navbar fixed-top navbar-light bg-light">
                <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 50px;"><p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;">Sector-14 Gurgaon</p>
                </a>
                <span id="UserName_n_Pic" runat="server" class="userpic">&nbsp;&nbsp; <i class="fa fa-pencil" style="font-size: 25px;"></i></span>

            </nav>
            <section style="margin-top: 50px;">

                <div class="container">

                    <div class="row">
                        <div class="col-sm-2 col-md-2"></div>
                        <div class="col-sm-8 col-md-8">
                            <div class="Paymentcard">
                                <h2 class="pay-title"  style="font-size: 25px;"><i class="fa fa-times-circle-o" aria-hidden="true"></i>Payment Failed</h2>
                                <div class="row">
                                    <div class="col-12" style="text-align: center;">
                                        <asp:Label runat="server" CssClass="txtamount" ID="lable1"></asp:Label><br />
                                        <asp:Label runat="server" CssClass="trxid" ID="lable2"></asp:Label>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-12" style="text-align: center;">
                                        <i class="fa fa-warning" style="color: red; font-size: 40px;"></i>
                                        <br />
                                        <span class="wrntxt">We are sorry but the</span><br />
                                        <span class="wrntxt">transaction failed.</span>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <div class="row">
                                    <div class="col-12" style="text-align: center; border-bottom: 1px solid lightgrey;">
                                        <span>Unknown Error</span>
                                        <p>Please Save above Transaction Id for your Future Reference.</p>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12" style="text-align: center;">
                                   
                                        <a class="btn btn-primary btn-group-sm btnstyle  border-0" id="tryagain" runat="server">Try again...</a>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="col-sm-2 col-md-2"></div>
                    </div>
                </div>

            </section>

        </div>
    </form>
     <div class="footer container" style="font-size:11px; text-align:center;"> 
                     <div class="row">
                         <div class="col-12">
                                 Copyright © mycornershop.in. All rights reserved

                         </div>
                     </div>
                 
                 </div>

   
  

     
    <script type="text/javascript" src="http://propeller.in/components/textfield/js/textfield.js"></script>

    <script src="../Assest/js/Main_script.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

     
</body>
</html>

