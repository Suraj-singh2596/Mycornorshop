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

function punchRecurring(Price, MID, Item_Name, OID, Option_Name, Flag, Qty, Sun, Sun_Qty, Mon, Mon_Qty, Tue, Tue_Qty, Wed, Wed_Qty, Thu,
    Thu_Qty, Fri, Fri_Qty, Sat, Sat_Qty, Date, Freq, Line_ID) {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnInsertRecuring",
        data: '{MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag + '", Qty:"' + Qty + '", Option_Name:"' + Option_Name
            + '", Sun:"' + Sun + '", Sun_Qty:"' + Sun_Qty + '", Mon:"' + Mon + '", Mon_Qty:"' + Mon_Qty + '", Tue:"' + Tue + '", Tue_Qty:"' + Tue_Qty
            + '", Wed:"' + Wed + '", Wed_Qty:"' + Wed_Qty + '", Thu:"' + Thu + '", Thu_Qty:"' + Thu_Qty + '", Fri:"' + Fri + '", Fri_Qty:"' + Fri_Qty
            + '", Sat:"' + Sat + '", Sat_Qty:"' + Sat_Qty + '", Date:"' + Date + '", Freq:"' + Freq + '", Line_ID:"' + Line_ID + '"}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            var confirmmodal = "<div class=\"modal-dialog modal-confirm\"><div class=\"modal-content\" style = \"height:auto;\">" +
                "<div class=\"modal-header flex-column\"><button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>" +
                "</div><div class=\"modal-body text-justify\" ><h5 style=\"color: #087972; font-weight:500;\"><span style=\"font-size:17px;line-height: 2;\">Your subscription is confirmed for </span><br/> <i>" + Item_Name + "</i> </h5>" +
                "<br/><h6>Please note :-</h6><br/><p> • The subscription <i class=\"fa fa-inr\" style=\"color: #087972;\"></i> prices are subject to change as per market rates. </p>" +
                //"<p>Don't forget to hang a bag at the door to receive your deliveries.</p>"+
                "<p> • Please ensure enough balance in your wallet(atleast a day before) for your subscription orders.</p>" +
                "<p> • You can review ,<i class=\"fa fa-edit\" style=\"color: #087972;\"></i> modify or pause your <i class=\"fa fa-reload\"></i> subscription anytime by navigating through menu -> my subscriptions </p>" +
                "<p> • You  subscribe for an item and you <i class=\"fa fa-check\" style=\"color: #087972;\"></i> confirm your subscription prior to 10 pm of the day to ensure delivery next day morning before 8 am.</p>" +
                "</div>" +
                "<div class=\"modal-footer justify-content-center\"><button type=\"button\" class=\"btn btn-success w-100\"data-dismiss=\"modal\">Ok</button></div></div ></div >";
            $("#confirmation_modal").append(confirmmodal);
            $("#confirmation_modal").modal();
        },
        complete: function () {
            $("#preload").hide();
        },
        error: function (e) {
            alert(e.statusText);
        }
    })
}
function getAllCategories() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/getAllCategories",
        data: '{}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            //localStorage.setItem('AllCategories', JOSN.parse(data.d).table)
            BindAllCategories(JSON.parse(data.d).table);

        },
        complete: function () {
            $("#preload").hide();
        },
    });
}
function BindAllCategories(tabl1) {
    var data = tabl1;// localStorage.getItem('AllCategories');
    var cgid_with_mcid = "";
    if (data != "") {
        var table = data;
        for (var i = 0; table.length > i; i++) {
            cgid_with_mcid = cgid_with_mcid + "<option cgid='" + table[i].cgid + "' mcid='" + table[i].mcid + "'>" + table[i].cg_name + "</option>";
        }

    }

    $('#header_html1').empty();
    $('#header_html1').show();
    $('#header_html1').append(cgid_with_mcid);
    $('#header_html1 option:contains(' + getCookie('category_name') + ')').attr('selected', 'selected');
    $('#header_html1').change(function (e) {
        e.preventDefault();
        var CGID = $(this).find('option:selected').attr('cgid');
        var MCID = $(this).find('option:selected').attr('mcid');
        if (CGID != getCookie('cgid')) {
            setCookie('cgid', CGID, 365);
            setCookie('mcid', MCID, 365);
            setCookie('tag_name', '', 365);
            setCookie('item_name', '', 365);
            setCookie('offer_id', '', 365);
            setCookie('category_name', $(this).find('option:selected').text(), 365);
            location.reload();
            getMCIDNames(CGID, MCID, '');
            cData();
            //var body = $("html, body");
            //body.stop().animate({ scrollTop: 0 }, 500, 'swing', function () {

            //});
        }
    })
}

$(document).ready(function () {
    $('#Mycart2').html(getCookie('item_count') || '');
    cData();
    var RID = getCookie('rid');
    var CGID = getCookie('cgid');
    var MCID = getCookie('mcid');
    var Tag_Name = getCookie('tag_name');
    var Item_Name = getCookie('item_name') || '';
    var Offer_ID = getCookie('offer_id');
    if (CGID != '') {
        getAllCategories();
        getMCIDNames(CGID, MCID, Item_Name);
    }
    if (Tag_Name != '') {
        getTag_Name();
        //$('#header_html1').show();
    }
})

function getTag_Name() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/getTag_Name",
        data: '{}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {

            $('#header_html1').empty();
            $('#header_html1').append(data.d);
            $('#header_html1').show();
            $('#header_html1 option:contains(' + getCookie('tag_name') + ')').attr('selected', 'selected');

            $('#header_html1').change(function (e) {
                e.preventDefault();
                var T_Name = $(this).find('option:selected').text();

                if (T_Name != getCookie('tag_name')) {
                    setCookie('cgid', '', 365);
                    setCookie('mcid', '', 365);
                    setCookie('tag_name', T_Name, 365);
                    setCookie('item_name', '', 365);
                    setCookie('offer_id', '', 365);
                    setCookie('category_name', T_Name, 365);

                    cData();
                }
            })
        },
        complete: function () {
            $("#preload").hide();
        },
    })
}

