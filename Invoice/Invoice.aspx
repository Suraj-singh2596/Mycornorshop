<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice_Invoice" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>MyCornerShop | Invoice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes" />
  
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900' type='text/css'>
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="vendor/font-awesome/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <style>
        .card-body {
            padding: 0px;
        }

        .table td, .table th {
            padding: 0.35rem;
        }

        hr {
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .center {
            width: 700px !important;
            height: auto;
            top: 0;
            bottom: 0;
            right: 0;
            margin: auto;
            border: 1px solid;
            border-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <!-- Container -->
    <form runat="server">
        <div class="container-fluid " id="content" runat="server" style="padding-left: 0px;">
            <!-- Header -->


            <div class="center" style="width: 700px; height: auto; background: white !important; padding: 20px;">
                <header>
                    <div class="row align-items-center">
                        <div class="col-sm-7 text-center text-sm-left mb-3 mb-sm-0">
                            <h3>KP Sweets and Restaurant</h3>
                        </div>
                        <div class="col-sm-5 text-center text-sm-right">
                            <h1>Invoice</h1>
                        </div>
                    </div>
                    <hr>
                </header>

                <!-- Main Content -->
                <main>
                    <div class="row">
                        <div class="col-sm-6"></div>
                        <div class="col-sm-6 text-sm-right">
                            <strong>Invoice No:</strong> 16835
                        <br />
                            <strong>Date:</strong> 05/12/2019
                        </div>

                    </div>
                    <hr>
                    <div class="row mt-2">
                        <div class="col-sm-6 text-sm-right order-sm-1">
                            <strong>Pay To:</strong>
                            <address>
                                KP Restaurant<br />
                                2705 N. Enterprise St<br />
                                Orange, CA 92865<br />
                                contact@restaurant.com
                            </address>
                        </div>
                        <div class="col-sm-6 order-sm-0">
                            <strong>Invoiced To:</strong>
                            <address>
                                Smith Rhodes<br />
                                15 Hodges Mews, High Wycombe<br />
                                HP12 3JL<br />
                                United Kingdom
                            </address>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header px-2 py-0">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <td class="col-1 border-0" style="width: 10%;"><strong>Sno.</strong></td>
                                        <td class="col-5 border-0" style="width: 50%;"><strong>Particular</strong></td>
                                        <td class="col-2 border-0" style="width: 10%;"><strong>QTY</strong></td>
                                        <td class="col-2 text-center border-0" style="width: 15%;"><strong>Rate</strong></td>
                                        <td class="col-2 text-center border-0" style="width: 15%;"><strong>Total</strong></td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="card-body px-2">
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td class="col-1 border-0" style="width: 10%;">1</td>
                                            <td class="col-5 text-1 border-0" style="width: 50%;">Creating a website design</td>
                                            <td class="col-2 text-center border-0" style="width: 10%;">$50.00</td>
                                            <td class="col-2 text-center border-0" style="width: 15%;">10</td>
                                            <td class="col-2 text-right border-0" style="width: 15%;">$500.00</td>
                                        </tr>
                                        <tr>
                                            <td class="col-1 border-0" style="width: 10%;">2</td>
                                            <td class="col-5 text-1 border-0" style="width: 50%;">Creating a website design</td>
                                            <td class="col-2 text-center border-0" style="width: 10%;">$50.00</td>
                                            <td class="col-2 text-center border-0" style="width: 15%;">10</td>
                                            <td class="col-2 text-right border-0" style="width: 15%;">$500.00</td>
                                        </tr>
                                        <tr>
                                            <td class="col-1 border-0" style="width: 10%;">3</td>
                                            <td class="col-5 text-1 border-0" style="width: 50%;">Creating a website design</td>
                                            <td class="col-2 text-center border-0" style="width: 10%;">$50.00</td>
                                            <td class="col-2 text-center border-0" style="width: 15%;">10</td>
                                            <td class="col-2 text-right border-0" style="width: 15%;">$500.00</td>
                                        </tr>
                                        <tr>
                                            <td class="col-1 border-0" style="width: 10%;">4</td>
                                            <td class="col-5 text-1 border-0" style="width: 50%;">Creating a website design</td>
                                            <td class="col-2 text-center border-0" style="width: 10%;">$50.00</td>
                                            <td class="col-2 text-center border-0" style="width: 15%;">10</td>
                                            <td class="col-2 text-right border-0" style="width: 15%;">$500.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="bg-light-2 text-right"><strong>Sub Total:</strong></td>
                                            <td class="bg-light-2 text-right">$2150.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="bg-light-2 text-right"><strong>Taxable:</strong></td>
                                            <td class="bg-light-2 text-right">$215.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="bg-light-2 text-right"><strong>CGST:</strong></td>
                                            <td class="bg-light-2 text-right">$2365.00</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="bg-light-2 text-right"><strong>SGST:</strong></td>
                                            <td class="bg-light-2 text-right">$2365.00</td>
                                        </tr>
                                        <tr>

                                            <td colspan="4" class="bg-light-2 text-right"><strong>Total:</strong></td>
                                            <td class="bg-light-2 text-right">$2365.00</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <footer class="text-center mt-4">
             <button type="button" onclick="PrintReceipt();" class="btn btn-primary  border-0 pull-right btnstyle">Print</button>
          <%--<asp:Button ID="Button1" CssClass="btn btn-primary  border-0 pull-right btnstyle" runat="server" OnClick="ButtonPrint_Click" Text="Print" />--%>
        </footer>
        <input type="text" class="text form-control d-none" value="hi" id="p_result" />
    </form>






</body>
    <script type="text/javascript">

        var LF = "\n";
        var issueID = 1;
        var tmp = "123456789"
        var _inch = 3;

        function changeInch() {
            _inch = type_inch.value;
        }

        function viewResult(result) {
            p_result.value = result;
        }

        function PrintReceipt() {

            setPosId(issueID);
            checkPrinterStatus();

            printText("\n\nMiraeAsset Venture Tower 685,\nSampyeong-dong, Bundang-gu,\nSeongnam-si, Gyeonggi-do,\n463-400, Korea\n\n\n", 0, 0, false, false, false, 0, 1);

            if (_inch == 2) {
                // 2inch sample
                printText("--------------------------------\n", 0, 0, false, false, false, 0, 0);
                printText("Item name      Q'ty       price \n", 0, 0, false, false, false, 0, 0);
                printText("Items 1          1        100.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 2          1        200.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 3          1        300.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 4          1        400.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 5          1        500.00\n", 0, 0, false, false, false, 0, 0);
                printText("--------------------------------\n", 0, 0, false, false, false, 0, 0);
                printText("                 Sub-Total 895.0\n", 0, 1, true, false, false, 0, 0);
                printText("                 Discount    5.0\n", 0, 1, true, false, false, 0, 0);
                printText("                ----------------\n", 0, 0, false, false, false, 0, 0);
                printText("                 Tax Total 200.0\n", 0, 1, true, false, false, 0, 0);
                printText("                ----------------\n", 0, 0, false, false, false, 0, 0);
                printText("                 Total   1,000.0\n", 0, 1, true, false, false, 0, 0);
                printText("--------------------------------\n", 0, 0, false, false, false, 0, 0);
            } else if (_inch == 3) {
                // 3inch sample
                printText("------------------------------------------\n", 0, 0, false, false, false, 0, 0);
                printText("Item name             Q'ty          price \n", 0, 0, false, false, false, 0, 0);
                printText("Items 1                 1           100.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 2                 1           200.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 3                 1           300.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 4                 1           400.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 5                 1           500.00\n", 0, 0, false, false, false, 0, 0);
                printText("------------------------------------------\n", 0, 0, false, false, false, 0, 0);
                printText("                           Sub-Total 895.0\n", 0, 1, true, false, false, 0, 0);
                printText("                           Discount    5.0\n", 0, 1, true, false, false, 0, 0);
                printText("                          ----------------\n", 0, 0, false, false, false, 0, 0);
                printText("                           Tax Total 200.0\n", 0, 1, true, false, false, 0, 0);
                printText("                          ----------------\n", 0, 0, false, false, false, 0, 0);
                printText("                           Total   1,000.0\n", 0, 1, true, false, false, 0, 0);
                printText("------------------------------------------\n", 0, 0, false, false, false, 0, 0);
            } else if (_inch == 4) {
                // 4inch sample
                printText("--------------------------------------------------------------\n", 0, 0, false, false, false, 0, 0);
                printText("Item name                         Q'ty                  price \n", 0, 0, false, false, false, 0, 0);
                printText("Items 1                             1                   100.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 2                             1                   200.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 3                             1                   300.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 4                             1                   400.00\n", 0, 0, false, false, false, 0, 0);
                printText("Items 5                             1                   500.00\n", 0, 0, false, false, false, 0, 0);
                printText("--------------------------------------------------------------\n", 0, 0, false, false, false, 0, 0);
                printText("                                               Sub-Total 895.0\n", 0, 1, true, false, false, 0, 0);
                printText("                                               Discount    5.0\n", 0, 1, true, false, false, 0, 0);
                printText("                                              ----------------\n", 0, 0, false, false, false, 0, 0);
                printText("                                               Tax Total 200.0\n", 0, 1, true, false, false, 0, 0);
                printText("                                              ----------------\n", 0, 0, false, false, false, 0, 0);
                printText("                                               Total   1,000.0\n", 0, 1, true, false, false, 0, 0);
                printText("--------------------------------------------------------------\n", 0, 0, false, false, false, 0, 0);
            } else {
                // error
                return;
            }

            printText("Tel : 000 - 0000 - 0000\n", 0, 0, true, false, false, 0, 0);
            printText("Homepage : www.bixolon.com\n\n\n\n", 0, 0, false, false, false, 0, 0);

            printQRCode("www.bixolon.com", 0, 1, 7, 0);
            print1DBarcode("01234567890", 0, 4, 70, 2, 1);
            printText("\n\n\n\n\n", 0, 0, false, false, false, 0, 0);
            cutPaper();

            var strSubmit = getPosData();

            console.log(strSubmit);

            issueID++;
            requestPrint('Printer', strSubmit, viewResult);

            return true;
        }


        var arrSymbol = [0, 1, 2, 3, 5, 6, 4, 7, 8];

        function PrintBarcode() {
            var barCodeData = barcode_data.value;
            var barCodeSymbol = arrSymbol[b_symbol.selectedIndex];
            var barCodeHeight = 100;
            var barCodeWidth = 3;

            var barCodeAlignment = b_align.selectedIndex;
            var barCodeHri = print_HRI.selectedIndex;

            setPosId(issueID);

            printText("print1DBarcode\n\n", 0, 0, false, false, false, 0, 0);
            print1DBarcode(barCodeData, barCodeSymbol, barCodeWidth, barCodeHeight, barCodeHri, barCodeAlignment);
            printText("\n\n\n\n\n\n\n\n", 0, 0, false, false, false, 0, 0);

            cutPaper();

            var strSubmit = getPosData();

            console.log(strSubmit);

            issueID++;
            requestPrint('Printer', strSubmit, viewResult);
        }

        //PrintPDFFile function is only available in iOS.
        function PrintPDFFile() {
            setPosId(issueID);

            var filePath = "mPrintTest.pdf";
            printPDFFile(filePath, -1, 550, 0);

            var strSubmit = getPosData();

            console.log(strSubmit);

            issueID++;
            requestPrint('Printer', strSubmit, viewResult);
        }

        function PrintImageFile() {
            setPosId(issueID);

            //imageFileWindows must use the full path of the local pc.
            var imageFileWindows = "C:\\BIXOLON\\mPrint Server\\logo.bmp";
            printBitmapFile(imageFileWindows, -2, 1, false);

            //imageFileiOS must use the filename in Document.
            var imageFileiOS = "BIXOLON.bmp";
            printBitmapFile(imageFileiOS, -2, 1, false);

            printText("\n\n\n\n\n\n\n\n", 0, 0, false, false, false, 0, 0);
            cutPaper();

            var strSubmit = getPosData();

            console.log(strSubmit);

            issueID++;

            requestPrint('Printer', strSubmit, viewResult);
        }

        function PrintCanvas() {
            // canvas data to image(encode base64)
            var imgData = canvas.toDataURL();

            var imageAlignment = image_align.selectedIndex;

            var imageWidth = -2;
            if (image_width.selectedIndex == 2) {
                imageWidth = parseInt(image_input.value);
            }

            setPosId(issueID);
            checkPrinterStatus();
            printText("Canvas Image Sample \n\n", 0, 0, false, false, false, 0, 0);
            printBitmap(imgData, imageWidth, imageAlignment, false);

            printText("\n\n\n\n\n", 0, 0, false, false, false, 0, 0);
            cutPaper();

            var strSubmit = getPosData();

            console.log(strSubmit);

            issueID++;
            requestPrint('Printer', strSubmit, viewResult);
        }

        function PrintPagemode() {

            var rotation = pagemode_direct.selectedIndex;

            setPosId(issueID);

            checkPrinterStatus();
            pagemodeBegin();
            pagemodePrintArea(512, 700);
            pagemodePrintDirection(rotation);

            if (pagemode_direct.selectedIndex == 0) {//Normal
                pagemodePrintPosition(0, 80);
                printText("mPrint Server!\n", 0, 1, false, false, false, 0, 0);
                pagemodePrintPosition(0, 150);
                printText("Test Print!!\n", 0, 0, false, false, false, 0, 0);
                pagemodePrintPosition(0, 230);
                printText(pagemode_direct.value, 0, 0, false, false, false, 0, 0);
                pagemodePrintPosition(100, 350);
                printQRCode("http://www.bixolon.com", 0, 0, 5, 0);
            } else if (pagemode_direct.selectedIndex == 1 || pagemode_direct.selectedIndex == 3) {  //Left90 or Right90
                pagemodePrintPosition(100, 100);
                printText("mPrint Server\n", 0, 1, false, false, false, 0, 0);
                pagemodePrintPosition(100, 170);
                printText("Test Print!!\n", 0, 0, false, false, false, 0, 0);
                pagemodePrintPosition(100, 250);
                printText(pagemode_direct.value, 0, 0, false, false, false, 0, 0);
                pagemodePrintPosition(200, 350);
                printQRCode("http://www.bixolon.com", 0, 0, 5, 0);
            }
            else {//Rotate180
                pagemodePrintPosition(100, 100);
                printText("mPrint Server!\n", 0, 1, false, false, false, 0, 0);
                pagemodePrintPosition(100, 170);
                printText("Test Print!!\n", 0, 0, false, false, false, 0, 0);
                pagemodePrintPosition(100, 250);
                printText(pagemode_direct.value, 0, 0, false, false, false, 0, 0);
                pagemodePrintPosition(230, 350);
                printQRCode("http://www.bixolon.com", 0, 0, 5, 0);

            }
            pagemodeEnd();
            printText("\n\n\n\n\n", 0, 0, false, false, false, 0, 0);
            cutPaper();
            console.log(strSubmit);

            var strSubmit = getPosData();

            issueID++;
            requestPrint('Printer', strSubmit, viewResult);
        }

        function onImageWidthSelectChange() {
            if (image_width.selectedIndex == 1) {
                document.getElementById('image_input').style.display = 'none';
            } else {
                document.getElementById('image_input').style.display = 'inline-block';
            }
        }

        function erase() {
            var sigCanvas = document.getElementById("canvas");
            var context = sigCanvas.getContext("2d");
            context.clearRect(0, 0, sigCanvas.width, sigCanvas.height);
        }

        // works out the X, Y position of the click inside the canvas from the X, Y position on the page
        function getPosition(mouseEvent, sigCanvas) {
            var rect = sigCanvas.getBoundingClientRect();
            return {
                X: mouseEvent.clientX - rect.left,
                Y: mouseEvent.clientY - rect.top
            };
        }

        function initialize() {
            // get references to the canvas element as well as the 2D drawing context
            var sigCanvas = document.getElementById("canvas");
            var context = sigCanvas.getContext("2d");
            context.strokeStyle = "#FF";
            context.lineJoin = "round";
            context.lineWidth = 5;


            // This will be defined on a TOUCH device such as iPad or Android, etc.
            var is_touch_device = "ontouchstart" in document.documentElement;

            if (is_touch_device) {
                // create a drawer which tracks touch movements
                var drawer = {
                    isDrawing: false,
                    touchstart: function (coors) {
                        context.beginPath();
                        context.moveTo(coors.x, coors.y);
                        this.isDrawing = true;
                    },
                    touchmove: function (coors) {
                        if (this.isDrawing) {
                            context.lineTo(coors.x, coors.y);
                            context.stroke();
                        }
                    },
                    touchend: function (coors) {
                        if (this.isDrawing) {
                            this.touchmove(coors);
                            this.isDrawing = false;
                        }
                    }
                };

                // create a function to pass touch events and coordinates to drawer
                function draw(event) {
                    // get the touch coordinates.  Using the first touch in case of multi-touch
                    var coors = {
                        x: event.targetTouches[0].pageX,
                        y: event.targetTouches[0].pageY
                    };

                    // Now we need to get the offset of the canvas location
                    var obj = sigCanvas;

                    if (obj.offsetParent) {
                        // Every time we find a new object, we add its offsetLeft and offsetTop to curleft and curtop.
                        do {
                            coors.x -= obj.offsetLeft;
                            coors.y -= obj.offsetTop;
                        } while (
                            // The while loop can be "while (obj = obj.offsetParent)" only, which does return null
                            // when null is passed back, but that creates a warning in some editors (i.e. VS2010).
                            (obj = obj.offsetParent) != null
                        );
                    }

                    // pass the coordinates to the appropriate handler
                    drawer[event.type](coors);
                }

                // attach the touchstart, touchmove, touchend event listeners.
                sigCanvas.addEventListener("touchstart", draw, false);
                sigCanvas.addEventListener("touchmove", draw, false);
                sigCanvas.addEventListener("touchend", draw, false);

                // prevent elastic scrolling
                sigCanvas.addEventListener(
                    "touchmove",
                    function (event) {
                        event.preventDefault();
                    },
                    false
                );
            } else {
                // start drawing when the mousedown event fires, and attach handlers to
                // draw a line to wherever the mouse moves to
                $("#canvas").mousedown(function (mouseEvent) {
                    var position = getPosition(mouseEvent, sigCanvas);
                    context.moveTo(position.X, position.Y);
                    context.beginPath();

                    // attach event handlers
                    $(this)
                        .mousemove(function (mouseEvent) {
                            drawLine(mouseEvent, sigCanvas, context);
                        })
                        .mouseup(function (mouseEvent) {
                            finishDrawing(mouseEvent, sigCanvas, context);
                        })
                        .mouseout(function (mouseEvent) {
                            finishDrawing(mouseEvent, sigCanvas, context);
                        });
                });
            }
        }


        // draws a line to the x and y coordinates of the mouse event inside
        // the specified element using the specified context
        function drawLine(mouseEvent, sigCanvas, context) {
            var position = getPosition(mouseEvent, sigCanvas);

            context.lineTo(position.X, position.Y);
            context.stroke();
        }

        // draws a line from the last coordiantes in the path to the finishing
        // coordinates and unbind any event handlers which need to be preceded
        // by the mouse down event
        function finishDrawing(mouseEvent, sigCanvas, context) {
            // draw the line to the finishing coordinates
            drawLine(mouseEvent, sigCanvas, context);

            context.closePath();

            // unbind any events which could draw
            $(sigCanvas)
                .unbind("mousemove")
                .unbind("mouseup")
                .unbind("mouseout");
        }

        function changeBarcodeSymbol() {
            var symbologySelect = document.getElementById("b_symbol");
            var index = symbologySelect.selectedIndex;

            if (index == 0) { $("#barcode_data").val("123456789012"); }			//UPCA
            else if (index == 1) { $("#barcode_data").val("01234567890"); }				//UPCE
            else if (index == 2) { $("#barcode_data").val("12345678"); }				//EAN8
            else if (index == 3) { $("#barcode_data").val("1234567890123"); }			//EAN13
            else if (index == 4) { $("#barcode_data").val("2468024680"); }				//ITF
            else if (index == 5) { $("#barcode_data").val("ABCD1234567890$+-/:"); }		//Codabar
            else if (index == 6) { $("#barcode_data").val("ABCDE1234567890VWXYZ"); }	//Code39
            else if (index == 7) { $("#barcode_data").val("BXLTEST1234567890123"); }	//Code93
            else if (index == 8) { $("#barcode_data").val("BXLTEST12345678901234567"); }//Code128
        }

        var pos_data = { id: 0, functions: {} };
        var pos_func = {};
        var incPosNum = 0;

        function getPosData() {
            pos_data.functions = pos_func;
            pos_func = {};
            incPosNum = 0;

            return JSON.stringify(pos_data);
        }

        function setPosId(setId) {
            pos_data.id = setId;
        }

        function checkPrinterStatus() {
            var _a = { checkPrinterStatus: [] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function directPrintText(text) {
            var _a = { directPrintText: [text] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function directPrintHex(hexString) {
            var _a = { directPrintHex: [hexString] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function cutPaper() {
            var _a = { cutPaper: [] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function setInternationalCharset(ics) {
            var _a = { setInternationalCharset: [ics] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function setCharacterset(charset) {
            var _a = { setCharacterset: [charset] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printText(text, horizontal, vertical, bold, invert, underline, fonttype, alignment) {
            var _a = { printText: [text, horizontal, vertical, bold, invert, underline, fonttype, alignment] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function print1DBarcode(data, symbol, barWidth, height, hriPosition, alignment) {
            var _a = { print1DBarcode: [data, symbol, barWidth, height, hriPosition, alignment] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printPDF417(data, symbol, alignment, columnNumber, rowNumber, moduleWidth, moduleHeight, eccLevel) {
            var _a = { printPDF417: [data, symbol, alignment, columnNumber, rowNumber, moduleWidth, moduleHeight, eccLevel] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printQRCode(data, model, alignment, moduleSize, eccLevel) {
            var _a = { printQRCode: [data, model, alignment, moduleSize, eccLevel] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printGS1Databar(data, symbol, alignment, moduleSize) {
            var _a = { printGS1Databar: [data, symbol, alignment, moduleSize] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printDataMatrix(data, alignment, moduleSize) {
            var _a = { printDataMatrix: [data, alignment, moduleSize] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printCompositeBarcode(data, symbol, alignment, moduleSize) {
            var _a = { printCompositeBarcode: [data, symbol, alignment, moduleSize] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printBitmap(imagedata, width, alignment, dither) {
            var _a = { printBitmap: [imagedata, width, alignment, dither] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printBitmapFile(filepath, width, alignment, dither) {
            var _a = { printBitmapFile: [filepath, width, alignment, dither] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function printPDFFile(filepath, pageNumber, width, alignment, dither) {
            var _a = { printPDFFile: [filepath, pageNumber, width, alignment, dither] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function pagemodeBegin() {
            var _a = { pagemodeBegin: [] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function pagemodePrintArea(width, height) {
            var _a = { pagemodePrintArea: [width, height] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function pagemodePrintPosition(x, y) {
            var _a = { pagemodePrintPosition: [x, y] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function pagemodePrintDirection(direction) {
            var _a = { pagemodePrintDirection: [direction] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function pagemodeEnd() {
            var _a = { pagemodeEnd: [] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        function openDrawer(pinNumber) {
            var _a = { openDrawer: [pinNumber] };
            pos_func["func" + incPosNum] = _a;
            incPosNum++;
        }

        var serverURL = "http://127.0.0.1:18080/mPrintServer/";


        function toHexBinary(s) {
            var l = s.length, r = new Array(l), i;
            for (i = 0; i < l; i++) {
                r[i] = ("0" + s.charCodeAt(i).toString(16)).slice(-2)
            }
            return r.join("")
        }

        function makeResultInquiryData(requestId, responseId, timeout) {
            return "{\"RequestID\":" + requestId + ",\"ResponseID\":\"" + responseId + "\",\"Timeout\":" + timeout + "}";
        }

        function requestMSRData(strPrinterName, timeout, _callback) {
            var requestURL = serverURL + strPrinterName + "/requestMSRData";

            var xmlHttpCheck = false;
            if (window.XMLHttpRequest) {
                xmlHttpCheck = new XMLHttpRequest();
            }

            var inquiryData = "{\"Timeout\":" + timeout + "}";

            xmlHttpCheck.open('POST', requestURL, true);
            xmlHttpCheck.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xmlHttpCheck.send(inquiryData);
            xmlHttpCheck.onreadystatechange = function () {
                if (xmlHttpCheck.readyState == 4 && xmlHttpCheck.status == 200) {
                    var res = JSON.parse(xmlHttpCheck.responseText);

                    var track1 = res.Track1;
                    var track2 = res.Track2;
                    var track3 = res.Track3;

                    _callback(res.Result, track1, track2, track3);
                }
                else if (xmlHttpCheck.readyState == 4 && xmlHttpCheck.status == 404) {
                    _callback("No printers");
                }
                else if (xmlHttpCheck.readyState == 4) {
                    _callback("cannot connect to server");
                }
            }
        }

        function checkResult(method, strPrinterName, requestId, responseId, _callback) {
            var requestURL = serverURL + strPrinterName + "/checkStatus";

            var xmlHttpCheck = false;
            if (window.XMLHttpRequest) {
                xmlHttpCheck = new XMLHttpRequest();
            }

            var inquiryData = makeResultInquiryData(requestId, responseId, 30);

            xmlHttpCheck.open(method, requestURL, true);
            xmlHttpCheck.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xmlHttpCheck.send(inquiryData);
            xmlHttpCheck.onreadystatechange = function () {
                if (xmlHttpCheck.readyState == 4 && xmlHttpCheck.status == 200) {
                    var res = JSON.parse(xmlHttpCheck.responseText);
                    var ret = res.Result;

                    if (ret.search("ready") >= 0 || ret.search("progress") >= 0) {
                        checkResult(method, strPrinterName, requestId, responseId, _callback);
                    }
                    else {
                        _callback(res.ResponseID + ":" + ret);
                    }
                }
                else if (xmlHttpCheck.readyState == 4 && xmlHttpCheck.status == 404) {
                    _callback("No printers");
                }
                else if (xmlHttpCheck.readyState == 4) {
                    _callback("cannot connect to server");
                }
            }
        }

        function requestPrint(strPrinterName, strSubmit, _callback) {
            var requestURL = serverURL + strPrinterName;
            var xmlHttpReq = false;

            if (window.XMLHttpRequest) {
                xmlHttpReq = new XMLHttpRequest();
            }

            xmlHttpReq.open('POST', requestURL, true);
            xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xmlHttpReq.send(strSubmit);

            xmlHttpReq.onreadystatechange = function () {

                if (xmlHttpReq.readyState == 4 && xmlHttpReq.status == 200) {
                    var res = JSON.parse(xmlHttpReq.responseText);
                    var ret = res.Result;
                    if (ret.search("ready") >= 0 || ret.search("progress") >= 0) {
                        checkResult('POST', strPrinterName, res.RequestID, res.ResponseID, _callback);
                    }
                    else if (ret.search("duplicated") >= 0) {
                        _callback(res.Result);
                    }
                }
                else if (xmlHttpReq.readyState == 4 && xmlHttpReq.status == 404) {
                    _callback("No printers");
                }
                else if (xmlHttpReq.readyState == 4) {
                    _callback("cannot connect to server");
                }
            }
        }

        function getBrowser() {
            var ua = navigator.userAgent, tem, M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
            if (/trident/i.test(M[1])) {
                tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
                return { name: 'IE', version: (tem[1] || '') };
            }
            if (M[1] === 'Chrome') {
                tem = ua.match(/\bOPR|Edge\/(\d+)/)
                if (tem != null) { return { name: 'Opera', version: tem[1] }; }
            }
            M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
            if ((tem = ua.match(/version\/(\d+)/i)) != null) { M.splice(1, 1, tem[1]); }
            return {
                name: M[0],
                version: M[1]
            };
        }

        function isEmpty(data) {
            if (typeof data == "undefined"
                || data == null
                || data == "")
                return true;

            else return false;
        }

    </script>
</html>
