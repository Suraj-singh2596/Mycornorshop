<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assest/css/bootstrap-grid.min.css" rel="stylesheet"/>
    <link href="Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link href="Assest/css/globalstyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link href="Assest/css/alert.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Assest/css/Main_style.css" rel="stylesheet" />
    <link href="swiper-master/packages/css/swiper.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Bitter" rel="stylesheet" />
    <link href="Assest/css/animations.css" rel="stylesheet" />
    <link href="Components/CSS/purchase_main.css" rel="stylesheet" />
    <script src="Assest/js/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="Admin/js/global.js"></script>
    <link href="Admin/css/textfield.css" rel="stylesheet" />
    <link href="styles/home-main.css" rel="stylesheet" />
    <style>
        #cat_sub .owl-carousel .owl-item img {
    display: block!important;
    width: 100%!important;
    height: 100%!important;
    margin-left: 0px!important;
    border-radius: 10px!important;
    border: 2px solid white;
    background: white!important;
}

          #cat_sub {
            margin-bottom: 50px;
        }

        .maincategorybox {
            border: 1px solid lightgrey;
            border-radius: 10px;
            padding: 5px;
            margin-bottom:15px;
        }

    </style>
</head>
<body id="pageone">

    <%-- loader start --%>

    <div id="preload" style="display: none;">
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
            <nav class="navbar fixed-top navbar-light bg-light">
                <a class="navbar-brand" href="javascript:void(0);" id="StoreName" runat="server" style="padding-left: 50px;"></a>
                <a id="Notif_seenBtn" style="color: white; margin-top: -10px;">
                    <span class="pr-1" id="Notificationpic" runat="server">&nbsp;&nbsp; 
                       <svg version="1.1" id="Notification" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                           viewBox="0 0 512 512" style="enable-background: new 0 0 512 512; width: 15px; height: 15px; fill: #fff;" xml:space="preserve">
                           <g>
                               <g>
                                   <path d="M467.812,431.851l-36.629-61.056c-16.917-28.181-25.856-60.459-25.856-93.312V224c0-67.52-45.056-124.629-106.667-143.04
			            V42.667C298.66,19.136,279.524,0,255.993,0s-42.667,19.136-42.667,42.667V80.96C151.716,99.371,106.66,156.48,106.66,224v53.483
			            c0,32.853-8.939,65.109-25.835,93.291l-36.629,61.056c-1.984,3.307-2.027,7.403-0.128,10.752c1.899,3.349,5.419,5.419,9.259,5.419
			            H458.66c3.84,0,7.381-2.069,9.28-5.397C469.839,439.275,469.775,435.136,467.812,431.851z" />
                               </g>
                           </g><g><g><path d="M188.815,469.333C200.847,494.464,226.319,512,255.993,512s55.147-17.536,67.179-42.667H188.815z" /></g>
                           </g><g></g><g></g><g></g>
                           <g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>

                    </span>
                    <div class="notification_count" id="Notif_count" runat="server">99</div>
                </a>
            </nav>

            <!--2. Swiper Section-->

            <ul id="searchResult"></ul>

            <section id="section1" class="section-item1" runat="server">


                <div class="container containers">
                </div>
                
            </section>
            <div class="container p-0" id="containerSection" style="margin-bottom: 10px!important;" runat="server">
            </div>
            <div id="contactus" style="margin-bottom: 55px;text-align: center;background: white;padding: 10px;" runat="server">For any queries Whatsapp :<a href="tel:+91 96675 50915">+91 96675 50915</a></div>

        </div>
    </form>


     

    <footer>
        <div class="footer boxshadow" style="height: auto;" id="active_balance">
            <div class="row">
                <div class="col-3 text-center">
                    <a class="_menu_opt">
                        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            width="22.398px" height="22.398px" viewBox="0 0 495.398 495.398" style="enable-background: new 0 0 495.398 495.398; fill: #55e6c1; margin-bottom: -10px;"
                            xml:space="preserve">
                            <g>
                                <g>
                                    <g>
                                        <path d="M487.083,225.514l-75.08-75.08V63.704c0-15.682-12.708-28.391-28.413-28.391c-15.669,0-28.377,12.709-28.377,28.391
				            v29.941L299.31,37.74c-27.639-27.624-75.694-27.575-103.27,0.05L8.312,225.514c-11.082,11.104-11.082,29.071,0,40.158
				            c11.087,11.101,29.089,11.101,40.172,0l187.71-187.729c6.115-6.083,16.893-6.083,22.976-0.018l187.742,187.747
				            c5.567,5.551,12.825,8.312,20.081,8.312c7.271,0,14.541-2.764,20.091-8.312C498.17,254.586,498.17,236.619,487.083,225.514z"
                                            fill="#27cacc" />
                                        <path d="M257.561,131.836c-5.454-5.451-14.285-5.451-19.723,0L72.712,296.913c-2.607,2.606-4.085,6.164-4.085,9.877v120.401
				            c0,28.253,22.908,51.16,51.16,51.16h81.754v-126.61h92.299v126.61h81.755c28.251,0,51.159-22.907,51.159-51.159V306.79
				            c0-3.713-1.465-7.271-4.085-9.877L257.561,131.836z"
                                            fill="#27cacc" />
                                    </g>
                                </g>
                            </g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
                        <br />
                        Home</a>
                </div>
                <div class="col-3 text-center menuopt" onclick="location.href='../Components/scheduler.aspx'">
                    <a class="_menu_opt" href="../Components/scheduler.aspx">

                        <svg version="1.1" id="Capa_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 512 512" width="22.398px" height="22.398px" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M458.732,422.212l-22.862-288.109c-1.419-18.563-17.124-33.098-35.737-33.098h-45.164v66.917
			c0,8.287-6.708,14.995-14.995,14.995c-8.277,0-14.995-6.708-14.995-14.995v-66.917H187.028v66.917
			c0,8.287-6.718,14.995-14.995,14.995c-8.287,0-14.995-6.708-14.995-14.995v-66.917h-45.164c-18.613,0-34.318,14.535-35.737,33.058
			L53.265,422.252c-1.769,23.082,6.238,46.054,21.962,63.028C90.952,502.253,113.244,512,136.386,512h239.236
			c23.142,0,45.434-9.747,61.159-26.721C452.505,468.305,460.512,445.333,458.732,422.212z M323.56,275.493l-77.553,77.553
			c-2.929,2.929-6.768,4.398-10.606,4.398c-3.839,0-7.677-1.469-10.606-4.398l-36.347-36.347c-5.858-5.858-5.858-15.345,0-21.203
			c5.858-5.858,15.355-5.858,21.203,0l25.751,25.741l66.956-66.956c5.848-5.848,15.345-5.848,21.203,0
			C329.418,260.139,329.418,269.635,323.56,275.493z"
                                        fill="gray" />
                                </g>
                            </g>
                            <g>
                                <g>
                                    <path d="M256.004,0c-54.571,0-98.965,44.404-98.965,98.975v2.029h29.99v-2.029c0-38.037,30.939-68.986,68.976-68.986
			s68.976,30.949,68.976,68.986v2.029h29.989v-2.029C354.969,44.404,310.575,0,256.004,0z"
                                        fill="gray" />
                                </g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                        </svg>
                        <br />
                        <label class="p-0 m-0" style="font-weight: 500!important;">Order</label>
                    </a>
                </div>
                <div class="col-3 text-center _walletbtn">
                    <a class="_menu_opt">
                        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            width="22.398px" height="22.398px" viewBox="0 0 890.5 890.5" style="enable-background: new 0 0 512 512; margin-bottom: -10px;" xml:space="preserve">
                            <g>
                                <g>
                                    <path d="M208.1,180.56l355-96.9l-18.8-38c-12.3-24.7-42.3-34.9-67-22.6l-317.8,157.5H208.1z" fill="gray" />
                                    <path d="M673.3,86.46c-4.399,0-8.8,0.6-13.2,1.8l-83.399,22.8L322,180.56h289.1h126l-15.6-57.2
			C715.5,101.06,695.3,86.46,673.3,86.46z"
                                        fill="gray" />
                                    <path d="M789.2,215.56h-11.4h-15.5h-15.5H628.5H193.8h-57h-48h-8.9H50.1c-15.8,0-29.9,7.3-39.1,18.8c-4.2,5.3-7.4,11.4-9.2,18.1
			c-1.1,4.2-1.8,8.6-1.8,13.1v6v57v494.1c0,27.601,22.4,50,50,50h739.1c27.601,0,50-22.399,50-50v-139.5H542.4
			c-46.9,0-85-38.1-85-85v-45.8v-15.5v-15.5v-34.4c0-23,9.199-43.899,24.1-59.199c13.2-13.601,30.9-22.801,50.7-25.101
			c3.3-0.399,6.7-0.6,10.1-0.6h255.2H813h15.5h10.6v-136.5C839.2,237.96,816.8,215.56,789.2,215.56z"
                                        fill="gray" />
                                    <path d="M874.2,449.86c-5-4.6-10.9-8.1-17.5-10.4c-5.101-1.699-10.5-2.699-16.2-2.699h-1.3h-1h-15.5h-55.9H542.4
			c-27.601,0-50,22.399-50,50v24.899v15.5v15.5v55.4c0,27.6,22.399,50,50,50h296.8h1.3c5.7,0,11.1-1,16.2-2.7
			c6.6-2.2,12.5-5.8,17.5-10.4c10-9.1,16.3-22.3,16.3-36.899v-111.3C890.5,472.16,884.2,458.959,874.2,449.86z M646.8,552.36
			c0,13.8-11.2,25-25,25h-16.6c-13.8,0-25-11.2-25-25v-16.6c0-8,3.7-15.101,9.6-19.601c4.3-3.3,9.601-5.399,15.4-5.399h4.2H621.8
			c13.8,0,25,11.199,25,25V552.36L646.8,552.36z"
                                        fill="gray" />
                                </g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                        </svg>
                        <br />
                        <label class="p-0 m-0" style="font-weight: 500!important;">Wallet</label></a>
                </div>
                <div class="col-3 text-center menuopt" id="Mycart" onclick="location.href='../cart.aspx'">
                    <a class="_menu_opt" href="../cart.aspx">
                       <svg version="1.1" id="Capa_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 426.667 426.667" width="22.398px" height="22.398px" style="enable-background: new 0 0 446.853 446.853; margin-bottom: -13px;" xml:space="preserve">
                            <g>
                                <g>
                                    <g>
                                        <path d="M128,341.333c-23.573,0-42.453,19.093-42.453,42.667s18.88,42.667,42.453,42.667c23.573,0,42.667-19.093,42.667-42.667
				S151.573,341.333,128,341.333z"
                                            fill="gray" />
                                        <path d="M151.467,234.667H310.4c16,0,29.973-8.853,37.333-21.973L424,74.24c1.707-2.987,2.667-6.507,2.667-10.24
				c0-11.84-9.6-21.333-21.333-21.333H89.92L69.653,0H0v42.667h42.667L119.36,204.48l-28.8,52.267
				c-3.307,6.187-5.227,13.12-5.227,20.587C85.333,300.907,104.427,320,128,320h256v-42.667H137.067
				c-2.987,0-5.333-2.347-5.333-5.333c0-0.96,0.213-1.813,0.64-2.56L151.467,234.667z"
                                            fill="gray" />
                                        <path d="M341.333,341.333c-23.573,0-42.453,19.093-42.453,42.667s18.88,42.667,42.453,42.667
				C364.907,426.667,384,407.573,384,384S364.907,341.333,341.333,341.333z"
                                            fill="gray" />
                                    </g>
                                </g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                            <g>
                            </g>
                        </svg>

                        <br />
                        <div class="cartcount" id="Mycart2" runat="server" style="font-size: 14px;">0</div>
                        <label class="p-0 m-0" style="font-weight: 500!important;">Cart</label></a>
                </div>
            </div>
        </div>
    </footer>


     

    <div class="cardatmcls atmcard">
        <div class="walletbtn" style="text-align: right; margin-right: 10px;">
            <i style="font-size: 22px; margin-top: 6px;"
                class="fa fa-times-circle "></i>
        </div>
        <div class="chip" style="visibility: hidden;">
            <div class="side left"></div>
            <div class="side right"></div>
            <div class="vertical top"></div>
            <div class="vertical bottom"></div>
        </div>
        <div class="data">
            <div class="pan" title="My Active balance" id="active_bal" runat="server"><span>Wallet Balance</span></div>
            <div class="first-digits d-none">4123</div>
            <div class="container">
                <div class="" style="width: 100%;">
                    <div class="" style="width: 100%; margin-top: -20px;">
                        <label style="font-size: 15px; font-weight: 500; text-transform: initial;">Add money to my In-Store wallet</label>
                        <div style="height: 35px; background: white; margin-left: 5px; margin-right: 5px; border-radius: 5px; display: flex;">
                            <svg height='35px' width='35px' style="" fill="#000000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                                <path d="M57.127,41.981c0-1.104-0.896-2-2-2H30.873c-1.104,0-2,0.896-2,2s0.896,2,2,2h9.826c2.88,0,5.307,1.95,6.048,4.598H30.873  c-1.104,0-2,0.896-2,2c0,1.104,0.896,2,2,2H46.54c-0.922,2.328-3.19,3.981-5.841,3.981h-9.826c-0.818,0-1.554,0.498-1.857,1.258  c-0.304,0.761-0.113,1.629,0.48,2.191l16.271,15.451c0.387,0.368,0.881,0.55,1.377,0.55c0.528,0,1.058-0.209,1.449-0.622  c0.762-0.802,0.729-2.066-0.072-2.828l-12.638-12h4.815c4.877,0,8.963-3.416,10.015-7.98h4.413c1.104,0,2-0.896,2-2  c0-1.104-0.896-2-2-2h-4.294c-0.285-1.712-0.99-3.281-2.013-4.598h6.307C56.23,43.981,57.127,43.086,57.127,41.981z M77,38.5  c-1.104,0-2,0.896-2,2v39c0,4.411-3.589,8-8,8H21c-4.411,0-8-3.589-8-8v-48c0-4.411,3.589-8,8-8h36c1.104,0,2-0.896,2-2  s-0.896-2-2-2H21c-6.617,0-12,5.383-12,12v48c0,6.617,5.383,12,12,12h46c6.617,0,12-5.383,12-12v-39C79,39.396,78.104,38.5,77,38.5z   M89,19.5H79v-9c0-1.104-0.896-2-2-2s-2,0.896-2,2v9h-9.875c-1.104,0-2,0.896-2,2s0.896,2,2,2H75v9c0,1.104,0.896,2,2,2s2-0.896,2-2  v-9h10c1.104,0,2-0.896,2-2S90.104,19.5,89,19.5z"></path></svg>

                            <input id="addbal" type="number" style="width: 70%; height: 35px; padding-left: 5px; margin-left: -4px; border-radius: 20px; border: none;" placeholder="Amount" />
                            <a class="btn addmoneybtn2 MoneyAdd w-25">Add money</a>

                        </div>

                    </div>
                    <div class="" style="width: 100%;">
                        <label style="font-size: 15px; font-weight: 500; text-transform: initial;">Pay to Retailer from In-Store wallet</label>
                        <div style="background: white; height: 35px; margin-left: 5px; margin-right: 5px; border-radius: 5px; display: flex;">
                            <svg height='35px' width='35px' fill="#000000" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                                <path d="M61.127,36.481c0-1.104-0.896-2-2-2H34.873c-1.104,0-2,0.896-2,2s0.896,2,2,2h9.826c2.88,0,5.307,1.95,6.048,4.598H34.873  c-1.104,0-2,0.896-2,2s0.896,2,2,2H50.54c-0.922,2.328-3.19,3.981-5.841,3.981h-9.826c-0.818,0-1.554,0.499-1.857,1.259  c-0.304,0.76-0.113,1.628,0.48,2.191l16.271,15.451c0.387,0.368,0.882,0.55,1.377,0.55c0.529,0,1.058-0.209,1.45-0.623  c0.761-0.801,0.728-2.066-0.073-2.827L39.884,55.061h4.815c4.877,0,8.963-3.417,10.015-7.981h4.413c1.104,0,2-0.896,2-2  s-0.896-2-2-2h-4.294c-0.285-1.712-0.99-3.281-2.012-4.598h6.306C60.231,38.481,61.127,37.586,61.127,36.481z M81,45  c-1.104,0-2,0.896-2,2v27c0,4.411-3.589,8-8,8H25c-4.411,0-8-3.589-8-8V26c0-4.411,3.589-8,8-8h37c1.104,0,2-0.896,2-2s-0.896-2-2-2  H25c-6.617,0-12,5.383-12,12v48c0,6.617,5.383,12,12,12h46c6.617,0,12-5.383,12-12V47C83,45.895,82.104,45,81,45z M95.589,20.76  L82.414,7.586c-0.75-0.75-2.078-0.75-2.828,0L66.412,20.76c-0.781,0.781-0.781,2.047,0,2.828c0.781,0.781,2.047,0.781,2.828,0  l9.76-9.76V40c0,1.104,0.896,2,2,2s2-0.896,2-2V13.829l9.761,9.76c0.391,0.391,0.902,0.586,1.414,0.586s1.023-0.195,1.414-0.586  C96.37,22.808,96.37,21.541,95.589,20.76z"></path></svg>

                            <input id="payment" type="number" style="width: 70%; height: 35px; padding-left: 5px; margin-left: -4px; border-radius: 20px; border: none;" placeholder="Amount" />
                            <a class=" btn addmoneybtn2 MoneyPay w-25">Pay </a>

                        </div>

                    </div>
                </div>


            </div>


        </div>
        <div class="lines-down"></div>
        <%--<div class="lines-up"></div>--%>
    </div>

    <div id="overlay">
        <div id="text" class="boxshadow">
            <div class="headertitle">
                Login with OTP
            </div>
            <div class="body p-2">
                <div class="container">
                    <div class="row">
                        <div class="form-group col-sm-12 pmd-textfield pmd-textfield-floating-label">
                            <label for="regular1" class="control-label">
                                Mobile Number
                            </label>
                            <input type="number" id="mNumber" class="form-control" />
                        </div>
                        <div class="form-group col-sm-12 pmd-textfield pmd-textfield-floating-label">
                            <label for="regular1" class="control-label">
                                OTP
                            </label>
                            <%-- <input type="text"  class="form-control" autocomplete="one-time-code" inputmode="numeric" />--%>
                            <form>

                                <input type="text" class="form-control" id="OTP" />
                                <input type="submit" class="d-none" value="Submit" />
                            </form>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <button class="btn btnlogin" type="button" id="sendOTP">Send OTP</button>
                            <button class="btn btnlogin mt-2" type="button" id="Login">Login</button>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>

    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>

    <input type="hidden" id="RID" runat="server" />

    <script src="Assest/js/ripple-effect.js"></script>
    <script src="Assest/js/alert.js"></script>

    <script src="Admin/js/textfield.js"></script>

   
    <script src="Items/Add_Balance.js"></script>
    <script src="Assest/js/owl.carousel.min.js"></script>
    <script src="Assest/bootstrap.js"></script>
    <script src="Assest/js/jquery-ui.min.js"></script>
    <script src="swiper-master/packages/js/swiper.min.js"></script>
    <script src='https://www.gstatic.com/firebasejs/6.4.2/firebase-app.js' type="text/javascript"></script>
    <script src='https://www.gstatic.com/firebasejs/6.4.2/firebase-messaging.js' type="text/javascript"></script>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule="nomodule" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
     <script src="Assest/js/Main_script.js"></script>
    <script src="jquery-helper/firebase.js"></script>
    <script src="jquery-helper/Home-helper.js"></script>
     
</body>
</html>
