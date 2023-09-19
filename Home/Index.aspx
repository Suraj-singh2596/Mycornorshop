<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Home_Index" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>My Cornner Shop | Home</title>
    <meta content="" name="descriptison">
    <meta content="" name="keywords">
     
    <link rel="shortcut icon" type="image/png" sizes="192x192" href="../Home/assets/img/ic_launcher.png">
    <!-- Favicons -->
    <link href="../Home/assets/img/fac_icon.png" rel="icon">    
    <link href="../Home/assets/img/fac_icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <link href="../Admin/css/textfield.css" rel="stylesheet" />
    <!-- Vendor CSS Files -->
    <link href="../Home/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../Home/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="../Home/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../Home/assets/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="../Home/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../Home/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../Home/assets/vendor/aos/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>



    <!-- Template Main CSS File -->
    <link href="../Home/assets/css/style.css" rel="stylesheet">


    <style>

         .pricing ul {
            padding: 0;
            list-style: none;
            color: #444444;
            text-align: left;
            line-height: 20px;
            font-size: 14px;
        }
        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #F5F5F5;
            border-radius: 10px;
        }

        ::-webkit-scrollbar {
            width: 10px;
            background-color: #F5F5F5;
        }

        ::-webkit-scrollbar-thumb {
            border-radius: 10px;
            background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.44, rgb(122,153,217)), color-stop(0.72, rgb(73,125,189)), color-stop(0.86, rgb(28,58,148)));
        }

        .form-control:focus {
            border: 2px solid #4e7ae0 !important;
            box-shadow: none;
            background: transparent;
        }

        .pmd-textfield-focused {
            display: none;
        }

        .form-group.pmd-textfield {
            margin-bottom: .5rem !important;
            line-height: 1rem !important;
        }

        .control-label {
            margin-left: 20px !important;
        }

        .pmd-textfield-floating-label label {
            line-height: 0rem !important;
            margin-bottom: 0rem !important;
        }

        .form-control {
            border: 1px solid lightgrey !important;
            border-radius: 5px !important;
            padding: 10px !important;
        }

        .pmd-textfield input.form-control {
            height: 40px !important;
        }

        .pmd-textfield-floating-label.pmd-textfield-floating-label-completed label {
            -ms-transform: translateY(0px) !important;
            -webkit-transform: translateY(0px) !important;
            transform: translateY(7px) !important;
            font-size: 0.875rem !important;
            color: #4e7ae0 !important;
            background: white !important;
        }

        .logbtn {
            background: #0c1c80;
            color: white;
            width: 100%;
            border-radius: 25px;
        }


            .logbtn:after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 0;
                height: 100%;
                background-color: rgba(255,255,255,0.4);
                -webkit-transition: none;
                -moz-transition: none;
                transition: none;
            }

            .logbtn:hover:after {
                width: 120%;
                background-color: rgba(255,255,255,0);
                -webkit-transition: all 0.4s ease-in-out;
                -moz-transition: all 0.4s ease-in-out;
                transition: all 0.4s ease-in-out;
                color: white !important;
            }

        .btn:hover {
            color: #ffffff;
            text-decoration: none;
            box-shadow: 0 8px 6px -6px black;
        }

        @media(max-width:767px) {
            #loginbtn {
                display: none;
            }
        }
    </style>
