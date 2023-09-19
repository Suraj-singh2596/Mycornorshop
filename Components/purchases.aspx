<%@ Page Language="C#" AutoEventWireup="true" CodeFile="purchases.aspx.cs" Inherits="Components_purchases" %>

 
 <!DOCTYPE html>

<html>
<head runat="server">
    <title>Purchase</title>
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


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

   <style>

.text-warning {
    color: #384862!important;
}
.border-left-warning {
    border-left: 0.25rem solid #384862 !important;
}

.optionbox:active{
   background: #86868640;
}

.optionbox div{
    font-size:14px;
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
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px; margin-top: -15px;">Purchase
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>
     
      <div class="container" style="margin-top:100px;">
          <div class="row">
              <div  class="col-xl-3 col-md-6 mb-4  ">
                        <div class="card border-left-warning shadow h-100 py-2 optionbox" onclick="location.href='supplier.aspx'">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            Add Purchase

                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" ></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-plus fa-2x text-gray-300" style="color:gray" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
              <div  class="col-xl-3 col-md-6 mb-4  ">
                        <div class="card border-left-warning shadow h-100 py-2 optionbox">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                           Purchase History

                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" ></div>
                                    </div>
                                    <div class="col-auto">

                                        <i class="fa fa-history fa-2x text-gray-300" style="color:gray" aria-hidden="true"></i>
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
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Admin/js/textfield.js"></script>


    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>


    <script>
       
    </script>
</body>
</html>
