<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supplier.aspx.cs" Inherits="Components_supplier" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <title>Purchase</title>
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


    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    <style>
        .supplierdetails input {
            width: 100% !important;
        }

        .style_prevu_kit:hover {
            box-shadow: 0px 0px 150px #000000;
            z-index: 2;
            -webkit-transition: all 200ms ease-in;
            -webkit-transform: scale(1.5);
            -ms-transition: all 200ms ease-in;
            -ms-transform: scale(1.5);
            -moz-transition: all 200ms ease-in;
            -moz-transform: scale(1.5);
            transition: all 200ms ease-in;
            transform: scale(1.1);
        }

        .ui-autocomplete {
            z-index: 99999;
        }
    </style>

</head>
<body>
     <input type="checkbox" name="" checked="checked" id="side-menu-switch" />
    <div class="side-menu">

        <nav id="navMenu" style="display:none;">
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
        <a href="javascript:void(0);" id="StoreName" runat="server" class="navbar-brand" style="margin-left: 40px; margin-top: -15px;">Purchase
             <p style="font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400; visibility: hidden;"></p>
        </a>
    </nav>

    <div class="container" style="margin-top: 100px;">
        <div class="card supplierdetails">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-12" style="border-bottom: 1px solid lightgray;">
                        <h5 class="text-center">Add New Purchase</h5>
                    </div>
                    <hr />
                    <div class="col-sm-12 col-12">
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <label for="Supplier" class="control-label">Supplier Name</label>
                            <input name="Supplier" type="text" id="Supplier" runat="server" class="form-control"><span class="pmd-textfield-focused"></span>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <label for="Date" class="control-label">Date<sup>(mm/dd/yyyy)</sup></label>
                            <input name="Date" type="date" id="Date" runat="server" class="form-control"><span class="pmd-textfield-focused"></span>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <label for="Invoiceno" class="control-label">Invoice Number</label>
                            <input name="Invoiceno" type="text" id="Invoiceno" runat="server" class="form-control"><span class="pmd-textfield-focused"></span>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <label for="Amount" class="control-label">Invoice Amount</label>
                            <input name="Amount" type="number" id="Amount" runat="server" class="form-control"><span class="pmd-textfield-focused"></span>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <label for="Paid_Amount" class="control-label">Paid Amount</label>
                            <input name="Paid_Amount" type="number" id="Paid_Amount" runat="server" class="form-control"><span class="pmd-textfield-focused"></span>
                        </div>
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <input class="attacmentfile" type="file" accept="image/*" capture="camera" multiple />
                            <div id="previewimg" class="row p-2"></div>
                        </div>
                    </div>


                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group pmd-textfield pmd-textfield-floating-label">
                            <button class="btn btnstyle w-100" id="Add_Invoice_Details">Proceed</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-3 mb-4">
        <div class="card">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-12" style="border-bottom: 1px solid lightgray;">
                        <h5 class="text-center">Previous Purchases</h5>
                    </div>
                    <hr />

                    <div class="col-sm-12 col-12">
                        <div class="form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-active pmd-textfield-floating-label-completed">
                            <label for="SearchInvoice" class="control-label">Search</label>
                            <input name="SearchInvoice" type="text" placeholder="search by supplier,Inv no, Inv amt" id="SearchInvoice" class="form-control"><span class="pmd-textfield-focused"></span>
                        </div>
                    </div>
                    <div class="col-sm-12 col-12" id="invoice_history">
                    </div>
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


    <script>
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

        function Images(Image) {
            var imgTmpl = '<div class="mr-4 mb-2" style="padding: 5px;border: 2px solid lightgray;border-radius: 10px;"><img class="Newattacments" height="60" width="60"  src=' + Image + '>' +
                '<i class="fa fa-trash RemovePatientAttachment" aria-hidden="true" style="margin-left: -5px;margin-top: -10px;position: absolute;"></i></div>';

            $('#previewimg').append(imgTmpl);

            $('.RemovePatientAttachment').click(function (g) {
                g.stopImmediatePropagation();

                var ImageUrl = $(this).parent().find('.Newattacments').attr('src');

                var storedImages = localStorage.getItem("Invoice_Images");

                if (storedImages) {
                    ImageSection = JSON.parse(storedImages);
                }

                for (var j = 0; j < ImageSection.length; j++) {
                    if (ImageSection[j].Img == ImageUrl) {
                        ImageSection.splice(j, 1);
                    }
                }
                localStorage.setItem("Invoice_Images", JSON.stringify(ImageSection));
                $(this).parent().remove();
            })
        }

        function imageIsLoaded(e) {
            Images(e.target.result)
        };

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

        $('#Add_Invoice_Details').click(function (e) {
            e.stopImmediatePropagation();
            var Supplier_Name = escapeHtml($.trim($('#Supplier').val()));
            var Invoice_Date = $.trim($('#Date').val());
            var Invoice_Number = escapeHtml($.trim($('#Invoiceno').val()));
            var Invoice_Amount = escapeHtml($.trim($('#Amount').val()));
            var Paid_Amount = escapeHtml($.trim($('#Paid_Amount').val()));
            localStorage.setItem('Invoice_Images', null);
            var Images = [];
            $('.Newattacments').each(function () {
                const Img_Data = {
                    Img: $(this).attr('src')
                };
                Images = JSON.parse(localStorage.getItem('Invoice_Images')) || [];
                Images.push(Img_Data);
                localStorage.setItem("Invoice_Images", JSON.stringify(Images));
            })

            if (Supplier_Name.length == 0) {
                showpopup('Please enter supplier name');
            }
            else if (Invoice_Amount.length == 0 || Invoice_Amount <= 0) {
                showpopup('Please enter correct invoice amount');
            }
            else {
                const Purchase_Data = {
                    Supplier_Name: Supplier_Name,
                    Invoice_Date: Invoice_Date, Invoice_No: Invoice_Number, Invoice_Amount: Invoice_Amount,
                    Total: Paid_Amount
                };
                localStorage.setItem('Invoice_Details', null);
                datarray.push(Purchase_Data);
                localStorage.setItem("Invoice_Details", JSON.stringify(datarray));
                window.location.href = 'Add_purchase.aspx';
            }
        })
        var datarrayImages = [];
        var datarray = [];
        $(document).ready(function () {
            var storedData = localStorage.getItem("Invoice_Details");
            if (storedData != null && storedData != "null") {
                datarray = JSON.parse(storedData);
                $('#Supplier').val(datarray[0].Supplier_Name);
                $('#Date').val(datarray[0].Invoice_Date);
                $('#Invoiceno').val(datarray[0].Invoice_No);
                $('#Amount').val(datarray[0].Invoice_Amount);
                $('#Paid_Amount').val(datarray[0].Total);
                $('#imagePreview').attr('src', datarray[0].Img)
                $('#imagePreview').show();
            }
            else {
                $('#Date').val(new Date().toISOString().split('T')[0]);
            }

            var storedImages = localStorage.getItem("Invoice_Images");
            if (storedImages != null && storedImages != "null") {
                ImageSection = JSON.parse(storedImages);
                for (var i = 0; i < ImageSection.length; i++) {
                    Images(ImageSection[i].Img);
                }
            }

            lastFiveInvoices();
        })
        var ImageSection = [];
        function lastFiveInvoices() {
            $.ajax({
                type: "POST",
                url: "supplier.aspx/getlastFiveInvoices",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#invoice_history').empty();
                    var History = '';
                    if (data.d != '') {
                        var parsedData = JSON.parse(data.d);
                        for (var i = 0; i < parsedData.length; i++) {
                            History = History + '<div class="row mb-2 style_prevu_kit" img="' + parsedData[i].InvoiceImage + '" suppier="' + parsedData[i].SUPPLIER + '" invoice_no="' + parsedData[i].INV_NO + '" invoice_amt="' + parsedData[i].INV_AMT + '" invoice_date="' + parsedData[i].DATE + '" paid="' + parsedData[i].Paid_Amount + '" title="Click to view details" style="font-size: 13px; border: 1px solid grey; border-radius: 10px;">' +
                                '<div class="col-sm-8 col-8" ><span>' + parsedData[i].SUPPLIER + '</span></div><div class="col-sm-4 col-4">' +
                                '<span class="float-right">Inv# ' + parsedData[i].INV_NO + '</span></div><div class="col-sm-4 col-4 pr-0"><span>Inv <i class="fa fa-inr"></i>' + parsedData[i].INV_AMT + '</span>' +
                                '</div><div class="col-sm-4 col-4"><span>' + parsedData[i].DATE + '</span></div><div class="col-sm-4 col-4 pl-0"><span class="float-right">Paid <i class="fa fa-inr"></i>' + parsedData[i].Paid_Amount + '</span></div></div>';
                        }
                    }
                    $('#invoice_history').append(History);
                    invoiceActions();
                }
            })
        }

        if (!!window.performance && window.performance.navigation.type === 2) {
            console.log('Reloading');
            window.location.reload();
        }

        $("#SearchInvoice").autocomplete({
            source: function (request, response) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "supplier.aspx/getInvoices",
                    dataType: "json",
                    data: '{FindData: "' + request.term + '"}',
                    success: function (data) {
                        response($.map($.parseJSON(data.d), function (item) {
                            var AC = new Object();
                            AC.label = item.SUPPLIER + ' - Inv# ' + item.INV_NO + ' - Inv Amt ' + item.INV_AMT;
                            AC.INV_NO = item.INV_NO;
                            AC.INV_AMT = item.INV_AMT;
                            AC.SUPPLIER = item.SUPPLIER;
                            AC.Paid_Amount = item.Paid_Amount;
                            AC.DATE = item.DATE;
                            AC.IMG = item.InvoiceImage;
                            return AC
                        }));
                    }
                });
            },
            minLength: 1,
            select: function (event, ui) {
                getInvoicesByInvoiceNo(ui.item.INV_NO, ui.item.INV_AMT, ui.item.SUPPLIER, ui.item.Paid_Amount, ui.item.DATE, ui.item.IMG);
            }
        });

        function getInvoicesByInvoiceNo(INV_NO, INV_AMT, SUPPLIER, Paid_Amount, DATE, IMG) {
            var History = '<div class="row mb-2 style_prevu_kit" img="' + IMG + '" suppier="' + SUPPLIER + '" invoice_no="' + INV_NO + '" invoice_amt="' + INV_AMT + '" invoice_date="' + DATE + '" paid="' + Paid_Amount + '" title="Click to view details" style="font-size: 13px; border: 1px solid grey; border-radius: 10px;">' +
                '<div class="col-sm-8 col-8" ><span>' + SUPPLIER + '</span></div><div class="col-sm-4 col-4">' +
                '<span class="float-right">Inv# ' + INV_NO + '</span></div><div class="col-sm-4 col-4 pr-0"><span>Inv <i class="fa fa-inr"></i>' + INV_AMT + '</span>' +
                '</div><div class="col-sm-4 col-4"><span>' + DATE + '</span></div><div class="col-sm-4 col-4 pl-0"><span class="float-right">Paid <i class="fa fa-inr"></i>' + Paid_Amount + '</span></div></div>';
            $('#invoice_history').empty();
            $('#invoice_history').append(History);
            invoiceActions();
        }

        var viewInvoice = [];
        function invoiceActions() {
            $('.style_prevu_kit').click(function (e) {
                e.stopImmediatePropagation();

                const dataSet = {
                    Supplier_Name: $(this).attr('suppier'),
                    Invoice_Date: $(this).attr('invoice_date'), Invoice_No: $(this).attr('invoice_no'), Invoice_Amount: $(this).attr('invoice_amt'),
                    Total: $(this).attr('paid'), Img: $(this).attr('img')
                };

                localStorage.setItem('Invoice_View', null);
                viewInvoice.push(dataSet);
                localStorage.setItem("Invoice_View", JSON.stringify(viewInvoice));
                window.location.href = 'View_Purchase_Invoice.aspx';
            })
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
