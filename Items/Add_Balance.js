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

$(function () {
    var rid = getCookie('rid');
    if (rid == "48" || rid == "51") {
        $('.navbar').removeClass('bg-light');
        $('.navbar').addClass('bg-blue');
        $("#Mycart2").removeClass('cartcount');
        $("#Mycart2").addClass('cartcounts');
        $('.topshow').removeClass('grad2');
        $('.additem .addbtn').removeClass('btnstyle');
        $('.additem .addbtn').addClass('btnstyles');
        $('.checkoutbtn').removeClass('btnstyle');

    }
    else if (rid == "47") {
        $('.navbar').removeClass('bg-light');
        $('.navbar').addClass('bg-green');
        $("#Mycart2").removeClass('cartcount');
        $("#Mycart2").addClass('cartcounts');
        $('.topshow').removeClass('grad2');
        $('.additem .addbtn').removeClass('btnstyle');
        $('.additem .addbtn').addClass('btnstyles');
        $('.checkoutbtn').removeClass('btnstyle');

    }
});


$('.MoneyAdd').click(function (e) {
    e.stopImmediatePropagation();
    var Amount = $.trim($('#addbal').val());
    if (Amount == '' || Amount == '0') {
        showpopup('Please enter amount first');
    }
    else {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../Home.aspx/fnGetTrxID",
            data: '{Amount: "' + Amount + '",RID: "' + $('#RID').val() + '"}',
            dataType: "json",
            success: function (data) {
                if (data.d != "") {
                    window.location.href = '../Payments/Payment_details.aspx/trxid/' + data.d;
                }
                else {
                    showpopup('Some error occurred');
                }
            }
        });
    }
})

$(".MoneyPay").click(function (e) {
    e.stopImmediatePropagation();
    e.stopImmediatePropagation();
    var Amount = $.trim($('#payment').val());
    if (Amount == '' || Amount == '0') {
        showpopup('Please enter amount first');
    }
    else {
        ConfirmDialog3("Are you sure you want to pay Rs. " + Amount, Amount);
    }

});

function ReceiveAmount(Amount) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "../Home.aspx/fnReceiveAmount",
        data: '{Amount: "' + Amount + '",RID: "' + $('#RID').val() + '"}',
        dataType: "json",
        success: function (data) {
            var current = data.d;
            current = current.split('|');
            if (current[0] == 'X') {
                showpopup('Your wallet has no money to spend');
            }
            else if (current[0] == 'N') {
                showpopup('Your wallet has insufficient balance');
            }

            else if (current[0] == 'Y') {
                showpopup('Amount of Rs. ' + Amount + ' Paid successfully. Your Trx ID is ' + current[1]);
                $('#active_bal').empty();
                $('#active_bal').append(current[2]);
                $('.walletbtn').trigger('click');
                $('#payment').val('');
            }


        }
    });
}

function ConfirmDialog3(message, Amount) {
    $('<div></div>').appendTo('body')
        .html('<div><h6>' + message + '?</h6></div>').dialog({
            modal: true,
            title: 'Confirm Payment',
            zIndex: 10000,
            autoOpen: true,
            width: 'auto',
            resizable: false,
            buttons: {
                Yes: function () {
                    $(this).dialog("close");
                    ReceiveAmount(Amount)
                },
                No: function () {
                    $(this).dialog("close");
                }
            },
            close: function (event, ui) {
                $(this).remove();
            }
        });
};


function showpopup(msg) {
    $('#Alert_btn').attr("data-message", msg)

    $('#Alert_btn').trigger('click');
}


$(".menuopt").click(function (e) {
    e.stopImmediatePropagation();
    $("#preload").show();
    var clr = $(this).find("path").attr('fill');
    if (clr == "gray") {
        $(this).find("path").attr('fill', '#27cacc');
       
    }
    else {
        $(this).find("path").attr('fill', 'gray');
        
    }
   
})

$("._walletbtn").click(function (e) {
    e.stopImmediatePropagation();
   
    var clr = $(this).find("path").attr('fill');
    if (clr == "gray") {
        $(this).find("path").attr('fill', '#27cacc');

    }
    else {
        $(this).find("path").attr('fill', 'gray');

    }
    if ($(".cardatmcls").hasClass("atmcard")) {
        $(".cardatmcls").removeClass("atmcard")
        $(".cardatmcls").addClass("atmcardopen")


    } else {
        $(".cardatmcls").addClass("atmcard")
        $(".cardatmcls").removeClass("atmcardopen")
        $("#Layer_1 path").attr('fill', 'gray');

    }

})