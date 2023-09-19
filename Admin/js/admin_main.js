




$("#addproductbtn").click(function () {
    $('#AddItemModal').empty();
    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/fnAddNewItem",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#AddItemModal').append(data.d);
            $('#AddItemModal').modal();
            Imageuploadforitems();

        }
    })
})

//$(".dashbordmove").click(function () {
//    $(this).parent().find(".nav-item").addClass("active");
//    $("#dashbordsection").show();
//    $("#reportsection").hide();
//    $("#itemsection").hide();

//})
//$(".reportsmove").click(function () {
//    $(this).parent().find(".nav-item").addClass("active");
//    $("#dashbordsection").hide();
//    $("#reportsection").show();
//    $("#itemsection").hide();
//    getReportsTotalRevenue();
//    getEarningOverview();
//    getRevenueSource();
//})
//$(".itemsmove").click(function () {
//    GEttabeldata();
//    getStealDeal();
//    getOffers();
//    getDeals();
//    $(this).parent().find(".nav-item").addClass("active");
//    $("#dashbordsection").hide();
//    $("#reportsection").hide();
//    $("#itemsection").show();

//})




$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
    localStorage.setItem('activeTab', $(e.target).attr('href'));
});

var activeTab = localStorage.getItem('activeTab');
if (activeTab) {
    // $('#accordionSidebar a[href="' + activeTab + '"]').tab('show');

    $('a[href="' + activeTab + '"]').trigger('click');
}
else {
    // $('#accordionSidebar a[href="#dashbordmove"]').tab('show');

    $('a[href="#dashbordmove"]').trigger('click');
}
$(function () {
    $('[data-toggle="tooltip"]').tooltip()
})

$(document).on('click', 'a', function (e) {
    //if ($(this).attr('href') == '#') {
    //    e.preventDefault();
    //}
    $("#itemsection").show();

});


$(document).ready(function () {
    setTimeout(function () {
        getStealDeal();
    }, 1000)
    setTimeout(function () {
        getOffers();
    }, 2000)
    setTimeout(function () {
        getDeals();
    }, 3000)
    setTimeout(function () {
        GEttabeldata();
    }, 1000)





    $("#itemsection").show();
})


function getRevenueSource() {
    $('#mop').empty();
    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/fngetRevenueSource",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var Current = data.d;
            Current = Current.split('|');
            var result = Current[0].substring(0, Current[0].length - 1);
            result = result.split(',');
            var a = [];
            for (var i = 0; i < result.length; i++) {
                if (a[i] != '') {
                    a.push(result[i]);
                }
            }

            var result1 = Current[1].substring(0, Current[1].length - 1);
            result1 = result1.split(',');
            var a1 = [];
            var MOP = '';
            for (var i = 0; i < result1.length; i++) {
                if (a1[i] != '') {
                    a1.push(result1[i]);
                    MOP = MOP + '<span class="mr-2"><i class="fas fa-circle text-primary"></i>' + result1[i] + '</span>';
                }
            }
            $('#mop').append(MOP);
            var ctx = document.getElementById("myPieChart");
            var myPieChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: a1,
                    datasets: [{
                        data: a,
                        backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
                        hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                        hoverBorderColor: "rgba(234, 236, 244, 1)",
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        caretPadding: 10,
                    },
                    legend: {
                        display: false
                    },
                    cutoutPercentage: 80,
                },
            });


        }
    })
}


function getReportsTotalRevenue() {
    $('#total_revenue').empty();
    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/fngetReportsTotalRevenue",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#total_revenue').append(data.d);
        }
    })
}



