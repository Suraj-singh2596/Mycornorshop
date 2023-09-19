<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_purchase.aspx.cs" Inherits="Components_Add_purchase" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Add Purchase</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="../Assest/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Assest/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Assest/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="../Assest/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../Assest/css/category_main.css" rel="stylesheet" />

    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link href="../Assest/css/alert.css" rel="stylesheet" />
    <link href="../Admin/css/textfield.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />

    <link href="CSS/purchase_main.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="../Admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <style>

        

        #added__itemsbox {
            padding-top: 9%;
        }

        @media only screen and (max-width:767px) {
            #added__itemsbox {
                padding-top: 30%;
            }

            #searchResult {
                margin: auto;
                width: 50%;
            }
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            margin: 0;
        }

        .lb_price_lbl h6 {
            font-size: 14px !important;
        }

        .lS_price_lbl h6 {
            font-size: 14px !important;
        }

        .stock_lbl h6 {
            font-size: 14px !important;
        }

        .box__ {
            background: white;
            padding: 10px;
            border: 1px solid #ececec;
            border-radius: 10px;
            margin-top: 10px;
        }

        .nameofitem, .barofitem {
            font-weight: bold;
        }

        .borderbox {
            border: 1px solid #ddd;
            border-radius: 10px;
            height: 75px;
        }

        .add_purchasebox {
            background: white;
            padding: 10px;
            border: 1px solid #ececec;
            border-radius: 10px;
            font-size: 14px;
        }

        .form-control {
            display: block;
            width: 100%;
            padding: .375rem .75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #ececec;
            background-clip: padding-box;
            border: 1px solid #ffffff;
            border-radius: .25rem;
            transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
        }

        .side-menu {
            width: 300px;
            height: 100%;
            padding: 50px 0;
            box-sizing: border-box;
            background-image: linear-gradient(0deg, #384862, #5294bd);
            display: flex;
            flex-flow: column nowrap;
            box-shadow: 5px 0px 10px rgba(17, 26, 41, 0.6);
            position: fixed;
            z-index: 9999;
            top: 0;
            transition: 0.5s;
            /* transform: translateX(0); */
        }

            .side-menu form {
                display: flex;
                margin: 0 10px 50px;
                border-radius: 100px;
                border: 1px solid #fff;
            }

                .side-menu form input,
                .side-menu form button {
                    background-color: transparent;
                    color: #fff;
                    border: none;
                    padding: 5px 10px;
                }

                .side-menu form input {
                    width: 230px;
                }

            .side-menu label {
                position: absolute;
                width: 40px;
                height: 80px;
                background-color: #384862;
                color: #fff;
                right: -40px;
                top: 0;
                bottom: 0;
                margin: auto;
                line-height: 80px;
                text-align: center;
                font-size: 30px;
                border-radius: 0 10px 10px 0;
            }

        #side-menu-switch {
            position: absolute;
            opacity: 0;
        }

            #side-menu-switch:checked + .side-menu {
                transform: translateX(-100%);
            }

                #side-menu-switch:checked + .side-menu label .fa {
                    transform: scaleX(-1);
                }

        ::placeholder {
            /* Chrome, Firefox, Opera, Safari 10.1+ */
            color: #fff;
            opacity: 1; /* Firefox */
        }

        .side-menu form button {
            width: 50px;
        }

        .side-menu form input:focus::placeholder {
            color: #ccc;
        }

        .side-menu form input:focus,
        .side-menu form button:focus {
            outline: none;
        }

        .ui-helper-hidden-accessible {
            display: none;
        }

        nav a {
            display: block;
            padding: 10px;
            color: #fff;
            text-decoration: none;
            position: relative;
            font-family: "Noto Sans TC", sans-serif;
        }

            nav a + a::before {
                content: "";
                position: absolute;
                border-top: 1px solid #fff;
                left: 10px;
                right: 10px;
                top: 0;
            }
            /* Method 1 */
            nav a .fas {
                margin-right: -1.1em;
                transform: scale(0);
                transition: 0.5s;
            }

            nav a:hover .fas {
                margin-right: 0.3em;
                transform: scale(1);
            }


        @media only screen and (max-width: 1024px) {
            .side-menu {
                display: none;
            }
        }

        .productdetails {
            font-size: 12px;
            margin: auto;
        }

        .add_purchasebox input {
            width: 100% !important;
            font-size: 12px !important;
        }

        .add_purchasebox label {
            font-size: 12px;
        }

        .form-group {
            margin-bottom: 0px !important;
        }

        #addNewproduct {
            font-size: 20px;
            float: right;
            margin-top: 3px;
            color: rgba(18,198,218,1);
        }

            #addNewproduct:active {
                color: gray;
            }

        .addgstbtn {
            padding: 4px;
            border-radius: 5px;
            color: white !important;
        }

        .gstbox {
            display: none;
        }

        ::placeholder {
            color: gray;
            opacity: 1; /* Firefox */
        }

        :-ms-input-placeholder { /* Internet Explorer 10-11 */
            color: gray;
        }

        ::-ms-input-placeholder { /* Microsoft Edge */
            color: gray;
        }

        .searchbox_box {
            margin-top: 20px;
            position: initial;
            width: 100%;
        }

        .tagscss {
            border: 1px solid #d0dcff;
            margin: 10px;
            padding: 4px;
            border-radius: 25px;
            background: #d7e2ff;
            cursor: pointer;
        }

        #AddItemModal input {
            width: 100% !important;
        }

        #searchResult {
            margin: 0;
            width: 100%;
        }

        .itemdetails {
            font-size: 13px;
            margin: auto;
        }

        #searchResult li {
            padding: 5px;
            border-bottom: 1px solid #ddd !important;
        }


        .count {
            position: absolute;
            left: 5px;
            margin-top: -10px;
            background: #384862;
            padding-left: 5px;
            padding-right: 5px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            color: white;
        }

        .productdetails {
            width: 70%;
        }
        /*   #added__itemsbox {
    padding-top: 10%;
}*/ .pmd-textfield-floating-label.pmd-textfield-floating-label-completed label {
            -ms-transform: translateY(0px);
            -webkit-transform: translateY(0px);
            transform: translateY(0px);
            font-size: 0.675rem;
            color: rgba(0, 0, 0, 0.54);
        }
    </style>
