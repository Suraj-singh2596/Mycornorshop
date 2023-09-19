var DateNum = '';
var currentdate = "";
$(function () {
    //if (localStorage.getItem('table-one') != "") {
    //    BindDataofHomepage();
    //} else {
    bannersAndDelivery();
    //}

    //if (localStorage.getItem('category') != "") {
    //    BindCategories();
    //} else {
    categoryandothers();
    //}

    //if (localStorage.getItem('othercategory') != "") {
    //    BindOthercategory();
    //} else {
    Othercategory();
    //}





    var today = new Date();
    var year = today.getFullYear();
    var mes = today.getMonth() + 1;
    var dia = today.getDate();
    var dayname = today.getDay();
    DateNum = dia
    currentdate = dayname

    setTimeout(function () {
        $('#orderConfirmDiv').empty();
        getLatestOrders();
    }, 1500)



});
var entityMap = {
    '&': '',
    '<': '',
    '>': '',
    '"': '',
    "'": '',
    '/': '',
    '`': '',
    '=': ''
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'`=\/]/g, function (s) {
        return entityMap[s];
    });
}


function bannersAndDelivery() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Home.aspx/getalldataofhomepage",
        data: '{}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            if (data.d != '') {
                var ReturnData = data.d.split("~");
                localStorage.setItem('table-one', ReturnData[0]);
                localStorage.setItem('table-two', ReturnData[1]);
                localStorage.setItem('table-three', ReturnData[2]);
                localStorage.setItem('table-four', ReturnData[3]);
                localStorage.setItem('table-five', ReturnData[4]);
                BindDataofHomepage();
            }
        },
        complete: function () {
            $("#preload").hide();
        },
    })
}