function cData() {
    var RID = getCookie('rid');
    var CGID = getCookie('cgid');
    var MCID = getCookie('mcid');
    var Tag_Name = getCookie('tag_name');
    var Item_Name = getCookie('item_name') || '';
    var Offer_ID = getCookie('offer_id');

    if (Item_Name != '') {
        $('#search_for_menu').val(Item_Name);
        $('#search_for_menu').attr('readonly', 'readonly')
        setTimeout(function (e) {
            $('#search_for_menu').removeAttr('readonly');
        }, 500)
    }
    var marque = "";
    if (getCookie('rid') == '48' || getCookie('rid') == '51' && CGID == "150") {
        marque = '<span style="color: #ed394d;font-weight: bold;">Prices shown above are applicable for a combo of 10 QTYs.</span>';
        $("#moveabletext").empty();
        $("#moveabletext").append(marque);

    }
    else if (getCookie('rid') == '48' || getCookie('rid') == '51' && CGID == "151") {
        marque = '<span style="color: #ed394d;font-weight: bold;">Prices shown above are applicable for a combo of 10 QTYs.</span>';
        $("#moveabletext").empty();
        $("#moveabletext").append(marque);

    }
    else if (getCookie('rid') == '48' || getCookie('rid') == '51' && CGID == "152") {
        marque = '<span style="color: #ed394d;font-weight: bold;">Prices shown above are applicable for a combo of 10 QTYs.</span>';
        $("#moveabletext").empty();
        $("#moveabletext").append(marque);

    }
    else {
        $("#moveabletext").hide();
    }

    if (RID != "" && CGID != "") {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../Items/Items.aspx/getItemsByCGID",
            data: '{CGID: "' + CGID + '",MCID: "' + MCID + '",Item_Name: "' + Item_Name + '"}',
            beforeSend: function () {
                $("#preload").show();
            },
            dataType: "json",
            success: function (data) {
                var result = data.d;
                //localStorage.setItem('itemsByCGIDtbl', result[0]);
                //localStorage.setItem('itemsByCGIDtbl1', result[1]);
                BindAllItems(JSON.parse(result).table, JSON.parse(result).table1)
                //$('#appenditems').empty();
                //$('#appenditems').append(data.d);
                setCookie('onlycgid', '1', '365');
                setCookie('onlytagname', '-1', '365');
                setCookie('onlyoffer', '-1', '365');
            },
            complete: function () {
                $("#preload").hide();
            },
        });
    }
    if (RID != "" && CGID == "" && MCID == "" && Item_Name == "" && Offer_ID != "") {

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../Items/Items.aspx/getMenuByOffers",
            data: '{Offer_ID: "' + Offer_ID + '"}',
            beforeSend: function () {
                $("#preload").show();
            },
            dataType: "json",
            success: function (data) {
                if (data.d) {
                    //var result = data.d.split("!");
                    //localStorage.setItem('Offeritem', result[0]);
                    //localStorage.setItem('Offeritemtbl1', result[1]);

                    var result = data.d
                    BindOffersItems(JSON.parse(result).table);
                }
                setCookie('onlycgid', '-1', '365');
                setCookie('onlytagname', '-1', '365');
                setCookie('onlyoffer', '1', '365');

            },
            complete: function () {
                $("#preload").hide();
            },
        });
    }
    if (RID != "" && CGID == "" && Tag_Name != "" && Item_Name == "" && Offer_ID == "") {

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../Items/Items.aspx/getAllTagData",
            data: '{Tag_Name: "' + Tag_Name + '"}',
            beforeSend: function () {
                $("#preload").show();
            },
            dataType: "json",
            success: function (data) {
                if (data.d != "") {
                    //var result = data.d.split("!");
                    //localStorage.setItem('tagitemtable', result[0]);
                    //localStorage.setItem('tagitemtable1', result[1]);

                    var result = data.d;
                    BindTagItems(JSON.parse(result).table, JSON.parse(result).table1);
                }

                setCookie('onlycgid', '1', '365');
                setCookie('onlytagname', '1', '365');
                setCookie('onlyoffer', '-1', '365');


            },
            complete: function () {
                $("#preload").hide();
            },
        });
    }

}