</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center header-transparent">
        <div class="container d-flex align-items-center">

            <div class="logo mr-auto">
                <img src="../Home/assets/img/My%20corner%20Shop%20logo%20white.png" />
                <%--<h1 class="text-light"><a href="index.html"><span>
                    <svg style="margin-top: -33px" height="10pt" viewBox="0 0 512 512" width="8pt" xmlns="http://www.w3.org/2000/svg">
                        <path d="m135 512h-120c-8.285156 0-15-6.714844-15-15v-361.996094c0-74.441406 60.5625-135.003906 135.003906-135.003906h361.996094c8.285156 0 15 6.714844 15 15v120c0 8.285156-6.714844 15-15 15h-347v347c0 8.285156-6.714844 15-15 15zm0 0" fill="gold" />
                        <path d="m497 0h-346.96875v150h346.96875c8.285156 0 15-6.714844 15-15v-120c0-8.285156-6.714844-15-15-15zm0 0" fill="gold" />
                    </svg>ᎷᎽ CᏫᏒႶᏋᏒ<sup>ᎴᏲᏫᎮ</sup></span></a></h1>--%>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            </div>

            <nav class="nav-menu d-none d-lg-block">
                <ul>
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#features">Features</a></li>
                   <%-- <li><a href="#gallery">Gallery</a></li>--%>
                  <%--  <li><a href="#team">Team</a></li>--%>
                    <li><a href="#pricing">Pricing</a></li>
                    <%-- <li class="drop-down">
                        <a href="">Drop Down</a>
                        <ul>
                            <li><a href="#">Drop Down 1</a></li>
                            <li class="drop-down">
                                <a href="#">Drop Down 2</a>
                                <ul>
                                    <li><a href="#">Deep Drop Down 1</a></li>
                                    <li><a href="#">Deep Drop Down 2</a></li>
                                    <li><a href="#">Deep Drop Down 3</a></li>
                                    <li><a href="#">Deep Drop Down 4</a></li>
                                    <li><a href="#">Deep Drop Down 5</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Drop Down 3</a></li>
                            <li><a href="#">Drop Down 4</a></li>
                            <li><a href="#">Drop Down 5</a></li>
                        </ul>
                    </li>--%>
                    <li><a href="#contact">Contact</a></li>
                    <li><a id="loginbtn" href="javascript:void(0);">Login</a></li>

                </ul>
            </nav>
            <!-- .nav-menu -->

        </div>
    </header>
    <!-- End Header -->
    <!-- ======= Hero Section ======= -->
    <section id="hero">

        <div class="container">
            <!--<div class="row">
              <div class="col-lg-7 pt-5 pt-lg-0 order-2 order-lg-1 d-flex align-items-center">
                <div data-aos="zoom-out">
                  <h1>Your local shops are now Online <span>ᎷᎽ CᏫᏒႶᏋᏒ ᎴᏲᏫᎮ</span></h1>
                  <h2>We are team of talanted designers making websites with Bootstrap</h2>
                  <div class="text-center text-lg-left">
                    <a href="#about" class="btn-get-started scrollto">Get Started</a>
                  </div>
                </div>
              </div>
              <div class="col-lg-5 order-1 order-lg-2 hero-img text-center" data-aos="zoom-out" data-aos-delay="300">
                  <h4 style="color: white;background: #5064ccf5;">Your local shops are now Online</h4>
                  <img style="width:70%;" src="assets/img/Picture1.png" class="img-fluid animated" alt=""/>
                 <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
              </div>
            </div>-->
            <div class="row">
                <div class="col-lg-7 pt-5 pt-lg-0 order-2 order-lg-1 d-flex align-items-center">
                    <div data-aos="zoom-out">
                        <h1>Your neighbourhood shops are now live on
                            <br />
                            <span>My Corner Shop<sup></sup> </span></h1>
                        <h2>We are on a mission to enable your nearby shops to go digital and provide the same experience as that of the large e-commerce platforms along wtih the trust and convenience that you always had with your local shops</h2>
                        <div class="text-center text-lg-left">
                            <a href="javascript:void(0);" id="loginbtn2" class="btn-get-started scrollto">Login now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 order-1 order-lg-2 hero-img text-center" data-aos="zoom-out" data-aos-delay="300">
                    <!--<img src="assets/img/animations-e-commerce-removebg-preview.png" class="img-fluid animated" alt=""/>-->
                    <!--<img src="assets/img/hero-img.png" class="img-fluid animated" alt="">-->
                    <!--<img src="assets/img/Picture15.png" class="img-fluid animated" alt=""/>-->
                    <img src="../Home/assets/img/leftpic1.png" class="img-fluid animated" alt="" />

                </div>
            </div>
        </div>

        <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
            <defs>
                <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z">
            </defs>
            <g class="wave1">
                <use xlink:href="#wave-path" x="50" y="3" fill="rgba(255,255,255, .1)">
            </g>
            <g class="wave2">
                <use xlink:href="#wave-path" x="50" y="0" fill="rgba(255,255,255, .2)">
            </g>
            <g class="wave3">
                <use xlink:href="#wave-path" x="50" y="9" fill="#fff">
            </g>
        </svg>

    </section>
    <!-- End Hero -->

    <main id="main">

        <!-- ======= About Section ======= -->
        <section id="about" class="about">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch" data-aos="fade-right">
                        <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="venobox play-btn mb-4" data-vbtype="video" data-autoplay="true"></a>
                    </div>

                    <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5" data-aos="fade-left">
                        <h3><span class="underline">About Us</span></h3>
                        <p>MyCornerShop enables you to connect with your favourite neighbourhood store digitally. We are on a mission to digitize shops in your neighbourhood so that they provide you the same experience as that of large e-commerce platforms</p>

                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="100">
                            <div class="icon"><i class="bx bx-cart"></i></div>
                            <h4 class="title"><a href="">Shop</a></h4>
                            <p class="description">We know you love shopping from your trusted local shop, but you also are now used to the digital experience. MyCornerShop provides you just this.</p>
                        </div>

                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="200">
                            <div class="icon"><i class="bx bx-mobile"></i></div>
                            <h4 class="title"><a href="">App</a></h4>
                            <p class="description">With MyCornerShop, you can connect with your local shops digitally through our mobile app. You can simply log on to the app, select the area where you want the service or goods to be delivered and lo and behold, you'll find your favourite stores online.</p>
                        </div>

                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="300">
                            <div class="icon"><i class="bx bx-gift"></i></div>
                            <h4 class="title"><a href="">Daily Needs</a></h4>
                            <p class="description">You can order groceries and daily needs from your favourite stores, reach out to pharmacies for medicines, book appointments at Salons for your styling needs and get laundry services at your door-step</p>
                        </div>

                    </div>
                </div>

            </div>
        </section>
        <!-- End About Section -->
        <!-- ======= Features Section ======= -->
        <section id="features" class="features">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
                    <h2><span class="underline">Features</span></h2>
                    <p>Check The Features</p>
                </div>

                <div class="row" data-aos="fade-left">
                    <div class="col-lg-3 col-md-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="50">
                            <i class="ri-store-line" style="color: #ffbb2c;"></i>
                            <h3><a href="">Local Shopping experience is now digital</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="100">
                            <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                            <h3><a href="">Your Trusted Shop is now online</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="150">
                            <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                            <h3><a href="">Simple Registration process</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="200">
                            <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                            <h3><a href="">Select your favourite local Shop</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="250">
                            <i class="ri-database-2-line" style="color: #47aeff;"></i>
                            <h3><a href="">Scan products and offers</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="300">
                            <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                            <h3><a href="">Pay Online or COD</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="350">
                            <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
                            <h3><a href="">Avail Offers</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="400">
                            <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
                            <h3><a href="">Subscribe to products that you need at regular frequency</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="450">
                            <i class="ri-anchor-line" style="color: #b2904f;"></i>
                            <h3><a href="">Set Delivery Slots</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="500">
                            <i class="ri-disc-line" style="color: #b20969;"></i>
                            <h3><a href="">Safe and Hygienic Delivery</a></h3>
                        </div>
                    </div>
                    <%--     <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="550">
                            <i class="ri-base-station-line" style="color: #ff5828;"></i>
                            <h3><a href="">Verdo Park</a></h3>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 mt-4">
                        <div class="icon-box" data-aos="zoom-in" data-aos-delay="600">
                            <i class="ri-fingerprint-line" style="color: #29cc61;"></i>
                            <h3><a href="">Flavor Nivelanda</a></h3>
                        </div>
                    </div>--%>
                </div>

            </div>
        </section>
        <!-- End Features Section -->
        <!-- ======= Counts Section ======= -->
        <section id="counts" class="counts">
            <div class="container">

                <div class="row" data-aos="fade-up">

                    <div class="col-lg-3 col-md-6">
                        <div class="count-box">
                            <i class="icofont-simple-smile"></i>
                            <span data-toggle="counter-up">232</span>
                            <p>Happy Clients</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                        <div class="count-box">
                            <i class="icofont-document-folder"></i>
                            <span data-toggle="counter-up">521</span>
                            <p>Projects</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                        <div class="count-box">
                            <i class="icofont-live-support"></i>
                            <span data-toggle="counter-up">1,463</span>
                            <p>Hours Of Support</p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                        <div class="count-box">
                            <i class="icofont-users-alt-5"></i>
                            <span data-toggle="counter-up">15</span>
                            <p>Hard Workers</p>
                        </div>
                    </div>

                </div>

            </div>
        </section>
        <!-- End Counts Section -->
        <!-- ======= Details Section ======= -->
        <section id="details" class="details">
            <div class="container">

                <div class="row content">
                    <div class="col-md-5" data-aos="fade-right">
                        <img src="../Home/assets/img/Generalstorepic.png" class="img-fluid" alt="General Store" />
                        <!--<img src="assets/img/details-1.png" class="img-fluid" alt="">-->
                    </div>
                    <div class="col-md-7 pt-4" data-aos="fade-up">
                        <h3><span class="underline">General Store</span></h3>
                        <p class="font-italic">
                            We have tied up with your local stores to provide you the same trust and quality at the comfort of your home
                        </p>
                        <ul>
                            <li><i class="icofont-check"></i>Select your store</li>
                            <li><i class="icofont-check"></i>Scan Products and Offers</li>
                            <li><i class="icofont-check"></i>Order Online</li>
                            <li><i class="icofont-check"></i>Pay online or COD</li>
                            <li><i class="icofont-check"></i>Avail Offers</li>
                            <li><i class="icofont-check"></i>Subscribe to products that you need at regular frequency</li>
                            <li><i class="icofont-check"></i>Set Delivery Slots</li>
                            <li><i class="icofont-check"></i>Safe and Hygienic Delivery</li>
                        </ul>
                        <%--   <p>
                            Voluptas nisi in quia excepturi nihil voluptas nam et ut. Expedita omnis eum consequatur non. Sed in asperiores aut repellendus. Error quisquam ab maiores. Quibusdam sit in officia
                        </p>--%>
                    </div>
                </div>

                <%--<div class="row content">
                    <div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
                        
                        <img src="../Home/assets/img/pharmacists.png" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
                        <h3><span class="underline">Pharmacy</span></h3>
                        <p class="font-italic">
                            Your neighbourhood pharmacy stores are now on MyCornerShop
                        </p>

                        <ul>
                            <li><i class="icofont-check"></i>Select Pharmacy</li>

                            <li><i class="icofont-check"></i>Order Online</li>
                            <li><i class="icofont-check"></i>Pay online or COD</li>
                            <li><i class="icofont-check"></i>Avail Offers</li>
                            <li><i class="icofont-check"></i>Subscribe to products that you need at regular frequency</li>
                            <li><i class="icofont-check"></i>Set Delivery Slots</li>
                            <li><i class="icofont-check"></i>Safe and Hygienic Delivery</li>
                        </ul>
                         
                    </div>
                </div>--%>

                <div class="row content">
                    <div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
                       
                        <img src="../Home/assets/img/Retailerban.png" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
                        <h3><span class="underline">Retailer</span></h3>
                        <p class="font-italic">
                            We help you set up your shop online so that your customers can now book their orders and services via MyCornerShop mobile app.

                        </p>
                        <p class="font-italic">
                           MyCornerShop provides you the opportunity to serve your customers better by being available 24X7 to recieve their orders


                        </p>
                        <p class="font-italic">
                            We are here to faciliate you in doing your business "Your Way".


                        </p>

                        <ul>

