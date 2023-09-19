var id = '';
var type = '';
$(function () {
    var getUrlParameter = function getUrlParameter(sParam) {
        var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            }
        }
    };
    id = getUrlParameter('q');
    type = getUrlParameter('type');
    GetProductDetails(id, type);
    

});
function showpopup(msg) {
    $('#Alert_btn').attr("data-message", msg)
    $('#Alert_btn').trigger('click');
}

function GetProductDetails(menuid, urltype) {
     $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Components/product_details.aspx/getcompleteproductdetails",
        data: '{menuid:"' + id + '",urltype:"' + type + '"}',
        dataType: "json",
        success: function (data) {
            if (data.d != '') {
                //localStorage.setItem('productDetails', data.d);
                if (urltype == "sd") {
                    BindProductdata(JSON.parse(data.d).table);
                } else if (urltype == "dl") {
                    BindProductdata2(JSON.parse(data.d).table);
                } else if (urltype == "ofr") {
                    BindProductdata3(JSON.parse(data.d).table);
                }
                else if (urltype == "Gn") {
                    BindProductdata4(JSON.parse(data.d).table);
                }
                
            }
        }
    });
}

function BindProductdata(table) {
    var data = table;// localStorage.getItem('productDetails');

    if (data != "") {
        var details =  data;
    }

    var btnDisplay = "";
    var btnDisplay1 = "style=\"display:none;\"";
    var Qty = "1";
    if (details[0].exists_order_qty != "0") {
        btnDisplay = "style=\"display:none;\"";
        btnDisplay1 = "";
        Qty = details[0].exists_order_qty;
    }

    var notavailablebox = "", hidebtn = "";
    if (details[0].item_availability != "Y") {
        notavailablebox = "<span class=\"notavailable\" style=\"background:antiquewhite;padding:9px;font-size:11px;border-radius:5px;\">out of stock</span >";
        hidebtn = "d-none";
    }

    var card = '<div class="card itemcard p-2"><div class="row"><div class="col-sm-6 col-md-6"><div class="container">' +
        '<div class="row"><div class="product_title"><h5>' + details[0].percent_off+'% off</h5></div></div></div><div class="Productimagebox">' +
        '<div class="swiper-container"><div class="swiper-wrapper"><div class="swiper-slide"><img src="../Menu_Pics/' + details[0].image_path+'" />' +
        '</div><div class="swiper-slide"><img src="../Menu_Pics/' + details[0].image_path +'" /></div><div class="swiper-slide">' +
        '<img src="../Menu_Pics/' + details[0].image_path + '" /></div><div class="swiper-slide"><img src="../Menu_Pics/' + details[0].image_path +'" />' +
        '</div><div class="swiper-slide"><img src="../Menu_Pics/' + details[0].image_path +'" /></div></div><div class="swiper-pagination"></div></div>' +
        '<hr /></div></div><div class="col-sm-6 col-md-6"><div class="container"><div class="row"><div class="productName">' +
        '<strong>' + details[0].name + '</strong></div></div><div class="row"><div class="productprice"><label>Product MRP: <strike>' + details[0].regular_price + '</strike> <strong>' + details[0].offer_price +'</strong></label>' +
        '<p>(Inclusive of all taxes)</p></div></div></div><div class="container mt-3"><div class="row"><div class="col-6">' +
        '<div class="row"><div class="col-12"><p>Qty</p></div></div><div ' + btnDisplay + ' class="qtyaddbtn ' + hidebtn+'"><a class="addbtnss">Add <i class="fa fa-plus-circle"></i></a>' +
        '</div>' + notavailablebox +'<div class="qtybtns" ' + btnDisplay1 +'><span class="qtyminusbtn"><i class="fa fa-minus-circle fa-2x"></i></span><span class="qtynumber">' +
        '<input type="text" class="qtyValue" value="' + Qty+'" /></span><span class="qtyplusbtn"><i class="fa fa-plus-circle fa-2x"></i></span>' +
        '</div></div><div class="col-6 d-none"><p>Unit</p><div class="selectbtn"><select class="form-control"><option>1 Litre</option>' +
        '<option>2 Litre</option><option>2.5 Litre</option><option>5 Litre</option></select></div></div></div><div class="row">' +
        '<div class="abtitem"></div><div class="col-12 description textshow" style="font-size: 15px; border-bottom: 1px solid lightgray; border-top: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Description</label><i class="fa fa-angle-down"></i><div class="description_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div><div class=" col-12 Features textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Key Features</label><i class="fa fa-angle-down"></i><div class="Features_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div><div class=" col-12 Unit textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Unit</label><i class="fa fa-angle-down"></i><div class="Unit_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div></div></div></div></div></div>'


    $("#shedulersection").empty();
    $("#shedulersection").append(card);
    $(".textshow").click(function () {
        if ($(this).find("i").hasClass("fa fa-angle-down")) {
            $(this).find("i").removeClass("fa-angle-down");
            $(this).find("i").addClass("fa-angle-up");
        } else {
            $(this).find("i").addClass("fa-angle-down");
            $(this).find("i").removeClass("fa-angle-up");
        }
        $(this).find(".textdiv").slideToggle();
    });

     

    var Swipes = new Swiper('.swiper-container', {
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
        },
    });

    var minVal = 1, maxVal = 20; // Set Max and Min values
    if (details[0].rid == "52") {
        maxVal = 1;
    }   
    $(".qtyaddbtn").click(function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $(this).hide();
        var current = $(this).parent().parent().find(".qtybtns").show();
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().find(".qtybtns").toggleClass("show");
        var SDID = id;
        var Flag = 'ADD';
        var Qty = '1';
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + SDID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    fnOrderPuchByStealDeal(data.d, Flag, Qty);
                    showpopup('Added to cart');
                }
            }
        });
    })
    // Increase product quantity on cart page
    $(".qtyplusbtn").on('click', function (e) {
         e.preventDefault();
        e.stopImmediatePropagation();
        alert("You cannot add more than 1 QTY")
    });
    // Decrease product quantity on cart page
    $(".qtyminusbtn").on('click', function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().removeClass('show')
        $(this).parent().parent().find('.qtyaddbtn').show();
        $(this).parent().hide();
        var SDID = id;
        var Flag = 'DELETE';
        var Qty = '0';
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + SDID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    fnOrderPuchByStealDeal(data.d, Flag, Qty);
                 }
            }
        });
         
    });

     
   
}