function BindAllItems(arr, arr1) {
    //var arr = '', arr1 = '';

    //arr = localStorage.getItem('itemsByCGIDtbl');
    //arr1 = localStorage.getItem('itemsByCGIDtbl1');
    if (arr != "" && arr != null) {
        var table = arr
    }
    if (arr1 != "" && arr1 != null) {
        var table1 = arr1
    }

    var Menu_Category = "";
    var Menu_category_name = "";
    var Menu_Item_List = "";

    var dis_none = "";
    if (table1[0].recurring_order_flag != "Y") {
        dis_none = "d-none";
    }

    if (table != "") {
        for (var i = 0; table.length > i; i++) {
            var img = "";
            var image_url = "";
            var margin_top = "margin-top:16px;margin-bottom:5px;";

            if (table[i].image_url != "") {
                img = "../Menu_Pics/" + table[i].image_url;
                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + table[i].name + "\"></div>";
                margin_top = "margin-top:16px;margin-bottom:5px;";
            }
            else {

                img = "../Menu_Pics/Defaultimage.png";
                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + table[i].name + "\"></div>";
            }
            var description = "";

            //if (table[i].DESCRIPTION != "") {
            //    var desc = table[i].DESCRIPTION.split("|");

            //    // for (var i = 0; desc.length > i; i++) {
            //    ////  description = description + '<h5>' + desc[i] + '</h5>';
            //    // }

            //}
            var btnDisplay = "display:none;";
            var btnDisplay1 = "";
            var qtyShow = "1";
            if (table[i].exists_order_qty != "0") {
                btnDisplay1 = "display:none;";
                btnDisplay = "";
                qtyShow = table[i].exists_order_qty;
            }
            var MRP = "";
            var PERCENTAGE = "";
            if (table[i].mrp != "" && table[i].mrp != null) {
                MRP = "<strike style =\"\"> " + table[i].mrp + "</strike>";
                PERCENTAGE = table[i].percent_off + "% off";
            }

            var reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
                "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
                "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
                "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
                "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
                "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";


            var notavailablebox = "", hidebtn = "";
            if (table[i].item_availability != "Y") {
                notavailablebox = "<span class=\"notavailable\" style=\"background:antiquewhite;padding:9px;font-size:11px;border-radius:5px;\">out of stock</span >";
                hidebtn = "d-none";
            }
            var additmbtnclass = "panditbooking";
            if (getCookie('rid') == "52" && table[i].name.toLowerCase().includes("puja samagri/material list")) {
                additmbtnclass = "pujasamagri";
            }

            Menu_Item_List = Menu_Item_List +
                "<div class=\"itemcard select-items unselected\" mcid='" + table[i].mcid + "' veg_non ='" + table[i].veg_nonveg + "'>" +
                "<div class=\"row\">" +
                "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
                "<div class=\"row\"><div style = \"width: 100%;\">" +
                "<div class=\"img_btn_box\">" +
                image_url + "</div></div></div></div>" +
                "<div class=\"detailsection\" style=\"width: 70%;\">" +
                "<span class=\"itm-amt\" amount=" + table[i].price + ">" +
                "<i class=\"fa fa-inr\" aria-hidden=\"true\" style=\"font-weight:100;\"></i>" + MRP + " <span style=\"font-weight:bold;\">" + table[i].price + "</span><span class=\"offpercnt\">" + PERCENTAGE + "  </span>" +
                "<div style=\"width: 90%;\">" +
                "<a href=\"\"  class=\"itm-name text-dark\" MID='" + table[i].mid + "'>" + table[i].name + "</a>" +
                "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
                "</div>" +
                "<div class=\"row\">" +
                "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss " + dis_none + hidebtn + "\" MID='" + table[i].mid + "'>" + reloadicon + "</a></div>" +
                "</div>" +
                "<div style = \"width: 40%;\" ><span class=\"additem\">" +
                "<a class=\"addbtn2 btn\" style=" + btnDisplay + margin_top + ">" +
                "<div class=\"qtySelector text-center " + hidebtn + "\">" +
                "<i class=\"fa fa-minus decreaseQty btnstyle\" ></i>" +
                "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
                "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
                "</div></a></span>" +
                "<span class=\"additem " + hidebtn + "\">" +
                "<a class=\"addbtn btn btnstyle " + additmbtnclass + "\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
                "</span>" + notavailablebox +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div></div>";
        }

        setCookie("mcidcount", "1", 365);


        setCookie("MID", "", 365);//HttpContext.Current.Session["MID"] = null;
        setCookie("MID", "2", 365);//HttpContext.Current.Session["MID"] = "2";
        if (Menu_Item_List != "") {
            Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
                "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
                + "</div></div></div><br/>";
        }

        $('#appenditems').empty();
        $('#appenditems').append(Menu_Item_List);
    }
    else {
        setCookie("MID", "-1", 365);//HttpContext.Current.Session["MID"] = "-1";
    }
    modal_sheduler();
    addSub();
    $('body').on('click', '.imagesection,.itm-name', function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        var Price = $(this).parent().parent().find('.itm-amt').attr('amount');
        var MID = $(this).parent().parent().find('.itm-name').attr('mid');
        var Item_Name = $(this).parent().find('.itm-name').text();
        var OID = $(this).parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
        var Option_Name = $(this).parent().parent().find('.platetype').find('option:selected').text() || '';
        var itemdetailforpunchorder = [];
        var data = {
            "Price": Price,
            "Item_Name": Item_Name,
            "OID": OID,
            "Option_Name": Option_Name
        }
        itemdetailforpunchorder.push(data);

        localStorage.setItem('Details_item', JSON.stringify(itemdetailforpunchorder));
        gotodetailpage(MID, Item_Name, 'Gn');
    })

}

function BindOffersItems(tab1) {
    var data = tab1;// localStorage.getItem('Offeritem');
    var xyz = "";
    var Menu_Item_List = "";
    if (data != "") {
        var table = data;
        for (var i = 0; table.length > i; i++) {
            var img = "";
            var image_url = "";
            var margin_top = "margin-top:16px;margin-bottom:5px;";
            if (table[i].image_url != "") {
                img = "../Menu_Pics/" + table[i].image_url;
                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + table[i].name + "\"></div>";
                margin_top = "margin-top:16px;margin-bottom:5px;";
            }
            else {

                img = "../Menu_Pics/Defaultimage.png";
                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\"alt=\"" + table[i].name + "\"></div>";
            }
            var description = "";

            //if (table[i].DESCRIPTION != "") {
            //    var desc = table[i].DESCRIPTION.split("|");

            //    //for (var i = 0; desc.length > i; i++) {
            //    //    //  description = description + '<h5>' + desc[i] + '</h5>';
            //    //}

            //}


            var div = "";

            if (xyz != table[i].category_name) {
                if (xyz == "") {

                    xyz = table[i].category_name;
                }
                else {

                    xyz = table[i].category_name;
                }

            }
            var btnDisplay = "display:none;";
            var btnDisplay1 = "";
            var qtyShow = "1";
            if (table[i].exists_order_qty != "0") {
                btnDisplay1 = "display:none;";
                btnDisplay = "";
                qtyShow = table[i].exists_order_qty;
            }

            if (getCookie('rid') == '48' || getCookie('rid') == '51') {
                var text = '<div style=\"margin-bottom:10px;\"><span><sup>*</sup>Prices shown above are applicable for a combo of 10 QTYs.</span></div>';
            }

            Menu_Item_List = Menu_Item_List +

                "<div class=\"itemcard select-items unselected\" mcid='" + table[i].mcid + "' veg_non ='" + table[i].veg_nonveg + "'>" +
                "<div class=\"row\">" +
                "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
                "<div class=\"row\"><div style = \"width: 100%;\">" +
                "<div class=\"img_btn_box\">" +
                image_url + "</div></div></div></div>" +
                "<div class=\"detailsection\" style=\"width: 70%;\">" +
                "<span class=\"itm-amt\" amount=" + table[i].show_price + ">" +
                "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + table[i].show_price + "</span>" +
                "<div style=\"width: 90%;\">" +
                "<a href=\"\"  class=\"itm-name text-dark\" MID='" + table[i].mid + "'>" + table[i].name + "</a>" +
                "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
                "</div>" +
                "<div class=\"row\">" +
                "<div style = \"width: 60%;\">" +
                "</div>" +
                "<div style = \"width: 40%;\" ><span class=\"additem\">" +
                "<a class=\"addbtn2 btn \" style=" + btnDisplay + margin_top + ">" +
                "<div class=\"qtySelector text-center\">" +
                "<i class=\"fa fa-minus decreaseQty btnstyle\"></i>" +
                "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
                "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
                "</div></a></span>" +
                "<span class=\"additem\">" +
                "<a class=\"addbtn btn btnstyle\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
                "</span>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div></div>";
        }
        $('#appenditems').empty();
        $('#appenditems').append(Menu_Item_List)

    }
    $('#header_html1').hide();
    $('.subcategory-name').html(getCookie('Offer_name'));
    addSub();
    modal_sheduler();

    $('body').on('click', '.imagesection,.itm-name', function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        var offer_id = getCookie('offer_id');
        var name = $(this).parent().find('.itm-name').text();
        gotodetailpage(offer_id, name, 'ofr');
    })

}

