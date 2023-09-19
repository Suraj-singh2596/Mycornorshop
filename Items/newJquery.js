let aspectRatioGroup = document.querySelector(
	"#aspectRatio--group .segmentedControl"
);
let radios = aspectRatioGroup.querySelectorAll(".menutype");
let i = 1;

// set CSS Var to number of radios we have
aspectRatioGroup.style.setProperty("--options", radios.length);

// loop through radio elements
radios.forEach((input) => {
    // store position as data attribute
    input.setAttribute("data-pos", i);

    // add click handler to change position
    input.addEventListener("click", (e) => {
        aspectRatioGroup.style.setProperty(
			"--options-active",
			e.target.getAttribute("data-pos")
		);
    });

    // increment counter
    i++;
});

// add class to enable the sliding pill animation, otherwise it uses a fallback
aspectRatioGroup.classList.add("useSlidingAnimation");


$("#Search").click(function () {
    $("#searchbox").css("animation", "scale-display .3s");
    $("#searchbox").toggleClass("activeclass");
    $('#searchbox').toggleClass('out').toggleClass('active');
    $(".downtop").toggleClass("activeclass2")

})


$(".addbtn").click(function (e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    $(this).hide();
    $(this).parent().parent().find(".addbtn2").show();
})


var minVal = 0, maxVal = 20; // Set Max and Min values
// Increase product quantity on cart page
$(".increaseQty").on('click', function () {
    supermario()
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

});
// Decrease product quantity on cart page
$(".decreaseQty").on('click', function () {
    supermario()
    var $parentElm = $(this).parents(".qtySelector");
    var addbtnshow = $(this).parent().parent().parent().parent().find(".addbtn2");
    var addbtn2show = $(this).parent().parent().parent().parent().find(".addbtn");
    $(this).addClass("clicked");
    setTimeout(function () {
        $(".clicked").removeClass("clicked");
    }, 100);
    var value = $parentElm.find(".qtyValue").val();
    if (value > 1) {
        value--;

    }
    else {
        addbtnshow.hide();
        addbtn2show.show();
    }
    $parentElm.find(".qtyValue").val(value);

});

$(".backbtn").click(function () {
    $("#menusection").css("animation", "scale-display .3s");
    $("#menusection").show();
    $('#menusection').removeClass('out').addClass('active');
    $("#menusection2").hide();
    $('.veg_all').addClass('active');
    $('.veg_all').attr('aria-pressed', 'true');
    if ($(".searchinput ").hasClass("toglesearch")) {
        $(".searchinput ").removeClass("toglesearch");
        $(".searchinput ").val("");
    }
    if ($(".searchbox").hasClass("adcss")) {
        $(".searchbox ").removeClass("adcss")
    }
})

$(".backbtn2").click(function () {
    $("#menusection2").css("animation", "scale-display .3s");
    $("#menusection2").show();
    $('#menusection2').removeClass('out').addClass('active');
    $("#menusection3").hide();

})


$(document).ready(function () {
    getResturantMenuList("1", "1", "Desserts")

})