<li><i class="icofont-check"></i>Take your shop online</li>
<li><i class="icofont-check"></i>Attract New Customers</li>
<li><i class="icofont-check"></i>Enhance Revenue</li>
<li><i class="icofont-check"></i>Delight Customers through Service and Digital Experience</li>
<li><i class="icofont-check"></i>Shop's digital presence</li>
<li><i class="icofont-check"></i>Simple Set up and Registration proess</li>
<li><i class="icofont-check"></i>Add, delete, edit Products / Services, prices, offers at your own convenience</li>
<li><i class="icofont-check"></i>Advertise to customers</li>
<li><i class="icofont-check"></i>Run Offers & Campaigns</li>
<li><i class="icofont-check"></i>Customers can set up subscriptions for their daily needs</li>
<li><i class="icofont-check"></i>Recieve orders online and fulfill as per your current model</li>
<li><i class="icofont-check"></i>Delivery agent app to monitor deliveries</li>
<li><i class="icofont-check"></i>Analytics for better deicsion making</li>
<li><i class="icofont-check"></i>Recieve Payment Online or COD</li>

                            
                        </ul>
                         
                    </div>
                </div>

                <div class="row content d-none">
                    <div class="col-md-4" data-aos="fade-right">
                        <!--<img src="assets/img/details-3.png" class="img-fluid" alt="">-->
                        <img src="../Home/assets/img/drycleaning.png" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-8 pt-5" data-aos="fade-up">
                        <h3><span class="underline">Laundry & Dry Cleaning Services</span></h3>
                        <%-- <p>Your local dhobi, presswala and dry cleaning service providers are now on MyCornerShop</p>
                        --%>
                        <ul>
                            <li><i class="icofont-check"></i>Select the Service Provider</li>
                            <li><i class="icofont-check"></i>Review Catalogue</li>
                            <li><i class="icofont-check"></i>Order Pick-up & Drop</li>
                            <li><i class="icofont-check"></i>Chose Slots</li>
                            <li><i class="icofont-check"></i>Pay online or COD</li>
                            <li><i class="icofont-check"></i>Avail Memberships</li>
                            <li><i class="icofont-check"></i>Safe and Hygienic Delivery</li>
                        </ul>
                        <%-- <p>
                            Qui consequatur temporibus. Enim et corporis sit sunt harum praesentium suscipit ut voluptatem. Et nihil magni debitis consequatur est.
                        </p>
                        <p>
                            Suscipit enim et. Ut optio esse quidem quam reiciendis esse odit excepturi. Vel dolores rerum soluta explicabo vel fugiat eum non.
                        </p>--%>
                    </div>
                </div>

                <div class="row content d-none">
                    <div class="col-md-4 order-1 order-md-2" data-aos="fade-left">
                        <!--<img src="assets/img/details-4.png" class="img-fluid" alt="">-->
                        <%-- <img src="assets/img/laundryservices.jpg" class="img-fluid" alt="" />--%>
                        <img src="../Home/assets/img/saloonandparlor.png" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-8 pt-5 order-2 order-md-1" data-aos="fade-up">
                        <h3><span class="underline">Salon and Parlour</span></h3>
                        <p class="font-italic">
                            MyCornerShop brings to you your favourite Salons and Parlours
                        </p>
                        <ul>
                            <li><i class="icofont-check"></i>Select your favourite Salon</li>
                            <li><i class="icofont-check"></i>Select Products and Services</li>
                            <li><i class="icofont-check"></i>Book Appointment or request service at home</li>
                            <li><i class="icofont-check"></i>Book Time Slot</li>
                            <li><i class="icofont-check"></i>Pay online or COD</li>
                            <li><i class="icofont-check"></i>Avail Memberships</li>
                            <li><i class="icofont-check"></i>Safe and Hygienic Delivery</li>
                        </ul>
                    </div>
                </div>

                <%--<div class="row content">
                    <div class="col-md-4" data-aos="fade-right">
                        <!--<img src="assets/img/details-3.png" class="img-fluid" alt="">-->
                        <img src="assets/img/saloonandparlor.png" class="img-fluid" alt="" />
                    </div>
                    <div class="col-md-8 pt-5" data-aos="fade-up">
                        <h3>Saloon and Parlour</h3>
                        <p>MyCornerShop brings to you your favourite Salons and Parlours</p>
                        <ul>
                            <li><i class="icofont-check"></i>Select your favourite Salon</li>
                            <li><i class="icofont-check"></i>Select Products and Services</li>
                            <li><i class="icofont-check"></i>Book Appointment or request service at home</li>
                            <li><i class="icofont-check"></i>Book Time Slot</li>
                            <li><i class="icofont-check"></i>Pay online or COD</li>
                            <li><i class="icofont-check"></i>Avail Memberships</li>
                            <li><i class="icofont-check"></i>Safe and Hygienic Delivery</li>
                        </ul>
                     <%--   <p>
                            Qui consequatur temporibus. Enim et corporis sit sunt harum praesentium suscipit ut voluptatem. Et nihil magni debitis consequatur est.
                        </p>
                        <p>
                            Suscipit enim et. Ut optio esse quidem quam reiciendis esse odit excepturi. Vel dolores rerum soluta explicabo vel fugiat eum non.
                        </p>--%>
            </div>

        </section>
        <!-- End Details Section -->
        <!-- ======= Gallery Section ======= -->
        <!--<section id="gallery" class="gallery">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
                    <h2>Gallery</h2>
                    <p>Check our Gallery</p>
                </div>

                <div class="row no-gutters" data-aos="fade-left">

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="100">
                            <a href="assets/img/gallery/gallery-1.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="150">
                            <a href="assets/img/gallery/gallery-2.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="200">
                            <a href="assets/img/gallery/gallery-3.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="250">
                            <a href="assets/img/gallery/gallery-4.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="300">
                            <a href="assets/img/gallery/gallery-5.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="350">
                            <a href="assets/img/gallery/gallery-6.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="400">
                            <a href="assets/img/gallery/gallery-7.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <div class="gallery-item" data-aos="zoom-in" data-aos-delay="450">
                            <a href="assets/img/gallery/gallery-8.jpg" class="venobox" data-gall="gallery-item">
                                <img src="assets/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
                            </a>
                        </div>
                    </div>

                </div>

            </div>
        </section>-->
        <!-- End Gallery Section -->
        <!-- ======= Testimonials Section ======= -->
        <section id="testimonials" class="testimonials d-none">
            <div class="container">

                <div class="owl-carousel testimonials-carousel" data-aos="zoom-in">

                    <div class="testimonial-item">
                        <img src="../Home/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                        <h3>Saul Goodman</h3>
                        <h4>Ceo &amp; Founder</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                            <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="../Home/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                        <h3>Sara Wilsson</h3>
                        <h4>Designer</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                            <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="../Home/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                        <h3>Jena Karlis</h3>
                        <h4>Store Owner</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                            <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="../Home/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                        <h3>Matt Brandon</h3>
                        <h4>Freelancer</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                            <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                    <div class="testimonial-item">
                        <img src="../Home/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                        <h3>John Larson</h3>
                        <h4>Entrepreneur</h4>
                        <p>
                            <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                            Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
                            <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                        </p>
                    </div>

                </div>

            </div>
        </section>
        <!-- End Testimonials Section -->
        <!-- ======= Team Section ======= -->
        <%--<section id="team" class="team">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
                    <h2>Team</h2>
                    <p>Our Great Team</p>
                </div>

                <div class="row" data-aos="fade-left">

                    <div class="col-lg-3 col-md-6">
                        <div class="member" data-aos="zoom-in" data-aos-delay="100">
                            <div class="pic">
                                <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Walter White</h4>
                                <span>Chief Executive Officer</span>
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
                        <div class="member" data-aos="zoom-in" data-aos-delay="200">
                            <div class="pic">
                                <img src="assets/img/team/team-2.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Sarah Jhonson</h4>
                                <span>Product Manager</span>
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                        <div class="member" data-aos="zoom-in" data-aos-delay="300">
                            <div class="pic">
                                <img src="assets/img/team/team-3.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>William Anderson</h4>
                                <span>CTO</span>
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                        <div class="member" data-aos="zoom-in" data-aos-delay="400">
                            <div class="pic">
                                <img src="assets/img/team/team-4.jpg" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h4>Amanda Jepson</h4>
                                <span>Accountant</span>
                                <div class="social">
                                    <a href=""><i class="icofont-twitter"></i></a>
                                    <a href=""><i class="icofont-facebook"></i></a>
                                    <a href=""><i class="icofont-instagram"></i></a>
                                    <a href=""><i class="icofont-linkedin"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>--%>
        <!-- End Team Section -->
         <!-- ======= Pricing Section ======= -->
        <section id="pricing" class="pricing">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
                    <h2>Pricing</h2>
                    <p>Check our Pricing</p>
                </div>

                <div class="row" data-aos="fade-left">

                    <div class="col-lg-4 col-md-6">
                        <div class="box" data-aos="zoom-in" data-aos-delay="100">
                            <h3>BASIC</h3>
                            <h4><sup>₹</sup>2000<span> / month
                                <p>applicable for anual subscription</p>
                            </span></h4>
                            <ul>
                                <li>Retailer Onboarding</li>

                                <li>Product Listing & Catalogue</li>

                                <li>Accounting & Reports</li>

                                <li>Online Orders</li>

                                <li>Geo Tagging</li>

                                <li>Transactional SMS</li>

                                <li>Pay on Delivery / Pay via Wallet</li>

                                <li>Customer Panel</li>

                                <li>Customer Wallet & Khata-book</li>

                                <li>Mobile App – Customer</li>


                                <li class="na" style="color:#ed7d31">Deals & Offers</li>
                                <li class="na" style="color:#ed7d31">Admin Dashboard</li>
                                <li class="na" style="color:#ed7d31">Order Scheduling</li>
                                <li class="na" style="color:#ed7d31">Delivery Slots</li>
                                <li class="na" style="color:#ed7d31">Offer & Deal Messages</li>
                                <li class="na" style="color:#ed7d31">Online Payment Service</li>
                                <li class="na" style="color:#ed7d31">Mobile App – Business</li>
                                <li class="na" style="color:#ed7d31">QR Based Ordering</li>
                                <li class="na" style="color:#ed7d31">Customer Feedback</li>



                                <li class="na" style="color:#4472c4">GST Billing</li>
                                <li class="na" style="color:#4472c4">Order Subscription – Daily, Weekly, Monthly</li>
                                <li class="na" style="color:#4472c4">Promotional Messages</li>
                                <li class="na" style="color:#4472c4">Mobile App - Delivery Boy</li>
                                <li class="na" style="color:#4472c4">Offerings from My Corner Shop </li>
                                <%--<li class="na">Pharetra massa</li>
                                <li class="na">Massa ultricies mi</li>--%>
                            </ul>
                            <div class="btn-wrap">
                                <a href="#" class="btn-buy">Buy Now</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
                        <div class="box featured" data-aos="zoom-in" data-aos-delay="200">
                            <h3>Intermediate</h3>
                            <h4><sup>₹</sup>3000<span> / month
                                <p>applicable for anual subscription</p>
                            </span></h4>
                            <ul>