function getEarningOverview() {

    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/fngetEarningOverview",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var Current = data.d;
            var result = Current.substring(0, Current.length - 1);
            result = result.split(',');
            var a = [];
            for (var i = 0; i < result.length; i++) {
                if (a[i] != '') {
                    a.push(result[i]);
                }
            }
            var ctx = document.getElementById("myAreaChart");
            var myLineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                    datasets: [{
                        label: "Earnings",
                        lineTension: 0.3,
                        backgroundColor: "rgba(78, 115, 223, 0.05)",
                        borderColor: "rgba(78, 115, 223, 1)",
                        pointRadius: 3,
                        pointBackgroundColor: "rgba(78, 115, 223, 1)",
                        pointBorderColor: "rgba(78, 115, 223, 1)",
                        pointHoverRadius: 3,
                        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
                        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
                        pointHitRadius: 10,
                        pointBorderWidth: 2,
                        data: a,
                        //data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
                    }],
                },
                options: {
                    maintainAspectRatio: false,
                    layout: {
                        padding: {
                            left: 10,
                            right: 25,
                            top: 25,
                            bottom: 0
                        }
                    },
                    scales: {
                        xAxes: [{
                            time: {
                                unit: 'date'
                            },
                            gridLines: {
                                display: false,
                                drawBorder: false
                            },
                            ticks: {
                                maxTicksLimit: 7
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                maxTicksLimit: 5,
                                padding: 10,
                                // Include a dollar sign in the ticks
                                callback: function (value, index, values) {
                                    return '₹' + number_format(value);
                                }
                            },
                            gridLines: {
                                color: "rgb(234, 236, 244)",
                                zeroLineColor: "rgb(234, 236, 244)",
                                drawBorder: false,
                                borderDash: [2],
                                zeroLineBorderDash: [2]
                            }
                        }],
                    },
                    legend: {
                        display: false
                    },
                    tooltips: {
                        backgroundColor: "rgb(255,255,255)",
                        bodyFontColor: "#858796",
                        titleMarginBottom: 10,
                        titleFontColor: '#6e707e',
                        titleFontSize: 14,
                        borderColor: '#dddfeb',
                        borderWidth: 1,
                        xPadding: 15,
                        yPadding: 15,
                        displayColors: false,
                        intersect: false,
                        mode: 'index',
                        caretPadding: 10,
                        callbacks: {
                            label: function (tooltipItem, chart) {
                                var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                                return datasetLabel + ': ₹' + number_format(tooltipItem.yLabel);
                            }
                        }
                    }
                }
            });
        }
    })


}

function GEttabeldata() {

    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/Gettabledata",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d != "") {
                $("#dataTableItems").empty();
                $("#dataTableItems").append(response.d);
                $('#dataTableItems').dataTable();
                editForItems();


            }

        },
        error: function (response) {

        },
        complete: function () {

        },
    });
}

