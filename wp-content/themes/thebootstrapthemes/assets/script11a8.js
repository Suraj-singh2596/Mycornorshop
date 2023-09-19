jQuery(document).ready(function ($) {

    $(".scroll a, .navbar-brand, .gototop,.explore").click(function (event) {
        event.preventDefault();
        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 600, 'swing');
        $(".scroll li").removeClass('active');
        $(this).parents('li').toggleClass('active');
    });
	
});


$('#myAffix').affix({
    offset: {
        top: 627,
        bottom: 500,
    }
})

$('#showAffix').affix({
    offset: {
        top: 170,
        bottom: 500,
    }
})

$(window).scroll(function () {
    var scroll = $(window).scrollTop();

    if (scroll >= 50) {
        $(".site-header").addClass("fix-top");
    } else {
        $(".site-header").removeClass("fix-top");
    }
});


var wow = new WOW(
    {
        boxClass: 'wowload',      // animated element css class (default is wow)
        animateClass: 'animated fadeInUp', // animation css class (default is animated)
        offset: 0,          // distance to the element when triggering the animation (default is 0)
        mobile: true,       // trigger animations on mobile devices (default is true)
        live: true        // act on asynchronously loaded content (default is true)
    }
);
wow.init();

jQuery(function ($) {
    equalheight = function (container) {

        var currentTallest = 0,
            currentRowStart = 0,
            rowDivs = new Array(),
            $el,
            topPosition = 0;
        $(container).each(function () {

            $el = $(this);
            $($el).height('auto')
            topPostion = $el.position().top;

            if (currentRowStart != topPostion) {
                for (currentDiv = 0; currentDiv < rowDivs.length; currentDiv++) {
                    rowDivs[currentDiv].height(currentTallest);
                }
                rowDivs.length = 0; // empty the array
                currentRowStart = topPostion;
                currentTallest = $el.height();
                rowDivs.push($el);
            } else {
                rowDivs.push($el);
                currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
            }
            for (currentDiv = 0; currentDiv < rowDivs.length; currentDiv++) {
                rowDivs[currentDiv].height(currentTallest);
            }
        });
    }

    $(window).load(function () {
        equalheight('.eq-blocks');
    });


    $(window).resize(function () {
        equalheight('.eq-blocks');
    });

    if($('span').is('.edd_checkout_cart_item_title') && $('.edd_checkout_cart_item_title:contains("Bundle")')){
        $('.edd_checkout_cart_item_title').closest('.col-sm-8').attr('class', 'col-sm-12');
        $('.before-you-buy').css('display','none');
    }

    $('#edd-free-downloads-modal').on('keyup', '#edd_free_download_email', function () {
        if(!isEmail($(this).val())){
           $(this).css('border','1px solid #ff0000');
           $(this).closest('#edd_free_download_form').find('.edd-free-download-submit').prop( "disabled", true );
        } else {
            $(this).css('border','1px solid #008000');
            $(this).closest('#edd_free_download_form').find('.edd-free-download-submit').prop( "disabled", false );
        }
    })
    $('#edd_purchase_form').on('keyup', '#edd-email', function () {
        if(!isEmail($(this).val())){
           $(this).css('border','1px solid #ff0000');
           $(this).closest('#edd_purchase_form').find('#edd-purchase-button').prop( "disabled", true );
        } else {
            $(this).css('border','1px solid #008000');
            $(this).closest('#edd_purchase_form').find('#edd-purchase-button').prop( "disabled", false );
        }
    })

    $('#edd_purchase_form').on('keyup', '#edd-first', function () {
        if(!isName($(this).val())){
            $(this).css('border','1px solid #ff0000');
            $(this).closest('#edd_purchase_form').find('#edd-purchase-button').prop( "disabled", true );
        } else {
            $(this).css('border','1px solid #008000');
            $(this).closest('#edd_purchase_form').find('#edd-purchase-button').prop( "disabled", false );
        }
    })

    $('#edd_purchase_form').on('keyup', '#edd-last', function () {
        if(!isName($(this).val())){
            $(this).css('border','1px solid #ff0000');
            $(this).closest('#edd_purchase_form').find('#edd-purchase-button').prop( "disabled", true );
        } else {
            $(this).css('border','1px solid #008000');
            $(this).closest('#edd_purchase_form').find('#edd-purchase-button').prop( "disabled", false );
        }
    })
	
    function isEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z]{2,4})$/;
        return regex.test(email);
    }

    function isName(name) {
        var regex = /^([a-zA-Z ]{2,32})$/;
        return regex.test(name);
    }
});