$("#addmorebtn").click(function () {
    $("#menusection").css("animation", "scale-display .3s");
    $("#menusection").show();
    $('#menusection').removeClass('out').addClass('active');
    $("#menusection3").hide();

})
$(".showfoodmore").click(function () {
    getResturantMenuList($(this).attr('rid'), $(this).attr('cgid'), $(this).attr('cg_name'));
    $("#menusection2").css("animation", "scale-display .3s");
    $("#menusection2").show();
    $('#menusection2').removeClass('out').addClass('active');
    $("#menusection").hide();

})
function getResturantMenuList(RID, CGID, Category_Name) {
    
    //if (RID != undefined) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        url: "../Items/Items.aspx/getMenuLists",
        data: "{'RID':'" + RID + "','CGID':'" + CGID + "','Category_Name':'" + Category_Name + "'}",
        success: function (result) {
            $('#appenditems').empty();
           
            if (result.d != '') {
                //$('.foodcategory2').html(Category_Name);
                $('#appenditems').append(result.d);
                $(".addbtn").click(function (e) {
                    supermario()


                    e.preventDefault();
                    e.stopImmediatePropagation();
                    //$(this).hide();
                    //$(this).parent().parent().find(".addbtn2").show();
                    $(this).hide();
                    $(this).parent().parent().find(".addbtn2").show();
                    var Price = $(this).parent().parent().parent().parent().parent().parent().find('.itm-amt').attr('amount');
                    var MID = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
                    var Item_Name = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').text();
                    var OID = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
                    var Option_Name = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').text() || '';
                    var Flag = 'Add';
                    var Qty = '1';
                    Final_amount();
                    calculate_amount1(Price, MID, OID, RID, Flag, Qty, Item_Name, $.trim(Option_Name));
                })
                var minVal = 0, maxVal = 20; // Set Max and Min values
                // Increase product quantity on cart page
                $(".increaseQty").on('click', function () {

                    supermario()
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

                    var Price = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.itm-amt').attr('amount');
                    var MID = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
                    var Item_Name = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.itm-name').text();
                    var OID = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
                    var Option_Name = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').text() || '';
                    var Flag = 'Sub';
                    var Qty = value;
                    Final_amount();
                    calculate_amount1(Price, MID, OID, RID, Flag, Qty, Item_Name, $.trim(Option_Name));

                });
                // Decrease product quantity on cart page
                $(".decreaseQty").on('click', function () {
                    supermario()
                    var $parentElm = $(this).parents(".qtySelector");
                    var addbtnshow = $(this).parent().parent().parent().parent().find(".addbtn2");
                    var addbtn2show = $(this).parent().parent().parent().parent().find(".addbtn");
                    $(this).addClass("clicked");
                    setTimeout(function () {
                        $(".clicked").removeClass("clicked");
                    }, 100);

                    var Price = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.itm-amt').attr('amount');
                    var MID = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
                    var Item_Name = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.itm-name').text();
                    var OID = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
                    var Option_Name = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').text() || '';
                    var value = $parentElm.find(".qtyValue").val();
                    if (value > 1) {
                        value--;
                        var Flag = 'Sub';
                    }
                    else {
                        var Flag = 'delete';
                        addbtnshow.hide();
                        addbtn2show.show();
                    }
                    $parentElm.find(".qtyValue").val(value);
                    var Qty = value;
                    Final_amount();
                    calculate_amount1(Price, MID, OID, RID, Flag, Qty, Item_Name, $.trim(Option_Name));

                });
            }
            $('.veg_all').click(function () {
                var result = $(this).attr('aria-pressed')

                if (result == 'true') {

                    $('.select-items').each(function () {
                        if ($(this).attr('veg_non') == 'N') {
                            $(this).css('display', 'none');
                        }
                        else {

                            $(this).css('display', 'block');
                        }
                    })

                }
                else {

                    $('.select-items').each(function () {
                        $(this).css('display', 'block');
                    })

                }
            })

            $('.platetype').change(function (e) {
                e.preventDefault();

                var price = $(this).find('option:selected').attr('price');
                $(this).parent().parent().parent().find('.itm-amt').removeAttr('amount');
                $(this).parent().parent().parent().find('.itm-amt').attr('amount', price);
                $(this).parent().parent().parent().find('.itm-amt').html('<i class="fa fa-inr" aria-hidden="true"></i>' + price);

                if ($(this).parent().parent().parent().parent().parent().parent().parent().find('.addbtn2').css('display') != 'none') {
                    var MID = $(this).parent().parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
                    var Item_Name = $(this).parent().parent().parent().parent().parent().parent().parent().find('.itm-name').text();
                    var OID = $(this).find('option:selected').attr('oid') || -1;
                    var Option_Name = $(this).find('option:selected').text() || '';
                    var Flag = 'Sub';
                    var Qty = $(this).parent().parent().parent().parent().parent().parent().parent().parent().find(".qtyValue").val();
                    Final_amount();
                    calculate_amount1(price, MID, OID, RID, Flag, Qty, Item_Name, $.trim(Option_Name));
                }

            })
        },
        error: function (e) {
            showpopup(e.statusText);
        }
    })

    // }
}
function Final_amount() {
    var Total = 0;
    $('.itm-amt').each(function () {
        if ($(this).parent().parent().parent().parent().parent().parent().find('.addbtn2').css('display') != 'none') {
            Total = parseFloat(Total) + (parseFloat($(this).attr('amount') * parseFloat($(this).parent().parent().parent().parent().parent().parent().find('.qtyValue').val())))
        }
    })
    // $('#totalbill').html(Total);
}
var Order_Data = [];
function inittialiseOrderData() {
    var FormData = {
        RID: $('#rest_id').val(),
        Table_No: $('#TableNo').val(),
        Mobile_No: $('#Mobile_No').val(),
        Header_ID: $('#header_id').val(),
        Name: $('#Cust_Name').val()
    }
    if (Order_Data == '')
        Order_Data = JSON.stringify(FormData);
}
function calculate_amount1(Price, MID, OID, RID, Flag, Qty, Item_Name, Option_Name) {
    if (Order_Data == '') {
        inittialiseOrderData();
    }


    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Items.aspx/Update_Order_Data",
        data: '{Price: "' + Price + '", MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag
            + '", OrderData:' + Order_Data + ', RID:"' + RID + '", Qty:"' + Qty + '", Item_Name:"' + Item_Name
            + '", Option_Name:"' + Option_Name + '"}',
        dataType: "json",
        success: function (data) {
            Order_Data = JSON.stringify(data.d);
        },
        error: function (e) {
            showpopup(e.statusText);
        }
    })
}