function BindTagItems(tab1, tab2) {
    var dis_none = "";
    var array = tab1 // localStorage.getItem('tagitemtable');
    var array1 = tab2 // localStorage.getItem('tagitemtable1');
    var Menu_Category = "";
    var Menu_category_name = "";
    var Menu_Item_List = "";

    if (array1 != "") {
        var table1 = array1;
        if (table1[0].recurring_order_flag != "Y") {
            dis_none = "d-none";
        }
    }

    if (array != "") {
        var table = array;

        for (var i = 0; table.length > i; i++) {
            var img = "";
            var image_url = "";
            var margin_top = "margin-top:16px;margin-bottom:5px;";

            if (table[i].image_url != "") {
                img = "../Menu_Pics/" + table[i].image_url;
                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + table[i].name + "\"></div>";
                margin_top = "margin-top:16px;margin-bottom:5px;";
            }
            else {

                img = "../Menu_Pics/Defaultimage.png";
                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + table[i].name + "\"></div>";
            }
            var description = "";

            //if (table[i].DESCRIPTION != "") {
            //   var desc = table[i].DESCRIPTION.split("|");

            //    //for (var i = 0; desc.length > i; i++) {
            //    //    //  description = description + '<h5>' + desc[i] + '</h5>';
            //    //}

            //}
            var btnDisplay = "display:none;";
            var btnDisplay1 = "";
            var qtyShow = "1";
            if (table[i].exists_order_qty != "0") {
                btnDisplay1 = "display:none;";
                btnDisplay = "";
                qtyShow = table[i].exists_order_qty;
            }



            var reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
                "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
                "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
                "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
                "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
                "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";

            if (getCookie('rid') == '48' || getCookie('rid') == '51') {
                var text = '<div style=\"margin-bottom:10px;\"><span><sup>*</sup>Prices shown above are applicable for a combo of 10 QTYs.</span></div>';
            }

            Menu_Item_List = Menu_Item_List +

                "<div class=\"itemcard select-items unselected\" mcid='" + table[i].mcid + "' veg_non ='" + table[i].veg_nonveg + "'>" +
                "<div class=\"row\">" +
                "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
                "<div class=\"row\"><div style = \"width: 100%;\">" +
                "<div class=\"img_btn_box\">" +
                image_url + "</div></div></div></div>" +
                "<div class=\"detailsection\" style=\"width: 70%;\">" +
                "<span class=\"itm-amt\" amount=" + table[i].price + ">" +
                "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + table[i].price + "</span>" +
                "<div style=\"width: 90%;\">" +
                "<a href=\"\"  class=\"itm-name text-dark\" MID='" + table[i].mid + "'>" + table[i].name + "</a>" +
                "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
                "</div>" +
                "<div class=\"row\">" +
                "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss " + dis_none + "\" MID='" + table[i].mid + "'>" + reloadicon + "</a></div>" +
                "</div>" +
                "<div style = \"width: 40%;\" ><span class=\"additem\">" +
                "<a class=\"addbtn2 btn\" style=" + btnDisplay + margin_top + ">" +
                "<div class=\"qtySelector text-center\">" +
                "<i class=\"fa fa-minus decreaseQty btnstyle\" ></i>" +
                "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
                "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
                "</div></a></span>" +
                "<span class=\"additem\">" +
                "<a class=\"addbtn btn btnstyle\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
                "</span>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div></div>";
        }

        setCookie('mcidcount', '1', 365);
        setCookie("MID", "", 365);//HttpContext.Current.Session["MID"] = null;
        setCookie("MID", "2", 365);//HttpContext.Current.Session["MID"] = "2";
        if (Menu_Item_List != "") {
            Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
                "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
                + "</div></div></div><br/>";;
        }
    }
    else {
        setCookie("MID", "-1", 365);
    }

    $('#appenditems').empty();
    $('#appenditems').append(Menu_Item_List);
    addSub();
    modal_sheduler();
    $('body').on('click', '.imagesection,.itm-name', function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        var offer_id = getCookie('offer_id');
        var name = $(this).parent().find('.itm-name').text();
        gotodetailpage(offer_id, name, 'tag');
    })
}

function getMCIDNames(CGID, MCID, Item_Name) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/getMCIDNames",
        data: '{CGID: "' + CGID + '",MCID: "' + MCID + '"}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            // localStorage.setItem("scrollList", data.d)
            BindMCIDNames(JSON.parse(data.d).table, MCID);

        },
        complete: function () {
            $("#preload").hide();
        },
    })
}
function BindMCIDNames(table, MCID) {
    /* var table = localStorage.getItem('scrollList');*/

    var Menu_category = "";
    var menu_selected = "";
    if (table != "") {
        var array = table;
        var subcatdetails = "";

        for (var i = 0; array.length > i; i++) {
            var imgdiv = "", catimg = "";
            if (getCookie('rid') == "52") {
                if (array[i].image_url != "" && array[i].image_url != null) {
                    imgdiv = '<img width="20" src="https://mycornershop.in/Menu_Pics/' + array[i].image_url + '"/>';
                    catimg = '<img style="width:100%;height:100%;" src="https://mycornershop.in/Menu_Pics/' + array[i].image_url + '"/>';
                }

            }

            if (array[i].mcid == MCID) {
                menu_selected = "<div class=\"subcategories subactive\" mcid='" + array[i].mcid + "'>" + imgdiv + " " + array[i].category_name + "</div>";

                if (getCookie('rid') == "52") {
                    subcatdetails = '<div class="subcategorydetails"><span class="subcatname">' + array[i].category_name + '</span><div class="cat-img">' + catimg + '</div>\
                                <div class="subcatdescription">'+ array[i].description + '</div><div style="text-align:right;">\
                                <a mcid="'+ array[i].mcid + '" class="viewdetailsbtn">Details</a></div></div>';
                }


            }
            else {
                Menu_category = Menu_category + "<div class=\"subcategories  \" mcid='" + array[i].mcid + "'>" + imgdiv + " " + array[i].category_name + "</div>";
            }

        }
    }

    $('#rid52only').empty();
    $('#rid52only').append(subcatdetails);
    $('#sub_category1').empty();
    $('#sub_category1').append(menu_selected + Menu_category);
    $(".subcategories").click(function (e) {
        e.stopImmediatePropagation();
        setCookie('mcid', $(this).attr('mcid'), 365);
        setCookie('item_name', '', 365);
        $('#search_for_menu').val('');
        $(".subcategories").removeClass("subactive");
        $(this).addClass("subactive");
        if (getCookie('rid') == '52') {
            GetMCIDDetailsbyMcid($(this).attr('mcid'));
        }

        cData();

        //var body = $("html, body");
        //body.stop().animate({ scrollTop: 0 }, 500, 'swing', function () {

        //});
    })

}