function BindDataofHomepage() {
    var arry0 = localStorage.getItem('table-one'),
        arry1 = localStorage.getItem('table-two'),
        arry2 = localStorage.getItem('table-three'),
        arry3 = localStorage.getItem('table-four'),
        arry4 = localStorage.getItem('table-five');

    var table0 = '', table1 = '', table2 = '', table3 = '', table4 = '';

    var DeliveryCharges = "",
        DeliverAmount = "",
        DeliverySection = "",
        DeliverySections = "",
        BannerSection = "",
        Images = "",
        stealdealsection = "",
        steal_deal = "";

    if (arry0 != "") {
        table0 = JSON.parse(arry0);

    }
    if (arry1 != "") {
        table1 = JSON.parse(arry1);

    }
    if (arry3 != "") {
        table3 = JSON.parse(arry3);

    }



    if (table1[0].DELIVERY_CHARGES_ALWAYS != "Y") {
        if (table1[0].MINIMUM_AMOUNT != "0") {
            if (table0[0].TOTAL != "0") {
                if (parseFloat(parseFloat(table0[0].TOTAL) - parseFloat(table1[0].MINIMUM_AMOUNT)) >= 0) {
                    DeliveryCharges = "Free Delivery! you have achieved minimum order amount";
                    DeliverAmount = "Free";
                }
                else {
                    DeliveryCharges = "Add Rs " + parseFloat(parseFloat(table1[0].MINIMUM_AMOUNT) - parseFloat(table0[0].TOTAL)) + " to get the free delivery";
                    //DeliveryCharges = "Shop above Rs " + ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString() + " for free delivery";
                    DeliverAmount = table1[0].DELIVERY_CHARGES;
                }
            }
            else {
                DeliveryCharges = "Shop above Rs " + table3[0].MINIMUM_AMOUNT + " more for free delivery";
                DeliverAmount = table1[0].DELIVERY_CHARGES;
            }
        }
    }
    else {
        /* DeliveryCharges = "You will be charged Rs " + table1[0].DELIVERY_CHARGES + " extra for delivering the order";*/

        DeliveryCharges = "Delivery of goods is absolutly free on order above Rs. " + table1[0].MINIMUM_AMOUNT;

        DeliverAmount = table1[0].DELIVERY_CHARGES;
    }
    DeliverySection = "<div class=\" container\"><div class=\"container\"><div class=\"row\"><div class=\"col-6\"><div class=\"deliv_image\">" +
        "<img src =\"images/fast-free-delivery.jpg\"/> </div> </div> <div class=\"col-6\"> <div class=\"offertext\">" +
        "<h1 class=\"titletext\"></h1><label><span id=\"deliveryamount\">" + DeliveryCharges + "</span></label>" +
        "</div></div></div></div></div>";

    var total_steal_amount = parseFloat(parseFloat(table1[0].MAX_ORDER_AMOUNT) - parseFloat(table0[0].TOTAL));
    if (total_steal_amount <= 0) {
        total_steal_amount = 0;
    }

    var stealClass = "";
    //string steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + ds.Tables[1].Rows[0]["MAX_ORDER_AMOUNT"].ToString() +
    //    "<br><br>Add items worth Rs " + Convert.ToString(total_steal_amount) + " to your cart to qualify for steal deal";

    var steal_deal_line = "Add items worth Rs " + parseFloat(total_steal_amount) + " to your cart to qualify for steal deal <br/><br/>";
    if (table1[0].MAX_ORDER_AMOUNT == "0") {
        stealClass = "d-none";
        steal_deal_line = "yey! you have achieved minimum order amount";
    }
    if (total_steal_amount == 0) {
        stealClass = "d-none";
        steal_deal_line = "yey! you have achieved minimum order amount";
    }
    var Minimum_Amount_steal_Deal = "";
    Minimum_Amount_steal_Deal = "<div class=\" container\"><div class=\"container\"><div class=\"row\"><div class=\"col-12\"> " +
        "<div class=\"offertext\"><span id=\"minAmountStealDeal\" style=\"font-size:11px;font-weight:600;\">" + steal_deal_line + "</span>" +
        "</div></div></div></div></div>";
    DeliverySections = "<div class=\"container delivofr\"><div class=\"row\"><div class=\"col-sm-2\"></div>" +
        "<div class=\"col-sm-8\">" +
        "" + DeliverySection + "" +
        "</div></div><hr/><div class=\"row stealclass " + stealClass + "\"style=\"background: antiquewhite;\"><div class=\"col-sm-2\"></div>" + Minimum_Amount_steal_Deal +
        "</div></div>";



    if (arry2 != "") {
        table2 = JSON.parse(arry2);
        for (var i = 0; table2.length > i; i++) {
            var dis = "";
            var dis1 = "d-none";
            if (table2[i].EXISTS_QTY == "1") {
                dis1 = "";
                dis = "d-none";
            }



            var Date = DateNum;
            var Day = "ODD";
            if (parseFloat(parseFloat(Date) % 2) == 0) {
                Day = "EVEN";
            }
            var img = "";

            if (table2[i].IMAGE_PATH != "") {
                img = "../Menu_Pics/" + table2[i].IMAGE_PATH;

            }
            else {
                img = "images/Defaultimage.png";
            }

            if (Day == "ODD" && table2[i].ODDDAYS == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";



            }
            if (Day == "EVEN" && table2[i].EVENDAYS == "Y") {

                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            var weekDay = currentdate;
            if (weekDay == "Mon" && table2[i].MON == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            if (weekDay == "Tue" && table2[i].TUE == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            if (weekDay == "Wed" && table2[i].WED == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            if (weekDay == "Thu" && table2[i].THU == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            if (weekDay == "Fri" && table2[i].FRI == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            if (weekDay == "Sat" && table2[i].SAT == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }
            if (weekDay == "Sun" && table2[i].SUN == "Y") {
                steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + table2[i].RID + "' sdid = '" + table2[i].SDID + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
                    "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + table2[i].REGULAR_PRICE + "</strike><span style=\"font-weight:bold;\">&nbsp; " + table2[i].OFFER_PRICE + "</span><span class=\"offpercnt\">" + table2[i].PERCENT_OFF + "% off </span></div>" +
                    "<div class=\"itemname\">" + table2[i].NAME + "  " + table2[i].PORTION + "</div> <div class=\"itemqty\">1 Unit</div>" +
                    "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                    "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                    "</div> </div> </div> </div> <hr>";
            }


        }

        if (steal_deal != "") {
            stealdealsection = "<div  class=\"container\"  style=\"background:white; margin-top:10px; \"><label> Today's Steal Deal</label><div class=\"todaydeal mt-2\"><div class=\"container\">" +
                "<hr>" + steal_deal + "</div></div> </div>";
        }
    }



    if (arry4 != "") {
        table4 = JSON.parse(arry4);

        for (var i = 0; table4.length > i; i++) {
            Images = Images +
                "<div class=\"swiper-slide\">" +
                "<div class=\"items boxshadow\"><img style = \"width: 100%;\" src=\"../Menu_Pics/" + table4[i].IMAGE_URL + "\" /></div>" +
                "</div>";
        }
        if (Images != "") {
            BannerSection = "<div class=\"container containers\"><div class=\"swiper-container\"><div class=\"swiper-wrapper\">" + Images +
                "</div></div></div>";
        }
    }





    var orderConfirmbox = "<div class='container' id='orderConfirmDiv'></div>";

    var searchbar = "<div class=\"searchbox container\"><div class=\"row\"><div class=\"col-sm-12\"><div class=\"searcitembox boxshadow\" style=\"width:100%;display:flex\"><div style=\"width:10%;text-align:center;padding-top: 3px; font-size:14px;padding-left: 10px;\"><i class=\"fa fa-search\"></i></div>" +
        "<div  style=\"width:90%\"><input class=\"inputseacrh\" id=\"searchforitem\" type=\"text\" placeholder=\"Search here...\"/></div></div></div></div></div>";

    $("#section1").append(searchbar + BannerSection + orderConfirmbox + DeliverySections + stealdealsection)


    var swiper = new Swiper('.swiper-container', {
        scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
            autoplay: true,
            lazyLoad: true,
            responsiveClass: true,
            loop: true,
            margin: 5,
            stagePadding: 15,
            autoHeight: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
        },
        autoplay: { delay: 5000, }
    });

    $(".addcartbtn").click(function (e) {
        supermario();
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().find(".addplusminusbtn").removeClass("d-none");
        $(this).addClass('d-none');

        var SDID = $(this).parent().parent().parent().parent().parent().attr('sdid');
        var Flag = 'ADD';
        var Qty = '1';
        fnOrderPuchByStealDeal(SDID, Flag, Qty);
        showpopup('Added to cart');
    })
    $(".decreaseqty1").click(function (e) {
        supermario();
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().parent().parent().find(".addcartbtn").removeClass("d-none");
        $(this).parent().parent().addClass("d-none")

        var SDID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('sdid');
        var Flag = 'DELETE';
        var Qty = '0';
        fnOrderPuchByStealDeal(SDID, Flag, Qty);
    })
    $(".increaseqty1").click(function (e) {
        supermario();
        e.preventDefault();
        e.stopImmediatePropagation();
        showpopup("You cannot add more than 1 QTY")
    })
    $('#searchforitem').autocomplete({
        source: function (request, response) {
            var Search_Value = $.trim($('#searchforitem').val());
            if (Search_Value.length >= 2) {
                $('#searchResult').empty();
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Home.aspx/fnGetAllProductsByCategory",
                    data: '{Search_Value: "' + Search_Value + '"}',
                    dataType: "json",
                    success: function (data) {
                        response(data.d);
                        var body = $("html, body");
                        body.stop().animate({ scrollTop: 0 }, 500, 'swing', function () {

                        });
                        $('.itemListLi').click(function (e) {
                            e.stopImmediatePropagation();

                            $("#preload").show();
                            setCookie('cgid', $(this).attr('cgid'), 365);
                            setCookie('mcid', $(this).attr('mcid'), 365);
                            setCookie('item_name', $.trim($('#searchforitem').val()), 365);
                            setCookie('tag_name', '', 365);
                            setCookie('offer_id', '', 365);
                            setCookie('category_name', $(this).attr('cg_name'), 365);
                            window.location.href = '../Items/Items.aspx';

                        })
                    }
                })
            }
            else if (Search_Value.length = 0) {
                $('#searchResult').empty();
            }
            else {
                $('#searchResult').empty();
            }
        },

        create: function (event, ui) {
            $(this).data('ui-autocomplete')._renderItem = function (ul, item) {


                return $('<li>').append('<div class="row itemListLi" cg_name="' + item.CG_NAME + '"  mcid="' + item.MCID + '" cgid="' + item.CGID + '"><div class="col-2" ><img class="w-100" src="' + '/Menu_Pics/' + item.IMAGE_URL + '" alt="img">' +
                    '</div><div class="col-10"><div class="row"><div class="col-12"><span>' + $.trim($('#searchforitem').val()) + ' in <br>' + item.Option_Name + '</span></div></div>' +
                    '</div></div>').appendTo('#searchResult');


            };
        },
        select: function (event, ui) {

            event.preventDefault();



        }

    });

    $(".stealdeal").click(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        var sdid = $(this).attr('sdid');
        var name = $(this).find('.itemname').text();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Home.aspx/encryptData",
            data: '{value:"' + sdid + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    location.href = '../Product/' + escapeHtml(name.replaceAll(' ', '-')) + '?q=' + data.d + '&type=sd';
                }
            }
        });


    });

}