</head>
<body>

    <input type="checkbox" name="" checked="checked" id="side-menu-switch" />
    <div class="side-menu">

        <nav id="navMenu">
        </nav>
        <label id="sidemenu" for="side-menu-switch">
            <i class="fa fa-angle-left"></i>
        </label>
    </div>
    <div id="preload" style="display: none;">
        <div class="sk-folding-cube">
            <div class="sk-cube1 sk-cube"></div>
            <div class="sk-cube2 sk-cube"></div>
            <div class="sk-cube4 sk-cube"></div>
            <div class="sk-cube3 sk-cube"></div>
        </div>
    </div>
    <%-- header section  --%>

    <nav class="navbar fixed-top navbar-light bg-light" id="headertextappend">
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 30px; margin-top: -15px;">Add Purchases
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>


    <div class="">
    </div>

    <div class="container">


        <div class="clear"></div>

        <div class="container">
            <div id="added__itemsbox">
            </div>
        </div>
        <%-- Product Detail Section --%>

        <div class="container">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8 pl-0 pr-0">
                    <div class="row">
                        <div class="col-12">
                            <div class="box__">
                                <div class="itemdetailbox container">
                                    <div id="Invoice_Details" runat="server">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="searchbox_box">
                        <div class="row">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">

                                <div class="serdiv">
                                    <i style="padding-left: 10px;" class="fa fa-search"></i>
                                    <input id="txt_search" class="searchinput" style="width: 75%;" placeholder="search items here..." />
                                    <i id="addNewproduct" class="fa fa-plus-square"></i>
                                </div>
                                <ul id="searchResult"></ul>



                            </div>
                            <div class="col-sm-2"></div>
                        </div>


                    </div>

                </div>

            </div>
        </div>
        <%-- Product Detail Section  end--%>

        <%-- Product add purchase section--%>
        <div class="container">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8 pl-0 pr-0">
                    <div id="AskBuySellPrice">
                    </div>
                    <div id="ItemList"></div>


                    <div class="col-sm-2"></div>
                </div>

            </div>
            <%-- Product add purchase section end --%>


            <%-- Product History section--%>
            <div class="container-fluid mb-5 d-none" id="myDiv">
                <div class="row">
                    <div class="col-md-12 col-sm-12 pl-0 pr-0">
                        <div class="card p-3 mt-3 mb-3" style="overflow: auto;">
                            <div class="trxhistory">
                                <label>Report</label>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>QTY</th>
                                            <th style="width: 200px;">Buying Price</th>
                                            <th>Selling Price</th>
                                            <th style="width: 200px!important;">Supplier Name</th>
                                            <th>Invoice No</th>
                                            <%-- <th>Status</th>
                                        <th>Delivered by</th>
                                        <th>Payment Status</th>
                                        <th style="width: 200px;">Payment Amount</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Date</th>
                                            <th>QTY</th>
                                            <th style="width: 200px;">Buying Price</th>
                                            <th>Selling Price</th>
                                            <th style="width: 200px!important;">Supplier Name</th>
                                            <th>Invoice No</th>
                                            <%--<th>Status</th>
                                        <th>Delivered by</th>
                                        <th>Payment Status</th>
                                        <th>Payment Amount</th>--%>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>


                        </div>

                    </div>

                </div>
            </div>
            <%-- Product History section end --%>

            <div class="container" style="margin-bottom: 60px;" id="Personal_Section">
            </div>
        </div>
    </div>


    <div class="modal fade" id="AddItemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    </div>

    <footer>
        <div class="footer__">
            <div class="container">
                <div class="row">
                    <%-- <div class="col-5">
                        <div class="total-section text-center">
                            <div class="items__count"><span id="item_count">0</span><span id="item_count_"> items</span></div>
                            <div class="items__total"><span id="item_total_amount">Rs. </span><span id="item_total_amount_"></span></div>
                        </div>
                    </div>--%>
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div class="button-section">
                            <button class="btn btnstyle w-100 " id="SubmitPurchase" style="margin-top: 5px; margin-bottom: 5px;">Submit Purchase</button>
                        </div>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>

        </div>
    </footer>
    <button type="button" id="Alert_btn" style="display: none; background: lightgray!important;" data-positionx="center" data-positiony="top" data-effect="fadeInUp"
        data-message="" data-duration="4000" data-type="danger" class="btn pmd-ripple-effect btn-danger pmd-z-depth pmd-alert-toggle">
    </button>
    <script src="../Admin/js/global.js"></script>
    <script src="../Assest/js/ripple-effect.js"></script>
    <script src="../Admin/js/textfield.js"></script>

    <script src="../Assest/js/alert.js"></script>
    <script src="../Assest/js/owl.carousel.min.js"></script>
    <script src="../Assest/bootstrap.js"></script>
    <script src="../Assest/js/jquery-ui.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <script>
        $("#addNewproduct").click(function (e) {
            e.stopImmediatePropagation();
            getItemModal('', 'ADD', '');
        })
        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }
        function getItemModal(MID, Flag, currentt) {

            $('#AddItemModal').empty();
            $.ajax({
                type: "POST",
                async: true,
                url: "../Admin/admin_items.aspx/fnAddNewItem",
                data: '{MID: "' + MID + '",Flag: "' + Flag + '"}',
                beforeSend: function () {
                    $("#preload").show();
                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#AddItemModal').empty();
                    $('#AddItemModal').append(data.d);

                    window.location.hash = "modal";

                    $('#AddItemModal').modal();

                    var loadFile = function (event) {
                        var image = document.getElementById('image');
                        image.src = URL.createObjectURL(event.target.files[0]);
                    };

                    $('#addproductbtn').removeAttr('disabled');
                    //image();
                    $('#Category').change(function () {
                        var CGID = $(this).find('option:selected').attr('cgid');
                        var abc = '';
                        $('#subcategorys').find('option').each(function () {
                            if ($(this).attr('cgid') == CGID && abc == '') {
                                $(this).attr('selected', 'selected');
                                $(this).removeClass('d-none')
                                abc = '1';
                            }
                            else if ($(this).attr('cgid') == CGID && abc == '1') {
                                $(this).removeClass('d-none')
                            }
                            else {
                                $(this).removeAttr('selected')
                                $(this).addClass('d-none')
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


                    $('#submititems').click(function (e) {
                        e.stopImmediatePropagation();

                        $(this).attr('disabled', 'disabled');
                        var Flag = $(this).attr('flag');
                        var Item_Name = $('#itemname').val();
                        var MTID = $('#Category option:selected').attr('cgid');
                        var MCID = $('#subcategorys option:selected').attr('mcid');

                        var LocalName = $('#localname').val();
                        var HSN_No = $('#Hsnnumber').val();
                        var MRP = $('#mrp').val();
                        var Selling_Price = $('#sprice').val();
                        var GST_Percentage = $('#GSTPERCENT').val();
                        var GST_Included = $('#GSTINCLUDED option:selected').val();
                        var selectedTags = '';
                        var Barcode = $('#barcode').val();
                        $('.selectedtag').each(function () {
                            selectedTags = selectedTags + $(this).text() + '|';
                        })
                        var imagesrc = $("#image").attr("src");
                        var ImgSource = '';
                        if (imagesrc != null || imagesrc != undefined) {
                            if (imagesrc.indexOf('base64') > -1) {
                                ImgSource = imagesrc.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
                            }
                            else {
                                ImgSource = '';
                            }

                        }
                        var Description = $('#Description').val();
                        var MID = $(this).attr('mid') || '';

                        var current_tr = '';


                        addItem(Item_Name, MTID, MCID, LocalName, HSN_No, MRP, Selling_Price, GST_Percentage,
                            GST_Included, ImgSource, Description, selectedTags, MID, Flag, Barcode, current_tr);

                        if (Flag == 'EDIT') {
                            showpopup('Item Updated Successfully');
                            var td_row = '<td class="sorting_1"><label class="switch">' +
                                '<input available="Y" mid="' + MID + '" class=" avability" type="checkbox" checked="">' +
                                '<span class="slider round"></span></label></td><td>1</td><td>' + Item_Name + '</td>' +
                                '<td>' + Description + '</td><td>' + $('#subcategorys option:selected').text() + '</td><td>' + $('#Category option:selected').text() + '</td><td>' + Selling_Price + '</td><td>' + MRP + '</td><td>' + GST_Included + '</td>' +
                                '<td>' + GST_Percentage + '</td><td><i mid="' + MID + '" name="' + Item_Name + '" class="fa fa-edit editItem"></i> ' +
                                '<i mid="' + MID + '" name="' + Item_Name + '" class="fa fa-tick d-none tickItem"></i></td><td>' +
                                '<i mid="' + MID + '" name="' + Item_Name + '" class="fa fa-trash deleteItem"></i></td>';
                            currentt.empty();
                            currentt.append(td_row);
                        }


                        if (Flag == 'DELETE') {
                            showpopup('Item deleted Successfully');
                        }
                    })

                    $('#itemname').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#itemname').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "../Admin/admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                Barcode: data.d[key].Barcode,
                                                price: data.d[key].Price,
                                                MRP: data.d[key].MRP,
                                                Local_Name: data.d[key].Option_Name
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            $('#barcode').val(ui.item.Barcode);
                            $('#sprice').val(ui.item.price);
                            $('#itemname').val(ui.item.label);
                            $('#mrp').val(ui.item.MRP);
                            $('#localname').val(ui.item.Local_Name);
                        }
                    });

                    $('#barcode').autocomplete({
                        source: function (request, response) {
                            var Search_Value = $.trim($('#barcode').val());
                            if (Search_Value.length >= 2) {
                                $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "../Admin/admin_items.aspx/fnGetAllProducts",
                                    data: '{Search_Value: "' + Search_Value + '"}',
                                    dataType: "json",
                                    success: function (data) {
                                        $('.ui-widget-content').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });
                                        $('.ui-autocomplete').css({ 'width': '300px', 'left': '556px;', 'top': '1267px', 'z-index': '9999' });

                                        response($.map(data.d, function (value, key) {
                                            return {
                                                label: data.d[key].Item_Name,
                                                Barcode: data.d[key].Barcode,
                                                price: data.d[key].Price,
                                                MRP: data.d[key].MRP,
                                                Local_Name: data.d[key].Option_Name
                                            };
                                        }));
                                    }
                                })
                            }

                        },

                        select: function (event, ui) {

                            event.preventDefault();
                            var TempValue = ui.item.value;
                            $('#barcode').val(ui.item.Barcode);
                            $('#sprice').val(ui.item.price);
                            $('#itemname').val(ui.item.label);
                            $('#mrp').val(ui.item.MRP);
                            $('#localname').val(ui.item.Local_Name);
                        }
                    });


                },
                complete: function () {
                    $("#preload").hide();
                }
            })
        }
        window.onpopstate = function () {
            let open_modal = document.querySelector('.modal.show')
            if (open_modal) {
                open_modal.dataset.pushback = 'true';
                $(open_modal).modal('hide')
            }
        }
        function addItem(Item_Name, MTID, MCID, LocalName, HSN_No, MRP, Selling_Price, GST_Percentage,
            GST_Included, ImgSource, Description, selectedTags, MID, Flag, Barcode, current_tr) {
            $.ajax({
                type: "POST",
                async: true,
                url: "../Admin/admin_items.aspx/fnUpdateMenuItem",
                data: '{Item_Name:"' + Item_Name + '",MTID:"' + MTID + '",MCID:"' + MCID + '",LocalName:"' + LocalName
                    + '",HSN_No:"' + HSN_No + '",MRP:"' + MRP + '",Selling_Price:"' + Selling_Price + '",GST_Percentage:"' + GST_Percentage
                    + '",GST_Included:"' + GST_Included + '",ImgSource:"' + ImgSource + '",Description:"' +
                    Description + '",selectedTags:"' + selectedTags + '",MID:"' + MID + '",Flag:"' + Flag + '",Barcode:"' + Barcode + '"}',
                beforeSend: function () {
                    $("#preload").show();

                },
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('#AddItemModal').modal('hide');

                    if (Flag == 'ADD') {
                        showpopup('Item Added Successfully');


                    }

                },
                complete: function () {
                    $("#preload").hide();

                },
            })
        }


        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image')
                        .attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
                $("#image").show();
            }
        }



        $(document).ready(function () {
            $('#dataTable').dataTable();

            var storedData = localStorage.getItem("item_list");
            if (storedData != null && storedData != "null") {
                datarray = JSON.parse(storedData);

                for (var j = 0; j < datarray.length; j++) {
                    RowCreated(datarray[j].Current_Selling_Price, datarray[j].Qty, datarray[j].UOM, datarray[j].MRP, datarray[j].Purchase_Rate,
                        datarray[j].GST, datarray[j].GST_Included, datarray[j].Price_With_Tax, datarray[j].Total, datarray[j].HSN,
                        datarray[j].Item_Name, datarray[j].MID, datarray[j].Img, datarray[j].Current_Stock, datarray[j].Comment);
                }

            }
            var Invoice_Detail = localStorage.getItem("Invoice_Details");
            if (Invoice_Detail != null && Invoice_Detail != "null") {
                var dataInvoice_Details = JSON.parse(Invoice_Detail);
                Invoice_Detail = "<div class=\"row\"><div class=\"productdetails\" style=\"width: 60%\"><div><strong>" + dataInvoice_Details[0].Supplier_Name + "</strong></div></div>" +
                    "<div class=\"productdetails\" style=\"width: 40%;\"><div><strong><i class=\"fa fa-calendar\"></i> " + dataInvoice_Details[0].Invoice_Date + "</strong>" +
                    "<a href=\"supplier.aspx\"><i style=\"float: right;color: red;\" class=\"fa fa-edit\"></i></a></div></div></div>" +
                    "<div class=\"row\"><div class=\"productdetails\" style=\"width: 60%\"><div><strong>Invoice No. " + dataInvoice_Details[0].Invoice_No + "</strong></div></div>" +
                    "<div class=\"productdetails\" style=\"width: 40%; \"><div><strong>Amount : <span id=\"total_to_compare\">" + dataInvoice_Details[0].Invoice_Amount + "</span></strong></div></div></div>";
            }
            else {
                Invoice_Detail = " <div class=\"row\"><div class=\"col-12\">" +
                    "<button type=\"button\" class=\"btn btnstyle w-100\" id=\"Add_Invoice_Btn\" onclick=\"location.href='supplier.aspx'\">Add Invoice Details</button>" +
                    "</div></div>";
            }
            $('#Invoice_Details').empty();
            $('#Invoice_Details').append(Invoice_Detail);
        })

        var datarray = [];

        function deldata(titleValue) {
            // retrieve stored data (JSON stringified) and convert

            var storedData = localStorage.getItem("item_list");
            if (storedData) {
                datarray = JSON.parse(storedData);
            }

            // Find and remove item from an array
            for (var j = 0; j < datarray.length; j++) {
                if (datarray[j].MID == parseInt(titleValue)) {
                    datarray.splice(j, 1);
                }
            }
            localStorage.setItem("item_list", JSON.stringify(datarray));
            //var i = datarray.indexOf(titleValue);
            //if (i > -1) {
            //    datarray.splice(i, 1);
            //}
            //  localStorage.setItem("item_list", JSON.stringify(datarray));
            //  datapost();
            // show();

        }

        function insert(Current_Selling_Price, Qty, UOM, MRP, Purchase_Rate, GST, GST_Included, Price_With_Tax, Total, HSN, Item_Name, MID, Img, Current_Stock, Comment) {

            const MID_Data = {
                Current_Selling_Price: Current_Selling_Price,
                Qty: Qty, UOM: UOM, MRP: MRP, Purchase_Rate: Purchase_Rate, GST: GST,
                GST_Included: GST_Included, Price_With_Tax: Price_With_Tax, Total: Total, HSN: HSN, Item_Name: Item_Name,
                MID: MID, Img: Img, Current_Stock: Current_Stock, Comment: Comment
            };
            datarray = JSON.parse(localStorage.getItem('item_list')) || [];
            datarray.push(MID_Data);
            localStorage.setItem("item_list", JSON.stringify(datarray));

        }

        function show() {
            var content = "<b>All Elements of the Arrays :</b><br>";
            for (var i = 0; i < datarray.length; i++) {
                content += datarray[i] + "<br>";
            }

            datapost();
        }

        function datapost() {
            var options = '';
            for (var i = 0; i < datarray.length; i++)
                options += '<option value="' + datarray[i] + '" />';

        }

        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
        }
        var Offer_Data = [];
        function inittialiseOrderData() {
            var FormData = {

            }
            if (Offer_Data == '')
                Offer_Data = JSON.stringify(FormData);
        }
        function getOfferItemsList(MID, Price, Qty, Flag) {
            if (Offer_Data == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Purchase.aspx/Update_Offer_Data",
                data: '{MID: "' + MID + '",Flag:"' + Flag + '", OfferData:' + Offer_Data + ', Qty:"' + Qty + '", Price:"' + Price + '"}',
                dataType: "json",
                success: function (data) {
                    Offer_Data = JSON.stringify(data.d);
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })

        }

        $('#txt_search').autocomplete({
            source: function (request, response) {
                var Search_Value = $.trim($('#txt_search').val());
                if (Search_Value.length >= 2) {
                    $('#searchResult').empty();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Add_purchase.aspx/fnGetAllProducts",
                        data: '{search: "' + Search_Value + '"}',
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                            $('.itemListLi').click(function (e) {
                                e.stopImmediatePropagation();

                                var current = $(this);
                                var MID = current.attr('mid');
                                var Current_Stock = current.attr('current_stock');
                                var Item = current.attr('item_name');
                                var Price = current.attr('price');
                                var Img = $(this).find('img').attr('src');
                                var GST = current.attr('gst');
                                var GST_Included = current.attr('gst_included');
                                RowGenerated(MID, Current_Stock, Item, Img, Price, GST, GST_Included);
                                //getTotalAmountAndCount(Price, Qty, 'ADD');
                                //getOfferItemsList(MID, Price, Qty, 'ADD');
                                $('#txt_search').val('')
                                $('#txt_search').focus();
                                $('#searchResult').empty();

                                //$('.deleterow').click(function (e) {
                                //    e.stopImmediatePropagation();
                                //    getOfferItemsList($(this).attr('mid'), '', '', 'DELETE');
                                //    getTotalAmountAndCount($(this).attr('price'), $(this).attr('qty'), 'DELETE');
                                //    $(this).parent().parent().parent().parent().parent().parent().remove();
                                //})
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

                    //return $('<li>')
                    //    .append("<img src=" + "/Menu_Pics/" + item.IMAGE_URL + " alt='img' />")
                    //    .append('<a>' + item.Item_Name + ' - Rs.' + item.Price + '</a>')
                    //    .append('<input type="number"value=' + item.Price + ' class="form-control price" />')
                    //    .append('<input type="number" value="1" class="form-control qty" />')
                    //    .append('<a class="btn btn-primary itemListLi">Add</a>')
                    //    .appendTo('#searchResult');
                    return $('<li>').append('<div class="container itemListLi" gst="' + item.GST + '" gst_included="' + item.GST_Included + '"  current_stock="' + item.Current_Stock + '" mid="' + item.MID + '" price="' + item.Price + '" item_name = "' + item.Item_Name + '">' +
                        '<div class="row"><div class="col-2" ><img class="w-100" src="' + 'https://mycornershop.in/Menu_Pics/' + item.IMAGE_URL + '" alt="img">' +
                        '</div><div class="col-10"><div class="row"><div class="col-12"><label class="itemdetails">' + item.Item_Name + ' - Rs.' + item.Price + '</label></div></div>' +
                        '<div class="row"><div class="col-4"></div><div class="col-4">' +
                        ' </div></div></div></div>').appendTo('#searchResult');


                };
            },
            select: function (event, ui) {

                event.preventDefault();

                //  ui.item.cg_name


            }

        });

        function RowGenerated(MID, Current_Stock, Item, Img, Price, GST, GST_Included) {
            var Div = '';
            var Comment_Box = '<textarea class="form-control" id="Comment" placeholder="Any Comment"></textarea>';
            if (MID > 0) {
                Div = '<div class="add_purchasebox container"><div><strong>' + Item + '</strong>' +
                    '<span style="float:right;"> ' +
                    '&nbsp;&nbsp; <i class="fa fa-trash" style="color:red;"></i></span></div> ' +
                    '<div class="row"><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="Qty" class="control-label">Qty</label><input name="Qty" type="number" id="Qty" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<select name="UOM" id="UOM" class="form-control" style="font-size: 13px; margin-top: 15px;">' +
                    '<option>Pieces</option><option>Pkt</option><option>Box</option></select><span class="pmd-textfield-focused"></span></div></div>' +
                    '<div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label "><label for="Purchase_Rate" class="control-label">Purchase Rate</label>' +
                    '<input name="Purchase_Rate" type="number" id="Purchase_Rate" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div>' +
                    '<div class="row"><div class="col-4"><div class="custom-control custom-checkbox" style="margin-top: 29px;">' +
                    '<input type="checkbox" checked="' + GST_Included + '" class="custom-control-input" id="customCheck2"><label class="custom-control-label" for="customCheck2">Include Tax</label>' +
                    '</div></div><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="Price_With_Tax" class="control-label">Price<sup>With tax</sup></label>' +
                    '<input name="Price_With_Tax" type="number" id="Price_With_Tax" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="Total" class="control-label">Total</label><input name="Total" type="number" id="Total" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div></div><div style="margin-top: 10px;"><a class="bnt btnstyle addgstbtn mt-2">Add GST Details</a>' +
                    '<a class="bnt btnstyle " id="CalculateAmount" style="float: right; padding: 4px; border-radius: 5px; margin-top: -7px; color: white !important;">Calculate</a>' +
                    '<div class="gstbox"><div class="row"><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="GST" class="control-label">GST</label><input name="GST" type="number" value="' + GST + '" id="GST" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="HSN" class="control-label">HSN</label>' +
                    '<input name="HSN" type="text" id="HSN" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div></div></div>' +
                    '<div class="row"><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="GST" class="control-label">MRP</label>' +
                    '<input name="GST" type="number" id="MRP" class="form-control"><span class="pmd-textfield-focused"></span></div></div><div class="col-6">' +
                    '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="Selling_Price" class="control-label">Selling Price</label>' +
                    '<input name="Selling_Price" type="number" id="Selling_Price" class="form-control"><span class="pmd-textfield-focused"></span></div></div>' +
                    '</div>' +
                    Comment_Box +
                    '<div style=\"text-align: right;margin-top:10px;\"><a mid="' + MID + '" Current_Stock="' + Current_Stock + '" Item="' + Item + '" Img="' + Img + '" class=" btnstyle create_row" style=\"color:white;width:100px;padding:5px;border-radius:5px;padding-left: 30px;padding-right: 30px;\">Ok</a></div></div> ';
            }
            else {
                Div = '<div class="add_purchasebox container"><div><strong>' + Item + '</strong>' +
                    '<span style="float:right;">' +
                    '&nbsp;&nbsp; <i class="fa fa-trash" style="color:red;"></i></span></div> ' +
                    '<div class="row"><div class="col-4 d-none"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="Qty" class="control-label">Qty</label><input name="Qty" value="1" type="number" id="Qty" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div><div class="col-4 d-none"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<select name="UOM" id="UOM" class="form-control" style="font-size: 13px; margin-top: 15px;">' +
                    '<option>Pieces</option><option>Pkt</option><option>Box</option></select><span class="pmd-textfield-focused"></span></div></div>' +
                    '<div class="col-4  d-none"><div class="form-group pmd-textfield pmd-textfield-floating-label "><label for="Purchase_Rate" class="control-label">Purchase Rate</label>' +
                    '<input name="Purchase_Rate" type="number" id="Purchase_Rate" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div>' +
                    '<div class="row"><div class="col-4  d-none"><div class="custom-control custom-checkbox" style="margin-top: 29px;">' +
                    '<input type="checkbox" checked="' + GST_Included + '" class="custom-control-input" id="customCheck2"><label class="custom-control-label" for="customCheck2">Include Tax</label>' +
                    '</div></div><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="Price_With_Tax" class="control-label">Amount</label>' +
                    '<input name="Price_With_Tax" type="number" id="Price_With_Tax" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="GST" class="control-label">GST</label><input name="GST" type="number" value="' + GST + '" id="GST" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div>' +
                    '<div class="col-4 d-none"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                    '<label for="Total" class="control-label">Total</label><input name="Total" type="number" id="Total" class="form-control"><span class="pmd-textfield-focused"></span>' +
                    '</div></div></div><div style="margin-top: 10px;"><a class="bnt btnstyle d-none mt-2">Add GST Details</a>' +
                    '<a class="bnt btnstyle  d-none" id="CalculateAmount" style="float: right; padding: 4px; border-radius: 5px; margin-top: -7px; color: white !important;">Calculate</a>' +
                    '<div class=""><div class="row"><div class="col-6 d-none"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="HSN" class="control-label">HSN</label>' +
                    '<input name="HSN" type="text" id="HSN" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div></div></div>' +
                    '<div class="row"><div class="col-6 d-none"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="GST" class="control-label">MRP</label>' +
                    '<input name="GST" type="number" id="MRP" class="form-control"><span class="pmd-textfield-focused"></span></div></div><div class="col-6 d-none">' +
                    '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="Selling_Price" class="control-label">Selling Price</label>' +
                    '<input name="Selling_Price" type="number" id="Selling_Price" class="form-control"><span class="pmd-textfield-focused"></span></div></div>' +

                    '</div>' + Comment_Box + '<div style=\"text-align: right;margin-top:10px;\"><a mid="' + MID + '" Current_Stock="' + Current_Stock + '" Item="' + Item + '" Img="' + Img + '" class="btnstyle create_row" style=\"color:white;width:100px;padding:5px;border-radius:5px;padding-left: 30px;padding-right: 30px;\">Ok</a></div></div>';
            }

            //var Div = '<div class="add_purchasebox container"><div><strong>' + Item + '</strong>' +
            //    '<span style="float:right;"><i mid="' + MID + '" Current_Stock="' + Current_Stock + '" Item="' + Item + '" Img="' + Img + '" class="fa fa-check create_row"></i>' +
            //    '&nbsp;&nbsp; <i class="fa fa-trash" style="color:red;"></i></span ></div > ' +
            //    '<div class="row"><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="Qty" class="control-label">Qty</label>' +
            //    '<input name="Qty" type="number" id="Qty" class="form-control"><span class="pmd-textfield-focused"></span></div></div><div class="col-6">' +
            //    '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="MRP" class="control-label">MRP</label>' +
            //    '<input name="MRP" type="number" id="MRP" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div><div class="row">' +
            //    '<div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="Buying" class="control-label">Purchase Price</label>' +
            //    '<input name="Buying" type="number" id="Buying" class="form-control"><span class="pmd-textfield-focused"></span></div></div><div class="col-6">' +
            //    '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="Selling" class="control-label">Selling Price</label>' +
            //    '<input name="Selling" type="number" id="Selling" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div>' +
            //    '<div style="margin-top: 10px;"><a class="bnt btnstyle addgstbtn mt-2">Add GST Details</a><div class="gstbox"><div class="row"><div class="col-6">' +
            //    '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="GST" class="control-label">GST(%)</label>' +
            //    '<input name="GST" type="number" id="GST" class="form-control"><span class="pmd-textfield-focused"></span></div></div><div class="col-6">' +
            //    '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="HSN" class="control-label">HSN</label>' +
            //    '<input name="HSN" type="text" id="HSN" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div></div></div></div>';
            $('#AskBuySellPrice').empty();
            $('#AskBuySellPrice').append(Div);
            //  RowCreated(MID, Current_Stock, Item, Img, "1");

            $(".addgstbtn").click(function (e) {
                e.stopImmediatePropagation();
                $(".gstbox").slideToggle();

            })
            $('#CalculateAmount').click(function (e) {
                e.stopImmediatePropagation();
                var Purchase_Rate = $.trim($('#Purchase_Rate').val());
                var Total = $.trim($('#Total').val());
                if (Purchase_Rate != '' && Total != '') {
                    showpopup('Please enter either Purchase Rate or Total');
                }
                else {
                    Calculation();
                }

            })

            $('.fa-trash').click(function (e) {
                e.stopImmediatePropagation();
                $('#AskBuySellPrice').empty();
            })

            $('.create_row').click(function (e) {
                e.stopImmediatePropagation();
                var Current_Selling_Price = $.trim($('#Selling_Price').val()) || '0';
                var Qty = $.trim($('#Qty').val()) || '0';
                var UOM = $('#UOM option:selected').text();
                var MRP = $.trim($('#MRP').val()) || '0';
                var Purchase_Rate = $.trim($('#Purchase_Rate').val()) || '0';
                var GST = $.trim($('#GST').val()) || 0;
                var GST_Included = $('#customCheck2').prop("checked");//== true ? 'Y' : 'N';
                var Comment = escapeHtml($.trim($('#Comment').val()));
                var Price_With_Tax = $.trim($('#Price_With_Tax').val()) || '0';
                var Total = $.trim($('#Total').val()) || '0';
                var HSN = $.trim($('#HSN').val());

                var Item_Name = $(this).attr('Item');
                var MID = $(this).attr('mid');
                var Img = $(this).attr('Img');
                var Current_Stock = $(this).attr('Current_Stock');

                if (Qty > 0) {
                    if (Item_Name == 'Discount') {
                        Price_With_Tax = Price_With_Tax * -1;
                        Qty = 0;
                    }
                    insert(Current_Selling_Price, Qty, UOM, MRP, Purchase_Rate, GST, GST_Included, Price_With_Tax, Total, HSN, Item_Name, MID, Img, Current_Stock, Comment);

                    RowCreated(Current_Selling_Price, Qty, UOM, MRP, Purchase_Rate, GST, GST_Included, Price_With_Tax, Total, HSN, Item_Name, MID, Img, Current_Stock, Comment);
                    $('#AskBuySellPrice').empty();
                }
                else {
                    showpopup('Quantity can not be zero');
                    $('#Qty').focus();
                }

                //if (Current_Selling_Price <= 0) {
                //    showpopup('Please enter Selling Price');
                //}
                //else if (Qty <= 0) {
                //    showpopup('Please enter Qty');
                //}
                //else if (MRP <= 0) {
                //    showpopup('Please enter MRP');
                //}

                //else {
                //    insert(Current_Selling_Price, Qty, UOM, MRP, Purchase_Rate, GST, GST_Included, Price_With_Tax, Total, HSN, Item_Name, MID, Img, Current_Stock, Comment);
                //    RowCreated(Current_Selling_Price, Qty, UOM, MRP, Purchase_Rate, GST, GST_Included, Price_With_Tax, Total, HSN, Item_Name, MID, Img, Current_Stock, Comment);
                //    $('#AskBuySellPrice').empty();
                //}
            })

        }

        function RowCreated(Current_Selling_Price, Qty, UOM, MRP, Purchase_Rate, GST, GST_Included, Price_With_Tax, Total, HSN, Item_Name, MID, Img, Current_Stock, Comment) {
            var Count = $('.count').length + 1;
            var Row = '';
            if (MID > 0) {
                Row = '<div class="box__ dataBox" mid="' + MID + '" selling_price="' + Current_Selling_Price + '" gst="' + GST + '" hsn="' + HSN + '" qty="' + Qty + '" mrp="' + MRP + '" purchase_price="' + Price_With_Tax + '">' +
                    '<div class="itemdetailbox container item_loop"><div class="row"><div><div class="count"><span title="Sr No">' + Count + '</span></div>' +
                    '<img width="60" src="' + Img + '" /></div><div class="productdetails"><div><strong class="item_N">' + Item_Name + '</strong>' +
                    '<i class="fa fa-trash removeFromList" mid="' + MID + '" title="Remove item from list" style="float: right; color: red; cursor: pointer; margin-top: -20px; margin-right: -20px;"></i>' +
                    '</div><div>Purchase Price : ' + Price_With_Tax + ' x ' + Qty + ' <b class="TotalAmount" style="float:right;">' + Total + '</b></div></div></div></div></div>';
            }
            else {
                Row = '<div class="box__ dataBox" mid="' + MID + '" selling_price="' + Current_Selling_Price + '" gst="' + GST + '" hsn="' + HSN + '" qty="' + Qty + '" mrp="' + MRP + '" purchase_price="' + Price_With_Tax + '">' +
                    '<div class="itemdetailbox container item_loop"><div class="row"><div><div class="count"><span title="Sr No">' + Count + '</span></div>' +
                    '<img width="60" src="' + Img + '" /></div><div class="productdetails"><div><strong class="item_N">' + Item_Name + '</strong>' +
                    '<i class="fa fa-trash removeFromList" mid="' + MID + '" title="Remove item from list" style="float: right; color: red; cursor: pointer; margin-top: -20px; margin-right: -20px;"></i>' +
                    '</div><div>' + Comment + ' <b class="TotalAmount" style="float:right;">' + Price_With_Tax + '</b></div></div></div></div></div>';
            }

            $('#ItemList').prepend(Row);

            $('.removeFromList').click(function (e) {
                e.stopImmediatePropagation();
                deldata($(this).attr('mid'));
                $(this).parent().parent().parent().parent().parent().remove();
            })


        }
        var entityMap = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#39;',
            '/': '&#x2F;',
            '`': '&#x60;',
            '=': '&#x3D;'
        };
        function escapeHtml(string) {
            return String(string).replace(/[&<>"'`=\/]/g, function (s) {
                return entityMap[s];
            });
        }

        $(document).ready(function () {
            getmenuname();
        })
        function getmenuname() {
            $.ajax({
                type: "POST",
                async: true,
                url: "../Admin/admin_dashboard.aspx/getMenulist",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        $("#navMenu").empty();
                        $("#navMenu").append(data.d);

                    }

                }

            });
        }


        $("#Gstdetails").click(function () {
            $("#gstform").slideToggle("slow", function () {
            });
        })

        $("#Addtags").click(function () {
            $("#tagsnames").slideToggle("slow", function () {
            });
        })

        var Invoice_Data = [];
        var datarrayImages = [];
        $('#SubmitPurchase').click(function (e) {
            e.stopImmediatePropagation();
            if ($('#Add_Invoice_Btn').length > 0) {
                showpopup('Please add Invoice Details first');
                $('#Add_Invoice_Btn').focus();
                $('#Add_Invoice_Btn').effect("shake", { times: 4 }, 1000);
            }
            else {
                var Total_To_Match = '0';
                var Total_To_Compare = $('#total_to_compare').text();
                $('.item_loop').each(function () {
                    Total_To_Match = parseFloat(Total_To_Match) + parseFloat($(this).find('.TotalAmount').text());
                })
                if (Total_To_Compare == Total_To_Match) {
                    datarray = JSON.parse(localStorage.getItem('item_list'));
                     
                    Invoice_Data = JSON.parse(localStorage.getItem('Invoice_Details'));

                    datarrayImages = JSON.parse(localStorage.getItem('Invoice_Images'));
                    for (var i = 0; i < datarrayImages.length; i++) {
                        datarrayImages[i].Img = datarrayImages[i].Img.replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, "");
                    }
                    datarrayImages = JSON.stringify(datarrayImages);

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Add_purchase.aspx/SubmitList",
                        data: '{datarray:' + JSON.stringify(datarray) + ',Invoice_Data:' + JSON.stringify(Invoice_Data) + ',Invoice_Images:' + datarrayImages + '}',

                        dataType: "json",
                        success: function (data) {
                            showpopup('Purchase Added Successfully');
                            localStorage.setItem('item_list', null);
                            localStorage.setItem('Invoice_Details', null);
                            localStorage.setItem('Invoice_Images', null);
                            setTimeout(function () {
                                location.reload();
                            }, 2000)
                        },
                        error: function (e) {
                            showpopup(e.statusText);
                        }
                    })
                }
                else {
                    showpopup('Sum of all items does not match with total purchase amount');
                }


            }
        })
        var PurchaseData = [];
        function inittialiseOrderData() {
            var FormData = {

            }
            if (PurchaseData == '')
                PurchaseData = JSON.stringify(FormData);
        }
        function CreateList(MID, Selling_Price, GST, HSN, Qty, MRP, Purchase_Price) {
            if (PurchaseData == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Add_purchase.aspx/AddPurchaseData",
                data: '{MID: "' + MID + '",Selling_Price:"' + Selling_Price + '", PurchaseData:' + PurchaseData + ', GST:"' + GST
                    + '", HSN:"' + HSN + '", Qty:"' + Qty + '", MRP:"' + MRP + '", Purchase_Price:"' + Purchase_Price + '"}',
                dataType: "json",
                success: function (data) {
                    Offer_Data = JSON.stringify(data.d);
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })

        }

        function SubmitList() {
            if (PurchaseData == '') {
                inittialiseOrderData();
            }
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Purchase.aspx/SubmitList",
                data: '{PurchaseData:' + PurchaseData + '}',
                dataType: "json",
                success: function (data) {
                    showpopup('Purchase Added Successfully');
                    setTimeout(function () {
                        location.reload();
                    }, 2000)
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })
        }
        $(".addgstbtn").click(function (e) {
            e.stopImmediatePropagation();
            $(".gstbox").slideToggle();

        })


        function Calculation() {

            var Qty = $.trim($('#Qty').val()) || 0;
            var Purchase_Rate = $.trim($('#Purchase_Rate').val()) || 0;
            var Total = $.trim($('#Total').val()) || 0;
            var GST = $.trim($('#GST').val()) || 0;
            var GST_Included = $('#customCheck2').prop("checked");//== true ? 'Y' : 'N';
            //showpopup(GST_Included);
            if (Qty <= 0) {
                showpopup('Please enter valid quantity');
                $('#Qty').focus();
                $('#Qty').effect("shake", { times: 4 }, 1000);
            }
            else if (Purchase_Rate == '' && Total == '') {
                showpopup('Please enter either purchase rate or total');
                $('#Purchase_Rate').effect("shake", { times: 4 }, 1000);
                $('#Total').effect("shake", { times: 4 }, 1000);
                $('#Purchase_Rate').focus();
            }
            else {
                var Price_Amount = '';
                var Price_With_GST = '';
                var CalTotal = '';
                if (GST_Included == true) {
                    if (Purchase_Rate > 0) {
                        Price_Amount = Purchase_Rate;
                        Price_With_GST = (parseFloat(Purchase_Rate) + ((parseFloat(Purchase_Rate) * parseFloat(GST)) / 100)).toFixed(2);
                        CalTotal = (Price_With_GST * Qty).toFixed(2);
                    }
                    else if (Total > 0) {
                        CalTotal = Total;
                        Price_With_GST = (Total / Qty).toFixed(2);
                        Price_Amount = ((parseFloat(Total / Qty) * 100) / (parseFloat(GST) + 100)).toFixed(2);
                    }
                    else {
                        showpopup('Please enter either purchase rate or total');
                        $('#Purchase_Rate').effect("shake", { times: 4 }, 1000);
                        $('#Total').effect("shake", { times: 4 }, 1000);
                        $('#Purchase_Rate').focus();
                    }

                }
                else {
                    if (Purchase_Rate > 0) {
                        Price_With_GST = ((parseFloat(Purchase_Rate) * 100) / (parseFloat(GST) + 100)).toFixed(2);
                        Price_Amount = Purchase_Rate;
                        CalTotal = (Purchase_Rate * Qty).toFixed(2);
                    }
                    else if (Total > 0) {
                        CalTotal = Total;
                        Price_Amount = (Total / Qty).toFixed(2);
                        Price_With_GST = ((parseFloat(Total / Qty) * 100) / (parseFloat(GST) + 100)).toFixed(2);
                    }
                    else {
                        showpopup('Please enter either purchase rate or total');
                        $('#Purchase_Rate').effect("shake", { times: 4 }, 1000);
                        $('#Total').effect("shake", { times: 4 }, 1000);
                        $('#Purchase_Rate').focus();
                    }
                }

                $('#Price_With_Tax').val(Price_With_GST);
                $('#Total').val(CalTotal);
                $('#Purchase_Rate').val(Price_Amount);
                $('#Price_With_Tax').parent().addClass('pmd-textfield-floating-label-active').addClass('pmd-textfield-floating-label-completed');
                $('#Total').parent().addClass('pmd-textfield-floating-label-active').addClass('pmd-textfield-floating-label-completed');
                $('#Purchase_Rate').parent().addClass('pmd-textfield-floating-label-active').addClass('pmd-textfield-floating-label-completed');
            }
        }
        $(document).ready(function () {
            getmenuname();
        })
        function getmenuname() {
            $.ajax({
                type: "POST",
                async: true,
                url: "../Admin/admin_dashboard.aspx/getMenulist",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data != "") {
                        $("#navMenu").empty();
                        $("#navMenu").append(data.d);

                    }

                }

            });
        }

    </script>
</body>
</html>
