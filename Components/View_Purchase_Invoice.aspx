<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_Purchase_Invoice.aspx.cs" Inherits="Components_View_Purchase_Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link href="CSS/purchase_main.css" rel="stylesheet" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="../Assest/js/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="../Admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" />

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <style>
        .ui-autocomplete {
            z-index: 99999;
        }
        .custom-select{
            font-size:15px !important;
        }
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
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 30px; margin-top: -15px;">Invoice Details
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>


    <div class="">
    </div>

    <div class="container" style="margin-top: 100px;">
        <div class="clear"></div>
        <div class="container">
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-8 pl-0 pr-0">
                    <div class="row">
                        <div class="col-12">
                            <div class="box__">
                                <div class="itemdetailbox container">
                                    <div id="Invoice_Details">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-3">
        <div class="card" style="border-radius: 7px;">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-12" style="border-bottom: 1px solid lightgray;">
                        <h5 class="text-center">Item list</h5>
                    </div>

                    <div class="col-sm-12 col-12 mt-2">
                        <div class="table-responsive">
                            <table class="table table-bordered display" id="example" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Description</th>
                                        <th>Qty</th>
                                        <th>UOM</th>
                                        <th>Purchase Rate</th>
                                        <th>Tax Included</th>
                                        <th>Tax %</th>
                                        <th>Purchase Rate with Tax</th>
                                        <th>Total</th>
                                        <th>MRP</th>
                                        <th>Selling Price</th>
                                        <th>HSN</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Description</th>
                                        <th>Qty</th>
                                        <th>UOM</th>
                                        <th>Purchase Rate</th>
                                        <th>Tax Included</th>
                                        <th>Tax %</th>
                                        <th>Purchase Rate with Tax</th>
                                        <th>Total</th>
                                        <th>MRP</th>
                                        <th>Selling Price</th>
                                        <th>HSN</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="d-none">
        <div class="footer__">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <div class="button-section">
                            <button class="btn btnstyle w-100 " id="UpdatePurchase" style="margin-top: 5px; margin-bottom: 5px;">Update Purchase</button>
                        </div>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>

        </div>
    </footer>

    <div class="modal fade" id="GeneralModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Invoice Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12 col-12">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                                <label for="Supplier" class="control-label">Supplier Name</label>
                                <input name="Supplier" type="text" id="Supplier" class="form-control" /><span class="pmd-textfield-focused"></span>
                            </div>
                        </div>
                        <div class="col-sm-12 col-12">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                                <label for="Date" class="control-label">Date<sup>(mm/dd/yyyy)</sup></label>
                                <input name="Date" type="date" id="Date" class="form-control" /><span class="pmd-textfield-focused"></span>
                            </div>
                        </div>
                        <div class="col-sm-12 col-12">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                                <label for="Invoiceno" class="control-label">Invoice Number</label>
                                <input name="Invoiceno" type="text" id="Invoiceno" class="form-control" /><span class="pmd-textfield-focused"></span>
                            </div>
                        </div>
                        <div class="col-sm-12 col-12">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                                <label for="Amount" class="control-label">Invoice Amount</label>
                                <input name="Amount" type="number" id="Amount" class="form-control" /><span class="pmd-textfield-focused"></span>
                            </div>
                        </div>
                        <div class="col-sm-12 col-12">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                                <label for="Paid_Amount" class="control-label">Paid Amount</label>
                                <input name="Paid_Amount" type="number" id="Paid_Amount" class="form-control" /><span class="pmd-textfield-focused"></span>
                            </div>
                        </div>
                        <div class="col-sm-12 col-12 mt-2">
                            <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                                <input class="attacmentfile" type="file" accept="image/*" capture="camera" multiple />
                                <div id="previewimg" class="row p-2"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btnstyle" id="SaveChanges">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="InvoiceItemModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Invoice Items</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" id="rowGen">
                </div>
                <div class="modal-footer d-none">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btnstyle" id="SaveChanges">Save changes</button>
                </div>
            </div>
        </div>
    </div>

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

        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }

        window.onpopstate = function () {
            let open_modal = document.querySelector('.modal.show')
            if (open_modal) {
                open_modal.dataset.pushback = 'true';
                $(open_modal).modal('hide')
            }
        }

        function showpopup(msg) {
            $('#Alert_btn').attr("data-message", msg)

            $('#Alert_btn').trigger('click');
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
            var Invoice_Detail = localStorage.getItem("Invoice_View");
            var DataIn = '';
            if (Invoice_Detail != null && Invoice_Detail != "null") {
                var dataInvoice_Details = JSON.parse(Invoice_Detail);
                var imagesAll = dataInvoice_Details[0].Img.split(',');
                var Img = '';
                for (var i = 0; i < imagesAll.length; i++) {
                    // imagesAll[i] = '../Menu_Pics/' + imagesAll[i]
                    Img = Img + '<div class="col-4 col-sm-2 pr-0 pl-0"><div class="mr-4 mb-2" style="padding: 5px;"><img class="AttachedImages" style="border: 2px solid lightgray;border-radius: 10px;" height="60" width="60"  src="' + '../Menu_Pics/' + imagesAll[i] + '">' +
                        '<i class="fa fa-trash RemoveExistingAttachment" attachment="' + imagesAll[i] + '" aria-hidden="true" style="margin-left: -8px;margin-top: -7px;position: absolute;"></i></div></div>'
                }

                DataIn = "<div class=\"row\"><div class=\"productdetails\" style=\"width: 60%\"><div><strong>" + dataInvoice_Details[0].Supplier_Name + "</strong></div></div>" +
                    "<div class=\"productdetails\" style=\"width: 40%;\"><div><strong><i class=\"fa fa-calendar\"></i> " + dataInvoice_Details[0].Invoice_Date + "</strong>" +
                    "<a href=\"javascript:void(0);\" id=\"editDetails\"><i style=\"float: right;color: red;\" class=\"fa fa-edit\"></i></a></div></div></div>" +
                    "<div class=\"row\"><div class=\"productdetails\" style=\"width: 60%\"><div><strong>Invoice No. " + dataInvoice_Details[0].Invoice_No + "</strong></div></div>" +
                    "<div class=\"productdetails\" style=\"width: 40%; \"><div><strong>Amount : <span id=\"total_to_compare\">" + dataInvoice_Details[0].Invoice_Amount + "</span></strong></div></div></div>" +
                    "<div class=\"row mt-2\"><div class=\"col-12 col-sm-12\"><div class=\"row\">" + Img + "</div></div></div></div>";
                $('#Invoice_Details').empty();
                $('#Invoice_Details').append(DataIn);
                getInvoiceLinestoView();
                editInvoiceDetails();
            }

        })
        function editInvoiceDetails() {
            $('.AttachedImages').click(function (e) {
                e.stopImmediatePropagation();
                window.location.href = $(this).attr('src');
            })
            $('.RemoveExistingAttachment').click(function (e) {
                e.stopImmediatePropagation();
                var ImageUrl = $(this).parent().find('.AttachedImages').attr('src');
                ImageUrl = ImageUrl.replace('../Menu_Pics/', '');
                var storedImages = localStorage.getItem("Invoice_View");

                if (storedImages) {
                    var ImageSection = JSON.parse(storedImages);
                    var viewInvoice = [];
                    var Refined_Image = ImageSection[0].Img.replace(ImageUrl + ',', '');
                    const dataSet = {
                        Supplier_Name: ImageSection[0].Supplier_Name,
                        Invoice_Date: ImageSection[0].Invoice_Date, Invoice_No: ImageSection[0].Invoice_No,
                        Invoice_Amount: ImageSection[0].Invoice_Amount,
                        Total: ImageSection[0].Total, Img: Refined_Image
                    };
                    localStorage.setItem('Invoice_View', null);
                    viewInvoice.push(dataSet);
                    localStorage.setItem("Invoice_View", JSON.stringify(viewInvoice));
                    deleteImage(ImageUrl);
                    $(this).parent().parent().remove();

                }

            })
            $('#editDetails').click(function (e) {
                e.stopImmediatePropagation();
                window.location.hash = "modal";
                $('#GeneralModal').modal();

                var storedData = localStorage.getItem("Invoice_View");
                if (storedData != null && storedData != "null") {
                    datarray = JSON.parse(storedData);
                    $('#Supplier').val(datarray[0].Supplier_Name);
                    $('#Date').val(datarray[0].Invoice_Date);
                    $('#Invoiceno').val(datarray[0].Invoice_No);
                    $('#Amount').val(datarray[0].Invoice_Amount);
                    $('#Paid_Amount').val(datarray[0].Total);

                }
                else {
                    $('#Date').val(new Date().toISOString().split('T')[0]);
                }
                $(".attacmentfile").change(function (g) {

                    g.preventDefault();
                    g.stopImmediatePropagation();
                    var noOfFiles = this.files.length;
                    for (var i = 0; i < noOfFiles; i++) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[i]);
                    }
                });

                $('#SaveChanges').click(function (g) {
                    g.stopImmediatePropagation();
                    var Pids = [];
                    $('.edit_lines').each(function () {
                        Pids.push($(this).attr('pid'));
                    })
                    var Newattacments = [];
                    $('.Newattacments').each(function () {
                        Newattacments.push($(this).attr('src').replace(/^data:image\/(png|jpg|jpeg|gif);base64,/, ""));
                    })
                    var Supplier = escapeHtml($.trim($('#Supplier').val()));
                    var Date = $.trim($('#Date').val());
                    var Invoiceno = escapeHtml($.trim($('#Invoiceno').val()));
                    var Amount = $.trim($('#Amount').val());
                    var Paid_Amount = $.trim($('#Paid_Amount').val());

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "View_Purchase_Invoice.aspx/UpdateInvoiceChanges",
                        data: '{Supplier:"' + Supplier + '",Date:"' + Date + '",Invoiceno:"' + Invoiceno
                            + '",Amount:"' + Amount + '",Paid_Amount:"' + Paid_Amount
                            + '",Pids:"' + Pids + '",Newattacments:"' + Newattacments + '"}',
                        beforeSend: function () {
                            $("#preload").show();
                        },
                        dataType: "json",
                        success: function (data) {
                            var DataImg = data.d;
                            var viewInvoice = [];
                            var storedData = JSON.parse(localStorage.getItem("Invoice_View"));
                            var Imgs = storedData[0].Img;
                            const dataSet = {
                                Supplier_Name: Supplier,
                                Invoice_Date: Date, Invoice_No: Invoiceno, Invoice_Amount: Amount,
                                Total: Paid_Amount, Img: Imgs + DataImg
                            };

                            localStorage.setItem('Invoice_View', null);
                            viewInvoice.push(dataSet);
                            localStorage.setItem("Invoice_View", JSON.stringify(viewInvoice));
                            location.reload();
                        },
                        complete: function () {
                            $("#preload").hide();
                        }
                    })
                })

            })
        }

        function deleteImage(ImageUrl) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "View_Purchase_Invoice.aspx/RemoveImages",
                data: '{ImageUrl:"' + ImageUrl + '"}',
                dataType: "json",
                success: function (data) {
                }
            })
        }

        function Images(Image) {
            var imgTmpl = '<div class="mr-4 mb-2" style="padding: 5px;border: 2px solid lightgray;border-radius: 10px;"><img class="Newattacments" height="60" width="60"  src=' + Image + '>' +
                '<i class="fa fa-trash RemovePatientAttachment" aria-hidden="true" style="margin-left: -5px;margin-top: -10px;position: absolute;"></i></div>';

            $('#previewimg').append(imgTmpl);

            $('.RemovePatientAttachment').click(function (g) {
                g.stopImmediatePropagation();
                $(this).parent().remove();
            })
        }

        function imageIsLoaded(e) {
            Images(e.target.result)
        };

        function getInvoiceLinestoView() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "View_Purchase_Invoice.aspx/getInvoiceLines",
                data: '{datarray:' + localStorage.getItem('Invoice_View') + '}',
                dataType: "json",
                success: function (data) {
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        var table = '';
                        if ($.fn.dataTable.isDataTable('#example')) {
                            table = $('#example').DataTable({
                                data: parsedData,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [
                                    { 'data': 'ITEM_NAME' },
                                    { 'data': 'DESCRIPTION' },
                                    { 'data': 'QTY' },
                                    { 'data': 'UOM' },
                                    { 'data': 'PURCHASE_RATE' },
                                    { 'data': 'TAX_INCLUDED' },
                                    { 'data': 'GST_PERCENTAGE' },
                                    { 'data': 'PURCHASE_RATE_WITH_TAX' },
                                    { 'data': 'TOTAL_AMOUNT' },
                                    { 'data': 'MRP' },
                                    { 'data': 'SELLING_PRICE' },
                                    { 'data': 'HSN' },
                                    {
                                        render: function (data, type, row) {
                                            return '<i class="fa fa-edit edit_lines" pid="' + row.PID + '" mid="' + row.MID + '"></i>';
                                        }

                                    }, {
                                        render: function (data, type, row) {
                                            return '<i class="fa fa-trash delete_lines" pid="' + row.PID + '"></i>';
                                        }

                                    }
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',

                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                        else {
                            table = $('#example').DataTable({

                                data: parsedData,
                                stateSave: true,
                                "bDestroy": true,
                                columns: [
                                    { 'data': 'ITEM_NAME' },
                                    { 'data': 'DESCRIPTION' },
                                    { 'data': 'QTY' },
                                    { 'data': 'UOM' },
                                    { 'data': 'PURCHASE_RATE' },
                                    { 'data': 'TAX_INCLUDED' },
                                    { 'data': 'GST_PERCENTAGE' },
                                    { 'data': 'PURCHASE_RATE_WITH_TAX' },
                                    { 'data': 'TOTAL_AMOUNT' },
                                    { 'data': 'MRP' },
                                    { 'data': 'SELLING_PRICE' },
                                    { 'data': 'HSN' },
                                    {
                                        render: function (data, type, row) {
                                            return '<i class="fa fa-edit edit_lines" pid="' + row.PID + '" mid="' + row.MID + '"></i>';
                                        }

                                    }, {
                                        render: function (data, type, row) {
                                            return '<i class="fa fa-trash delete_lines" pid="' + row.PID + '"></i>';
                                        }

                                    }
                                ],
                                "orderClasses": false,
                                responsive: true,
                                dom: 'lBfrtip',
                                buttons: [
                                    'copyHtml5',
                                    'excelHtml5',
                                    'csvHtml5',
                                    'pdfHtml5'
                                ]
                            });
                        }
                    }
                    $('#example tbody').on('click', '.edit_lines', function (e) {
                        e.stopImmediatePropagation();
                        var p = $(this);
                        var tr = $(this).parent().closest('tr');
                        var Item_Name = tr.find('td:nth-child(1)').text();
                        var Description = tr.find('td:nth-child(2)').text();
                        var Qty = tr.find('td:nth-child(3)').text();
                        var UOM = tr.find('td:nth-child(4)').text();
                        var Purchase_Rate = tr.find('td:nth-child(5)').text();
                        var Tax_Included = tr.find('td:nth-child(6)').text() == 'Y' ? 'checked' : '';
                        var Tax_Percentage = tr.find('td:nth-child(7)').text();
                        var Purchase_Rate_with_tax = tr.find('td:nth-child(8)').text();
                        var Total = tr.find('td:nth-child(9)').text();
                        var MRP = tr.find('td:nth-child(10)').text();
                        var Selling_Price = tr.find('td:nth-child(11)').text();
                        var HSN = tr.find('td:nth-child(12)').text();
                        var PID = $(this).attr('pid');
                        var MID = $(this).attr('mid');
                        rowGenerated(Item_Name, Description, Qty, UOM, Purchase_Rate, Tax_Included
                            , Tax_Percentage, Purchase_Rate_with_tax, Total, MRP, Selling_Price, PID, p, HSN, tr, MID);
                    })
                    $('#example tbody').on('click', '.delete_lines', function (e) {
                        e.stopImmediatePropagation();
                        var PID = $(this).attr('pid');
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "View_Purchase_Invoice.aspx/deletePurchaseInvoiceLine",
                            data: '{PID:"' + PID + '"}',
                            dataType: "json",
                            success: function (data) {
                                showpopup('Item removed successfully');
                            }
                        })
                    })
                },
                error: function (e) {
                    showpopup(e.statusText);
                }
            })
        }

        function rowGenerated(Item_Name, Description, Qty, UOM, Purchase_Rate, Tax_Included
            , Tax_Percentage, Purchase_Rate_with_tax, Total, MRP, Selling_Price, PID, p, HSN, tr, MID) {
            var Comment_Box = '<textarea class="form-control" id="Comment" placeholder="Any Comment">' + Description + '</textarea>';
            Div = '<div class="add_purchasebox container"><div class="row"><div class="col-12"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                '<label for="Item_N" class="control-label">Item Name</label><input mid="' + MID + '" value="' + Item_Name + '" name="Item_N" type="text" id="Item_N" class="form-control"><span class="pmd-textfield-focused"></span>' +
                '</div></div></div> ' +
                '<div class="row"><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                '<label for="Qty" class="control-label">Qty</label><input name="Qty" type="number" value="' + Qty + '" id="Qty" class="form-control"><span class="pmd-textfield-focused"></span>' +
                '</div></div><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                '<select name="UOM" id="UOM" class="form-control" style="font-size: 13px; margin-top: 15px;">' +
                '<option>Pieces</option><option>Pkt</option><option>Box</option></select><span class="pmd-textfield-focused"></span></div></div>' +
                '<div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label "><label for="Purchase_Rate" class="control-label">Purchase Rate</label>' +
                '<input name="Purchase_Rate" type="number" value="' + Purchase_Rate + '" id="Purchase_Rate" class="form-control"><span class="pmd-textfield-focused"></span></div></div></div>' +
                '<div class="row"><div class="col-4"><div class="custom-control custom-checkbox" style="margin-top: 29px;">' +
                '<input type="checkbox"  ' + Tax_Included + '  class="custom-control-input" id="customCheck2"><label class="custom-control-label" for="customCheck2">Include Tax</label>' +
                '</div></div><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                '<label for="Price_With_Tax" class="control-label">Price<sup>With tax</sup></label>' +
                '<input name="Price_With_Tax" value="' + Purchase_Rate_with_tax + '" type="number" id="Price_With_Tax" class="form-control"><span class="pmd-textfield-focused"></span>' +
                '</div></div><div class="col-4"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                '<label for="Total" class="control-label">Total</label><input name="Total" type="number" value="' + Total + '" id="Total" class="form-control"><span class="pmd-textfield-focused"></span>' +
                '</div></div></div><div style="margin-top: 10px;"><a class="bnt btnstyle d-none addgstbtn mt-2">Add GST Details</a>' +
                '<a class="bnt btnstyle d-none" id="CalculateAmount" style="float: right; padding: 4px; border-radius: 5px; margin-top: -7px; color: white !important;">Calculate</a>' +
                '<div class=""><div class="row"><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label">' +
                '<label for="GST" class="control-label">GST</label><input name="GST"  type="number" value="' + Tax_Percentage + '" id="GST" class="form-control"><span class="pmd-textfield-focused"></span>' +
                '</div></div><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="HSN" class="control-label">HSN</label>' +
                '<input name="HSN" type="text" id="HSN" value="' + HSN + '"  class="form-control"><span class="pmd-textfield-focused"></span></div></div></div></div></div>' +
                '<div class="row"><div class="col-6"><div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="GST" class="control-label">MRP</label>' +
                '<input name="GST" type="number" id="MRP"  value="' + MRP + '" class="form-control"><span class="pmd-textfield-focused"></span></div></div><div class="col-6">' +
                '<div class="form-group pmd-textfield pmd-textfield-floating-label"><label for="Selling_Price" class="control-label">Selling Price</label>' +
                '<input name="Selling_Price" type="number"  value="' + Selling_Price + '" id="Selling_Price" class="form-control"><span class="pmd-textfield-focused"></span></div></div>' +
                '</div>' +
                Comment_Box + '<div style=\"text-align: right;margin-top:10px;\"><a pid="' + PID + '"  class="btnstyle" id=\"UpdateChangesLinesInvoice\" style=\"color:white;width:100px;padding:5px;border-radius:5px;padding-left: 30px;padding-right: 30px;\">Save Changes</a></div></div>';
            $('#rowGen').empty();
            $('#rowGen').append(Div);
            window.location.hash = "modal";
            $('#InvoiceItemModal').modal();
            $('#UOM').find('option').removeAttr('selected');
            $("#UOM option:contains(" + UOM + ")").attr("selected", true);

            $('#UpdateChangesLinesInvoice').click(function (e) {
                e.stopImmediatePropagation();

                var Name = escapeHtml($.trim($('#Item_N').val()));
                var Item_Qty = escapeHtml($.trim($('#Qty').val())) || 0;
                var Item_UOM = $('#UOM').find('option:selected').text();
                var Item_Purchase_rate = escapeHtml($.trim($('#Purchase_Rate').val())) || 0;
                var Item_Tax_Included = $('#customCheck2').prop('checked') == true ? 'Y' : 'N';
                var Item_Price_With_Tax = escapeHtml($.trim($('#Price_With_Tax').val())) || 0;
                var Total = escapeHtml($.trim($('#Total').val()));
                var GST = escapeHtml($.trim($('#GST').val())) || 0;
                var Item_HSN = escapeHtml($.trim($('#HSN').val()));
                var Item_MRP = escapeHtml($.trim($('#MRP').val())) || 0;
                var Item_Selling_Price = escapeHtml($.trim($('#Selling_Price').val())) || 0;
                var Item_Comment = escapeHtml($.trim($('#Comment').val()));
                var MID = $('#Item_N').attr('mid');

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "View_Purchase_Invoice.aspx/fnUpdateChangesLinesInvoice",
                    data: '{Name:"' + Name + '",Item_Qty:"' + Item_Qty + '",Item_UOM:"' + Item_UOM + '",Item_Purchase_rate:"' + Item_Purchase_rate
                        + '",Item_Tax_Included:"' + Item_Tax_Included + '",Item_Price_With_Tax:"' + Item_Price_With_Tax
                        + '",Total:"' + Total + '",GST:"' + GST + '",Item_HSN:"' + Item_HSN + '",Item_MRP:"' + Item_MRP
                        + '",Item_Selling_Price:"' + Item_Selling_Price + '",Item_Comment:"' + Item_Comment + '",PID:"' + PID + '",MID:"' + MID + '"}',
                    dataType: "json",
                    success: function (data) {
                        showpopup('Item updated successfully');
                        $('#InvoiceItemModal').modal('hide');
                        var row = '<td>' + Name + '</td>' +
                            '<td>' + Item_Comment + '</td><td>' + Item_Qty + '</td><td>' + Item_UOM + '</td><td>' + Item_Purchase_rate + '</td>' +
                            '<td>' + Item_Tax_Included + '</td><td>' + GST + '</td><td>' + Item_Price_With_Tax + '</td><td>' + Total + '</td><td>' + Item_MRP + '</td>' +
                            '<td>' + Item_Selling_Price + '</td><td>' + Item_HSN + '</td><td><i class="fa fa-edit edit_lines" pid="13"></i></td>' +
                            '<td><i class="fa fa-trash delete_lines" pid="' + PID + '"></i></td>';
                        tr.empty();
                        tr.append(row);
                    }
                })
            })

            $("#Item_N").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "View_Purchase_Invoice.aspx/fnGetAllProducts",
                        dataType: "json",
                        data: '{FindData: "' + request.term + '"}',
                        success: function (data) {
                            response($.map($.parseJSON(data.d), function (item) {
                                var AC = new Object();
                                AC.label = item.NAME;
                                AC.value = item.NAME;
                                AC.Price = item.PRICE;
                                AC.MID = item.MID;
                                AC.HSN_NO = item.HSN_NO;
                                AC.MRP = item.MRP;
                                AC.GST = item.GST_PERCENTAGE;
                                return AC
                            }));
                        }
                    });
                },
                minLength: 1,
                select: function (event, ui) {
                    $('#Item_N').val(ui.item.label);
                    $('#Item_N').attr('mid', ui.item.MID);
                    $('#MRP').val(ui.item.MRP);
                    $('#Selling_Price').val(ui.item.Price);
                    $('#HSN').val(ui.item.HSN_NO);
                    $('#GST').val(ui.item.GST);

                }
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
    </script>
</body>
</html>
