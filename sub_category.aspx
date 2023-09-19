 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="sub_category.aspx.cs" Inherits="sub_category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link href="Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Assest/css/category_main.css" rel="stylesheet" />
    <link href="swiper-master/packages/css/swiper.min.css" rel="stylesheet" />

    <link href="Assest/css/subcategory_main.css" rel="stylesheet" />
   
    <style>
        .dropdown-menu {
            min-width: 5rem !important;
        }

        .dropdown-toggle::after {
            display: none;
        }

        .dropdown-menu.show {
           transform: translate3d(-82px, 14px, 0px)!important;
        }
        .dropdown{
            text-align: right;
    padding-right: 12px;
    position: absolute;
    float: right;
    margin-left: 135px;
        }
        

        /* Two */
.dropdown-item {
  background-repeat: no-repeat!important;
  background-position: -120px -120px, 0 0!important;
  
  background-image: -webkit-linear-gradient(
    top left,
    rgba(255, 255, 255, 0.2) 0%,
    rgba(255, 255, 255, 0.2) 37%,
    rgba(255, 255, 255, 0.8) 45%,
    rgba(255, 255, 255, 0.0) 50%
  )!important;
  background-image: -moz-linear-gradient(
    0 0,
    rgba(255, 255, 255, 0.2) 0%,
    rgba(255, 255, 255, 0.2) 37%,
    rgba(255, 255, 255, 0.8) 45%,
    rgba(255, 255, 255, 0.0) 50%
  )!important;
  background-image: -o-linear-gradient(
    0 0,
    rgba(255, 255, 255, 0.2) 0%,
    rgba(255, 255, 255, 0.2) 37%,
    rgba(255, 255, 255, 0.8) 45%,
    rgba(255, 255, 255, 0.0) 50%
  )!important;
  background-image: linear-gradient(
    0 0,
    rgba(255, 255, 255, 0.2) 0%,
    rgba(255, 255, 255, 0.2) 37%,
    rgba(255, 255, 255, 0.8) 45%,
    rgba(255, 255, 255, 0.0) 50%
  )!important;
  
  -moz-background-size: 250% 250%, 100% 100%!important;
       background-size: 250% 250%, 100% 100%!important;
  
  -webkit-transition: background-position 0s ease!important;
     -moz-transition: background-position 0s ease!important;      
       -o-transition: background-position 0s ease!important;
          transition: background-position 0s ease!important;
}

.dropdown-item:hover {
  background-position: 0 0, 0 0!important;
  
  -webkit-transition-duration: 0.5s!important;
     -moz-transition-duration: 0.5s!important;
          transition-duration: 0.5s!important;
}

    </style>
</head>
<body id="pageone">
    <form id="form1" runat="server">
        <div>

            <!--1. Navbar section-->
            <nav class="navbar fixed-top navbar-light bg-light text-center">
                <a class="navbar-brand" href="#"><span>
                    <svg style="position: absolute;" height="10pt" viewBox="0 0 512 512" width="8pt" xmlns="http://www.w3.org/2000/svg">
                        <path d="m135 512h-120c-8.285156 0-15-6.714844-15-15v-361.996094c0-74.441406 60.5625-135.003906 135.003906-135.003906h361.996094c8.285156 0 15 6.714844 15 15v120c0 8.285156-6.714844 15-15 15h-347v347c0 8.285156-6.714844 15-15 15zm0 0" fill="gold" />
                        <path d="m497 0h-346.96875v150h346.96875c8.285156 0 15-6.714844 15-15v-120c0-8.285156-6.714844-15-15-15zm0 0" fill="gold" />
                    </svg></span><span style="margin-left: 7px;">ᎷᎽ CᏫᏒႶᏋᏒ<sup>ᎴᏲᏫᎮ</sup></span></a>
                <span class="userpic"> <i class="fa fa-user-circle-o "></i></span>
            </nav>

            <!--3. Category -->
            <section id="categorysection" runat="server" style="margin-top: 40px;">
                <div class="container">
                    <div class="row">
                        <div class="col-6 col-md-4 col-sm-4 p-2">
                            <div class="card   m-1 mt-2">
                                <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/carts.png" />
                                </div>
                                <div class="card-content">General Store 1</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4 col-sm-4 p-2">
                            <div class="card   m-1 mt-2">
                               <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/carts.png" />
                                </div>
                                <div class="card-content">General Store 2</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4 col-sm-4 p-2">
                            <div class="card   m-1 mt-2">
                                 <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/carts.png" />
                                </div>
                                <div class="card-content">General Store 3</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4 col-sm-4 p-2">
                            <div class="card   m-1 mt-2">
                                 <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/carts.png" />
                                </div>
                                <div class="card-content">General Store 4</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4   col-sm-4 p-2">
                            <div class="card m-1 mt-2">
                                 <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/pharmacy.png" />
                                </div>
                                <div class="card-content">Pharmacist 1</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4   col-sm-4 p-2">
                            <div class="card m-1 mt-2">
                                 <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/washing-machine.png" />
                                </div>
                                <div class="card-content">Dry Cleaner 1</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4   col-sm-4 p-2">
                            <div class="card m-1 mt-2">
                                 <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/washing-clothes.png" />
                                </div>
                                <div class="card-content">Dhoobi 1</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-4    col-sm-4 p-2 ">
                            <div class="card m-1 mt-2">
                                 <div class="dropdown show" style="text-align: right;">
                                    <a class="dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i style="font-size: 25px; color: lightgray;"
                                        class="fa fa-ellipsis-h" aria-hidden="true"></i>
                                    </a>

                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <a class="dropdown-item" href="#">Visit</a>
                                        <a class="dropdown-item" href="#">Remove</a>
                                    </div>
                                </div>
                                <div class="card-img">
                                    <img src="Assest/images/car-wash.png" />
                                </div>
                                <div class="card-content">Car Cleaner 1</div>
                            </div>
                        </div>

                    </div>
                </div>

            </section>
        </div>
    </form>
    <div style="height: 50px;"></div>
    <footer>
        <div class="footer"></div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>


</script>
</body>
</html>