function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

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

//$(window).scroll(function () {
//    var win_height = $(this).height();
//    var cur_height = $(this).scrollTop();
//    var final_height = win_height + cur_height;
//    var doc_height = 1200;
//    var RID = getCookie('rid');
//    var CGID = getCookie('cgid');
//    var MCID = getCookie('mcid');
//    var Tag_Name = getCookie('tag_name');
//    var Item_Name = getCookie('item_name') || '';
//    var Offer_ID = getCookie('offer_id');
//    if (parseInt(final_height) >= 1200) {
//        if (getCookie('onlycgid') != '-1') {
//            getCGIDData(CGID, MCID, Item_Name);
//        }
//        if (getCookie('onlytagname') != '-1') {
//            gettagDataAll(Item_Name);
//        }

//    }
//    else if (parseInt($(window).height()) <= 700) {
//        if (getCookie('onlycgid') != '-1') {
//            getCGIDData(CGID, MCID, Item_Name);
//        }
//        if (getCookie('onlytagname') != '-1') {
//            gettagDataAll(Item_Name);
//        }
//    }
//});


function getCGIDData(CGID, MCID, Item_Name) {

    $.ajax({
        type: "POST",
        async: false,
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/getCGIDData",
        data: '{CGID: "' + CGID + '",MCID: "' + MCID + '",Item_Name: "' + Item_Name + '"}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            if (data.d != "") {
                $('#appenditems').append(data.d);
                addSub();
                modal_sheduler();
            }
        },
        complete: function () {
            $("#preload").hide();
        },
    });
}
function gettagDataAll(Item_Name) {

    $.ajax({
        type: "POST",
        async: false,
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/gettagDataAll",
        data: '{Item_Name: "' + Item_Name + '"}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            if (data.d != "") {
                $('#appenditems').append(data.d);
                addSub();
                modal_sheduler();
            }
            else {
                setCookie('onlytagname', '-1', '365');
            }
        },
        complete: function () {
            $("#preload").hide();
        },
    });
}


function addSub() {
    var RID = $('#rest_id').val();
    $(".addbtn").click(function (e) {
        supermario();
        e.preventDefault();
        e.stopImmediatePropagation();

        if (getCookie('rid') == "52") {
            if ($(this).hasClass('pujasamagri') == true) {
                $(this).addClass('samagriactive');
                $(this).hide();
                $(this).parent().parent().find(".addbtn2").show();
                var Price = $(this).parent().parent().parent().parent().parent().parent().find('.itm-amt').attr('amount');
                var MID = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
                var Item_Name = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').text();
                var OID = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
                var Option_Name = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').text() || '';
                var Flag = 'ADD';
                var Qty = '1';
                var Offer_ID = getCookie('offer_id') || 0;
                if (MID != '0') {
                    getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                    showpopup('Added to cart');
                }
                else if (Offer_ID != '0') {
                    setOrderByOffer(RID, Offer_ID, Flag, Qty);
                    showpopup('Added to cart');
                }
            }
            else if ($(this).hasClass('panditbooking') == true) {
                if ($('.pujasamagri').hasClass('samagriactive') != true) {
                    showpopup('Please add puja samagri first');
                    return;
                } else {
                    $(this).hide();
                    $(this).parent().parent().find(".addbtn2").show();
                    var Price = $(this).parent().parent().parent().parent().parent().parent().find('.itm-amt').attr('amount');
                    var MID = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
                    var Item_Name = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').text();
                    var OID = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
                    var Option_Name = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').text() || '';
                    var Flag = 'ADD';
                    var Qty = '1';
                    var Offer_ID = getCookie('offer_id') || 0;
                    if (MID != '0') {
                        getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                        showpopup('Added to cart');
                    }
                    else if (Offer_ID != '0') {
                        setOrderByOffer(RID, Offer_ID, Flag, Qty);
                        showpopup('Added to cart');
                    }
                }

            }

        }

        else {
            $(this).hide();
            $(this).parent().parent().find(".addbtn2").show();
            var Price = $(this).parent().parent().parent().parent().parent().parent().find('.itm-amt').attr('amount');
            var MID = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').attr('mid');
            var Item_Name = $(this).parent().parent().parent().parent().parent().parent().find('.itm-name').text();
            var OID = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').attr('oid') || -1;
            var Option_Name = $(this).parent().parent().parent().parent().parent().parent().find('.platetype').find('option:selected').text() || '';
            var Flag = 'ADD';
            var Qty = '1';
            var Offer_ID = getCookie('offer_id') || 0;
            if (MID != '0') {
                getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
                showpopup('Added to cart');
            }
            else if (Offer_ID != '0') {
                setOrderByOffer(RID, Offer_ID, Flag, Qty);
                showpopup('Added to cart');
            }
        }




    });

    var minVal = 0, maxVal = 20; // Set Max and Min values
    // Increase product quantity on cart page
    $(".increaseQty").on('click', function (e) {
        supermario();
        e.preventDefault();
        e.stopImmediatePropagation();
        var $parentElm = $(this).parents(".qtySelector");

        if (getCookie('rid') == "52") { maxVal = 1; }



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
        var Flag = 'SUB';
        var Qty = value;
        var Offer_ID = getCookie('offer_id') || 0;
        if (MID != '0') {
            getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
        }
        else if (Offer_ID != '0') {
            setOrderByOffer(RID, Offer_ID, Flag, Qty);
        }
        //if (MID != '0') {
        //    getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
        //}


    });
    // Decrease product quantity on cart page
    $(".decreaseQty").on('click', function (e) {
        supermario();
        e.preventDefault();
        e.stopImmediatePropagation();
        if (getCookie('rid') == "52") {
            if ($(this).parent().parent().parent().parent().find(".addbtn").hasClass('pujasamagri') == true) {
                $(this).parent().parent().parent().parent().find(".pujasamagri").removeClass('samagriactive');
                $('.panditbooking').parent().parent().find('.decreaseQty').trigger('click');
            }
        }
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
            var Flag = 'SUB';
        }
        else {
            var Flag = 'DELETE';
            addbtnshow.hide();
            addbtn2show.show();
        }
        $parentElm.find(".qtyValue").val(value);
        var Qty = value;

        var Offer_ID = getCookie('offer_id') || 0;
        if (MID != '0') {
            getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
        }
        else if (Offer_ID != '0') {
            setOrderByOffer(RID, Offer_ID, Flag, Qty);
        }
        //if (MID != '0') {
        //    getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty);
        //}
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

    }

})