$('#search_for_menu').keyup(function (e) {
    e.stopImmediatePropagation();
    var txt = $.trim($(this).val());

    $('.sub_cateogry').each(function () {
        var count = "0";
        $('.itm-name').each(function () {
            if (txt.length >= 2) {
                if ($.trim($(this).text()).toLowerCase().indexOf(txt.toLowerCase()) != -1) {

                    $(this).parent().parent().parent().parent().css('display', 'block');
                }
                else {
                    count = "1";
                    $(this).parent().parent().parent().parent().css('display', 'none');
                }
            }
            else {

                $(this).parent().parent().parent().parent().css('display', 'block');
            }

        })
        if (count == "1") {
            $(this).css('display', 'none');
        }
        else {
            $(this).css('display', 'block');
        }
    })

})



//function calculate_amount(Price, MID, OID, RID, Flag, Qty, Item_Name, Option_Name) {
//    if (Order_Data == '') {
//        inittialiseOrderData();
//    }

//    var url_data = "{Price:'" + Price + "',MID:'" + MID + "',OID:'" + OID + "',eventname:'" + Flag + "',Qty:'" +
//            Qty + "',RID:'" + RID + "',Option_Name:'" + Option_Name + "',Item_Name:'" + Item_Name + "',OrderData:" + Order_Data + "}";
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",

//        url: "../ScantoDine_main/manager.aspx/Update_Order_Data1",

//        //url: "../my_menu.aspx/Update_Order_Data",
//        //data: '{Price: "' + Price + '", MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag
//        //    + '", OrderData:' + Order_Data + ' , RID:"' + RID + '", Qty:"' + Qty + '", Item_Name:"' + Item_Name
//        //    + '", Option_Name:"' + Option_Name + '"}',
//        //data: '{Price:"' + Price + '",MID:"' + MID + '",OID:"' + OID + '",eventname:"' + Flag + '",Qty:"' +
//        //    Qty + '",RID:"' + RID + '",Option_Name:"' + Option_Name + '",Item_Name:"' + Item_Name + '",OrderData:' + Order_Data + '}',

//        data: url_data,