function editForItems() {

    $("#dataTable").on('click', '.editbtn', function () {

        var current = $(this).closest('tr');
        var edit = current.find('.editbtn');
        var update = current.find('.updatebtn');
        var cancel = current.find('.cancelbtn');
        var MID = $(this).attr('mid');

        $('#AddItemModal').empty();
        $.ajax({
            type: "POST",
            async: true,
            url: "admin.aspx/fnUpdateItem",
            data: '{MID:"' + MID + '"}',
            beforeSend: function () {

            },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#AddItemModal').append(data.d);
                $('#AddItemModal').modal();
                Imageuploadforitems();

            }
        })
        //name = current.find('.itmname').val();
        //localname = current.find('.itmname').attr("localname");
        //hsn = current.find('.itmname').attr("hsn");
        //Tagsnam = current.find('.itmname').attr("tags");
        //description = current.find('.descrption').val();
        //cgroup = current.find('.cgroup option:selected').text();
        //category = current.find('.category option:selected').text();
        //price = current.find('.price').val();
        //qty = current.find('.qty').val();
        //gstI = current.find('.gstinclude').val();
        //gstP = current.find('.gstpercent').val();

        //var num = cgroup;
        //$("#Category option").each(function () {
        //    if ($(this).text() == num) {
        //        $(this).attr("selected", "selected");
        //    }
        //    else {
        //        $(this).removeAttr("selected");
        //    }
        //});

        //var a = Tagsnam.split("|");

        //for (var i = 0; i < a.length; i++) {

        //    $('.tagselect').each(function () {
        //        if (a[i] == $(this).html()) {
        //            $(this).addClass('selectedtag');
        //            $(this).removeClass('tagscss');
        //        }
        //        else {
        //            $(this).removeClass('selectedtag');
        //            $(this).addClass('tagscss');
        //        }
        //    })


        //}

        //var b = [];

        //b.push(a);
        //// class="tagselect selectedtag" tagscss tagselect

        //$("#Description").val(description);
        //$("#itemname").val(name);
        //$("#subcategorys").val(category);
        //$("#localname").val(localname);
        //$("#Hsnnumber").val(hsn);
        //$("#mrp").val(price);
        //$("#sprice").val(price);
        //$("#GSTPERCENT").val(gstP);
        //$("#QTYtypes").val(qty);

        //$("#logoutModal").modal();
        //$("#updateitems").show();
        //$("#submititems").hide();
        edit.hide();
        update.show();
        cancel.show();


    });
    //$(".cancelbtn").click(function () {
    $("#dataTable").on('click', '.cancelbtn', function () {
        var current = $(this).closest('tr');
        edit = current.find('.editbtn');
        update = current.find('.updatebtn');
        cancel = current.find('.cancelbtn');
        text = current.find('.textfield');
        input = current.find('.inputfield');
        edit.show();
        update.hide();
        cancel.hide();
        text.show();
        input.hide();

    })
    //$(".updatebtn").click(function () {
    $("#dataTable").on('click', '.updatebtn', function () {
        var current = $(this).closest('tr');
        edit = current.find('.editbtn');
        update = current.find('.updatebtn');
        cancel = current.find('.cancelbtn');
        edit.show();
        update.hide();
        cancel.hide();


    })
    //$(".deletebtn").click(function () {
    $("#dataTable").on('click', '.deletebtn', function () {
        var MID = $(this).attr("mid");
        $.ajax({
            type: "POST",
            async: true,
            url: "admin.aspx/fnDeleteItem",
            data: '{MID:"' + MID + '"}',
            beforeSend: function () {

            },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                alert('Deleted successfully');
                GEttabeldata();

            }
        })
    })
}