function categoryandothers() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Home.aspx/getAllCategories",
        data: '{}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            if (data.d != '') {
                //var ReturnData = data.d.split("~");
                //localStorage.setItem('category', ReturnData[0]);
                //localStorage.setItem('category-two', ReturnData[1]);
                //localStorage.setItem('category-three', ReturnData[2]);
                //localStorage.setItem('category-four', ReturnData[3]);

                var table1 = JSON.parse(data.d).table,
                    table2 = JSON.parse(data.d).table1,
                    table3 = JSON.parse(data.d).table2,
                    table4 = JSON.parse(data.d).table3,
                    table5 = JSON.parse(data.d).table4;

                BindCategories(table1, table2, table3, table4, table5);
            }
        },
        complete: function () {
            $("#preload").hide();
        },
    })
}


function BindCategories(table1, table2, table3, table4, table5) {
    var arr0 = table1,// localStorage.getItem('category'),
        arr1 = table2,// localStorage.getItem('category-two'),
        arr2 = table3,//localStorage.getItem('category-three'),
        arr3 = table4,//localStorage.getItem('category-four');
        arr4 = table5;
    var tabl = '', tabl1 = '', tabl2 = '', tabl3 = '', tabl4 = '';


    var Category_loop = "", Offer_loop = "", Offer_loop1 = "", Shop_By_Category = "", Offers = "",
        Best_Special = "", Special_Deals = "", Special_Deals_loop = "", Shop_By_Categories = "";


    if (arr0 != "" && arr0 != null) {
        tabl = arr0;
        tabl4 = arr4;

        if (tabl4 != "") {
            for (var k = 0; tabl4.length > k; k++) {
                Category_loop = '';
                for (var i = 0; tabl.length > i; i++) {
                    if (tabl4[k].mainid == tabl[i].maincategoryid) {
                        var img = "";
                        if (tabl[i].image_url != "") {
                            img = "https://mycornershop.in/Menu_Pics/" + tabl[i].image_url;
                        }
                        else {
                            img = "https://mycornershop.in/Menu_Pics/Category1-removebg-preview.png";
                        }
                        Category_loop = Category_loop + "<li class=\"cards_item call_item\" cgid='" + tabl[i].cgid + "' rid='" + tabl[i].rid + "'>" +
                            "<a rid='" + tabl[i].rid + "' cgid='" + tabl[i].cgid + "' mcid='" + tabl[i].mcid + "' href=\"Javascript:void(0)\"  class=\"openproducts\"  >" +
                            "<div class=\"card boxshadow " + tabl[i].bg_color + "\"style=\"border-radius: 5px!important;\"><div class=\"card_image\">" +
                            "<img src =" + img + ">" +
                            "</div> <div class=\"card_content\">" + tabl[i].cg_name + "</div></div></a></li>";
                    }

                }
                if (Category_loop != '') {
                    Shop_By_Categories = Shop_By_Categories + "<div class='maincategorybox'><label style='margin-top: -17px;\
        position: absolute;background: white;padding: 0px 10px; '>"+ tabl4[k].name + "</label><ul style='margin-top: 15px;' class=\"cards\">" +
                        Category_loop +
                        "</ul></div>";
                }



            }
        }
        else {
            for (var i = 0; tabl.length > i; i++) {
                var img = "";
                if (tabl[i].image_url != "") {
                    img = "https://mycornershop.in/Menu_Pics/" + tabl[i].image_url;
                }
                else {
                    img = "https://mycornershop.in/Menu_Pics/Category1-removebg-preview.png";
                }
                Category_loop = Category_loop + "<li class=\"cards_item call_item\" cgid='" + tabl[i].cgid + "' rid='" + tabl[i].rid + "'>" +
                    "<a rid='" + tabl[i].rid + "' cgid='" + tabl[i].cgid + "' mcid='" + tabl[i].mcid + "' href=\"Javascript:void(0)\"  class=\"openproducts\"  >" +
                    "<div class=\"card boxshadow " + tabl[i].bg_color + "\"style=\"border-radius: 5px!important;\"><div class=\"card_image\">" +
                    "<img src =" + img + ">" +
                    "</div> <div class=\"card_content\">" + tabl[i].cg_name + "</div></div></a></li>";

            }

            Shop_By_Categories = "<div class='maincategorybox'><ul style='margin-top: 15px;' class=\"cards\">" +
                Category_loop +
                "</ul></div>";
        }


    }

    if (arr1 != "" && arr1 != null) {
        tabl1 = arr1;
        for (var i = 0; tabl1.length > i; i++) {

            var img = "";
            if (tabl1[i].offer_image != "") {
                img = "background-image:url(Assest/images/Offerimage/" + tabl1[i].offer_image + ");";
            }

            Offer_loop1 = Offer_loop1 + " <div class=\"story-item item boxshadow\" style=" + img + ">" +
                "<div class=\"row\"><div class=\"col-5 pr-0\"><div class=\"offeritempic\"></div></div><div class=\"col-7 pl-0\"><a offer_id = '" + tabl1[i].oid + "' class=\"offerRedirect\"><div class=\"overlay \">" +
                "<h5>" + tabl1[i].offer_name + "</h5><hr /><p style=\"font-size: 8px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;\">" + tabl1[i].offer_items + "</p>" +
                "<p style=\"font-size: 9px; margin-bottom: 0px;\">Get upto<b style=\"font-size: 20px;\">" + tabl1[i].percent_off + "%</b> off</p>" +
                "<a class=\"btn ordernow \" style=\"padding: 0px;\">Order now</a></div></a></div></div></div> ";


        }
        var offerhide = "";
        if (Offer_loop1 != "") {
            if (getCookie('rid') == "48" || getCookie('rid') == "51") {
                offerhide = "d-none";
            }
            Best_Special = "<section class=\"section-item " + offerhide + "\"><div class=\" card-body card-bodypadding card1\" style=\"margin-top: -15px;\">" +
                "<label>Best Offer</label><div id=\"owl-carosel4\" class=\"story-doubles owl-carousel owl-theme\">" + Offer_loop1 +
                "</div></div></section>";

        }
    }
    //tag
    if (arr3 != "" && arr3 != null) {
        tabl3 = arr3;
        for (var i = 0; tabl3.length > i; i++) {

            var img = "";
            if (tabl3[i].tag_image != "") {
                img = "background-image:url(Assest/images/" + tabl3[i].tag_image + ");";
            }
            else {
                img = "";
            }
            Offer_loop = Offer_loop + "<a class=\"redirectbyTagName\" tag_name ='" + tabl3[i].tag_name + "' > <div class=\"story-item item\" style='" + img + "'>" +

                "<span>" + tabl3[i].tag_name + "<span>" +
                "</div> </a>";

        }

        if (Offer_loop != "") {
            Offers = " <section class=\"section-item\"style=\"padding-top:15px; padding-bottom:15px; margin-top:15px; margin-bottom:15px; background:#dbe2e4\">" +
                " <div class=\" card-body card-bodypadding card1\">" +
                " <div id =\"owl-carosel2\" class=\"story-double owl-carousel owl-theme\">" + Offer_loop + "</div></div></section>";
        }
    }


    if (arr2 != "" && arr2 != null) {
        tabl2 = arr2;
        for (var i = 0; tabl2.length > i; i++) {
            var btnDisplay = "";
            var btnDisplay1 = "style=\"display:none;\"";
            var Qty = "1";
            if (tabl2[i].exists_order_qty != "0") {
                btnDisplay = "style=\"display:none;\"";
                btnDisplay1 = "";
                Qty = tabl2[i].exists_order_qty;
            }

            var img = "";

            if (tabl2[i].image_path != "") {
                img = "https://mycornershop.in/Menu_Pics/" + tabl2[i].image_path;
            }
            else {
                img = "https://mycornershop.in/images/Defaultimage.png";
            }

            Special_Deals_loop = Special_Deals_loop + "<div class=\"story-item item\" rid='" + tabl2[i].rid + "' deal_id='" + tabl2[i].deal_id + "'><div class=\"card boxshadow align-items-center\">" +   //loop begin here
                "<img class=\"card-img-top itemimage\" style=\"height: 65px;\" src=\"" + img + "\" />" +  //Image path for deal
                "<div class=\"itemdetails text-left p-2\"><div class=\"price\">&#8377<s style=\"font-weight:300;\">" + tabl2[i].general_price + "</s>  " + tabl2[i].offer_price + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pan style=\"color:red;\">" + tabl2[i].percent_off + "% off</pan></div>" +  //Price for the deal
                "<div class=\"detail\">" + tabl2[i].deal_name1 + "</div></div><div class=\"card-body p-0\">" +  //name of the product
                "<div class=\"addbtn\" " + btnDisplay + " >Add +</div><div class=\"additem\" " + btnDisplay1 + "><div class=\"qtySelector text-center\">" +
                "<i class=\"fa fa-minus decreaseQty btnstyle\"></i><input readonly type=\"text\" class=\"qtyValue\" value=" + Qty + " />" +
                "<i class=\"fa fa-plus increaseQty btnstyle\"></i></div></div></div></div></div>"; //loop end here


        }
    }
    if (Special_Deals_loop != "") {
        Special_Deals = "<section class=\"section-item\"><div class=\"card-body card-bodypadding card1\">" +
            "<label>Special Deal</label>" + //Deal Header
            "<div id =\"owl-carosel3\" class=\"story-Grof owl-carousel owl-theme\">" + Special_Deals_loop +

            "</div></div></section>";
    }

    if (Shop_By_Categories != "") {
        var textis = "Shop by Category";
        if (getCookie('rid') == "52") {
            textis = "Vidhi Puja by Category";
        }

        Shop_By_Category = "<section class=\"section-item\" style=\"background:white; padding-bottom:15px;\"><div class=\"card-body card-bodypadding\">" +
            "<label style=''>" + textis +"</label><div style='padding: 5px;' class=\"main  w-100\">" + Shop_By_Categories + "</div></div></section>";
    }

    var addtionaltiles = "<section class=\"section-item\"><div id=\"cat_sub\" class=\" card-body card-bodypadding card1\" style=\"margin-top: -15px;\"></div></section>";

    $("#containerSection").append(Special_Deals + Best_Special + Shop_By_Category + Offers + addtionaltiles);

    $('#owl-carosel2').owlCarousel({
        center: false,
        items: 1,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 10,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false
        
    });
    $('#owl-carosel3').owlCarousel({
        center: false,
        items: 3,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 10,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false,
        responsive: {
            0: {
                items: 2
            },

            600: {
                items: 4
            },

            1024: {
                items: 5
            },

            1366: {
                items: 6
            }
        }
    });

    $('#owl-carosel4').owlCarousel({
        center: false,
        items: 3,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 10,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false,
        responsive: {
            0: {
                items: 1
            },

            600: {
                items: 1
            },

            1024: {
                items: 3
            },

            1366: {
                items: 4
            }
        }
    });

    var RID = $('#RID').val();

    $(".addbtn").click(function (e) {
        supermario()
        e.preventDefault();
        e.stopImmediatePropagation();
        var current = $(this);
        current.hide();
        var plusminusbtn = current.parent().find(".additem")
        plusminusbtn.show();

        var Deal_ID = $(this).parent().parent().parent().attr('deal_id');
        var Flag = 'ADD';
        var Qty = '1';
        setOrderByDeal(Deal_ID, Flag, Qty);
        showpopup('Added to cart');
    })

    var minVal = 1, maxVal = 20; // Set Max and Min values
    // Increase product quantity on cart page
    $(".increaseQty").on('click', function (e) {
        supermario()
        e.preventDefault();
        e.stopImmediatePropagation();
        var $parentElm = $(this).parents(".qtySelector");

        $(this).addClass("clicked");
        setTimeout(function () {
            $(".clicked").removeClass("clicked");
        }, 100);
        var value = $parentElm.find(".qtyValue").val();
        if (value < maxVal) {
            value++;
        }
        $parentElm.find(".qtyValue").val(value);
        var Deal_ID = $(this).parent().parent().parent().parent().parent().attr('deal_id');
        var Flag = 'SUB';
        var Qty = value;
        setOrderByDeal(Deal_ID, Flag, Qty);
    });
    // Decrease product quantity on cart page
    $(".decreaseQty").on('click', function (e) {
        supermario()
        e.preventDefault();
        e.stopImmediatePropagation();
        var $parentElm = $(this).parents(".qtySelector");
        var addbtnshow = $(this).parents(".additem");
        var addbtn2show = $(this).parent().parent().parent().find(".addbtn");
        $(this).addClass("clicked");
        setTimeout(function () {
            $(".clicked").removeClass("clicked");
        }, 100);
        var value = $parentElm.find(".qtyValue").val();
        if (value > 1) {
            value--;
            var Flag = 'SUB';
        }
        else {
            var Flag = 'DELETE';
            addbtnshow.hide();
            addbtn2show.show();
        }
        $parentElm.find(".qtyValue").val(value); var Deal_ID = $(this).parent().parent().parent().attr('deal_id');
        var Deal_ID = $(this).parent().parent().parent().parent().parent().attr('deal_id');
        var Qty = value;
        setOrderByDeal(Deal_ID, Flag, Qty);

    });

    $('.offerRedirect').click(function (e) {
        e.stopImmediatePropagation();
        $("#preload").show();
        setCookie('Offer_name', 'Best Offers', 365);
        setCookie('cgid', '', 365);
        setCookie('mcid', '', 365);
        setCookie('offer_id', $(this).attr('offer_id'), 365);
        setCookie('item_name', '', 365);
        setCookie('tag_name', '', 365);
        setCookie('category_name', $(this).parent().find('h5').text(), 365);
        window.location.href = '../Items/Items.aspx';
    })
    $('.openproducts').click(function (e) {
        e.stopImmediatePropagation();
        $("#preload").show();
        setCookie('cgid', $(this).attr('cgid'), 365);
        setCookie('mcid', $(this).attr('mcid'), 365);
        setCookie('tag_name', '', 365);
        setCookie('item_name', '', 365);
        setCookie('offer_id', '', 365);
        setCookie('category_name', $(this).find('.card_content').text(), 365);
        window.location.href = '../Items/Items.aspx';
    })
    $('.redirectbyTagName').click(function (e) {
        e.stopImmediatePropagation();
        $("#preload").show();
        setCookie('cgid', '', 365);
        setCookie('mcid', '', 365);
        setCookie('tag_name', $(this).attr('tag_name'), 365);
        setCookie('item_name', '', 365);
        setCookie('offer_id', '', 365);
        setCookie('category_name', $(this).attr('tag_name'), 365);

        window.location.href = '../Items/Items.aspx';
    })
    $(".itemimage,.itemdetails").click(function (e) {

        e.preventDefault();
        e.stopImmediatePropagation();
        var deal_id = $(this).parent().parent().attr('deal_id');
        var name = $(this).parent().find('.detail').text();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Home.aspx/encryptData",
            data: '{value:"' + deal_id + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    location.href = '../Product?q=' + data.d + '&type=dl';
                }
            }
        });
    });
}