function BindProductdata2(table) {
    var data = table;// localStorage.getItem('productDetails');

    if (data != "") {
        var details =  data;
    }

    var btnDisplay = "";
    var btnDisplay1 = "style=\"display:none;\"";
    var Qty = "1";
    if (details[0].exists_order_qty != "0") {
        btnDisplay = "style=\"display:none;\"";
        btnDisplay1 = "";
        Qty = details[0].exists_order_qty;
    }


    var description = "";
    if (details[0].description != "" && details[0].description!=null) {
        if (details[0].rid == "51" && details[0].rid == "48") {
            var desc = details[0].description.split("|");
            for (var i = 0; desc.length > i; i++) {
                var prah = desc[i].split("~");
                description = description + '<h5><b>' + prah[0] + '</b></h5><p>' + prah[1] + '</p>';
            }
        }
        else {
            description = '<p>' + details[0].description + '</p>'
        }

    }

    var notavailablebox = "", hidebtn = "";
    if (details[0].item_availability != "Y") {
        notavailablebox = "<span class=\"notavailable\" style=\"background:antiquewhite;padding:9px;font-size:11px;border-radius:5px;\">out of stock</span >";
        hidebtn = "d-none";
    }

    var card = '<div class="card itemcard p-2"><div class="row"><div class="col-sm-6 col-md-6"><div class="container">' +
        '<div class="row"><div class="product_title"><h5>' + details[0].percent_off + '% off</h5></div></div></div><div class="Productimagebox">' +
        '<div class="swiper-container"><div class="swiper-wrapper"><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_path + '" />' +
        '</div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_path + '" /></div><div class="swiper-slide">' +
        '<img src="https://mycornershop.in/Menu_Pics/' + details[0].IMAGE_PATH + '" /></div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_path + '" />' +
        '</div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_path + '" /></div></div><div class="swiper-pagination"></div></div>' +
        '<hr /></div></div><div class="col-sm-6 col-md-6"><div class="container"><div class="row"><div class="productName">' +
        '<strong>' + details[0].deal_name1 + '</strong></div></div><div class="row"><div class="productprice"><label>Product MRP: <strike>' + details[0].general_price + '</strike> <strong>' + details[0].offer_price + '</strong></label>' +
        '<p>(Inclusive of all taxes)</p></div></div></div><div class="container mt-3"><div class="row"><div class="col-6">' +
        '<div class="row"><div class="col-12"><p>Qty</p></div></div>' + notavailablebox +'<div ' + btnDisplay + ' class="qtyaddbtn ' + hidebtn+'"><a class="addbtnss">Add <i class="fa fa-plus-circle"></i></a>' +
        '</div><div class="qtybtns" ' + btnDisplay1 +'><span class="qtyminusbtn"><i class="fa fa-minus-circle fa-2x"></i></span><span class="qtynumber">' +
        '<input type="text" class="qtyValue" value="' + Qty +'" /></span><span class="qtyplusbtn"><i class="fa fa-plus-circle fa-2x"></i></span>' +
        '</div></div><div class="col-6 d-none"><p>Unit</p><div class="selectbtn"><select class="form-control"><option>1 Litre</option>' +
        '<option>2 Litre</option><option>2.5 Litre</option><option>5 Litre</option></select></div></div></div><div class="row">' +
        '<div class="abtitem"></div><div class="col-12 description textshow" style="font-size: 15px; border-bottom: 1px solid lightgray; border-top: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Description</label><i class="fa fa-angle-down"></i><div class="description_text textdiv">' +
        '<p style="font-size: 13px;">' + description + '</p>' +
        '</div></div><div class=" col-12 Features textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Key Features</label><i class="fa fa-angle-down"></i><div class="Features_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div><div class=" col-12 Unit textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Unit</label><i class="fa fa-angle-down"></i><div class="Unit_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div></div></div></div></div></div>'


    $("#shedulersection").empty();
    $("#shedulersection").append(card);
    $(".textshow").click(function () {
        if ($(this).find("i").hasClass("fa fa-angle-down")) {
            $(this).find("i").removeClass("fa-angle-down");
            $(this).find("i").addClass("fa-angle-up");
        } else {
            $(this).find("i").addClass("fa-angle-down");
            $(this).find("i").removeClass("fa-angle-up");
        }
        $(this).find(".textdiv").slideToggle();
    });



    var Swipes = new Swiper('.swiper-container', {
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
        },
    });


    var minVal = 1, maxVal = 20; // Set Max and Min values
    if (details[0].rid == "52") {
        maxVal = 1;
    }   
    $(".qtyaddbtn").click(function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $(this).hide();
        var current = $(this).parent().parent().find(".qtybtns").show();
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().find(".qtybtns").toggleClass("show");
        var SDID = id;
        var Flag = 'ADD';
        var Qty = '1';
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + SDID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    setOrderByDeal(data.d, Flag, Qty)
                    showpopup('Added to cart');
                }
            }
        });
    })
      
   
    // Increase product quantity on cart page
    $(".qtyplusbtn").on('click', function () {
        var $parentElm = $(this).parents(".qtybtns");
        $(this).addClass("clicked");
        setTimeout(function () {
            $(".clicked").removeClass("clicked");
        }, 100);
        var value = $parentElm.find(".qtyValue").val();
        if (value < maxVal) {
            value++;
        }
        $parentElm.find(".qtyValue").val(value);

        var Deal_ID = id;
        var Flag = 'SUB';
        var Qty = value;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + Deal_ID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    setOrderByDeal(data.d, Flag, Qty);
                    showpopup('Added to cart');
                }
            }
        });
        
    });
    // Decrease product quantity on cart page
    $(".qtyminusbtn").on('click', function () {
        var $parentElm = $(this).parents(".qtybtns");
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
            $(this).parent().removeClass('show')
            $(this).parent().parent().find('.qtyaddbtn').show();
            $(this).parent().hide();
        }
        $parentElm.find(".qtyValue").val(value); 
        var Deal_ID = id;
        var Qty = value;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + Deal_ID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    setOrderByDeal(data.d, Flag, Qty);
                     
                }
            }
        });
        $parentElm.find(".qtyValue").val(value);
    });



}