function Imageuploadforitems() {

    $('#Category').change(function () {
        var MTID = $(this).val();
        $('#subcategorys').find('option').each(function () {
            if ($(this).attr('mtid') == MTID) {
                $(this).attr('selected', 'selected');

            }
            else {
                $(this).removeAttr('selected')
            }
        })
    })

    $(".tagselect").click(function () {

        if ($(this).hasClass("tagscss")) {
            $(this).removeClass("tagscss");
            $(this).addClass("selectedtag");
        }
        else {
            $(this).addClass("tagscss");
            $(this).removeClass("selectedtag");

        }

    })
    $("#Gstdetails").click(function () {
        $("#gstform").slideToggle("slow", function () {
        });
    })

    $("#Addtags").click(function () {
        $("#tagsnames").slideToggle("slow", function () {
        });
    })

    $("#addcategorybtn").click(function () {
        $("#addcategorymodal").modal('show');
    })
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#image-preview").attr("src", e.target.result);
                $("#image-preview").show(100);
                $("#image-preview").fadeIn(650);
            };
            reader.readAsDataURL(input.files[0]);

        }
    }

    $("#uploadBtn").change(function () {
        readURL(this);
        ResizeImage(this)

    });
    var url2 = '';
    $("#uploadBtn").change(function () {

        readURL3(this);
        ResizeImage(this)
    });

    function readURL3(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                url2 = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    function ConvChar(str) {
        c = {
            '<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;', "'": '&#039;',
            '#': '&#035;'
        };
        return str.replace(/[<&>'"#]/g, function (s) { return c[s]; });
    }




    function ResizeImage() {
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            var filesToUploads = document.getElementById('uploadBtn').files;
            var file = filesToUploads[0];
            if (file) {

                var reader = new FileReader();
                // Set the image once loaded into file reader
                reader.onload = function (e) {

                    var img = document.createElement("img");
                    img.src = e.target.result;

                    var canvas = document.createElement("canvas");
                    var ctx = canvas.getContext("2d");
                    ctx.drawImage(img, 0, 0);

                    var MAX_WIDTH = 100;
                    var MAX_HEIGHT = 100;
                    var width = img.width;
                    var height = img.height;

                    if (width > height) {
                        if (width > MAX_WIDTH) {
                            height *= MAX_WIDTH / width;
                            width = MAX_WIDTH;
                        }
                    } else {
                        if (height > MAX_HEIGHT) {
                            width *= MAX_HEIGHT / height;
                            height = MAX_HEIGHT;
                        }
                    }
                    canvas.width = width;
                    canvas.height = height;
                    var ctx = canvas.getContext("2d");
                    ctx.drawImage(img, 0, 0, width, height);

                    dataurl = canvas.toDataURL(file.type);
                    document.getElementById('image-preview').src = dataurl;
                    document.getElementById("uploadFile").value = this.value.replace("C:\\fakepath\\", dataurl);
                }
                reader.readAsDataURL(file);

            }

        } else {
            alert('The File APIs are not fully supported in this browser.');
        }
    }

    document.getElementById("uploadBtn").onchange = function () {
        document.getElementById("uploadFile").value = this.value.replace("C:\\fakepath\\", "");
    };
    imageuploadforcategory();

    $('#updateitems ,#submititems').click(function (e) {
        e.stopImmediatePropagation();
        var Flag = $(this).attr('flag');
        var Item_Name = $('#itemname').val();
        var MTID = $('#Category option:selected').val();
        var MCID = $('#subcategorys option:selected').attr('mcid')
        
        var LocalName = $('#localname').val();
        var HSN_No = $('#Hsnnumber').val();
        var MRP = $('#mrp').val();
        var Selling_Price = $('#sprice').val();
        var GST_Percentage = $('#GSTPERCENT').val();
        var GST_Included = $('#GSTINCLUDED option:selected').val();
        var selectedTags = '';
        $('.selectedtag').each(function () {
            selectedTags = selectedTags + $(this).text() + '|';
        })
        var imagesrc = $("#image-preview").attr("src");
        var ImgSource = '';
        if (imagesrc != null || imagesrc != undefined) {
            ImgSource = imagesrc.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
        }
        var Description = $('#Description').val();
        var MID = $(this).attr('mid') || '';
        $.ajax({
            type: "POST",
            async: true,
            url: "admin.aspx/fnUpdateMenuItem",
            data: '{Item_Name:"' + Item_Name + '",MTID:"' + MTID + '",MCID:"' + MCID + '",LocalName:"' + LocalName
                + '",HSN_No:"' + HSN_No + '",MRP:"' + MRP + '",Selling_Price:"' + Selling_Price + '",GST_Percentage:"' + GST_Percentage
                + '",GST_Included:"' + GST_Included + '",ImgSource:"' + ImgSource + '",Description:"' +
                Description + '",selectedTags:"' + selectedTags + '",MID:"' + MID + '",Flag:"' + Flag + '"}',
            beforeSend: function () {

            },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert('Updated successfully')
                $('#AddItemModal').modal('hide');
                GEttabeldata();

            }
        })

    })
}
function imageuploadforcategory() {
    function readURL2(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#image-previews").attr("src", e.target.result);
                $("#image-previews").show(100);
                $("#image-previews").fadeIn(650);
            };
            reader.readAsDataURL(input.files[0]);

        }
    }

    $("#uploadBtns").change(function () {
        readURL2(this);
        ResizeImage2(this)

    });
    var url2 = '';
    $("#uploadBtns").change(function () {

        readURL3(this);
        ResizeImage2(this)
    });

    function readURL3(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                url2 = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    function ConvChar(str) {
        c = {
            '<': '&lt;', '>': '&gt;', '&': '&amp;', '"': '&quot;', "'": '&#039;',
            '#': '&#035;'
        };
        return str.replace(/[<&>'"#]/g, function (s) { return c[s]; });
    }




    function ResizeImage2() {
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            var filesToUploads = document.getElementById('uploadBtns').files;
            var file = filesToUploads[0];
            if (file) {

                var reader = new FileReader();
                // Set the image once loaded into file reader
                reader.onload = function (e) {

                    var img = document.createElement("img");
                    img.src = e.target.result;

                    var canvas = document.createElement("canvas");
                    var ctx = canvas.getContext("2d");
                    ctx.drawImage(img, 0, 0);

                    var MAX_WIDTH = 100;
                    var MAX_HEIGHT = 100;
                    var width = img.width;
                    var height = img.height;

                    if (width > height) {
                        if (width > MAX_WIDTH) {
                            height *= MAX_WIDTH / width;
                            width = MAX_WIDTH;
                        }
                    } else {
                        if (height > MAX_HEIGHT) {
                            width *= MAX_HEIGHT / height;
                            height = MAX_HEIGHT;
                        }
                    }
                    canvas.width = width;
                    canvas.height = height;
                    var ctx = canvas.getContext("2d");
                    ctx.drawImage(img, 0, 0, width, height);

                    dataurl = canvas.toDataURL(file.type);
                    document.getElementById('image-previews').src = dataurl;
                    document.getElementById("uploadFiles").value = this.value.replace("C:\\fakepath\\", dataurl);
                }
                reader.readAsDataURL(file);

            }

        } else {
            alert('The File APIs are not fully supported in this browser.');
        }
    }

    document.getElementById("uploadBtn").onchange = function () {
        document.getElementById("uploadFile").value = this.value.replace("C:\\fakepath\\", "");
    };
}



$("#submitcategory").click(function () {
    var cat_name = $("#Categoryname").val();
    var gstpcent = $("#gstp").val();
    var taxcmnt = $("#taxcomment").val();
    var imgfile = $("#image-previews").attr("src");
    var ImgSource = '';
    if (imgfile != null || imgfile != undefined) {
        ImgSource = imgfile.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
    }
    if (cat_name == null && cat_name.length == "") {
        alert("Category name required");
    } else {
        $.ajax({
            type: "POST",
            async: true,
            url: "admin.aspx/fninsertcategory",
            data: '{cat_name:"' + cat_name + '",gstpcent:"' + gstpcent + '",taxcmnt:"' + taxcmnt + '",ImgSource:"' + ImgSource + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert('Updated successfully')
                $('#AddItemModal').modal('hide');
                GEttabeldata();
            }

        })

    }

})



