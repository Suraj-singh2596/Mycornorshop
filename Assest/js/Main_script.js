
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



//$('#searchforitem').autocomplete({
//    source: function (request, response) {
//        var Search_Value = $.trim($('#searchforitem').val());
//        if (Search_Value.length >= 2) {
//            $.ajax({
//                type: "POST",
//                contentType: "application/json; charset=utf-8",
//                url: "Home.aspx/fnGetAllProducts",
//                data: '{RID: "' + $('#RID').val() + '",Search_Value: "' + Search_Value + '"}',
//                dataType: "json",
//                success: function (data) {
//                    $('.ui-widget-content').css({ 'width': '300px', 'left': '15px', 'top': '417px', });
//                    $('.ui-autocomplete').css({ 'width': '300px', 'left': '15px', 'top': '417px', });

//                    response($.map(data.d, function (value, key) {
//                        return {
//                            label: data.d[key].Item_Name,

//                            value: data.d[key].MID,
//                            CGID: data.d[key].CGID,
//                            MCID: data.d[key].MCID,
//                            Retailer_ID: data.d[key].RID,
//                            cg_name: data.d[key].CG_NAME
//                        };
//                    }));
//                }
//            })
//        }

//    },

//    select: function (event, ui) {

//        event.preventDefault();
//        setCookie('cgid', ui.item.CGID, 365);
//        setCookie('mcid', ui.item.MCID, 365);
//        setCookie('item_name', ui.item.label, 365);
//        setCookie('tag_name', '', 365);
//        setCookie('offer_id', '', 365);
//        setCookie('category_name', ui.item.cg_name, 365);
//        window.location.href = '../Items/Items.aspx';
//    }
//});