document.onkeydown = function (e) {
    if (e.keyCode == 123) {
        return false;
    }
    if (e.ctrlKey && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)) {
        return false;
    }
    if (e.ctrlKey && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)) {
        return false;
    }
    if (e.ctrlKey && e.keyCode == 'U'.charCodeAt(0)) {
        return false;
    }

    if (e.ctrlKey && e.shiftKey && e.keyCode == 'C'.charCodeAt(0)) {
        return false;
    }
}
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
$(".modal-target").click(function () {
    var src = $(this).attr('src');
    var img = '<img class="image-preview" src="' + src + '" alt=""/>'
    $(".preview-img").empty();
    $(".preview-img").append(img);
    modal.style.display = "block";
});

 
// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}



$('.popup-youtube, .popup-vimeo').magnificPopup({
    /*disableOn: 700,*/
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,
    fixedContentPos: false
});

$(document).ready(function () {
    $(document).on("click", '.whatsappsharebtn', function () {
        var imgurl = $(this).parent().parent().parent().find('img').attr('src');
        var img = new Image();
        img.onload = function () {
            var canvas = document.createElement("canvas");
            canvas.width = img.width;
            canvas.height = img.height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0);
            var base64Image = getBase64Image(canvas);

        };
        img.setAttribute("crossOrigin", "anonymous");
        img.src = imgurl;

        if (navigator.msSaveBlob) {
            var blob = dataURItoBlob(base64Image);
            /*return navigator.msSaveBlob(blob, name);*/
        }
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            $("#sharmodalbtn").hide();
            $(".preview-img").empty();
            var mod = "<img src='gomobile/assets/images/undraw_product_iteration_kjok.png' alt=''/> <br/> This Feature will come soon."
            $(".preview-img").append(mod);
            modal.style.display = "block";

        }
        else {
            var text = $(this).attr("data-text");
            var url = $(this).attr("data-link");


            var message = encodeURIComponent(text) + " - " + encodeURIComponent(img.src);
            var whatsapp_url = "whatsapp://send?text=" + message;
            window.location.href = whatsapp_url;
            
        }
    });

    $(document).on("click", '.whatsappsharebtntests', function () {
        var imgurl = $(this).parent().parent().parent().find('img').attr('src');
        var img = new Image();
        img.onload = function () {
            var canvas = document.createElement("canvas");
            canvas.width = img.width;
            canvas.height = img.height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0);
            var base64Image = getBase64Image(canvas);

        };
        img.setAttribute("crossOrigin", "anonymous");
        img.src = imgurl;

        if (navigator.msSaveBlob) {
            var blob = dataURItoBlob(base64Image);
            /*return navigator.msSaveBlob(blob, name);*/
        }
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            
            var text = $(this).attr("data-text");
            var url = $(this).attr("data-link");
            var message = encodeURIComponent(text) + " - " + encodeURIComponent(img.src);
            var whatsapp_url = "whatsapp://send?text=" + message;
            window.location.href = whatsapp_url;
             
        }
        else {
            $("#sharmodalbtn").hide();
            $(".preview-img").empty();
            var mod = "<img src='gomobile/assets/images/undraw_product_iteration_kjok.png' alt=''/> <br/> This Feature will come soon."
            $(".preview-img").append(mod);
            modal.style.display = "block";
        }
    });


});



//$("#formFile").change(function (g) {
//    g.preventDefault();
//    g.stopImmediatePropagation();
//    var reader = new FileReader();
//    reader.onload = imageIsLoaded;
//    reader.readAsDataURL(this.files[0]);

//});
//function imageIsLoaded(e) {
//    $("#fileupload__btn").attr('url', e.target.result);
//};


//var imagebase64 = "";

//function encodeImageFileAsURL(element) {
//    var file = element;
//    var reader = new FileReader();
//    reader.onloadend = function () {
//        imagebase64 = reader.result;
//    }
//    reader.readAsDataURL(file);
//}



$(".downloadsharebtn").click(function () {
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        $("#sharmodalbtn").hide();
        $(".preview-img").empty();
        var mod = "<img src='gomobile/assets/images/undraw_product_iteration_kjok.png' alt=''/> <br/> This Feature will come soon."
        $(".preview-img").append(mod);
        modal.style.display = "block";
    } else {
        var source = $(this).parent().parent().parent().find('img').attr('src');
        var img = new Image();
        img.onload = function () {
            var canvas = document.createElement("canvas");
            canvas.width = img.width;
            canvas.height = img.height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0);

            var base64Image = getBase64Image(canvas);
            downloadURI(base64Image, "image.png");
        };
        img.setAttribute("crossOrigin", "anonymous");
        img.src = source;

    }
});


function getBase64Image(canvas) {
    var dataURL = canvas.toDataURL("image/png");
    return dataURL;
}

function downloadURI(uri, name) {
    // IE10+ : (has Blob, but not a[download] or URL)
    if (navigator.msSaveBlob) {
        const blob = dataURItoBlob(uri);
        return navigator.msSaveBlob(blob, name);
    }
    const link = document.createElement("a");
    link.download = name;
    link.href = uri;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

function dataURItoBlob(dataurl) {
    const parts = dataurl.split(","),
        mime = parts[0].match(/:(.*?);/)[1];
    if (parts[0].indexOf("base64") !== -1) {
        const bstr = atob(parts[1]);
        let n = bstr.length;
        const u8arr = new Uint8Array(n);

        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new Blob([u8arr], { type: mime });
    } else {
        const raw = decodeURIComponent(parts[1]);
        return new Blob([raw], { type: mime });
    }
}


$(".sharevideos").click(function (e) {
    e.stopImmediatePropagation();
    e.preventDefault();
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        $("#sharmodalbtn").hide();
        $(".preview-img").empty();
        var mod = "<img src='gomobile/assets/images/undraw_product_iteration_kjok.png' alt=''/> <br/> This Feature will come soon."
        $(".preview-img").append(mod);
        modal.style.display = "block";
    }
    else {
        var text = $(this).attr("data-text");
        var url = $(this).attr("data-link");
        var message = encodeURIComponent(text) + " - " + encodeURIComponent(url);
        var whatsapp_url = "whatsapp://send?text=" + message;
        window.location.href = whatsapp_url;
        

    }
});



const shareData = {
    title: 'MDN',
    text: 'Learn web development on MDN!',
    url: 'https://developer.mozilla.org'
}

const btn = document.querySelector('button');
const resultPara = document.querySelector('.result');

// Share must be triggered by "user activation"
btn.addEventListener('click', async () => {
    try {
        await navigator.share(shareData)
        resultPara.textContent = 'MDN shared successfully'
    } catch (err) {
        resultPara.textContent = 'Error: ' + err
    }
});







