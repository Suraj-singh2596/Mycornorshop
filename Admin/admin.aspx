<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="Admin_admin" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My conner shop | Admin</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="css/textfield.css" rel="stylesheet" />
       
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" />
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="assets2/css/material-dashboard.min1c51.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.min.css" rel="stylesheet" />
     <link href="../Assest/css/globalstyle.css" rel="stylesheet" />

    <!-- Include Date Range Picker -->


    <style>
        /*DATE RANGE CSS*/

        .itmscss {
            background: green;
            color: white;
            padding: 5px;
            border-radius: 20px;
            margin: 5px;
            font-size: 10px;
        }

        body .ui-datepicker {
            padding: 5px 4px;
            background: white;
            border: none;
        }

            body .ui-datepicker .ui-datepicker-stay-duration {
                color: #0d5264;
                font-family: "Lato", sans-serif;
                font-size: 14px;
                font-weight: 900;
                text-transform: uppercase;
                text-align: center;
                margin-top: 17px;
                margin-bottom: 8px;
            }

            body .ui-datepicker .ui-datepicker-header {
                background: #ccb268;
                border: none;
                -moz-border-radius: 0;
                -webkit-border-radius: 0;
                border-radius: 0;
                padding-top: 12px;
                padding-bottom: 9px;
            }

                body .ui-datepicker .ui-datepicker-header .ui-datepicker-prev {
                    width: 33px;
                    height: 33px;
                    left: 13px;
                    top: 10px;
                    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAhCAYAAAEg4/L5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA7RJREFUeNpi5A1KYYCC/0DMCGIwIQnAaSYkAbgOJpgWJMAI086ITAMEECPUogqoYAcLmnntYG2f1s6Gi4AF+IJT4QIsUMPgZgAEEMxQHiD+zIAJeIH4C8iYamQFyHZAxetAipiRRZ+9+4BhHMw6fiD+gMU6ASD+CBBAjEghCgJnoLQJsi8YsAUmcvg9YcANnoAUSMN4UkIC6AqkmZB5X378xDACRUFRkCdWrz5BtkaEj5fhzSd4GD4FmSCDrANJEgRkWNBSAUY4AAQQekCBwFUg1sLj9WtArI0swIIlAAkBLeTAxpbeMYCxqiLDm5XTcUnD88c9bLKcbKzgJHfh7kMGkfBMfC67x4RLxsfciOH7r98Mf//9I+g/WMDi9M6KihwGPi5OBq+6bpxmMKIVDKQCRvRkxgjF1whovIakFgwAAghbOgEBRSDuBUUOlH8WiIuB+D66QhY0vjcQb8FioBwQB8LCG4i3Ysst23FoRgdboGpRDJgJxB4kBKIHVA/YAE4gTiMjJkB6OEEGXMKn6uXyaQxsLCy4pC+BDFDBJXtjdjfD9K17GH79+YNLiQrOpL2nrQKcNxqWrMPrD6xuS3S1YxDh52VwqeogGBBYXTB/9yEGJQkxcBYnywBYJbW/owpbWYxhwB1ckoKh6eCAxAPugPICKB18YyAPcIFc8B2IZ5GhGaTnOywM0oH4IAmaD0L1oASiAxAHEaE5CKoWayyshxYWStAs+wKKt0LFGKFq4AAgwHAVKMgA1BZIAOJSIFYnwZs3gRgUhQuA+C85aQlkcRe0zAVlpjkkOoABqn4OVP9/qHnMxDiCDYj3QjWWMlAXlELN3Qu1B6sjQMUvqLXixEBb4AS1xw/dEflAvI5cUy01VRjSPEl2+0aovWBHWALxBHIsBxVi9+b3MexsKWf4R0QrAQsA2WsJKmbrSNUJak2ALNaWl2aYs/MAQ9GspZRETx0LNCSIAsxMTAxLy7IYvEz1GY5cvcUgHpkFbitRCGyYSFENqj9cDLXBDbQpm3dRwwEQz7FrGtnjq3uRwdO37xm61mxl+PTtO8PM3CSGVE9Hhj0XrjC8/viZEjfsA5WYoOg4Ro7u6TmJDNGOVgxXHz4Ftzjff/lKjjFWoOg4DsQF5OjOnDIfnC5+/PrFcG1mJ76mDi4Asvc4ct0RAsSrGegHQoF4DXqJCRLgAsURjS0/CLVnDa66A9SqcIYqWkBlyxdAzXWA2kOwFgUpSoTW/SzQlsdNEi29CdUHG3VIRLccBgDmGPEddIdrBgAAAABJRU5ErkJggg==");
                }

                body .ui-datepicker .ui-datepicker-header .ui-datepicker-prev,
                body .ui-datepicker .ui-datepicker-header .ui-datepicker-next {
                    border: none;
                    cursor: pointer;
                }

                    body .ui-datepicker .ui-datepicker-header .ui-datepicker-prev .ui-icon,
                    body .ui-datepicker .ui-datepicker-header .ui-datepicker-next .ui-icon {
                        display: none;
                    }

                body .ui-datepicker .ui-datepicker-header .ui-datepicker-next {
                    right: 13px;
                    top: 10px;
                    width: 33px;
                    height: 33px;
                    background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAAAhCAYAAAEg4/L5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA6lJREFUeNpi5A1KYYCC/0DMCGIwIQnAaSYkAbgOJpgWJMAI086ITAMEECPUogqoYAcLmnntMG0Mn9bOZkB2BgNfcCqYZoEaBjcDIIBghvIA8WcGTMALxF9AxtQhK4CZDwUg8WomdK3P3n1AF2KGWccPxB+wWCcAxB8BAogRKURB4AyUNoEJsKCFLgMaHxx+TxhwgycgBdLIIlJCAshcaQzffPnxE4WPoaAoyBM1EoG+eAKzRoSPl+HNJ5QAfgoyQQbGQ5MEARkWtFSAEQ4AAYQeUCBwFYi18Hj9GhBrIwuwYAlAQkALObCxpXcU8GbldAZjVUV8BsLzxz1cKkTCMxku3H0ITnqcbKy4lN1jIuT2v//+MXz/9ZvBx9wIpxpQmCjh8s62plKGT9++M4hHZuGzR4kRrWAgFTCiJzNGKL5GQOM1JLVgABBA2NIJCICipBeIjaH8s0BcDMT3sYUHMvAG4i1YDJQD4kAo2weIt2LLLdtxaEYHW6BqUQyYCcQeJASiB1QP2ABOIE4jIyZAejhBBlzCJsvGwsLwcvk0QoZcAhmggk3m158/DNO37mG4MbsbnwEqeJN2w5J14Pyxp60CpxqCeSOiYwqDCD8vQ6KrHXkGgLK5koQYw/zdh0g3AFQG7++ogldWuAy4g0sSFICCoen47LgDygugdPCNgTzABXLBdyCeRYZmkJ7vsDAAufMgCZoPQvWgBKIDEAcRoTkIqhZrLKyHFhZK0Cz7Aoq3QsUYoWrgACDAcBUoKHU9ECcAcSkQq5PgzZtADMoHC0BlNT6FTHgs7oKWuX+AeA6JDmCAqp8D1f8fah4zMY5gA+K9UI2lDNQFpVBz90LtweoIPyAGtVScGGgLnKD2BKI7Ih+IN5JUuno6MVhqqlDimHVQe8GOsATiCaSa8A/YKtjZUs5wb34fuAAjE4DstQTlju0k1lMooC8tmiHF3YHh6sOnDO41neDWBolgB8gRn6ENe7IBqKG1tqaAwUZbjWHb6YsM0V3TwO0nIsFHJmqkNFBjbcrmXWCLXQy1CTUlsTbmjlASHdry0gybG4rBjfjyeSuAdfVeUo04DnJEEzmOEOThBrc4QY5Yuv8YQ+aU+eT6ownkiONAXEBKDgE1b67N7GS48fgZuMkLig4yAcje48h1RwgQr2agHwgF4jXoJSZIgIvEupgcsA9qzxpcdcd3aB3NBa39qAkWQM11htpDsBYFKUqE1v0s0JbHTRItvQnVBxt1SES3HAYAEaDvn+18U+wAAAAASUVORK5CYII=");
                }

                body .ui-datepicker .ui-datepicker-header .ui-datepicker-title {
                    line-height: normal;
                    font-size: 0;
                }

                    body .ui-datepicker .ui-datepicker-header .ui-datepicker-title .ui-datepicker-month {
                        text-align: center;
                        display: block;
                        font-family: "Montserrat", sans-serif;
                        font-weight: bold;
                        font-size: 16px;
                        text-transform: uppercase;
                    }

                    body .ui-datepicker .ui-datepicker-header .ui-datepicker-title .ui-datepicker-year {
                        text-align: center;
                        display: block;
                        font-family: "Montserrat", sans-serif;
                        font-size: 13px;
                        font-weight: normal;
                    }

            body .ui-datepicker .ui-datepicker-group {
                margin: 0 2px;
                width: calc(50% - 4px) !important;
            }

            body .ui-datepicker .ui-datepicker-calendar {
                background-color: #0d5264;
                width: 100% !important;
                margin: 0 !important;
                table-layout: fixed;
            }

                body .ui-datepicker .ui-datepicker-calendar td,
                body .ui-datepicker .ui-datepicker-calendar th {
                    width: 37px;
                    height: 23px;
                    padding: 0;
                }

                body .ui-datepicker .ui-datepicker-calendar th {
                    font-family: "Montserrat", sans-serif;
                    font-weight: 900;
                    color: white;
                    font-size: 13px;
                }

                body .ui-datepicker .ui-datepicker-calendar .sejour > a {
                    background: #476f65;
                }

                body .ui-datepicker .ui-datepicker-calendar .start > a {
                    position: relative;
                    background: #ccb268;
                    color: #404040;
                }

                    body .ui-datepicker .ui-datepicker-calendar .start > a:after {
                        content: " ";
                        display: block;
                        width: 0;
                        height: 0;
                        border-style: solid;
                        border-width: 6px 0 6px 6px;
                        border-color: transparent transparent transparent #ccb168;
                        position: absolute;
                        left: 100%;
                        top: 50%;
                        margin-top: -6px;
                    }

                body .ui-datepicker .ui-datepicker-calendar .end > a {
                    position: relative;
                    background: #ccb268;
                    color: #404040;
                }

                    body .ui-datepicker .ui-datepicker-calendar .end > a:after {
                        content: " ";
                        display: block;
                        width: 0;
                        height: 0;
                        border-style: solid;
                        border-width: 6px 6px 6px 0;
                        border-color: transparent #ccb168 transparent transparent;
                        position: absolute;
                        right: 100%;
                        top: 50%;
                        margin-top: -6px;
                    }

                body .ui-datepicker .ui-datepicker-calendar .ui-state-default {
                    display: block;
                    width: 100%;
                    height: 100%;
                    line-height: 23px;
                    text-align: center;
                    padding: 0;
                    border: none;
                    outline: 0;
                    background: none;
                    color: white;
                    font-family: "Montserrat", sans-serif;
                    font-size: 13px;
                }

                    body .ui-datepicker .ui-datepicker-calendar .ui-state-default:hover {
                        background: #ccb268;
                    }

        /*DATE RANGE CSS*/
        .form-control:focus {
            border-color: none;
            box-shadow: none;
        }

        .inputfield {
            height: 23px;
            display: none;
        }

        .updatebtn {
            display: none;
        }

        .cancelbtn {
            display: none;
        }

        .fileUpload {
            position: relative;
            overflow: hidden;
        }

            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }

        .btn--browse {
            border: 1px solid #dfdfdf;
            border-left: 0;
            border-radius: 0 2px 2px 0;
            background-color: #eee;
            color: #555555;
            height: 30px;
            padding: 2px 14px;
        }

        .f-input {
            height: 30px;
            background-color: white;
            border: 1px solid #dfdfdf;
            width: 72%;
            max-width: 400px;
            float: left;
            padding: 0 14px;
        }

        #tagsnames ul {
            display: inline-flex;
            list-style-type: none;
        }

        .tagscss {
            border: 1px solid #d0dcff;
            margin: 10px;
            padding: 4px;
            border-radius: 25px;
            background: #d7e2ff;
            cursor: pointer;
        }

        .selectedtag {
            border: 1px solid #4e73df;
            margin: 10px;
            padding: 4px;
            border-radius: 25px;
            background: #4e73df;
            cursor: pointer;
            color: white;
        }

        table {
            font-size: 13px;
        }

        .card.bg-success, .card .card-header-success .card-icon, .card .card-header-warning:not(.card-header-icon):not(.card-header-text), .card .card-header-success:not(.card-header-icon):not(.card-header-text), .card.card-rotate.bg-success .back, .card.card-rotate.bg-success .front {
            background: linear-gradient(60deg,#ffffff,#ffffff);
        }

        .bg-light {
            background: #384862 !important;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            color: white;
            height: 80px;
        }

         #itemsection{
            margin-top:110px;
        }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion d-none" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin.aspx">
                <div class="sidebar-brand-icon rotate-n-15">
                </div>
                <div class="sidebar-brand-text mx-3">ᎷᎽ CᏫᏒႶᏋᏒ <sup>ᎴᏲᏫᎮ</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0" />

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link dashbordmove" href="#dashbordmove" data-toggle="tab">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>
            <hr class="sidebar-divider" />
            <hr class="sidebar-divider my-0" />
            <li class="nav-item">
                <a class="nav-link itemsmove" href="#itemsmove" data-toggle="tab">
                    <i class="fa fa-plus-square" aria-hidden="true"></i>
                    <span>Items</span></a>
            </li>
            <hr class="sidebar-divider" />
            <hr class="sidebar-divider my-0" />
            <li class="nav-item">
                <a class="nav-link reportsmove" href="#reportsmove" data-toggle="tab">
                    <i class="fa fa-flag-checkered" aria-hidden="true"></i>
                    <span>Reports</span></a>
            </li>
            <hr class="sidebar-divider" />


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <nav class="navbar fixed-top navbar-light bg-light text-center">
                    <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px;margin-top: -15px; color: white;">Menu Catalogue
                    </a>
                </nav>

                <section id="itemsection" style="margin-top: 100px;">

                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4" style="display:flex;">
                            <h1 class="h3 mb-0 text-gray-800">Steal Deals</h1>
                          
                            <a href="javascript:void(0);" id="addStealDeals" class=" d-sm-inline-block btn btn-sm  btnstyle shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i>Add Steal Deals</a>
                        </div>

                        <!-- Content Row -->

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Items List </h6>
                            </div>
                            <div class="card-body" id="itemsappend3">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableStealDeal" width="100%" cellspacing="0">
                                  
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4" style="display:flex;">
                            <h1 class="h3 mb-0 text-gray-800">Offers</h1>
                            
                            <a href="javascript:void(0);" id="addOffers" class=" d-sm-inline-block btn btn-sm btnstyle shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i>Add Offers</a>
                        </div>

                        <!-- Content Row -->

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Items List </h6>
                            </div>
                            <div class="card-body" id="itemsappend4">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableOffers" width="100%" cellspacing="0">
                                       
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4" style="display: flex;">
                            <h1 class="h3 mb-0 text-gray-800">Deals</h1>
                            
                            <a href="javascript:void(0);" id="adddeals" class=" d-sm-inline-block btn btn-sm btnstyle shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i>Add Deals</a>
                        </div>

                        <!-- Content Row -->

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Items List </h6>
                            </div>
                            <div class="card-body" id="dealsappend5">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableDeals" width="100%" cellspacing="0">
                                      
                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-2" style="display: flex;">
                            <h1 class="h3 mb-0 text-gray-800">Items</h1>
                            
                            <a href="javascript:void(0);" id="addproductbtn" class=" d-sm-inline-block btn btn-sm btnstyle shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i>Add More Items</a>
                        </div>

                        <!-- Content Row -->

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Items List </h6>
                            </div>
                            <div class="card-body" id="itemsappend">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableItems" width="100%" cellspacing="0">
                                        

                                    </table>
                                </div>
                            </div>
                        </div>


                    </div>
                </section>
                <section id="reportsection" style="display: none;">
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Reports</h1>
                            <%--<br />
                            <br />
                            <a href="javascript:void(0);" id="addproductbtn2" class=" d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i>Add More Items</a>--%>
                        </div>

                        <!-- Content Row -->
                        <div class="row" id="total_revenue">

                             
                        </div>


                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-8 col-lg-7">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-area">
                                            <canvas id="myAreaChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Pie Chart -->
                            <div class="col-xl-4 col-lg-5">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                        <div class="dropdown no-arrow">
                                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                                                <div class="dropdown-header">Dropdown Header:</div>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Something else here</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-pie pt-4 pb-2">
                                            <canvas id="myPieChart"></canvas>
                                        </div>
                                        <div class="mt-4 text-center small" id="mop">
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-primary"></i>Direct
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-success"></i>Social
                                            </span>
                                            <span class="mr-2">
                                                <i class="fas fa-circle text-info"></i>Referral
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Items List </h6>
                            </div>
                            <div class="card-body" id="itemsappend2">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
                <section id="dashbordsection" class="d-none">
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4" style="display: flex;">
                            <h1 class="h3 mb-0 text-gray-800">Admin Dashboard</h1>
                            <%-- <br />
                            <br />
                            <a href="javascript:void(0);" id="addproductbtn1" class=" d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm text-white-50"></i>Add More Items</a>--%>
                        </div>

                        <!-- Content Row -->
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <div class="card card-chart">
                                    <div class="card-header card-header-success">
                                        <div class="ct-chart" id="dailySalesChart">
                                            <div>
                                                <canvas id="mylineChart"></canvas>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title">Fast Moving Items</h4>
                                        <p class="card-category">
                                            <span class="text-success"><i class="fa fa-long-arrow-up"></i>55% </span>increase in today sales.
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">access_time</i> updated 4 minutes ago
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-chart">
                                    <div class="card-header card-header-warning">
                                        <div class="ct-chart" id="websiteViewsChart">
                                            <canvas id="myBarChart"></canvas>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title">High Profile Customers</h4>
                                        <p class="card-category">Last Campaign Performance</p>
                                    </div>
                                    <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">access_time</i> campaign sent 2 days ago
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-chart">
                                    <div class="card-header card-header-danger">
                                        <div class="ct-chart" id="completedTasksChart">
                                            <svg xmlns:ct="http://gionkunz.github.com/chartist-js/ct" width="100%" height="100%" class="ct-chart-line" style="width: 100%; height: 100%;">
                                                <g class="ct-grids">
                                                    <line x1="40" x2="40" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="85" x2="85" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="130" x2="130" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="175" x2="175" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="220" x2="220" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="265" x2="265" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="310" x2="310" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line x1="355" x2="355" y1="0" y2="120" class="ct-grid ct-horizontal"></line>
                                                    <line y1="120" y2="120" x1="40" x2="400" class="ct-grid ct-vertical"></line>
                                                    <line y1="96" y2="96" x1="40" x2="400" class="ct-grid ct-vertical"></line>
                                                    <line y1="72" y2="72" x1="40" x2="400" class="ct-grid ct-vertical"></line>
                                                    <line y1="48" y2="48" x1="40" x2="400" class="ct-grid ct-vertical"></line>
                                                    <line y1="24" y2="24" x1="40" x2="400" class="ct-grid ct-vertical"></line>
                                                    <line y1="0" y2="0" x1="40" x2="400" class="ct-grid ct-vertical"></line>
                                                </g><g><g class="ct-series ct-series-a"><path d="M40,92.4C85,30,85,30,85,30C130,66,130,66,130,66C175,84,175,84,175,84C220,86.4,220,86.4,220,86.4C265,91.2,265,91.2,265,91.2C310,96,310,96,310,96C355,97.2,355,97.2,355,97.2" class="ct-line"></path>
                                                    <line x1="40" y1="92.4" x2="40.01" y2="92.4" class="ct-point" ct:value="230" opacity="1"></line>
                                                    <line x1="85" y1="30" x2="85.01" y2="30" class="ct-point" ct:value="750" opacity="1"></line>
                                                    <line x1="130" y1="66" x2="130.01" y2="66" class="ct-point" ct:value="450" opacity="1"></line>
                                                    <line x1="175" y1="84" x2="175.01" y2="84" class="ct-point" ct:value="300" opacity="1"></line>
                                                    <line x1="220" y1="86.4" x2="220.01" y2="86.4" class="ct-point" ct:value="280" opacity="1"></line>
                                                    <line x1="265" y1="91.2" x2="265.01" y2="91.2" class="ct-point" ct:value="240" opacity="1"></line>
                                                    <line x1="310" y1="96" x2="310.01" y2="96" class="ct-point" ct:value="200" opacity="1"></line>
                                                    <line x1="355" y1="97.2" x2="355.01" y2="97.2" class="ct-point" ct:value="190" opacity="1"></line>
                                                </g>
                                                </g><g class="ct-labels"><foreignObject style="overflow: visible;" x="40" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">12p</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="85" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">3p</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="130" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">6p</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="175" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">9p</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="220" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">12p</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="265" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">3a</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="310" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">6a</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" x="355" y="125" width="45" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 45px; height: 20px;">9a</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" y="96" x="0" height="24" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 24px; width: 30px;">0</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" y="72" x="0" height="24" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 24px; width: 30px;">200</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" y="48" x="0" height="24" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 24px; width: 30px;">400</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" y="24" x="0" height="24" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 24px; width: 30px;">600</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" y="0" x="0" height="24" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 24px; width: 30px;">800</span></foreignObject>
                                                    <foreignObject style="overflow: visible;" y="-30" x="0" height="30" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 30px; width: 30px;">1000</span></foreignObject>
                                                </g></svg>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title">Pending Payments</h4>
                                        <p class="card-category">Last Campaign Performance</p>
                                    </div>
                                    <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">access_time</i> campaign sent 2 days ago
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <br />
                        <br />
                        <br />
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4 ">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body TotalOrders">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Orders</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">780</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4 RunningOrders">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Running Orders</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">21</div>
                                            </div>
                                            <div class="col-auto">
                                                <%-- <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>--%>
                                                <i class="fa fa-shopping-basket fa-2x text-gray-300" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4 DeliveredOrder">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold   text-uppercase mb-1" style="color: #45bed0!important;">Delivered Order</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                            </div>
                                            <div class="col-auto">
                                                <%--  <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>--%>
                                                <i class="fa fa-shopping-cart  fa-2x text-gray-300" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Pending Requests Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4 PendingDelivery">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Delivery</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">8</div>
                                            </div>
                                            <div class="col-auto">
                                                <%--            <i class="fas fa-comments fa-2x text-gray-300"></i>--%>
                                                <i class="fa fa-exclamation-triangle fa-2x text-gray-300" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4 ">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body addwallet">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Add Money Into Wallet</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-wallet fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary textheader">Total orders </h6>
                            </div>
                            <div class="card-body" id="totalorders">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTabletotalorder" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%-- <div class="card shadow mb-4 d-none">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Running orders </h6>
                            </div>
                            <div class="card-body" id="runningorder">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTablerunning" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4 d-none">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Delivered  orders </h6>
                            </div>
                            <div class="card-body" id="Deliveredgorder">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableDelivered" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4 d-none">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Pending  orders </h6>
                            </div>
                            <div class="card-body" id="Pendingorder">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTablePending" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4 d-none">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Delivery status </h6>
                            </div>
                            <div class="card-body" id="Deliverystatus">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableDeliverystatus" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4 d-none">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Return delivery </h6>
                            </div>
                            <div class="card-body" id="DeliveryReturn">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTableReturn" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ITEM NAME</th>
                                                <th>DESCRIPTION</th>
                                                <th>CATEGORY GROUP</th>
                                                <th>CATEGORY</th>
                                                <th>PRICE date</th>
                                                <th>QTY/PORTION</th>
                                                <th>GST INCLUDED</th>
                                                <th>GST PERCENTAGE</th>
                                                <th>EDIT</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>--%>
                        <!-- Content Row -->




                    </div>
                </section>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; MyCornnerShop 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Add item Modal-->
    <div class="modal fade" id="AddItemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>


    <div class="modal fade" id="addcategorymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabels">Add Category</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Category Name
                        </label>
                        <input type="text" id="Categoryname" class="form-control">
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            GST Percentage
                        </label>
                        <input type="number" id="gstp" class="form-control">
                    </div>
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Tax Comment
                        </label>
                        <textarea id="taxcomment" class="form-control"></textarea>
                    </div>

                    <div class="input-group">
                        <input id="uploadFiles" disabled class="f-input" />
                        <div class="fileUpload btns btn--browse">
                            <span>Browse</span>
                            <input id="uploadBtns" type="file" class="upload" />

                        </div>
                        <img id="image-previews" class="artiimg" style="display: none; margin: 10px;" src="" />
                    </div>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" id="submitcategory" href="javascript:void(0);">Submit</a>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="addstealdeal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
    <div class="modal fade" id="addoffersapnd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>
    <div class="modal fade" id="adddeal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    </div>




    <div class="modal fade" id="addwalletpopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelss">Add Money into wallte</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group pmd-textfield pmd-textfield-floating-label">
                        <label for="regular1" class="control-label">
                            Amount
                        </label>
                        <input type="number" id="AmountWallet" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" id="Pay_submit" href="javascript:void(0);">Pay</a>
                </div>
            </div>
        </div>
    </div>


    <script src="assets2/demo/demo.js"></script>
    <%--<script src="assets2/demo/jquery.sharrre.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
    <%--<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.min.js"></script>--%>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>

    <script src="js/global.js"></script>
    <%-- <script src="assets2/js/plugins/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>--%>




    <%--<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.22/datatables.min.js"></script>--%>

    <script src="js/textfield.js"></script>
    <script src="js/admin_main.js"></script>
    <%--<script src="vendor/jquery/jquery.min.js"></script>--%>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
    <%--<script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="js/demo/datatables-demo.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
    <script>
        var ctx = document.getElementById('mylineChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
                datasets: [{
                    label: 'Items',
                    data: [12, 19, 3, 17, 6, 3, 7],
                    backgroundColor: "rgba(54,185,204,1)"
                }]
            }
        });


        var ctx = document.getElementById("myBarChart").getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["M", "T", "W", "T", "F", "S", "S"],
                datasets: [{
                    label: 'apples',
                    data: [12, 19, 3, 17, 28, 24, 7],
                    backgroundColor: "rgba(78,115,223,1)"
                }, {
                    label: 'oranges',
                    data: [30, 29, 5, 5, 20, 3, 10],
                    backgroundColor: "rgba(54,185,204,1)"
                }]
            }
        });

        $("#addStealDeals").click(function () {
            $("#addstealdeal").empty();
            $.ajax({
                type: "POST",
                async: true,
                url: "admin.aspx/fnGetStealDealModal",
                data: '{}',
                beforeSend: function () {

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    $("#addstealdeal").append(data.d);
                    $("#addstealdeal").modal();
                    addstealdealintodb();
                    $('#stealitems').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#stealitems').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "admin.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                value: data.d[key].MID,
                                                qty: data.d[key].Qty,
                                                price: data.d[key].Price,
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            $('#stealitems').val(ui.item.label)
                            $('#stealportion').val(ui.item.qty)
                            $('#stealitems').attr('Content_id', TempValue);
                            $('#regularprice').val(ui.item.price);
                        }
                    });
                }
            })

        })



        function addstealdealintodb() {
            $("#AddStealDealbtn").click(function () {
                var Name = $("#stealitems").attr("Content_id");
                var Portion = $("#stealportion").val();
                var MRP = $("#regularprice").val();
                var offer_price = $("#offerprice").val();
                var start_date = $("#datepicker").val();
                var end_date = $("#enddate").val();
                var MIN_order = $("#minorder").val();
                var SUN = $("#customCheck1:checked").val();
                var MON = $("#customCheck2:checked").val();
                var TUE = $("#customCheck3:checked").val();
                var WED = $("#customCheck4:checked").val();
                var THU = $("#customCheck5:checked").val();
                var FRI = $("#customCheck6:checked").val();
                var SAT = $("#customCheck7:checked").val();
                var Odd = $("#odd:checked").val();
                var Even = $("#even:checked").val();
                var Order_selection = $("#offerselection").val();
                if (Name.length == 0) {
                    alert("Name missing");
                }
                else if (Portion.length == 0) {
                    alert("Portion missing");
                }
                else if (MRP.length == 0) {
                    alert("MRP missing");
                }
                else if (offer_price.length == 0) {
                    alert("offer_price missing");
                }
                else if (start_date.length == 0) {
                    alert("start_date missing");
                }
                else if (end_date.length == 0) {
                    alert("end_date missing");
                }
                else if (MIN_order.length == 0) {
                    alert("MIN_order missing");
                }
                else if (Order_selection.length == 0) {
                    alert("Order_selection missing");
                }
                else {
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "admin.aspx/insertstealdealdata",
                        data: '{Name: "' + Name + '",Portion: "' + Portion + '",MRP: "' + MRP + '",offer_price: "' + offer_price + '",start_date: "' + start_date
                            + '",end_date: "' + end_date + '",MIN_order: "' + MIN_order + '",SUN: "' + SUN + '",MON: "' + MON + '",TUE: "' + TUE
                            + '",WED: "' + WED + '",THU: "' + THU + '",FRI: "' + FRI + '",SAT: "' + SAT + '",Odd: "' + Odd
                            + '",Even: "' + Even + '",Order_selection: "' + Order_selection + '"}',
                        beforeSend: function () {

                        },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            alert(data.d);
                            $("#addstealdeal").modal('hide');
                            getStealDeal();
                        }
                    })
                }




            })

        }

    </script>

</body>

</html>