var count = 0;
$(window).scroll(function () {

    var win_height = $(this).height();
    var cur_height = $(this).scrollTop();
    var final_height = win_height + cur_height;
    var doc_height = 1200;

    if ($('#cat_sub').children().length == 0) {
        count = count + 1;
        if (count <= 3) {
            Othercategory();
        }
    }

});


function Othercategory() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Home.aspx/getotherCategories",
        data: '{}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            if (data.d != '') {
                //var ReturnData = data.d.split("~");
                //BindOthercategory(ReturnData[0], ReturnData[1]);
                BindOthercategory(JSON.parse(data.d).table, JSON.parse(data.d).table1,)
            }
        },
        complete: function () {
            $("#preload").hide();
        },
    })
}

function BindOthercategory(table1, table2) {
    if (table1 != "" && table2 != "") {

        //var datatables1 = JSON.parse(table1);
        //var datatables2 = JSON.parse(table2);
        var datatables1 = table1;
        var datatables2 = table2;
        var Content = "";
        var MCID = "";

        var CGID = "";
        var CG_Name = "";
        for (var i = 0; i < datatables2.length; i++) {
            var Menu_Category = "";
            for (var j = 0; j < datatables1.length; j++) {
                var image = "src=\"https://mycornershop.in/Menu_Pics/demopicture.png\"";
                if (datatables1[i].image_url != "") {
                    image = "src=\"https://mycornershop.in/Menu_Pics/" + datatables1[j].image_url + "\"";
                }

                if (datatables2[i].cgid == datatables1[j].cgid) {
                    Menu_Category = Menu_Category + "<div class=\"story-item item\"><a class=\"redirectBymcid\" cname='" + datatables1[j].cg_name + "' cgid='" + datatables1[j].cgid + "' mcid='" + datatables1[j].mcid + "'>" +
                        "<div class=\"card\"><div class=\"_addtinlimg\"><img style=\"margin-left: 15px;\" " + image + " alt=\"\"/>" +
                        "</div><div class=\"_additiontext\">" + datatables1[j].category_name + "</div></a></div></div>";
                }
            }
            Content = Content + "<div class=\"additionalitm\"><div class=\"ovrl\">" +
                "<label style=\"color: #3c7f70;font-size:17px;\">" + datatables2[i].cg_name + "</label><div class=\"story-doubles2 owl-carousel owl-carosel5 owl-theme\">" +
                Menu_Category +
                "</div></div></div>";
        }


        $('#cat_sub').empty();

        $('#cat_sub').append(Content);
        $('.owl-carosel5').owlCarousel({
            center: false,
            items: 3,
            lazyLoad: true,
            responsiveClass: true,
            loop: false,
            margin: 10,
            stagePadding: 15,
            autoHeight: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
            nav: false,
            responsive: {
                0: {
                    items: 3
                },

                600: {
                    items: 3
                },

                1024: {
                    items: 3
                },

                1366: {
                    items: 6
                }
            }
        });

        $('.redirectBymcid').click(function (e) {
            e.stopImmediatePropagation();
            $("#preload").show();
            setCookie('cgid', $(this).attr('cgid'), 365);
            setCookie('mcid', $(this).attr('mcid'), 365);
            setCookie('tag_name', '', 365);
            setCookie('item_name', '', 365);
            setCookie('offer_id', '', 365);
            setCookie('category_name', $(this).attr('cname'), 365);
            window.location.href = '../Items/Items.aspx';
        });
    }

}