function BindProductdata3(table) {
    var data = table;// localStorage.getItem('productDetails');

    if (data != "") {
        var details =  data;
    }
    var btnDisplay = "";
    var btnDisplay1 = "style=\"display:none;\"";
    var Qty = "1";
    if (details[0].exists_order_qty != "0") {
        btnDisplay = "style=\"display:none;\"";
        btnDisplay1 = "";
        Qty = details[0].exists_order_qty;
    }

    var description = "";

    var description = "";

    if (details[0].description != "" && details[0].description != null) {
        if (details[0].rid == "51" && details[0].rid == "48") {
            var desc = details[0].description.split("|");
            for (var i = 0; desc.length > i; i++) {
                var prah = desc[i].split("~");
                description = description + '<h5><b>' + prah[0] + '</b></h5><p>' + prah[1] + '</p>';
            }
        }
        else {
            description = '<p>' + details[0].description + '</p>'
        }

    }


    var notavailablebox = "", hidebtn = "";
    if (details[0].ITEM_AVAILABILITY != "Y") {
        notavailablebox = "<span class=\"notavailable\" style=\"background:antiquewhite;padding:9px;font-size:11px;border-radius:5px;\">out of stock</span >";
        hidebtn = "d-none";
    }
    var card = '<div class="card itemcard p-2"><div class="row"><div class="col-sm-6 col-md-6"><div class="container">' +
        '<div class="row"><div class="product_title"><h5></h5></div></div></div><div class="Productimagebox">' +
        '<div class="swiper-container"><div class="swiper-wrapper"><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" />' +
        '</div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" /></div><div class="swiper-slide">' +
        '<img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" /></div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" />' +
        '</div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" /></div></div><div class="swiper-pagination"></div></div>' +
        '<hr /></div></div><div class="col-sm-6 col-md-6"><div class="container"><div class="row"><div class="productName">' +
        '<strong>' + details[0].name + '</strong></div></div><div class="row"><div class="productprice"><label>Product MRP:   <strong>' + details[0].show_price + '</strong></label>' +
        '<p>(Inclusive of all taxes)</p></div></div></div><div class="container mt-3"><div class="row"><div class="col-6">' +
        '<div class="row"><div class="col-12"><p>Qty</p></div></div>' + notavailablebox + '<div ' + btnDisplay + ' class="qtyaddbtn ' + hidebtn+'"><a class="addbtnss">Add <i class="fa fa-plus-circle"></i></a>' +
        '</div><div class="qtybtns"  ' + btnDisplay1+'><span class="qtyminusbtn"><i class="fa fa-minus-circle fa-2x"></i></span><span class="qtynumber">' +
        '<input type="text" class="qtyValue" value="' + Qty+'" /></span><span class="qtyplusbtn"><i class="fa fa-plus-circle fa-2x"></i></span>' +
        '</div></div><div class="col-6 d-none"><p>Unit</p><div class="selectbtn"><select class="form-control"><option>1 Litre</option>' +
        '<option>2 Litre</option><option>2.5 Litre</option><option>5 Litre</option></select></div></div></div><div class="row">' +
        '<div class="abtitem"><h6 style="margin-top: .5rem;">Features</h6></div><div class="col-12 description textshow" style="font-size: 15px; border-bottom: 1px solid lightgray; border-top: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Description</label><i class="fa fa-angle-down"></i><div class="description_text textdiv">' +
        '<p style="font-size: 13px;">' + description + '</p>' +
        '</div></div><div class=" col-12 Features textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Key Features</label><i class="fa fa-angle-down"></i><div class="Features_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div><div class=" col-12 Unit textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Unit</label><i class="fa fa-angle-down"></i><div class="Unit_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div></div></div></div></div></div>'


    $("#shedulersection").empty();
    $("#shedulersection").append(card);
    $(".textshow").click(function () {
        if ($(this).find("i").hasClass("fa fa-angle-down")) {
            $(this).find("i").removeClass("fa-angle-down");
            $(this).find("i").addClass("fa-angle-up");
        } else {
            $(this).find("i").addClass("fa-angle-down");
            $(this).find("i").removeClass("fa-angle-up");
        }
        $(this).find(".textdiv").slideToggle();
    });

      var Swipes = new Swiper('.swiper-container', {
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
        },
      });

    var minVal = 1, maxVal = 20; // Set Max and Min values
    if (details[0].rid == "52") {
        maxVal = 1;
    }   
    $(".qtyaddbtn").click(function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $(this).hide();
        var current = $(this).parent().parent().find(".qtybtns").show();
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().find(".qtybtns").toggleClass("show");
        var SDID = id;
        var Flag = 'ADD';
        var Qty = '1';
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + SDID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    setOrderByOffer(data.d, Flag, Qty)
                    showpopup('Added to cart');
                }
            }
        });
    })


    // Increase product quantity on cart page
    $(".qtyplusbtn").on('click', function () {
        var $parentElm = $(this).parents(".qtybtns");
        $(this).addClass("clicked");
        setTimeout(function () {
            $(".clicked").removeClass("clicked");
        }, 100);
        var value = $parentElm.find(".qtyValue").val();
        if (value < maxVal) {
            value++;
        }
        $parentElm.find(".qtyValue").val(value);

        var Deal_ID = id;
        var Flag = 'SUB';
        var Qty = value;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + Deal_ID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                     
                    setOrderByOffer(data.d, Flag, Qty)
                    showpopup('Added to cart');
                }
            }
        });

    });
    // Decrease product quantity on cart page
    $(".qtyminusbtn").on('click', function () {
        var $parentElm = $(this).parents(".qtybtns");
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
            $(this).parent().removeClass('show')
            $(this).parent().parent().find('.qtyaddbtn').show();
            $(this).parent().hide();
        }
        $parentElm.find(".qtyValue").val(value);
        var Deal_ID = id;
        var Qty = value;
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + Deal_ID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    setOrderByOffer(data.d, Flag, Qty)
                }
            }
        });
        $parentElm.find(".qtyValue").val(value);
    });
}
function BindProductdata4(table) {
    var data = table;// localStorage.getItem('productDetails');

    if (data != "") {
        var details =  data;
    }
    var btnDisplay = "";
    var btnDisplay1 = "style=\"display:none;\"";
    var Qty = "1";
    if (details[0].exists_order_qty != "0") {
        btnDisplay = "style=\"display:none;\"";
        btnDisplay1 = "";
        Qty = details[0].exists_order_qty;
    }

    var description = "";

    if (details[0].description != "" && details[0].description != null) {

        if (details[0].rid == "51" && details[0].rid == "48") {
            var desc = details[0].description.split("|");
            for (var i = 0; desc.length > i; i++) {
                var prah = desc[i].split("~");
                description = description + '<h5><b>' + prah[0] + '</b></h5><p>' + prah[1] + '</p>';
            }
        }
        else {
            description = '<p>' + details[0].description +'</p>'
        }

       
    }
    var notavailablebox = "", hidebtn = "";
    if (details[0].item_availability != "Y") {
        notavailablebox = "<span class=\"notavailable\" style=\"background:antiquewhite;padding:9px;font-size:11px;border-radius:5px;\">out of stock</span >";
        hidebtn = "d-none";
    }
    var card = '<div class="card itemcard p-2"><div class="row"><div class="col-sm-6 col-md-6"><div class="container">' +
        '<div class="row"><div class="product_title"><h5>' + details[0].percent_off +'% off</h5></div></div></div><div class="Productimagebox">' +
        '<div class="swiper-container"><div class="swiper-wrapper"><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" />' +
        '</div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" /></div><div class="swiper-slide">' +
        '<img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" /></div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" />' +
        '</div><div class="swiper-slide"><img src="https://mycornershop.in/Menu_Pics/' + details[0].image_url + '" /></div></div><div class="swiper-pagination"></div></div>' +
        '<hr /></div></div><div class="col-sm-6 col-md-6"><div class="container"><div class="row"><div class="productName">' +
        '<strong>' + details[0].name + '</strong></div></div><div class="row"><div class="productprice"><label>Product MRP: <strike>' + details[0].mrp + '</strike>  <strong>' + details[0].price + '</strong></label>' +
        '<p>(Inclusive of all taxes)</p></div></div></div><div class="container mt-3"><div class="row"><div class="col-6">' +
        '<div class="row"><div class="col-12"><p>Qty</p></div></div>' + notavailablebox + '<div ' + btnDisplay + ' class="' + hidebtn+' qtyaddbtn"><a class="addbtnss">Add <i class="fa fa-plus-circle"></i></a>' +
        '</div><div ' + btnDisplay1+' class="qtybtns"><span class="qtyminusbtn"><i class="fa fa-minus-circle fa-2x"></i></span><span class="qtynumber">' +
        '<input type="text" class="qtyValue" value="' + Qty+'" /></span><span class="qtyplusbtn"><i class="fa fa-plus-circle fa-2x"></i></span>' +
        '</div></div><div class="col-6 d-none"><p>Unit</p><div class="selectbtn"><select class="form-control"><option>1 Litre</option>' +
        '<option>2 Litre</option><option>2.5 Litre</option><option>5 Litre</option></select></div></div></div><div class="row">' +
        '<div class="abtitem"></div><div class="col-12 description textshow" style="font-size: 15px; border-bottom: 1px solid lightgray; border-top: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Description</label><i class="fa fa-angle-down"></i><div class="description_text textdiv">' +
        '<p style="font-size: 13px;">' + description + '</p>' +
        '</div></div><div class="col-12 Features textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Key Features</label><i class="fa fa-angle-down"></i><div class="Features_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div><div class=" col-12 Unit textshow d-none" style="font-size: 15px; border-bottom: 1px solid lightgray; padding-bottom: 5px; padding-top: 5px;">' +
        '<label class="mb-0">Unit</label><i class="fa fa-angle-down"></i><div class="Unit_text textdiv">' +
        '<p style="font-size: 13px;">What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry  standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has</p>' +
        '</div></div></div></div></div></div></div>'


    $("#shedulersection").empty();
    $("#shedulersection").append(card);
    $(".textshow").click(function () {
        if ($(this).find("i").hasClass("fa fa-angle-down")) {
            $(this).find("i").removeClass("fa-angle-down");
            $(this).find("i").addClass("fa-angle-up");
        } else {
            $(this).find("i").addClass("fa-angle-down");
            $(this).find("i").removeClass("fa-angle-up");
        }
        $(this).find(".textdiv").slideToggle();
    });

    var Swipes = new Swiper('.swiper-container', {
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
        },
    });


    var minVal = 1, maxVal = 20; // Set Max and Min values
    if (details[0].rid == "52") {
        maxVal = 1;
    }     
    $(".qtyaddbtn").click(function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $(this).hide();
        var current = $(this).parent().parent().find(".qtybtns").show();
        e.preventDefault();
        e.stopImmediatePropagation();
        $(this).parent().find(".qtybtns").toggleClass("show");
        var MID = id;
        var Flag = 'ADD';
        var Qty = '1';
        var Data_item = localStorage.getItem('Details_item'),
            Data_item = JSON.parse(Data_item);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + MID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    getData(Data_item[0].Price, data.d, Data_item[0].Item_Name, Data_item[0].OID, Data_item[0].Option_Name, Flag, Qty)
                    showpopup('Added to cart');
                }
            }
        });
    })


    // Increase product quantity on cart page
    $(".qtyplusbtn").on('click', function () {
        var $parentElm = $(this).parents(".qtybtns");
        $(this).addClass("clicked");
        setTimeout(function () {
            $(".clicked").removeClass("clicked");
        }, 100);
        var value = $parentElm.find(".qtyValue").val();
        if (value < maxVal) {
            value++;
        }
        $parentElm.find(".qtyValue").val(value);

        var MID = id;
        var Flag = 'SUB';
        var Qty = value;
        var Data_item = localStorage.getItem('Details_item'),
            Data_item = JSON.parse(Data_item);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + MID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    getData(Data_item[0].Price, data.d, Data_item[0].Item_Name, Data_item[0].OID, Data_item[0].Option_Name, Flag, Qty)
                    
                    showpopup('Added to cart');
                }
            }
        });

    });
    // Decrease product quantity on cart page
    $(".qtyminusbtn").on('click', function () {
        var $parentElm = $(this).parents(".qtybtns");
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
            $(this).parent().removeClass('show')
            $(this).parent().parent().find('.qtyaddbtn').show();
            $(this).parent().hide();
        }
        $parentElm.find(".qtyValue").val(value);
        var MID = id;
        var Qty = value;
        var Data_item = localStorage.getItem('Details_item'),
            Data_item = JSON.parse(Data_item);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Components/product_details.aspx/decryptData",
            data: '{value:"' + MID + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != '') {
                    getData(Data_item[0].Price, data.d, Data_item[0].Item_Name, Data_item[0].OID, Data_item[0].Option_Name, Flag, Qty)
                }
            }
        });
        $parentElm.find(".qtyValue").val(value);
    });
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
           
            if (data_split[0] == "0") {
                $('#Mycart2').addClass('d-none');
            }
            else {
                $('#Mycart2').removeClass('d-none');
                 
            }

        },

        error: function (e) {
            alert(e.statusText);
        }
    })
}
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
             
            if (data_split[0] == "0") {
                $('#Mycart2').addClass('d-none');
            }
            else {
                $('#Mycart2').removeClass('d-none');
                 
            }

        },
        error: function (e) {
            alert(e.statusText);
        }
    })
}
function setOrderByOffer(Offer_ID, Flag, Qty) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnOrderPuchByOffer",
        data: '{Offer_ID: "' + Offer_ID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',
        dataType: "json",

        success: function (data) {
            var data_split = data.d;
            data_split = data_split.split('|');
            $('#Mycart2').html('');
            $('#Mycart2').html(data_split[0]);
              
        },

       
        error: function (e) {
            showpopup(e.statusText);
        }
    })
}
function getData(Price, MID, Item_Name, OID, Option_Name, Flag, Qty) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnOrderPuch",
        data: '{Price: "' + Price + '", MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag
            + '",Qty:"' + Qty + '", Item_Name:"' + Item_Name
            + '", Option_Name:"' + Option_Name + '"}',

        dataType: "json",
        success: function (data)
        {
            var data_split = data.d;
            data_split = data_split.split('|');
            $('#Mycart2').html('');
            $('#Mycart2').html(data_split[0]);
             
        },

        error: function (e) {
            showpopup(e.statusText);
        }
    })
}
