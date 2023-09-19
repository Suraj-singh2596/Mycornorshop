<%@ Page Title="" Language="C#" MasterPageFile="~/APP/application.master" AutoEventWireup="true" CodeFile="application.aspx.cs" Inherits="APP_application" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Overlay panel -->
    <div class="body-overlay"></div>
    <!-- Left panel -->
    <div id="panel-left">
        <div class="panel panel--left">
            <!-- Slider -->
            <div class="panel__navigation">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="user-details">
                            <div class="user-details__thumb">
                                <img src="../assets/images/photos/avatar.jpg" alt="" title="" />
                            </div>
                            <div class="user-details__title"><span>Hello</span> Patrick Vue</div>
                        </div>
                        <nav class="main-nav">
                            <ul>
                                <li class="subnav opensubnav">
                                    <img src="gomobile/assets/images/icons/gray/home.svg" alt="" title="" /><span>Home Pages</span><i><img src="gomobile/assets/images/icons/gray/arrow-right.svg" alt="" title="" /></i></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/checked.svg" alt="" title="" /><span>Features</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/news.svg" alt="" title="" /><span>News</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/cart.svg" alt="" title="" /><span>Shop</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/photos.svg" alt="" title="" /><span>Photos</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/video.svg" alt="" title="" /><span>Videos</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/chat.svg" alt="" title="" /><span>Chat</span><strong>3</strong></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/tabs.svg" alt="" title="" /><span>Tabs &amp; Toggles</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/form.svg" alt="" title="" /><span>Forms</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/tables.svg" alt="" title="" /><span>Tables</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/contact.svg" alt="" title="" /><span>Contact</span></a></li>
                                <li><a href="javascript:void(0);">
                                    <img src="gomobile/assets/images/icons/gray/user.svg" alt="" title="" /><span>User login</span></a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="swiper-slide">
                        <div class="subnav-header backtonav">
                            <img src="gomobile/assets/images/icons/gray/arrow-left.svg" alt="" title="" /><span>BACK</span>
                        </div>
                        <nav class="main-nav">
                            <ul>
                                <li><a href="javascript:void(0);"><b>01</b><span>Main design</span></a></li>
                                <li><a href="javascript:void(0);"><b>02</b><span>Mobile Website</span></a></li>
                                <li><a href="javascript:void(0);"><b>03</b><span>Shop Design</span></a></li>
                                <li><a href="javascript:void(0);"><b>04</b><span>Food / Restaurant</span></a></li>
                                <li><a href="javascript:void(0);"><b>05</b><span>Medical Clinic</span></a></li>
                                <li><a href="javascript:void(0);"><b>06</b><span>Beauty Center</span></a></li>
                                <li><a href="javascript:void(0);"><b>07</b><span>Music App</span></a></li>
                                <li><a href="javascript:void(0);"><b>08</b><span>Wedding Website</span></a></li>
                                <li><a href="javascript:void(0);"><b>09</b><span>Classic App</span></a></li>
                                <li><a href="javascript:void(0);"><b>10</b><span>Metro Style</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Right panel -->
    <div id="panel-right">
        <div class="panel panel--right">
            <div class="user-profile">
                <div class="user-profile__thumb">
                    <img src="../assets/images/photos/avatar.jpg" alt="" title="" />
                </div>
                <div class="user-profile__name">Patrick Vue</div>
                <div class="buttons buttons--centered mb-20">
                    <div class="info-box"><span>Followers</span> 25k</div>
                    <div class="info-box"><span>Following</span> 9k</div>
                    <div class="info-box"><span>Likes</span>1.5k</div>
                </div>
                <div class="buttons buttons--centered">
                    <a href="#" class="button button--blue button--ex-small ml-10">FOLLOW</a>
                    <a href="#" class="button button--green button--ex-small ml-10">MESSAGE</a>
                </div>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="#">
                        <img src="gomobile/assets/images/icons/gray/user.svg" alt="" title="" /><span>My Account</span></a></li>
                    <li><a href="#">
                        <img src="gomobile/assets/images/icons/gray/chat.svg" alt="" title="" /><span>Messages</span><strong>3</strong></a></li>
                    <li><a href="#">
                        <img src="gomobile/assets/images/icons/gray/love.svg" alt="" title="" /><span>Favourites</span></a></li>
                    <li><a href="#">
                        <img src="gomobile/assets/images/icons/gray/settings.svg" alt="" title="" /><span>Settings</span></a></li>
                    <li><a href="#">
                        <img src="gomobile/assets/images/icons/gray/logout.svg" alt="" title="" /><span>Logout</span></a></li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="panel-close panel-close--left">
        <img src="gomobile/assets/images/icons/black/close.svg" alt="" title="" />
    </div>
    <div class="panel-close panel-close--right">
        <img src="gomobile/assets/images/icons/black/close.svg" alt="" title="" />
    </div>

    <div class="page page--main" data-page="intro-website">

        <!-- HEADER -->
        <header class="header header--page header--fixed">
            <div class="header__inner">
                <div class="header__icon header__icon--menu open-panel" data-panel="left" data-arrow="right"><span></span><span></span><span></span><span></span><span></span><span></span></a></div>
                <div class="header__logo header__logo--text"><a href="#"><strong>Insure</strong>PRO</a></div>
                <div class="header__icon open-panel" data-panel="right" data-arrow="left">
                    <ion-icon style="color: #1b6cfc; font-size: 25px;" name="person-outline"></ion-icon>
                </div>
            </div>
        </header>

        <!-- PAGE CONTENT -->
        <div class="page__content page__content--with-header">

            <div class="card">
                <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                    <div class="swiper-wrapper">
                         <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Offers</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Lead Forms</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Brochures</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Academy</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Posters</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Activity points</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Reffer & earn</strong></a></h2>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--5">
                            <div class="slider-thumbs__image">
                                <a href="#">
                                    <img class=" " src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                            </div>
                            <div class="slider-thumbs__caption caption" style="padding-top: 0px;">
                                <div class="caption__content">
                                    <h2 class="caption__title"><a href="#"><strong style="font-size: 10px;">Quiz</strong></a></h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-pagination slider-thumbs__pagination"></div>
                </div>
            </div>

            <h2 class="page__title">Welcome to Insure PRO</h2>

            <!-- SLIDER SIMPLE -->
            <div class="swiper-container slider-simple slider-thumb-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="0" data-itemsperview="1">
                <div class="swiper-wrapper">
                    <div class="swiper-slide slider-simple__slide" style="background-image: url(gomobile/assets/images/photos/image-1.jpg);">
                        <div class="slider-simple__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title">Daam hai halke <strong>Becho</strong> khulke</h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-simple__slide" style="background-image: url(gomobile/assets/images/photos/image-2.jpg);">
                        <div class="slider-simple__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title">Smart <strong>Ploicy</strong>for the smart Gen!  </h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-simple__slide" style="background-image: url(gomobile/assets/images/photos/image-3.jpg);">
                        <div class="slider-simple__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><strong>Story telling</strong> leads to great selling.</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-button-prev slider-simple__prev"></div>
                <div class="swiper-button-next slider-simple__next"></div>
                <div class="swiper-pagination slider-simple__pagination"></div>

            </div>

            <div class="page__title-bar">
                <h3>Get New Leads</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="leadimg modal-target" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="leadimg modal-target" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="leadimg modal-target" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="leadimg modal-target" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="leadimg modal-target" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="leadimg modal-target" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>

            <div class="page__title-bar">
                <h3>Posters</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
             <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                 <a class="whatsappsharebtn wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="whatsappsharebtn wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="whatsappsharebtn wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="whatsappsharebtn wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="whatsappsharebtn wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="whatsappsharebtn wbtn">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>

            <div class="page__title-bar">
                <h3>Videos</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->

            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a class="popup-youtube" href="https://www.youtube.com/watch?v=pBFQdxA-apI">
                                
                                <img src="gomobile/assets/images/drive_featured.jpg" alt="" title="" />
                                <div class="playsymbol"><ion-icon class="logo-youtube" name="logo-youtube"></ion-icon></div>

                            </a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="sharevideos wbtn" data-text="This is WhatsApp video sharing example using link" data-link="https://www.youtube.com/watch?v=pBFQdxA-apI" data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a class="popup-vimeo" href="videos/Code_of_Conduct_and_Ethics_for_Employees_Knowledgecity.mp4">
                                 
                               <img src="gomobile/assets/images/coc.PNG" alt="" title="" />
                                <div class="playsymbol"><ion-icon class="play-outline" name="play-outline"></ion-icon></div>
                            </a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="sharevideos wbtn" data-text="This is WhatsApp video sharing example using link" data-link="https://mycornershop.in/APP/videos/Code_of_Conduct_and_Ethics_for_Employees_Knowledgecity.mp4" data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image"> 
                            <a class="popup-vimeo" href="AboutInsurance/story.html">
                                 
                               <img src="gomobile/assets/images/nivabhupa.PNG" alt="" title="" />
                                <div class="playsymbol"><ion-icon class="play-outline" name="play-outline"></ion-icon></div>
                            </a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>
            <div class="page__title-bar">
                <h3>Posters</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>


            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="downloadsharebtn wbtn" download="gomobile/assets/images/photos/image-6.jpg">
                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                    Download & Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="downloadsharebtn wbtn" download="gomobile/assets/images/photos/image-2.jpg">
                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                    Download & Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="downloadsharebtn wbtn" download="gomobile/assets/images/photos/image-7.jpg">
                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                    Download & Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="downloadsharebtn wbtn" download="gomobile/assets/images/photos/image-1.jpg">
                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                    Download & Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="downloadsharebtn wbtn" download="gomobile/assets/images/photos/image-3.jpg">
                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                    Download & Share</a>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                <a class="downloadsharebtn wbtn">
                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                    Download & Share</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>

            <div class="page__title-bar">
                <h3>Recommended For You</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>


            <div class="page__title-bar">
                <h3>Corona Awareness</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>


            <div class="page__title-bar">
                <h3>Health Insurance</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>

            <div class="page__title-bar">
                <h3>Life Insurance</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>


            <div class="page__title-bar">
                <h3>Motor Insurance</h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>


            <div class="page__title-bar">
                <h3>Mitual Funds </h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--2">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="recommandeImg" src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <span class="recomText">Things to know about covid and pregnancy</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>

            <div class="page__title-bar">
                <h3>Mint Academy - training for growth </h3>
                <div class="page__title-right">
                    <div class="swiper-button-prev slider-thumbs__prev"></div>
                    <div class="swiper-button-next slider-thumbs__next"></div>
                </div>
            </div>
            <!-- SLIDER THUMBS -->
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">


                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><a href="#">Desire to <strong>create</strong></a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><a href="#">Powerful <strong>creativity</strong></a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-7.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><a href="#"><strong>Imagination</strong> is power</a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><a href="#"><strong>Positive</strong> energy</a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><a href="#"><strong>Creative</strong> workflow</a></h2>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img src="gomobile/assets/images/photos/image-5.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption">
                            <div class="caption__content">
                                <h2 class="caption__title"><a href="#">UI/UX <strong>super</strong> designs</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>

            <div class="page__title-bar">
                <h3>Daily News</h3>
            </div>
            <div class="posts">
                <div class="post">
                    <div class="post__thumb">
                        <a href="#">
                            <img src="gomobile/assets/images/photos/image-1.jpg" alt="" title="" /></a>
                    </div>
                    <div class="post__details">
                        <h4 class="post__title"><a href="#">Creativity is allowing yourself to make mistakes</a></h4>
                        <a href="#" class="post__more button button--blue button--ex-small">MORE</a>
                    </div>
                </div>
                <div class="post">
                    <div class="post__thumb">
                        <a href="#">
                            <img src="gomobile/assets/images/photos/image-2.jpg" alt="" title="" /></a>
                    </div>
                    <div class="post__details">
                        <h4 class="post__title"><a href="#">The true sign of intelligence is not not knowledge</a></h4>
                        <a href="#" class="post__more button button--blue button--ex-small">MORE</a>
                    </div>
                </div>
                <div class="post">
                    <div class="post__thumb">
                        <a href="#">
                            <img src="gomobile/assets/images/photos/image-3.jpg" alt="" title="" /></a>
                    </div>
                    <div class="post__details">
                        <h4 class="post__title"><a href="#">The desire to create is one of the deepest yearnings</a></h4>
                        <a href="#" class="post__more button button--blue button--ex-small">MORE</a>
                    </div>
                </div>
                <a href="#" class="button button--green button--full">VIEW ALL NEWS</a>
            </div>


            <div class="page__title-bar">
                <h3>Our main services</h3>
            </div>
            <div class="cards cards--12 mb-10">
                <div class="card">
                    <div class="card__icon">
                        <ion-icon style="font-size: 40px; font-weight: bold; color: #1b6cfc;" name="medkit-outline"></ion-icon>
                    </div>
                    <div class="card__details">
                        <h4 class="card__title">Health Insurance</h4>
                    </div>
                    <div class="card__more"><a class="button button--blue button--ex-small" href="#">MORE</a></div>
                </div>
                <div class="card">
                    <div class="card__icon">
                        <ion-icon style="font-size: 40px; font-weight: bold; color: #1b6cfc;" name="heart-outline"></ion-icon>
                    </div>
                    <div class="card__details">
                        <h4 class="card__title">Life Insurance</h4>
                    </div>
                    <div class="card__more"><a class="button button--blue button--ex-small" href="#">MORE</a></div>
                </div>
                <div class="card">
                    <div class="card__icon">
                        <ion-icon style="font-size: 40px; font-weight: bold; color: #1b6cfc;" name="car-sport-outline"></ion-icon>
                    </div>
                    <div class="card__details">
                        <h4 class="card__title">Car Insurance</h4>
                    </div>
                    <div class="card__more"><a class="button button--blue button--ex-small" href="#">MORE</a></div>
                </div>
                <div class="card">
                    <div class="card__icon">
                        <ion-icon style="font-size: 40px; font-weight: bold; color: #1b6cfc;" name="bicycle-outline"></ion-icon>
                    </div>
                    <div class="card__details">
                        <h4 class="card__title">Bike Insurance</h4>
                    </div>
                    <div class="card__more"><a class="button button--blue button--ex-small" href="#">MORE</a></div>
                </div>

            </div>
            <div class="swiper-container slider-thumbs slider-init mb-20" data-paginationtype="bullets" data-spacebetweenitems="10" data-itemsperview="auto">
                <div class="swiper-wrapper">
                      <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div>
                        <div class="slider-thumbs__caption caption"> 
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                 <a onclick="window.Android.startSharing('https://mycornershop.in/gomobile/assets/images/photos/image-6.jpg','These example sentences are selected automatically from various online news sources to reflect current usage of the word text.','img')" class="wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                               <%-- <a class="wbtn" href="whatsapp://send?text=The text to share!" data-action="share/whatsapp/share">Share via Whatsapp</a>--%>
                            </div>
                        </div>
                    </div>
                     <div class="swiper-slide slider-thumbs__slide slider-thumbs__slide--3">
                        <div class="slider-thumbs__image">
                            <a href="#">
                                <img class="modal-target" src="gomobile/assets/images/photos/image-6.jpg" alt="" title="" /></a>
                        </div> 
                        <div class="slider-thumbs__caption caption"> 
                            <div class="caption__content" style="text-align: center; background: #01ddac; border-radius: 10px; padding: 2px;">
                                 <a onclick="window.Android.startSharing('https://mycornershop.in/APP/sample.pdf','These example sentences are selected automatically from various online news sources to reflect current usage of the word text.','pdf')" class="wbtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share">
                                    <ion-icon name="logo-whatsapp"></ion-icon>
                                    Share</a>
                               <%-- <a class="wbtn" href="whatsapp://send?text=The text to share!" data-action="share/whatsapp/share">Share via Whatsapp</a>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination slider-thumbs__pagination"></div>
            </div>
            <div style="height: 100px;">
			
			</div>
        </div>




    </div>
    <!-- PAGE END -->

    <!-- Bottom navigation -->
    <div id="bottom-toolbar" class="bottom-toolbar">
        <div class="bottom-navigation">
            <div class="swiper-container-toolbar swiper-toolbar">
                <div class="bottom-navigation__pagination"></div>
                <div class="bottom-navigation__more">
                    <img src="gomobile/assets/images/icons/white/more.svg" alt="" title="" />
                </div>
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <ul class="bottom-navigation__icons">
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/home.svg" alt="" title="" /></a></li>
                            <li><a href="#" class="open-panel" data-panel="right" data-arrow="left">
                                <img src="gomobile/assets/images/icons/white/user.svg" alt="" title="" /></a></li>
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/blocks.svg" alt="" title="" /></a></li>
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/cart.svg" alt="" title="" /></a></li>
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/contact.svg" alt="" title="" /></a></li>

                        </ul>
                    </div>
                    <div class="swiper-slide">
                        <ul class="bottom-navigation__icons">
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/news.svg" alt="" title="" /></a></li>
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/photos.svg" alt="" title="" /></a></li>
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/video.svg" alt="" title="" /></a></li>
                            <li><a href="#">
                                <img src="gomobile/assets/images/icons/white/chat.svg" alt="" title="" /></a></li>
                            <li><a href="#" data-popup="social" class="open-popup">
                                <img src="gomobile/assets/images/icons/white/love.svg" alt="" title="" /></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Social Icons Popup -->
    <div id="popup-social"></div>

    <!-- Alert -->
    <div id="popup-alert"></div>



    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                
            </div>
            <div class="modal-body">
                <div class="preview-img">
                </div>
                
            </div>
            <div class="modal-footer">
                <a id="sharmodalbtn" href="#" class="button button--green button--full whatsappsharebtn" data-text="This is WhatsApp sharing example using link " data-action="share/whatsapp/share"> <ion-icon name="logo-whatsapp"></ion-icon> Share</a>
            </div>
        </div>

    </div>

</asp:Content>