function showpopup(msg) {
    $('#Alert_btn').attr("data-message", msg)

    $('#Alert_btn').trigger('click');
}


if (!!window.performance && window.performance.navigation.type === 2) {
    console.log('Reloading');
    window.location.reload();
}
$(document).ready(function () {
    var swiper = new Swiper('.swiper-container', {
        scrollbar: {
            el: '.swiper-scrollbar',
            hide: true,
            autoplay: true,
            lazyLoad: true,
            responsiveClass: true,
            loop: true,
            margin: 5,
            stagePadding: 15,
            autoHeight: true,
            autoplayTimeout: 7000,
            smartSpeed: 800,
        },
        autoplay: { delay: 5000, }
    });

    $('#owl-carosel2').owlCarousel({
        center: false,
        items: 3,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 5,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false,
        responsive: {
            0: {
                items: 1
            },

            600: {
                items: 1
            },

            1024: {
                items: 3
            },

            1366: {
                items: 4
            }
        }
    });
    $('#owl-carosel3').owlCarousel({
        center: false,
        items: 3,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 10,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false,
        responsive: {
            0: {
                items: 2
            },

            600: {
                items: 4
            },

            1024: {
                items: 5
            },

            1366: {
                items: 6
            }
        }
    });

    $('#owl-carosel4').owlCarousel({
        center: false,
        items: 3,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 10,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false,
        responsive: {
            0: {
                items: 1
            },

            600: {
                items: 1
            },

            1024: {
                items: 3
            },

            1366: {
                items: 4
            }
        }
    });


    $('#owl-carosel5').owlCarousel({
        center: false,
        items: 3,
        lazyLoad: true,
        responsiveClass: true,
        loop: false,
        margin: 10,
        stagePadding: 15,
        autoHeight: true,
        autoplayTimeout: 7000,
        smartSpeed: 800,
        nav: false,
        responsive: {
            0: {
                items: 3
            },

            600: {
                items: 3
            },

            1024: {
                items: 3
            },

            1366: {
                items: 4
            }
        }
    });
});


