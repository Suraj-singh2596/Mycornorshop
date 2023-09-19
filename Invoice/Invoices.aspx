<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoices.aspx.cs" Inherits="Invoice_Invoices" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>MyCornerShop | Invoice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes" />

    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type="text/css" />
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="vendor/font-awesome/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
    <link href="../Assest/css/globalstyle.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js" integrity="sha512-s/XK4vYVXTGeUSv4bRPOuxSDmDlTedEpMEcAQk0t/FMd9V6ft8iXdwSBxV0eD60c6w/tjotSlKu9J2AAW1ckTA==" crossorigin="anonymous"></script>
</head>
<body class="bg-white">
    <form id="form1" runat="server">
        <div class="container" id="Invoice_Body" style="border: 2px solid gray;background:white;" runat="server">
            <div class="row"></div>
            <div class="row">
                <div class="col-sm-12 col-12">
                    <h2 class="text-center">Invoice</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-12">
                    <h5>Supermart</h5>
                </div>
            </div>
            <div class="row" style="font-size: 13px;">
                <div class="col-12 col-sm-12">
                    Praesidio DoctorPlus Private Limited #729, Old DLF MG Road Gurgaon, Haryana(122001)
                </div>
                <div class="col-12 col-sm-12">
                    9953075912
                </div>
                <div class="col-12 col-sm-12">
                    GST#465494985614894
                </div>
            </div>
            <hr style="background-color: #fff; border-top: 2px dashed #8c8b8b;" />
            <div class="row text-right" style="font-size: 13px;">
                <div class="col-12 col-sm-12">
                    Invoice No: SUPER/2019-20/18
                </div>
                <div class="col-12 col-sm-12">
                    Date: 28-01-21 03:32 PM
                </div>
                <div class="col-12 col-sm-12">
                    <label style="font-weight: 700">Invoiced To:</label>
                    Jatin Kansal-9953075912
                </div>
            </div>
            <hr style="background-color: #fff; border-top: 2px dashed #8c8b8b;" />

            <div class="row" style="border: 2px solid gray;">
                <div class="col-12 col-sm-12">
                    <div class="row">
                        <div class="col-2 col-sm-2 pr-0">
                            <label style="font-weight: 600">SNo.</label>
                        </div>
                        <div class="col-4 col-sm-4 pr-0 pl-0">
                            <label style="font-weight: 600">Particular</label>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <label style="font-weight: 600">Rate</label>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <label style="font-weight: 600">Qty</label>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <label style="font-weight: 600">Total</label>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12">
                    <div class="row">
                        <div class="col-2 col-sm-2 pr-0">
                            <span style="font-size: 12px;">1</span>
                        </div>
                        <div class="col-4 col-sm-4 pr-0 pl-0">
                            <span style="font-size: 12px;">Adavik Camel Milk Bottle</span>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <span style="font-size: 12px;">&#8377;89.29</span>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <span style="font-size: 12px;">1</span>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <span style="font-size: 12px;">&#8377;89.29</span>
                        </div>
                    </div>
                    <hr class="mt-0 mb-0" />
                    <div class="row">
                        <div class="col-2 col-sm-2 pr-0">
                            <span style="font-size: 12px;">1</span>
                        </div>
                        <div class="col-4 col-sm-4 pr-0 pl-0">
                            <span style="font-size: 12px;">Adavik Camel Milk Bottle</span>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <span style="font-size: 12px;">&#8377;89.29</span>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <span style="font-size: 12px;">1</span>
                        </div>
                        <div class="col-2 col-sm-2 pr-0 pl-0">
                            <span style="font-size: 12px;">&#8377;89.29</span>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-sm-12">
                    <div class="row" style="border-top: 1px solid gray;">
                        <div class="col-12 col-sm-12 text-right">
                            <div class="row">
                                <div class="col-8 col-sm-8">
                                    <span style="font-size: 14px;">Sub Total:</span>
                                </div>
                                <div class="col-4 col-sm-4">
                                    <span style="font-size: 14px;">&#8377;178.58</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border-top: 1px solid gray;">
                        <div class="col-12 col-sm-12 text-right">
                            <div class="row">
                                <div class="col-8 col-sm-8">
                                    <span style="font-size: 14px;">Taxable:</span>
                                </div>
                                <div class="col-4 col-sm-4">
                                    <span style="font-size: 14px;">&#8377;178.58</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border-top: 1px solid gray;">
                        <div class="col-12 col-sm-12 text-right">
                            <div class="row">
                                <div class="col-8 col-sm-8">
                                    <span style="font-size: 14px;">CGST 6%:</span>
                                </div>
                                <div class="col-4 col-sm-4">
                                    <span style="font-size: 14px;">&#8377;10.71</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border-top: 1px solid gray;">
                        <div class="col-12 col-sm-12 text-right">
                            <div class="row">
                                <div class="col-8 col-sm-8">
                                    <span style="font-size: 14px;">SGST 6%:</span>
                                </div>
                                <div class="col-4 col-sm-4">
                                    <span style="font-size: 14px;">&#8377;10.71</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border-top: 1px solid gray;">
                        <div class="col-12 col-sm-12 text-right">
                            <div class="row">
                                <div class="col-8 col-sm-8">
                                    <span style="font-size: 14px;">Round Off:</span>
                                </div>
                                <div class="col-4 col-sm-4">
                                    <span style="font-size: 14px;">&#8377;-0.01</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border-top: 1px solid gray;">
                        <div class="col-12 col-sm-12 text-right">
                            <div class="row">
                                <div class="col-8 col-sm-8">
                                    <span style="font-size: 14px;">Total:</span>
                                </div>
                                <div class="col-4 col-sm-4">
                                    <span style="font-size: 14px;">&#8377;200.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-sm-12">
                    <span style="font-size: 11px; font-weight: 600;">NOTE :</span>
                    <span style="font-size: 10px;">This is computer generated receipt and does not require physical signature.</span>
                </div>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12 col-sm-12 text-center">
                <button type="button" id="downloadInvoice" class="btn btnstyle">Download</button>
            </div>
        </div>
        <canvas id="previewImage"></canvas>
        <input type="hidden" id="invoice_no" runat="server" value="invoice" />
    </form>
    <script>
        var element = $("#Invoice_Body"); // global variable
        var getCanvas; // global variable

        $('#downloadInvoice').click(function (e) {
            e.stopImmediatePropagation();
            html2canvas(element, {
                onrendered: function (canvas) {
                    $("#previewImage").append(canvas);
                    getCanvas = canvas;
                    var a = document.createElement('a');
                    a.href = getCanvas.toDataURL("image/png").replace(/^data:image\/png/, "data:application/octet-stream");
                    a.download = $('#invoice_no').val() + '.png';
                    a.click();
                }
            });

        });

    </script>
</body>
</html>