function edits() {

    $(".editbtn").click(function (e) {
        e.stopImmediatePropagation();
        var current = $(this).closest('tr');
        var edit = current.find('.editbtn'),
            update = current.find('.updatebtn'),
            cancel = current.find('.cancelbtn'),
            MID = $(this).attr('mid');

        $('#AddItemModal').empty();
        $.ajax({
            type: "POST",
            async: true,
            url: "admin.aspx/fnUpdateItem",
            data: '{MID:"' + MID + '"}',
            beforeSend: function () {

            },
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                $('#AddItemModal').append(data.d);
                $('#AddItemModal').modal();
                Imageuploadforitems();

            }
        })


        edit.hide();
        update.show();
        cancel.show();


    });
    $(".cancelbtn").click(function () {

        var current = $(this).closest('tr');
        edit = current.find('.editbtn');
        update = current.find('.updatebtn');
        cancel = current.find('.cancelbtn');
        text = current.find('.textfield');
        input = current.find('.inputfield');
        edit.show();
        update.hide();
        cancel.hide();
        text.show();
        input.hide();

    })
    $(".updatebtn").click(function () {

        var current = $(this).closest('tr');
        edit = current.find('.editbtn');
        update = current.find('.updatebtn');
        cancel = current.find('.cancelbtn');
        edit.show();
        update.hide();
        cancel.hide();


    })
    $(".deletebtn").click(function () {

        var MID = $(this).attr("mid");
        //$.ajax({
        //    type: "POST",
        //    async: true,
        //    url: "admin.aspx/fnDeleteItem",
        //    data: '{MID:"' + MID + '"}',
        //    beforeSend: function () {

        //    },
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (data) {
        //        alert('Deleted successfully');
        //        GEttabeldata();

        //    }
        //})
    })
}

///--------------------------------------///---------------------------------------/////--------------------------------------



$("#addOffers").click(function () {
    $("#addoffers").modal();
})



function getStealDeal() {

    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/GetStealDealData",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#dataTableStealDeal').empty();
            $("#dataTableStealDeal").append(data.d);
            $('#dataTableStealDeal').dataTable();
        }
    })
}