function supermario() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    if (/android/i.test(userAgent)) {
        navigator.vibrate([215,])
    }
}
function Final_amount() {
    var Total = 0;
    var item_count = "0";
    $('.itm-amt').each(function () {
        if ($(this).parent().parent().parent().parent().parent().find('.addbtn2').css('display') != 'none') {
            item_count = parseInt(item_count) + 1;
            Total = parseFloat(Total) + (parseFloat($(this).attr('amount') * parseFloat($(this).parent().parent().parent().parent().parent().find('.qtyValue').val())))
        }
    })
    if (item_count != '0') {
        $('.qtydisplay').text(item_count);
    }
    else {
        $('.qtydisplay').text('');
    }
    // $('#totalbill').html(Total);
}


function setOrderByOffer(RID, Offer_ID, Flag, Qty) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnOrderPuchByOffer",
        data: '{RID: "' + RID + '", Offer_ID: "' + Offer_ID + '", Qty:"' + Qty + '" ,eventname:"' + Flag + '"}',
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


            $('#deliveryamount').empty();
            if (data_split[3] == "X") {
                $('#deliveyFreeAmount').html('Add Rs ' + (parseInt(data_split[4]) - parseInt(data_split[1])) + ' to get the free delivery');
            }
            else if (data_split[3] == "N") {
                $('#deliveyFreeAmount').html('Yey! you will get free delivery');
            }
            else if (data_split[3] == "Y") {
                $('#deliveyFreeAmount').html('You will be charged Rs ' + data_split[2] + ' extra for this order');
            }
            else if (data_split[3] == 'Z') {
                $('#deliveyFreeAmount').html('Shop above Rs ' + data_split[4] + ' for free delivery');
            }
            else {

            }

            //}

        },

        //{
        //    var data_split = data.d;
        //    data_split = data_split.split('|');
        //    $('#Mycart2').html('');
        //    $('#Mycart2').html(data_split[0]);
        //    if (data_split[0] == "0") {
        //        $('#Mycart2').addClass('d-none');
        //    }
        //    else {
        //        $('#Mycart2').removeClass('d-none');
        //    }
        //},
        error: function (e) {
            showpopup(e.statusText);
        }
    })
}

function getData(RID, Price, MID, Item_Name, OID, Option_Name, Flag, Qty) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/fnOrderPuch",
        data: '{Price: "' + Price + '", MID: "' + MID + '", OID:"' + OID + '" ,eventname:"' + Flag
            + '", RID:"' + RID + '", Qty:"' + Qty + '", Item_Name:"' + Item_Name
            + '", Option_Name:"' + Option_Name + '"}',

        dataType: "json",
        success: function (data)
        //{
        //    var data_split = data.d;
        //    data_split = data_split.split('|');
        //    $('#Mycart2').html('');
        //    $('#Mycart2').html(data_split[0]);
        //    if (data_split[0] == "0") {
        //        $('#Mycart2').addClass('d-none');
        //    }
        //    else {
        //        $('#Mycart2').removeClass('d-none');
        //    }
        //}
        {
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

            $('#deliveyFreeAmount').empty();
            if (data_split[3] == "X") {
                $('#deliveyFreeAmount').html('Add Rs ' + (parseInt(data_split[4]) - parseInt(data_split[1])) + ' to get the free delivery');
            }
            else if (data_split[3] == "N") {
                $('#deliveyFreeAmount').html('Yey! you will get free delivery');
            }
            else if (data_split[3] == "Y") {
                $('#deliveyFreeAmount').html('You will be charged Rs ' + data_split[2] + ' extra for this order');
            }
            else if (data_split[3] == 'Z') {
                $('#deliveyFreeAmount').html('Shop above Rs ' + data_split[4] + ' for free delivery');
            }
            else {

            }

            // }

        },

        error: function (e) {
            showpopup(e.statusText);
        }
    })
}

function supermario() {
    var userAgent = navigator.userAgent || navigator.vendor || window.opera;
    if (/android/i.test(userAgent)) {
        navigator.vibrate([215,])
    }
}

$('#clicktrigger').click(function (e) {
    e.stopImmediatePropagation();
    searchFilter();
})


$('#placeorder').click(function (e) {
    e.stopImmediatePropagation();
    if ($.trim($('#Mycart2').text()) != '0') {
        window.location.href = '../cart.aspx?rid=' + getUrlParameter('rid');
    }
    else {
        showpopup('Please add item first');
    }
})



$(".subcategories").click(function () {
    $(".subcategories").removeClass("subactive");
    $(this).addClass("subactive");
    var MCID = $(this).attr('mcid');
    if (MCID != '0') {
        $('.unselected').each(function () {
            if ($(this).attr('mcid') == MCID) {
                $(this).css('display', 'block');
            }
            else {
                $(this).css('display', 'none');
            }
        })
    }
    else {
        $('.unselected').each(function () {
            $(this).css('display', 'block');
        })
    }
})