$(document).ready(function () {

    $('#Mycart2').html(getCookie('item_count') || '');


    var User_ID = getCookie('user_id');
    if (User_ID == "") {
        on();
    }
    else {
        off();
    }

});
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

$(".walletbtn").click(function () {
    if ($(".cardatmcls").hasClass("atmcard")) {
        $(".cardatmcls").removeClass("atmcard")
        $(".cardatmcls").addClass("atmcardopen")


    } else {
        $(".cardatmcls").addClass("atmcard")
        $(".cardatmcls").removeClass("atmcardopen")
        $("#Layer_1 path").attr('fill', 'gray');

    }
});

function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}

$('#sendOTP').click(function (e) {
    e.stopImmediatePropagation();
    var Mobile = $.trim($('#mNumber').val());
    if (Mobile.length != 10) {
        showpopup('Please enter 10 digit mobile number');
        $('#mNumber').focus();
    }
    else {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Home.aspx/sendOTP",
            data: '{Mobile: "' + Mobile + '"}',
            beforeSend: function () {
                $("#preload").show();
            },
            dataType: "json",
            success: function (data) {
                showpopup('OTP sent successfully');
                $('#sendOTP').attr('disabled', true);
                $('#sendOTP').val('Resend OTP after 30 Seconds');
                $('#mNumber').attr('readonly', 'readonly');
                $('#OTP').removeClass('d-none');

                startTimer();
            },
            complete: function () {
                $("#preload").hide();
            },
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
    var nextElem = $('#sendOTP');
    var duration = nextElem.val();
    var a = 30;
    var seconds = 30;
    setInterval(function () {
        seconds--;
        if (seconds >= 0) {
            nextElem.html('Resend OTP after ' + toTimeString(seconds) + ' Seconds');
        }
        if (seconds === 0) {
            $('#sendOTP').attr('disabled', false);
            nextElem.html('Resend OTP');
            clearInterval(seconds);
        }
    }, 1000);
}
$('#Login').click(function (e) {
    e.stopImmediatePropagation();
    var Mobile = $.trim($('#mNumber').val());
    var OTP = $.trim($('#OTP').val());
    if ($.trim($('#OTP').val()).length == 4) {
        verifyOTP(Mobile, OTP);
    }
})

function verifyOTP(Mobile, OTP) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Home.aspx/generateUserLogin",
        data: '{Mobile: "' + Mobile + '",OTP: "' + OTP + '"}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            var current = data.d;
            current = current.split('|');
            if (current[0] == "N") {
                showpopup('Please enter correct OTP')
            }
            else {
                window.location.href = current[1];
            }
        },
        complete: function () {
            $("#preload").hide();
        },
    })
}