function getOffers() {

    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/getOffersData",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#dataTableOffers').empty();
            $("#dataTableOffers").append(data.d);
            $('#dataTableOffers').dataTable();
        }
    })
}
function getDeals() {

    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/getDealData",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#dataTableDeals').empty();
            $("#dataTableDeals").append(data.d);
            $('#dataTableDeals').dataTable();
        }
    })
}

$(".addwallet").click(function () {
    $("#addwalletpopup").modal();

});




//for deal insert --------------------------------------------

$("#adddeals").click(function () {
    $("#adddeal").empty();
    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/gen_dealmodal",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#adddeal").append(data.d);
            $("#adddeal").modal();
            insertdeal();
            $('#dealitems').autocomplete({
                source: function (request, response) {
                    var Search_Value = $.trim($('#dealitems').val());
                    if (Search_Value.length >= 2) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "admin.aspx/fnGetAllProducts",
                            data: '{Search_Value: "' + Search_Value + '"}',
                            dataType: "json",
                            success: function (data) {
                                $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });
                                $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });

                                response($.map(data.d, function (value, key) {
                                    return {
                                        label: data.d[key].Item_Name,
                                        value: data.d[key].MID,
                                        qty: data.d[key].Qty,
                                        price: data.d[key].Price,
                                    };
                                }));
                            }
                        })
                    }

                },

                select: function (event, ui) {

                    event.preventDefault();
                    var TempValue = ui.item.value;
                     
                    $('#dealitems').val(ui.item.label);
                    $('#dealitems').attr('Content_id', TempValue);
                    $('#itmqty').val(ui.item.qty);
                    $('#itmprice').val(ui.item.price);

                }
            });
        }
    });


});

function insertdeal() {
    $('#createdeal').click(function () {
        var dealname = $('#dealname').val();
        var mid = $('#dealitems').attr('Content_id');
        var dealitemsname = $('#dealitems').val();
        var description = $('#Description').val();
        var itmqty = $('#itmqty').val();
        var reg_price = $('#itmprice').val();
        var ofrprice = $('#ofrprice').val();
        var instruction = $('#instruction').val();
        var startdate = $('#datestart').val();
        var enddate = $('#dateend').val();
        if (dealname.length == 0) {
            alert('Please select Deal Name');
        }
        else if (startdate.length == 0) {
            alert('Please select Start date');
        }
        else if (enddate.length == 0) {
            alert('Please select End date');
        }
        else {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin.aspx/insertdealitems",
                data: '{dealitemsname: "' + dealitemsname + '",dealname: "' + dealname + '",description: "' + description + '",itmqty: "' + itmqty + '",reg_price: "' + reg_price + '",ofrprice: "' + ofrprice
                    + '",instruction: "' + instruction + '",startdate: "' + startdate + '",enddate: "' + enddate + '",MID: "' + mid + '"}',
                beforeSend: function () {

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                }
            })

        }


    });

}





//for offers insert --------------------------------------------