//        dataType: "json",
//        success: function (data) {
//            Order_Data = JSON.stringify(data.d);
//        },
//        error: function (e) {
//            alert(e.statusText);
//        }
//    })
//}
$('.veg_all').click(function () {

    var result = $(this).attr('aria-pressed')

    if (result == 'true') {
        $('.sub_cateogry').each(function () {
            var count = "0";
            $(this).parent().parent().parent().find('.select-items').each(function () {
                if ($(this).attr('veg_non') == 'N') {
                    $(this).css('display', 'none');
                    count = "1";
                }
                else {
                    $(this).css('display', 'block');
                }
            })
            if (count == "1") {
                $(this).css('display', 'none');
            }
            else {
                $(this).css('display', 'block');
            }

        })
    }
    else {
        $('.sub_cateogry').each(function () {
            $(this).parent().parent().parent().find('.select-items').each(function () {
                $(this).css('display', 'block');
            })
            $(this).css('display', 'block');
        })
    }
})
$('#placeorder ,#getBillDetails').click(function () {

    var body = '';
    if (Order_Data.length > 0) {
        var data = JSON.parse(Order_Data);
        var i = 1;
        var total_amount = '0';
        for (var j = 0; j < data.OrderDetails.length; j++) {
            var size = '';
            if (data.OrderDetails[j].Option_Name != '') {
                size = ' | ' + data.OrderDetails[j].Option_Name;
            }

            //body = body + '<div class="row"><div class="detailsection" style="width: 90%;"><div class="row"><div style="width: 70%;">' +
            //               '<span class="itm-name"><i class="fa fa-circle"></i> &nbsp&nbsp' + data.OrderDetails[j].Item_Name + size + '</span></div><div style="width: 15%; padding-left: 5%;"><span>' +
            //                data.OrderDetails[j].Qty + '</span><span class="additem"><a class="addbtn2 btn" style=""><div class="qtySelector text-center"><i class="fa fa-minus decreaseQty"></i><input readonly="" type="text" class="qtyValue" value="1"><i class="fa fa-plus increaseQty"></i></div></a></span></div><div style="width: 15%;text-align:right;"><span class="itm-amt"><i class="fa fa-inr" aria-hidden="true"></i> ' + data.OrderDetails[j].Price + '</span></div>' +
            //                '</div></div></div>';


            body = body + '<div class="row generated_row" mid="' + data.OrderDetails[j].MID + '" price="' + data.OrderDetails[j].Price + '" item_name="' +
                data.OrderDetails[j].Item_Name + '"oid="' + data.OrderDetails[j].OID + '"Option_Name="' + data.OrderDetails[j].Option_Name + '"rid="' +
                data.OrderDetails[j].RID + '" style="border-top:1px solid lightgrey;border-bottom:1px solid lightgrey;margin-top:3px;margin-bottom:3px;padding-top:3px;padding-bottom:3px;"><div class="detailsection" style="width: 100%;"><div class="row"><div style="width: 50%;">' +
                          '<span class="itm-name" style=\"font-size:100%;\">&#8226; ' + data.OrderDetails[j].Item_Name + size + '</span></div><div style="width: 30%;">' +
                            '<span class="additem"><a class="addbtn2 btn" style="width: 85%;margin-top:0px;"><div class="qtySelector text-center">' +
                              '<i class="fa fa-minus decreaseQty"></i><input readonly type="text" class="qtyValue" value="' + data.OrderDetails[j].Qty + '" />' +
                              '<i class="fa fa-plus increaseQty"></i></div></a></span>' +
                              '</div><div style="width: 15%;text-align:right;"><span class="itm-amt"><i class="fa fa-inr" aria-hidden="true"></i> ' + data.OrderDetails[j].Price + '</span></div>' +
                           '</div></div></div>';


            i++;

            total_amount = parseFloat(total_amount) + (parseFloat(data.OrderDetails[j].Price) * parseFloat(data.OrderDetails[j].Qty))
        }
        if (body != '') {
            $('#menuSelectedItems').empty();
            $('#menuSelectedItems').append(body);
            $('#item_count').html(parseInt(i) - 1);
            $('#total_amount').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + total_amount)
            $("#menusection3").css("animation", "scale-display .3s");
            $("#menusection3").show();
            $('#menusection3').removeClass('out').addClass('active');
            $("#menusection2").hide();
            var minVal1 = 0, maxVal1 = 20; // Set Max and Min values
            // Increase product quantity on cart page
            $(".increaseQty").on('click', function (e) {
                e.stopImmediatePropagation();
                e.preventDefault();
                supermario()

                var Price = $(this).parent().parent().parent().parent().parent().parent().parent().attr('price');
                var MID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('mid');
                var Item_Name = $(this).parent().parent().parent().parent().parent().parent().parent().attr('item_name');
                var OID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('oid');
                var Option_Name = $(this).parent().parent().parent().parent().parent().parent().parent().attr('Option_Name');
                var RID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('rid');
                var Flag = 'Sub';
                if (RID != undefined) {
                    var $parentElm = $(this).parents(".qtySelector");

                    $(this).addClass("clicked");
                    setTimeout(function () {
                        $(".clicked").removeClass("clicked");
                    }, 100);
                    var value = $parentElm.find(".qtyValue").val();
                    if (value < maxVal1) {
                        value++;
                    }
                    $parentElm.find(".qtyValue").val(value);

                    $('.select-items').each(function () {
                        if ($(this).find('.itm-name').attr('mid') == MID) {

                            $(this).find('.imagesection').find('.qtyValue').val(value);
                        }
                        //else if (value1 > 1 && $(this).find('.itm-name').attr('mid') == MID)
                        //{
                        //    $(this).find('.imagesection').find('.qtyValue').val(value);
                        //}
                        //else {

                        //}
                    })
                    var Total = '0';
                    $('.generated_row').each(function () {
                        if (value > 0) {
                            Total = parseFloat(Total) + (parseFloat($(this).attr('price')) * parseFloat($(this).find('.addbtn2').find('.qtySelector').find('.qtyValue').val()))
                        }
                        else {
                            Total = parseFloat(Total) + 0;
                        }
                    })
                    $('#total_amount').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + Total)


                    calculate_amount1(Price, MID, OID, RID, Flag, value, Item_Name, $.trim(Option_Name));


                }
            });
            // Decrease product quantity on cart page
            $(".decreaseQty").on('click', function (e) {
                e.stopImmediatePropagation();
                e.preventDefault();
                supermario()

                var Price = $(this).parent().parent().parent().parent().parent().parent().parent().attr('price');
                var MID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('mid');
                var Item_Name = $(this).parent().parent().parent().parent().parent().parent().parent().attr('item_name');
                var OID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('oid');
                var Option_Name = $(this).parent().parent().parent().parent().parent().parent().parent().attr('Option_Name');
                var RID = $(this).parent().parent().parent().parent().parent().parent().parent().attr('rid');

                if (RID != undefined) {

                    var $parentElm = $(this).parents(".qtySelector");

                    var rowline = $(this).parent().parent().parent().parent().parent().parent().parent();

                    $(this).addClass("clicked");
                    setTimeout(function () {
                        $(".clicked").removeClass("clicked");
                    }, 100);
                    var count = $('#item_count').text();
                    var value1 = $parentElm.find(".qtyValue").val();
                    if (value1 > 1) {
                        value1--;
                        var Flag = 'Sub';
                    }
                    else {
                        var Flag = 'delete';
                        rowline.remove();
                        count = parseInt(count) - 1;
                    }
                    $parentElm.find(".qtyValue").val(value1);

                    $('.select-items').each(function () {
                        if ($(this).find('.itm-name').attr('mid') == MID) {
                            if (value1 == 0) {
                                $(this).find('.imagesection').find('.addbtn').css('display', 'inline-block');
                                $(this).find('.imagesection').find('.addbtn2').css('display', 'none');
                            }
                            $(this).find('.imagesection').find('.qtyValue').val(value1);
                        }
                    })
                    var Total = '0';
                    $('.generated_row').each(function () {
                        if (value1 > 0) {
                            Total = parseFloat(Total) + (parseFloat($(this).attr('price')) * parseFloat($(this).find('.addbtn2').find('.qtySelector').find('.qtyValue').val()))
                        }
                        else {
                            Total = parseFloat(Total) + 0;
                        }
                    })
                    $('#total_amount').html('<i class="fa fa-inr" aria-hidden="true"></i> ' + Total)
                    if (count == '0') {
                        $('.backbtn2').trigger('click');
                    }
                    $('#item_count').html(count);
                    calculate_amount1(Price, MID, OID, RID, Flag, value1, Item_Name, $.trim(Option_Name));

                    //$(".backbtn2").click(function () {
                    //    $("#menusection2").css("animation", "scale-display .3s");
                    //    $("#menusection2").show();
                    //    $('#menusection2').removeClass('out').addClass('active');
                    //    $("#menusection3").hide();

                    //})
                }

            });

        }
        else {
            showpopup('Please add item first');
        }




    }
    else {
        showpopup('Please add item first');
    }

})
$('#confirm_Order').click(function (e) {
    e.stopImmediatePropagation();
    $('#confirm_Order').attr('disabled', 'disabled');
    if (Order_Data == '') {
        inittialiseOrderData();
    }
    if (JSON.parse(Order_Data).OrderDetails.length > 0) {
        var Manager_Value = $('#Manager_Value').val();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Items.aspx/PunchOrder",
            data: '{OrderData:' + Order_Data + '}',
            dataType: "json",
            success: function (data) {
                var order_no = data.d;
                order_no = order_no.split('|');
                showpopup('Order Placed Successfully. Your Order number is: ' + order_no[0]);
                $('#confirm_Order').removeAttr("disabled");
                if (Manager_Value == "0") {
                    location.reload();
                }
                else {
                    window.location.href = '../ScantoDine_main/manager.aspx?rid=' + $('#rest_id').val() + '&tid=' + $('#TableNo').val();
                }

            },
            error: function (e) {
                showpopup(e.statusText);
            }
        })
    }


})
$('#bill_the_table').click(function (e) {
    e.stopImmediatePropagation();
    if ($('#header_id').val() != "0") {
        $.ajax({
            url: "../ScantoDine_main/manager.aspx/getBillTheTable",
            type: "post",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "{'RID':'" + $('#rest_id').val() + "','TID':'" + $('#TableNo').val() + "','Header_ID':'" + $('#header_id').val() + "','Flag':'" + 'Y' + "'}",

            success: function (result) {
                $('#myModalFullscreen').empty();
                if (result.d != '') {
                    $('#myModalFullscreen').append(result.d);
                    $('#myModalFullscreen').modal('show');
                }
                else {
                    showpopup('Please add the item first');
                }


                $('#Generate_Bill').click(function (e) {
                    var Header_ID = $(this).attr('header_id')
                    $.ajax({
                        url: "../ScantoDine_main/manager.aspx/generateInvoice",
                        type: "post",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: "{'RID':'" + $('#rest_id').val() + "','TID':'" + $('#TableNo').val() + "','Header_ID':'" + $('#header_id').val() + "'}",

                        success: function (result) {
                            showpopup('Bill Generated');
                            location.reload();
                        }
                    })
                })
            }
        })
    }
    else {
        showpopup('Pehle kuch order to kr le bhai');
    }
})
$('#view_order').click(function (e) {
    e.stopImmediatePropagation();
    if ($('#header_id').val() != "0") {
        $.ajax({
            url: "../ScantoDine_main/manager.aspx/getBillTheTable",
            type: "post",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: "{'RID':'" + $('#rest_id').val() + "','TID':'" + $('#TableNo').val() + "','Header_ID':'" + $('#header_id').val() + "','Flag':'" + 'N' + "'}",

            success: function (result) {
                $('#getTableBill').empty();
                if (result.d != '') {
                    $('#getTableBill').append(result.d);
                    $('#getTableBill').modal('show');
                }
                else {
                    showpopup('Pehle kuch order to kr le bhai');
                }

            }
        })
    }
    else {
        showpopup('Pehle kuch order to kr le bhai');
    }
})
$('input:radio[name="aspectRatio"]').click(function () {

    if (this.checked) {
        var mt_id = $(this).attr('mt_id');

        $('.showfoodmore').each(function () {
            if ($(this).attr('mtid') != mt_id && mt_id != '0') {
                $(this).css('display', 'none');
            }
            else if (mt_id == '0') {
                $(this).css('display', 'block');
            }
            else {
                $(this).css('display', 'block');
            }
        })
    }
});