function showpopup(msg) {
    $('#Alert_btn').attr("data-message", msg)

    $('#Alert_btn').trigger('click');
}

function searchFilter() {
    var txt = $.trim($('#search_for_menu').val());


    $('.itm-name').each(function () {
        if (txt.length >= 2) {
            if ($.trim($(this).text()).toLowerCase().indexOf(txt.toLowerCase()) != -1) {

                $(this).parent().parent().parent().parent().css('display', 'block');
            }
            else {
                $(this).parent().parent().parent().parent().css('display', 'none');
            }
        }
        else {

            $(this).parent().parent().parent().parent().css('display', 'block');
        }

    })
}


$('#search_for_menu').autocomplete({
    source: function (request, response) {
        var Search_Value = $.trim($('#search_for_menu').val());
        if (Search_Value.length >= 2) {
            $('#searchResult').empty();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../../Home.aspx/fnGetAllProductsByCategory",
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
                        setCookie('item_name', $.trim($('#search_for_menu').val()), 365);
                        setCookie('tag_name', '', 365);
                        setCookie('offer_id', '', 365);
                        setCookie('category_name', $(this).attr('cg_name'), 365);
                        $('#search_for_menu').blur();
                        $('#searchResult').empty();
                        cData();
                        getAllCategories();
                        getMCIDNames($(this).attr('cgid'), $(this).attr('mcid'), $.trim($('#search_for_menu').val()));
                        //var body = $("html, body");
                        //body.stop().animate({ scrollTop: 0 }, 500, 'swing', function () {

                        //});

                    })
                }
            })
        } else if (Search_Value.length = 0) {
            $('#searchResult').empty();
        }
        else {
            $('#searchResult').empty();
        }

    },

    create: function (event, ui) {
        $(this).data('ui-autocomplete')._renderItem = function (ul, item) {


            return $('<li>').append('<div class="row itemListLi" cg_name="' + item.CG_NAME + '"  mcid="' + item.MCID + '" cgid="' + item.CGID + '"><div class="col-2" ><img class="w-100" src="' + '/Menu_Pics/' + item.IMAGE_URL + '" alt="img">' +
                '</div><div class="col-10"><div class="row"><div class="col-12"><span>' + $.trim($('#search_for_menu').val()) + ' in <br>' + item.Option_Name + '</span></div></div>' +
                '</div></div>').appendTo('#searchResult');


        };
    },
    select: function (event, ui) {

        event.preventDefault();



    }

});