<li>Retailer Onboarding</li>

                                <li>Product Listing & Catalogue</li>

                                <li>Accounting & Reports</li>

                                <li>Online Orders</li>

                                <li>Geo Tagging</li>

                                <li>Transactional SMS</li>

                                <li>Pay on Delivery / Pay via Wallet</li>

                                <li>Customer Panel</li>

                                <li>Customer Wallet & Khata-book</li>

                                <li>Mobile App – Customer</li>


                                <li  style="color:#ed7d31">Deals & Offers</li>
                                <li style="color:#ed7d31">Admin Dashboard</li>
                                <li style="color:#ed7d31">Order Scheduling</li>
                                <li style="color:#ed7d31">Delivery Slots</li>
                                <li style="color:#ed7d31">Offer & Deal Messages</li>
                                <li style="color:#ed7d31">Online Payment Service</li>
                                <li style="color:#ed7d31">Mobile App – Business</li>
                                <li style="color:#ed7d31">QR Based Ordering</li>
                                <li style="color:#ed7d31">Customer Feedback</li>



                                <li class="na" style="color:#4472c4">GST Billing</li>
                                <li class="na" style="color:#4472c4">Order Subscription – Daily, Weekly, Monthly</li>
                                <li class="na" style="color:#4472c4">Promotional Messages</li>
                                <li class="na" style="color:#4472c4">Mobile App - Delivery Boy</li>
                                <li class="na" style="color:#4472c4">Offerings from My Corner Shop </li>


                            </ul>
                            <div class="btn-wrap">
                                <a href="#" class="btn-buy">Buy Now</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
                        <div class="box" data-aos="zoom-in" data-aos-delay="300">
                            <h3>Premium</h3>
                            <h4><sup>₹</sup>4000<span> / month
                                <p>applicable for anual subscription</p>
                            </span></h4>
                            <ul>

                               <li>Retailer Onboarding</li>

                                <li>Product Listing & Catalogue</li>

                                <li>Accounting & Reports</li>

                                <li>Online Orders</li>

                                <li>Geo Tagging</li>

                                <li>Transactional SMS</li>

                                <li>Pay on Delivery / Pay via Wallet</li>

                                <li>Customer Panel</li>

                                <li>Customer Wallet & Khata-book</li>

                                <li>Mobile App – Customer</li>


                                <li  style="color:#ed7d31">Deals & Offers</li>
                                <li style="color:#ed7d31">Admin Dashboard</li>
                                <li style="color:#ed7d31">Order Scheduling</li>
                                <li style="color:#ed7d31">Delivery Slots</li>
                                <li style="color:#ed7d31">Offer & Deal Messages</li>
                                <li style="color:#ed7d31">Online Payment Service</li>
                                <li style="color:#ed7d31">Mobile App – Business</li>
                                <li style="color:#ed7d31">QR Based Ordering</li>
                                <li style="color:#ed7d31">Customer Feedback</li>



                                <li style="color:#4472c4">GST Billing</li>
                                <li style="color:#4472c4">Order Subscription – Daily, Weekly, Monthly</li>
                                <li style="color:#4472c4">Promotional Messages</li>
                                <li style="color:#4472c4">Mobile App - Delivery Boy</li>
                                <li style="color:#4472c4">Offerings from My Corner Shop </li>

                            </ul>
                            <div class="btn-wrap">
                                <a href="#" class="btn-buy">Buy Now</a>
                            </div>
                        </div>
                    </div>

                    <%--<div class="col-lg-3 col-md-6 mt-4 mt-lg-0">
                        <div class="box" data-aos="zoom-in" data-aos-delay="400">
                            <span class="advanced">Advanced</span>
                            <h3>Ultimate</h3>
                            <h4><sup>$</sup>49<span> / month</span></h4>
                            <ul>
                                <li>Aida dere</li>
                                <li>Nec feugiat nisl</li>
                                <li>Nulla at volutpat dola</li>
                                <li>Pharetra massa</li>
                                <li>Massa ultricies mi</li>
                            </ul>
                            <div class="btn-wrap">
                                <a href="#" class="btn-buy">Buy Now</a>
                            </div>
                        </div>
                    </div>--%>
                </div>

            </div>
        </section>
        <!-- End Pricing Section -->
        <!-- ======= F.A.Q Section ======= -->
        <section id="faq" class="faq section-bg" style="display: none;">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
                    <h2>F.A.Q</h2>
                    <p>Frequently Asked Questions</p>
                </div>

                <div class="faq-list">
                    <ul>
                        <li data-aos="fade-up">
                            <i class="bx bx-help-circle icon-help"></i><a data-toggle="collapse" class="collapse" href="#faq-list-1">Non consectetur a erat nam at lectus urna duis? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                            <div id="faq-list-1" class="collapse show" data-parent=".faq-list">
                                <p>
                                    Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                                </p>
                            </div>
                        </li>

                        <li data-aos="fade-up" data-aos-delay="100">
                            <i class="bx bx-help-circle icon-help"></i><a data-toggle="collapse" href="#faq-list-2" class="collapsed">Feugiat scelerisque varius morbi enim nunc? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                            <div id="faq-list-2" class="collapse" data-parent=".faq-list">
                                <p>
                                    Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                                </p>
                            </div>
                        </li>

                        <li data-aos="fade-up" data-aos-delay="200">
                            <i class="bx bx-help-circle icon-help"></i><a data-toggle="collapse" href="#faq-list-3" class="collapsed">Dolor sit amet consectetur adipiscing elit? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                            <div id="faq-list-3" class="collapse" data-parent=".faq-list">
                                <p>
                                    Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                                </p>
                            </div>
                        </li>

                        <li data-aos="fade-up" data-aos-delay="300">
                            <i class="bx bx-help-circle icon-help"></i><a data-toggle="collapse" href="#faq-list-4" class="collapsed">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                            <div id="faq-list-4" class="collapse" data-parent=".faq-list">
                                <p>
                                    Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in.
                                </p>
                            </div>
                        </li>

                        <li data-aos="fade-up" data-aos-delay="400">
                            <i class="bx bx-help-circle icon-help"></i><a data-toggle="collapse" href="#faq-list-5" class="collapsed">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="bx bx-chevron-down icon-show"></i><i class="bx bx-chevron-up icon-close"></i></a>
                            <div id="faq-list-5" class="collapse" data-parent=".faq-list">
                                <p>
                                    Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque.
                                </p>
                            </div>
                        </li>

                    </ul>
                </div>

            </div>
        </section>
        <!-- End F.A.Q Section -->
        <!-- ======= Contact Section ======= -->
        <section id="contact" class="contact">
            <div class="container">

                <div class="section-title" data-aos="fade-up">
                    <h2>Contact</h2>
                    <p>Contact Us</p>
                </div>

                <div class="row">

                    <div class="col-lg-4" data-aos="fade-right" data-aos-delay="100">
                        <div class="info">
                            <div class="address">
                                <i class="icofont-google-map"></i>
                                <h4>Location:</h4>
                                <p>
                                    #729, 1, Mehrauli-Gurgaon Rd,
                                    Block B, Old DLF Colony,
                                    Sector 14, Gurugram,
                                    Haryana 122001
                                </p>
                            </div>

                            <div class="email">
                                <i class="icofont-envelope"></i>
                                <h4>Email:</h4>
                                <p>contactus@mycornershop.in</p>
                            </div>

                            <div class="phone">
                                <i class="icofont-phone"></i>
                                <h4>Call:</h4>
                                <p>+91 96506 01555</p>
                            </div>

                        </div>

                    </div>

                    <div class="col-lg-8 mt-5 mt-lg-0" data-aos="fade-left" data-aos-delay="200">

                        <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                            <div class="form-row">
                                <div class="col-md-6 form-group">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                    <div class="validate"></div>
                                </div>
                                <div class="col-md-6 form-group">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                    <div class="validate"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                <div class="validate"></div>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                <div class="validate"></div>
                            </div>
                            <div class="mb-3">
                                <div class="loading">Loading</div>
                                <div class="error-message"></div>
                                <div class="sent-message">Your message has been sent. Thank you!</div>
                            </div>
                            <div class="text-center">
                                <button type="submit">Send Message</button>
                            </div>
                        </form>

                    </div>

                </div>

            </div>
        </section>
        <!-- End Contact Section -->

    </main><!-- End #main -->
    <!-- ======= Footer ======= -->
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6   col-md-6">
                        <div class="footer-info">
                            <img style="max-height: 70px;" src="../Home/assets/img/My%20corner%20Shop%20logo%20white.png" />
                            <%--<h3>ᎷᎽ CᏫᏒႶᏋᏒ<sup>ᎴᏲᏫᎮ</sup></h3>--%>
                            <p class="pb-3"><em>A product of Futurity Technologies LLP</em></p>
                            <p>
                               <%-- #729, 1, Mehrauli-Gurgaon Rd,<br />
                                Block B, Old DLF Colony,<br />
                                Sector 14, Gurugram,
                                <br />
                                Haryana 122001<br />
                                <br />--%>
                                <strong>Phone:</strong> +91 96506 01555<br>
                                <strong>Email:</strong>contactus@mycornershop.in<br>
                            </p>
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-6 footer-links" style="visibility:hidden;">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#about">About us</a></li>
                           
                            <li><i class="bx bx-chevron-right"></i><a href="terms-conditions/terms.html">Terms of service</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="terms-conditions/terms.html">Privacy policy</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i><a href="#hero">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#about">About us</a></li>
                            <li  ><i class="bx bx-chevron-right"></i><a href="#features">Features</a></li>
                            <li ><i class="bx bx-chevron-right"></i><a href="#pricing">Pricing</a></li>
                            <li ><i class="bx bx-chevron-right"></i><a href="#contact">Contact</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="terms-conditions/terms.html">Terms of service</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="terms-conditions/terms.html">Privacy policy</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-md-6 footer-links d-none">
                        <h4>Our Services</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i><a href="#">General Store</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Pharmacy</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Laundry</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Saloon</a></li>
                            <li><i class="bx bx-chevron-right"></i><a href="#">Dry Cleaning etc.</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-6 footer-newsletter d-none">
                        <h4>Our Newsletter</h4>
                        <p>We have tied up with your local stores to provide you the same trust and quality at the comfort of your home</p>
                        <form action="" method="post">
                            <input type="email" name="email"><input type="submit" value="Subscribe">
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong><span><a href="index.aspx"><span>
                    <%-- <svg style="margin-top: -15px; margin-left: 15px" height="10pt" viewBox="0 0 512 512" width="8pt" xmlns="http://www.w3.org/2000/svg">
                        <path d="m135 512h-120c-8.285156 0-15-6.714844-15-15v-361.996094c0-74.441406 60.5625-135.003906 135.003906-135.003906h361.996094c8.285156 0 15 6.714844 15 15v120c0 8.285156-6.714844 15-15 15h-347v347c0 8.285156-6.714844 15-15 15zm0 0" fill="gold" />
                        <path d="m497 0h-346.96875v150h346.96875c8.285156 0 15-6.714844 15-15v-120c0-8.285156-6.714844-15-15-15zm0 0" fill="gold" />
                    </svg>--%>Futurity Technologies LLP</span></a></span></strong>
                . All Rights Reserved
            </div>
            <div class="credits">
            </div>
        </div>
    </footer>
    <!-- End Footer -->

    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
    <div id="preloader"></div>

    <!-- modals -->
    <div class="modal fade" id="loginmodal" role="dialog" runat="server">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <!--<div class="modal-header">
                    <h4 class="modal-title">Modal Header</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>-->
                <div class="modal-body p-4">
                    <form name="Form1" runat="server">
                        <div style="text-align: center;">
                            <img style="max-height: 40px;" src="../Home/assets/img/My%20corner%20Shop%20logo.png" />


                            <%--<a href="javascript:void(0);"><span>
                                <svg style="margin-top: -15px; margin-left: 15px" height="10pt" viewBox="0 0 512 512" width="8pt" xmlns="http://www.w3.org/2000/svg">
                                    <path d="m135 512h-120c-8.285156 0-15-6.714844-15-15v-361.996094c0-74.441406 60.5625-135.003906 135.003906-135.003906h361.996094c8.285156 0 15 6.714844 15 15v120c0 8.285156-6.714844 15-15 15h-347v347c0 8.285156-6.714844 15-15 15zm0 0" fill="gold" />
                                    <path d="m497 0h-346.96875v150h346.96875c8.285156 0 15-6.714844 15-15v-120c0-8.285156-6.714844-15-15-15zm0 0" fill="gold" />
                                </svg>ᎷᎽ CᏫᏒႶᏋᏒ<sup>ᎴᏲᏫᎮ</sup>

                                                          </span></a>--%>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <hr />
                        <div class="form-group pmd-textfield pmd-textfield-floating-label usernameinput">

                            <label for="regular1" class="control-label">
                                <span style="background: white;">Username  </span>
                            </label>
                            <input type="text" id="username" class="form-control" style="position: initial!important;" runat="server">
                        </div>


                        <div class="form-group pmd-textfield pmd-textfield-floating-label passwordinput">

                            <label for="regular1" class="control-label">
                                <span style="background: white;">Password  </span>
                            </label>
                            <input type="password" id="password" class="form-control" style="position: initial!important;" runat="server">
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label optinput d-none">

                            <label for="OTP" class="control-label">
                                <span style="background: white;">OTP  </span>
                            </label>
                            <input type="password" runat="server" id="OTP" class="form-control" style="position: initial!important;">
                        </div>
                        <hr />
                        <div style="text-align: center; cursor: pointer;">
                            <a class="loginwithotpbtn">Login with OTP</a>
                            <a class="loginwithpassword d-none">Login with Password</a>
                        </div>
                        <hr />

                        <div class="form-group pmd-textfield pmd-textfield-floating-label sendotpbtn d-none">

                            <input type="button" id="Sendotp" class="btn logbtn" value="Send OTP">
                            <asp:Button runat="server" ID="SubmitOTP"  type="submit"  class="btn logbtn d-none mt-3" Text="Submit" OnClick="btnOTP_Submit" />
                        </div>

                        <div class="form-group pmd-textfield pmd-textfield-floating-label loginbtn">

                            <%-- <input type="button" id="loginsubmit" class="btn logbtn" value="Login">--%>
                            <asp:Button runat="server" ID="loginsubmit" type="submit"  class="btn logbtn" Text="Login" OnClick="btnLogin_Click" />


                        </div>
                    </form>
                </div>
                <!--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>-->
            </div>

        </div>
    </div>

    <!-- Vendor JS Files -->
    <script src="../Admin/js/global.js"></script>
    <script src="../Admin/js/textfield.js"></script>
    <script src="../Home/assets/vendor/jquery/jquery.min.js"></script>
    <script src="../Home/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../Home/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="../Home/assets/vendor/php-email-form/validate.js"></script>
    <script src="../Home/assets/vendor/venobox/venobox.min.js"></script>
    <script src="../Home/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="../Home/assets/vendor/counterup/counterup.min.js"></script>
    <script src="../Home/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="../Home/assets/vendor/aos/aos.js"></script>

    <!-- Template Main JS File -->
    <script src="../Home/assets/js/main.js"></script>

    
    <script>
        $("#loginbtn").click(function () {
            $("#loginmodal").modal();
        })

        $("#loginbtn2").click(function () {
            $("#loginmodal").modal();
        })

        $(".loginwithotpbtn").click(function () {
            $(".passwordinput").addClass("d-none");
            $(".sendotpbtn").removeClass("d-none");
            $(".loginbtn").addClass("d-none");
            $(".loginwithpassword").removeClass("d-none");
            $(".loginwithotpbtn").addClass("d-none");
            $('#OTP').parent().addClass('d-none');
            $('#SubmitOTP').addClass('d-none');
        })

        $(".loginwithpassword").click(function () {
            $(".passwordinput").removeClass("d-none");
            $(".sendotpbtn").addClass("d-none");
            $(".loginbtn").removeClass("d-none");
            $(".loginwithpassword").addClass("d-none");
            $(".loginwithotpbtn").removeClass("d-none");
            $('#OTP').parent().addClass('d-none');
            $('#SubmitOTP').addClass('d-none');
        })

        $('#Sendotp').click(function (e) {
            e.stopImmediatePropagation();
            var UserName = $.trim($('#username').val());
            if (UserName.length <= 0) {
                alert('Please enter your username');
            }
            else {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Index.aspx/sendOTP",
                    data: '{Mobile: "' + UserName + '"}',
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "N") {
                            alert('This username is not registered with us');
                        }
                        else {
                            alert('OTP sent successfully');
                            $('#Sendotp').attr('disabled', true);
                            $('#Sendotp').val('Resend OTP after 30 Seconds');
                            $('#OTP').parent().removeClass('d-none');
                            $('#SubmitOTP').removeClass('d-none');
                            startTimer();
                        }

                    },
                    error: function (e) {
                        alert(e.statusText);
                    }
                })
            }
        })

        function toTimeString(seconds) {
            var Time = (new Date(seconds * 1000)).toUTCString().match(/(\d\d:\d\d:\d\d)/)[0];
            Time = Time.split(':');
            // return (new Date(seconds * 1000)).toUTCString().match(/(\d\d:\d\d:\d\d)/)[0];
            return Time[2];
        }

        function startTimer() {
            var nextElem = $('#Sendotp');
            var duration = nextElem.val();
            var a = 30;
            var seconds = 30;
            setInterval(function () {
                seconds--;
                if (seconds >= 0) {
                    nextElem.val('Resend OTP after ' + toTimeString(seconds) + ' Seconds');
                }
                if (seconds === 0) {
                    $('#Sendotp').attr('disabled', false);
                    nextElem.val('Resend OTP');
                    clearInterval(seconds);
                }
            }, 1000);
        }


    </script>

</body>

</html>