$("#Search").click(function () {

    $(".searchinput ").addClass("toglesearch");
    $(".searchbox").addClass("adcss");


})

$("#tip").on('keyup', function () {

    var keyCode = (event.keyCode ? event.keyCode : event.which);
    if (((keyCode >= 97 && keyCode <= 122)) || keyCode == 96 || keyCode == 8) {
        if ($(this).val() > 0) {
            $('#total_amount_toPay').html(parseFloat(($('#total_amount_toPay').attr('amount')) - parseFloat($('#total_amount_toPay').attr('tip'))) + parseFloat($(this).val() || 0))
        }
    }

    else {
        $('#total_amount_toPay').html(parseFloat($('#total_amount_toPay').attr('amount') || 0))
        return false;
    }
})
$('.tipclick').click(function (e) {
    e.stopImmediatePropagation();
    if ($('#tip').val() > 0) {
        $('#total_amount_toPay').html(parseFloat(($('#total_amount_toPay').attr('amount')) - parseFloat($('#total_amount_toPay').attr('tip'))) + parseFloat($('#tip').val() || 0))
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Items.aspx/Add_Tip",
            data: '{RID: "' + $(this).attr('rid') + '", Header_ID: "' + $(this).attr('header_id') + '", Amount:"' + $('#tip').val() + '"}',
            dataType: "json",
            success: function (data) {
            },
            error: function (e) {
                showpopup(e.statusText);
            }
        })
    }
})



function supermario() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    if (/android/i.test(userAgent)) {
        navigator.vibrate([215, ])
    }
}


function showpopup(msg) {
    $('#Alert_btn').attr("data-message", msg)

    $('#Alert_btn').trigger('click');
}