function modal_sheduler() {

    $('.md-trigger').on('click', function (e) {
        e.stopImmediatePropagation();
        $('#frequencyModal').empty();
        var MID = $(this).attr('mid');
        var img = $(this).parent().parent().parent().parent().parent().parent().find('.food_pic').find('img').attr('src');
        var strike_price = $.trim($(this).parent().parent().parent().parent().find('strike').text());
        var Actual_Price = $.trim($(this).parent().parent().parent().parent().find('span:first').text());
        var Percent_off = $.trim($(this).parent().parent().parent().parent().find('.offpercnt').text());
        var Item_Name = $.trim($(this).parent().parent().parent().parent().find('a:first').text());

        var modal = "<div class=\"md-content\"><div class=\"title w-100 text-center\">All repeat orders start from tomorrow. </div>" +
            "<div class=\"w-100 mt-5 ml-3\"><a class=\"md-close\" style=\"\"><i class=\"fa fa-times\"></i></a></div><div class=\"itmbox_details m-2\" style=\"padding-top: 30px;\">" +
            "<div class=\"itemcard select-items unselected\" style=\"box-shadow: none;\"><div class=\"row\"><div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
            "<div class=\"row\"><div style=\"width: 100%;\"><div class=\"img_btn_box\"><div class=\"food_pic\">" +
            "<img src=" + img + " alt=" + Item_Name + ">" +
            "</div></div></div></div></div><div class=\"detailsection\" style=\"width: 70%; font-size: 12px;\">" +
            "<span class=\"itm-amt\" amount=\"100\"><i class=\"fa fa-inr\" aria-hidden=\"true\" style=\"font-weight: 100;\"></i><strike style=\"font-weight: 100;\">" + strike_price + "</strike>&nbsp;<span style=\"font-weight: bold;\">" + Actual_Price + "</span><span class=\"offpercnt\">" + Percent_off + " </span>" +
            "<div style=\"width: 90%;\"><a class=\"itm-name text-dark\">" + Item_Name + "</a><p style=\"font-size: 10px; margin-bottom: 0px;\"></p>" +
            "</div></span></div></div></div></div><div class=\"container\"><div class=\"row\"><div class=\"col-4 pr-0\"><div style=\"font-size: 12px; font-weight: bold;\">" +
            "SET FREQUENCY</div></div><div class=\"col-8 pl-0\"><div style=\"border-bottom: 1px solid lightgrey; font-size: 12px;\"><span style=\"visibility: hidden\">SET FREQUENCY</span>" +
            "</div></div></div><div class=\"frequency__Box m-3\"><div class=\"row\"><div class=\"frequency__selected freq\" freq=\"w\">Weekly</div><div class=\"frequency freq d-none\" freq=\"2w\">Once in 2 weeks</div>" +
            "<div class=\"frequency freq d-none\" freq=\"1m\">Once in a month</div></div></div><div class=\"row\"><div class=\"col-4 pr-0\"><div style=\"font-size: 12px; font-weight: bold;\">" +
            "SET QUANTITY</div></div><div class=\"col-8 pl-0\"><div style=\"border-bottom: 1px solid lightgrey; font-size: 12px;\"><span style=\"visibility: hidden\">SET QUANTITY</span>" +
            "</div></div></div><div class=\"container quantity__Box\"><div class=\"row\" style=\"object-fit: contain; overflow: auto;\">" +
            "<div class=\"weeks__qty\"><div class=\"week_name\">MON</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues mon\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\"/>" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">TUE</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues tue\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\" /></div>" +
            "<div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\"><div class=\"week_name\">WED</div>" +
            "<div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div><div>" +
            "<input type=\"number\" readonly class=\"qtyvalues wed\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">THU</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues thu\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">FRI</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues fri\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">SAT</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues sat\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">SUN</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues sun\" style=\"width: 23px; border: none; text-align: center;\" value=\"1\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div></div></div><div class=\"row\">" +
            "<div class=\"col-5 pr-0\"><div style=\"font-size: 12px; font-weight: bold;\">SET STARTING DATE</div></div><div class=\"col-7 pl-0\">" +
            "<div style=\"border-bottom: 1px solid lightgrey; font-size: 12px;\"><span style=\"visibility: hidden\">SET QUANTITY</span>" +
            "</div></div></div><div class=\"select_dateBox\"><div class=\"row\"><div class=\"col-12\"><div  class=\"input-group date\" >" +
            "<input id=\"datepicker\" data-date-format=\"dd-M-yyyy\" class=\"form-control\" type=\"text\" readonly /><span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-calendar\"></i></span>" +
            "</div></div></div></div><div class=\"submit_buttonBo5\"><div class=\"row\"><div class=\"col-12\">" +
            "<button type=\"button\" id=\"setRecurring\" class=\"btn btnstyle w-100 text-center mt-4\">Set Recurring order</button></div></div></div></div></div>";

        $('#frequencyModal').append(modal);
        $('#frequencyModal').addClass('md-show');
        $('.md-close').on('click', function () {
            $('#frequencyModal').removeClass('md-show');
            $('#frequencyModal').empty();
        });
        $("#datepicker").datepicker({
            autoclose: true,
            todayHighlight: true,
            'startDate': new Date((new Date()).valueOf() + 1000 * 3600 * 24)
        }).datepicker('update', new Date((new Date()).valueOf() + 1000 * 3600 * 24));
        var minVal12 = 0, maxVal12 = 20; // Set Max and Min values
        // Increase product quantity on cart page
        $(".qty_plus").on('click', function () {
            var $parentElm = $(this).parents(".Qty_selector ");

            $(this).addClass("clicked");
            setTimeout(function () {
                $(".clicked").removeClass("clicked");
            }, 100);
            var value = $parentElm.find(".qtyvalues").val();
            if (value < maxVal12) {
                value++;
            }
            $parentElm.find(".qtyvalues").val(value);

        });
        // Decrease product quantity on cart page
        $(".qty_minus").on('click', function () {
            var $parentElm = $(this).parents(".Qty_selector");
            $(this).addClass("clicked");
            setTimeout(function () {
                $(".clicked").removeClass("clicked");
            }, 100);
            var value = $parentElm.find(".qtyvalues").val();
            if (value >= 1) {
                value--;
            }

            $parentElm.find(".qtyvalues").val(value);
        });

        $('.freq').click(function () {
            $('.freq').removeClass('frequency__selected');
            $('.freq').addClass('frequency');
            $(this).removeClass('frequency');
            $(this).addClass('frequency__selected');
        })
        $('#setRecurring').click(function (f) {
            f.stopImmediatePropagation();

            var Sun = 'N'
            var Mon = 'N'
            var Tue = 'N'
            var Wed = 'N'
            var Thu = 'N'
            var Fri = 'N'
            var Sat = 'N'
            if ($.trim($('.sun').val()) != '0') {
                Sun = 'Y'
            }
            if ($.trim($('.mon').val()) != '0') {
                Mon = 'Y'
            }
            if ($.trim($('.tue').val()) != '0') {
                Tue = 'Y'
            }
            if ($.trim($('.wed').val()) != '0') {
                Wed = 'Y'
            }
            if ($.trim($('.thu').val()) != '0') {
                Thu = 'Y'
            }
            if ($.trim($('.fri').val()) != '0') {
                Fri = 'Y'
            }
            if ($.trim($('.sat').val()) != '0') {
                Sat = 'Y'
            }
            var Date = $.trim($('#datepicker').val());
            var Freq = $('.frequency__selected').attr('freq');
            punchRecurring(Actual_Price, MID, Item_Name, '-1', '', 'ADD', '1', Sun, $.trim($('.sun').val()), Mon, $.trim($('.mon').val()), Tue, $.trim($('.tue').val()),
                Wed, $.trim($('.wed').val()), Thu, $.trim($('.thu').val()), Fri, $.trim($('.fri').val()), Sat, $.trim($('.sat').val()), Date, Freq, '');
            $('.md-modal').removeClass('md-show');
            $('.md-modal').empty();
        })
    });



};

function gotodetailpage(value, name, typ) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Home.aspx/encryptData",
        data: '{value:"' + value + '"}',
        dataType: "json",
        success: function (data) {
            if (data.d != '') {
                location.href = '../Product?q=' + data.d + '&type=' + typ + '';
            }
        }
    });
}

function GetMCIDDetailsbyMcid(MCID) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Items/Items.aspx/getMCIDdetailsforridvidipuja",
        data: JSON.stringify({ MCID: MCID }),
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
            if (data.d != "") {
                var array = JSON.parse(data.d).table;
                var catimg = "";
                if (getCookie('rid') == "52") {
                    if (array[0].image_url != "" && array[0].image_url != null) {
                        catimg = '<img style="width:100%;height:100%;" src="https://mycornershop.in/Menu_Pics/' + array[0].image_url + '"/>';
                    }
                }
                var subcatdetails = '<div class="subcategorydetails"><span class="subcatname">' + array[0].category_name + '</span><div class="cat-img">' + catimg + '</div>\
                                <div class="subcatdescription"><strong>Description</strong><br/>'+ array[0].description + '</div>\
                                <div class="detailsdescription">\
                                <div>'+ array[0].detaildescription + '</div>\
                                <div class="mt-2"><strong>Key Insights</strong><br/>' + array[0].keyinsights + '</div>\
                                <div class="mt-2"><strong>Benefits</strong><br/>' + array[0].benefits + '</div></div>\
                                <div style="text-align:right;">\
                                <a mcid="'+ array[0].mcid + '" onclick="fnopenmoredescription($(this))" class="viewdetailsbtn">View more details</a></div></div>';
                $('#rid52only').empty();
                $('#rid52only').append(subcatdetails);
            }


        },
        complete: function () {
            $("#preload").hide();
        },
    })
}

function fnopenmoredescription(current) {
    current.parent().parent().find('.detailsdescription').slideToggle();
    if (current.text() == "View more details") {
        current.text('Hide Details');
    } else {
        current.text('View more details');
    }
}