$("#Notif_seenBtn").click(function (e) {
    e.stopImmediatePropagation();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Home.aspx/Fn_updateSeenFlag",
        data: '{}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            location.href = "../Components/Notifications.aspx";
        },
        complete: function () {
            $("#preload").hide();
        },
    })
})




function setOrderByDeal(Deal_ID, Flag, Qty) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnOrderPuchByDeal",
        data: '{ Deal_ID: "' + Deal_ID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',
        dataType: "json",
        success: function (data) {

            var data_split = data.d;
            data_split = data_split.split('|');
            $('#Mycart2').html('');
            $('#Mycart2').html(data_split[0]);

            var stealClass = "";
            var minus = parseFloat(data_split[5]) - parseFloat(data_split[1]);
            var steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + data_split[5] +
                "<br><br>Add items worth Rs " + minus + " to your cart to qualify for steal deal";

            if (data_split[5] == "0") {
                stealClass = "d-none";
                steal_deal_line = "yey! you have achieved minimum order amount";
            }
            if (minus <= 0) {
                stealClass = "d-none";
                steal_deal_line = "yey! you have achieved minimum order amount";
            }
            $('.stealclass').removeClass('d-none');
            $('.stealclass').addClass(stealClass);
            $('#minAmountStealDeal').html(steal_deal_line);

            if (data_split[0] == "0") {
                $('#Mycart2').addClass('d-none');
            }
            else {
                $('#Mycart2').removeClass('d-none');


                $('#deliveryamount').empty();
                if (data_split[3] == "X") {
                    $('#deliveryamount').text('Add Rs ' + (parseInt(data_split[4]) - parseInt(data_split[1])) + ' to get the free delivery');
                }
                else if (data_split[3] == "N") {
                    $('#deliveryamount').text('Yey! you will get free delivery');
                }
                else if (data_split[3] == "Y") {
                    $('#deliveryamount').text('You will be charged Rs ' + data_split[2] + ' extra for this order');
                }
                else {

                }
            }

        },
        error: function (e) {
            alert(e.statusText);
        }
    })
}