$("#addOffers").click(function () {
    $("#addoffersapnd").empty();
    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/fnGetofferModal",
        data: '{}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $("#addoffersapnd").append(data.d);
            $("#addoffersapnd").modal();
            insertoffers()
            $('#ofr_items').autocomplete({
                source: function (request, response) {
                    var Search_Value = $.trim($('#ofr_items').val());
                    if (Search_Value.length >= 2) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "admin.aspx/fnGetAllProducts",
                            data: '{Search_Value: "' + Search_Value + '"}',
                            dataType: "json",
                            success: function (data) {
                                $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });
                                $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1158px', 'z-index': '9999' });

                                response($.map(data.d, function (value, key) {
                                    return {
                                        label: data.d[key].Item_Name + ' -  Rs. ' + data.d[key].Price,
                                        value: data.d[key].MID,
                                        qty: data.d[key].Qty,
                                        price: data.d[key].Price,
                                    };
                                }));
                            }
                        })
                    }

                },

                select: function (event, ui) {

                    event.preventDefault();
                    var TempValue = ui.item.value;
                    var itemsdelected = "<span class=\"itmscss\" itmqty=\"" + ui.item.qty + "\" Itemprice=\"ui.item.price\" Content_id=\"" + TempValue + "\">" +
                        "<select class=\"perticularqty\"><option value=\"1\">1</option><option value=\"2\">2</option><option value=\"3\">3</option><option value=\"4\">4</option><option value=\"5\">5</option><option value=\"6\">6</option><option value=\"7\">7</option><option value=\"8\">8</option><option value=\"9\">9</option><option value=\"10\">10</option></select> " + ui.item.label.replace('|', '-') + "<i class=\"fa fa-times-circle deleteselectitms\" style=\"font-size:16px;margin-left:10px;\"></i></span > ";
                    $('#selecteditems').append(itemsdelected);
                    var qty = $("#perticularqty:selected").val() + ','


                    current_data = qty(',');
                    for (var i = 0; i < current_data.length; i++) {
                        if ($.trim(current_data[i]) != '') {

                        }

                    }

                    removeitems();
                    //$('#dealitems').val(ui.item.label);
                    //$('#dealitems').attr('Content_id', TempValue);
                    //$('#itmqty').val(ui.item.qty);
                    //$('#itmprice').val(ui.item.price);

                }
            });
        }
    });


});

function removeitems() {
    $(".deleteselectitms").click(function () {
        $(this).parent().hide();
        $(this).parent().removeClass('itmscss');
    })
}

function insertoffers() {
    $('#Addoffersbtn').click(function () {
        var ofrname = $('#ofr_name').val();
        var ofr_original_price = $('#ofr_ori_price').val();
        var ofr_Price = $('#ofrprices').val();
        var sun = $('#ofrsun:checked').val();
        var mon = $('#ofrmon:checked').val();
        var tue = $('#ofrtue:checked').val();
        var wed = $('#ofrwed:checked').val();
        var thu = $('#ofrthu:checked').val();
        var fri = $('#ofrfri:checked').val();
        var sat = $('#ofrsat:checked').val();
        var startdate = $('#ofrstartdate').val();
        var enddate = $('#ofrenddate').val();
        var instruction = $('#ofr_instruct').val();
        var description = $('#ofr_description').val();
        var gst = "N";
        var gstpercent = $("#gstpercent").val().replace('%', '');
        if ($('#dateend:checked') != "N") {
            gst = "Y";
        }

        if (ofrname.length == 0) {
            alert('Please select offer Name');
        }

        else if (startdate.length == 0) {
            alert('Please select start date');
        }
        else if (enddate.length == 0) {
            alert('Please select End date');
        }
        else {
            $.ajax({
                type: "POST",
                async: true,
                url: "admin.aspx/insertoffersitems",
                data: '{ofrname: "' + ofrname + '",ofr_original_price: "' + ofr_original_price + '",ofr_Price: "' + ofr_Price + '",sun: "' + sun + '",mon: "' + mon + '",tue: "' + tue
                    + '",wed: "' + wed + '",thu: "' + thu + '",fri: "' + fri + '",sat: "' + sat + '",startdate: "' + startdate + '",enddate: "' + enddate
                    + '",instruction: "' + instruction + '",description: "' + description + '",gst: "' + gst + '",gstpercent:"' + gstpercent + '"}',
                beforeSend: function () {

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (data.d == 'Y') {

                        var selectedTags = '';
                        $('.itmscss').each(function () {
                            selectedTags = selectedTags + $(this).text() + '|' + $(this).attr('itmqty') + ',';
                        })


                        current_data = selectedTags.split(',');
                        for (var i = 0; i < current_data.length; i++) {
                            if ($.trim(current_data[i]) != '') {
                                offersitemsinsertloop(current_data[i]);
                            }

                        }


                    }
                }
            })

        }


    });

}


function offersitemsinsertloop(offeritms) {
 
    $.ajax({
        type: "POST",
        async: true,
        url: "admin.aspx/insertofferitemsinloop",
        data: '{offeritms: "' + offeritms + '"}',
        beforeSend: function () {

        },
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            alert(data.d)
        }
    })
}