function supermario() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    if (/android/i.test(userAgent)) {
        navigator.vibrate([215,])
    }
}

function fnOrderPuchByStealDeal(SDID, Flag, Qty) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnOrderPuchByStealDeal",
        data: '{SDID: "' + SDID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',

        dataType: "json",
        success: function (data) {

            var data_split = data.d;
            data_split = data_split.split('|');
            $('#Mycart2').html('');
            $('#Mycart2').html(data_split[0]);
            var stealClass = "";
            var minus = parseFloat(data_split[5]) - parseFloat(data_split[1]);
            //var steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + data_split[5] +
            //    "<br><br>Add items worth Rs " + minus + " to your cart to qualify for steal deal";

            var steal_deal_line = " Add items worth Rs " + minus + " to your cart to qualify for steal deal<br/><br/>";

            if (data_split[5] == "0") {
                stealClass = "d-none";
                steal_deal_line = "Free Delivery! you have achieved minimum order amount";
            }
            if (minus <= 0) {
                stealClass = "d-none";
                steal_deal_line = "Free Delivery! you have achieved minimum order amount";
            }
            $('.stealclass').removeClass('d-none');
            $('.stealclass').addClass(stealClass);
            $('#minAmountStealDeal').html(steal_deal_line);
            if (data_split[0] == "0") {
                $('#Mycart2').addClass('d-none');
            }
            else {
                $('#Mycart2').removeClass('d-none');

                //$('#Mycart').append("<a href=\"../cart.aspx?rid=" + RID + " \" class=\"float\">" +
                //    "<img class=\"my-float\" src=\"images/cart%20(2).png\" /><div class=\"counts\">" + data_split[0] + "</div> </a>");

                $('#deliveryamount').empty();
                if (data_split[3] == "X") {
                    $('#deliveryamount').text('Add Rs ' + (parseInt(data_split[4]) - parseInt(data_split[1])) + ' to get the free delivery');
                }
                else if (data_split[3] == "N") {
                    $('#deliveryamount').text('Free Delivery! you have achieved minimum order amount');
                }
                else if (data_split[3] == "Y") {
                    $('#deliveryamount').text('You will be charged Rs ' + data_split[2] + ' as delivery charges');
                }
                else {

                }

            }

        },

        error: function (e) {
            showpopup(e.statusText);
        }
    })
}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getConfirmationMsg(HeaderId) {
    var url = link + "/home.aspx/getConfirmationMsg";
    var data = JSON.stringify({ HeaderId: HeaderId });
    var Result = doAjax(url, data);
    if (Result != '') {
        var All = Result.split('~');
        var urlLink = link + '/Components/scheduler.aspx';
        var Msg = "<div class='row'><div class='col-sm-12' style='padding-left: 0;padding-right: 0;'>" +
            "<div class='orderconfirmbox' style='padding: 10px;margin-top: 10px;background: #ffffff;text-align: center;border: 1px solid #e9e9e9;border-radius: 5px;'><p class='mb-0'>" + All[0] + "</p><div style='text-align:right;'><a href='" +
            urlLink + "' style='padding: 5px 15px;border-radius: 18px;color: white; width:80px;' class='btnstyle'>View Order</a></div></div></div></div>";
         
        var newmsg = "<div class='row'><div class='col-sm-12'>" +
            "<div class='orderconfirmbox' style='padding: 10px;margin-top: 10px;background: #ffffff;text-align: center;border: 1px solid #e9e9e9;border-radius: 5px;'><img src='/images/checkedicon.png'/><p class='mb-0'>" + All[0] + " <a href='" + urlLink + "'>click for view order</a></p><div style='text-align:right;'><a href='" +
            urlLink + "' style='padding: 5px 15px;border-radius: 18px;color: white; width:80px;' class='btnstyle d-none'>View Order</a></div></div></div></div>";


        $('#orderConfirmDiv').append(newmsg);
    }
}

function getLatestOrders() {
    var url = link + "/home.aspx/getLatestOrders";
    var data = {};
    var jsonResult = doAjax(url, data);
    if (jsonResult != '') {
        var Result = JSON.parse(jsonResult).table;
        for (var i = 0; i < Result.length; i++) {
            getConfirmationMsg(Result[i].HEADER_ID);
        }
    }
}

var link = window.location.origin;

function doAjax(url, params, method) {
    var Result = "";
    $.ajax({
        'async': false,
        url: url,
        type: method || 'POST',
        contentType: "application/json",
        dataType: 'json',
        data: params,
        success: function (data) {
            Result = data.d;
        },
        error: function (jqXHR, exception) {
            if (jqXHR.responseText.indexOf('session') > -1) {
                Logout();
            }
            else {
                if (jqXHR.status === 0) {
                    alert('Not connect.\n Verify Network.');
                } else if (jqXHR.status == 404) {
                    alert('Requested page not found. [404]');
                } else if (jqXHR.status == 500) {
                    alert('Internal Server Error [500].');
                } else if (exception === 'parsererror') {
                    alert('Requested JSON parse failed.');
                } else if (exception === 'timeout') {
                    alert('Time out error.');
                } else if (exception === 'abort') {
                    alert('Ajax request aborted.');
                } else {
                    alert('Uncaught Error.\n' + jqXHR.responseText);
                }
            }
        }

    });
    return Result;
}
