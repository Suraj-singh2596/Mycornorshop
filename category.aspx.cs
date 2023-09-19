using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getAllCategories();
        getCustomerOrders();
        GetTransactionHistory();
        //Send_Notification.SendPushNotification("drForKpjRmOYq4gbKjZTaD:APA91bFfpdB1G8OL_Z7BQgL5hhbdj7uKXD3kuARt6iNSi2ILGVcZdqOj3zDAcnX8IBtvb5lKM7ozoO-61WqvWPmIfarwuntchySnyETjtLF40m_ZfNowjZ_t8QMOXgRUo_BEe3gUwIs2", "Hi My self lalit");
        //  var x = Send_Notification.SendPushNotification("dHSU9zlCQP-t8cOjBYNXEA:APA91bFubpAWS-w8XiO35fo71S0beZOsoAJVGFjHZGH2hE2MohhkAO_dDUeZNFWFyTDlBgu3fXlEjuJEfGilH6-TKIMFdy9E7009RuM_ydgYOuX5h_5Vim0XucaZCmVXaq6i88y8tWpi", "Hi My self is lalit");
        
    }
    public void getAllCategories()
    {
      

        string General_Store = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><a href=\"../Home.aspx?rid=1CD0xSSF53lP2Cvczbwz3w==&ulid=1CD0xSSF53lP2Cvczbwz3w==\" ><div class=\"card hover m-1 mt-2 bgclor \">" +
            "<div class=\"row\">" +
            "<div class=\"col-4\"><div class=\"card-img\"><img src=\"svgicons/store.svg\"></div></div>" +
            "<div class=\"col-8\"><div class=\"card-content\">Gupta General Store <p class=\"location\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> Sector-14, Gurugram</p><button class=\"btn visitbtn\">Visit now</button></div></div>" +
            "</div></div></a></div>";

        string Pharma = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2 bgclor\">" +
            "<div class=\"row\">" +
            "<div class=\"col-4\"><div class=\"card-img\"><img src = \"svgicons/medicines.svg\" ></div></div>" +
             "<div class=\"col-8\"><div class=\"card-content\">Pharmacist <p class=\"location\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> Sector-14, Gurugram</p><button class=\"btn visitbtn\">Visit now</button></div></div>" +
            "</div></div></div>";

        string Dry_Cleaner = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2 bgclor\">" +
            "<div class=\"row\">" +
            "<div class=\"col-4\"><div class=\"card-img\"><img src = \"svgicons/washing-machine.svg\" ></div></div>" +
             "<div class=\"col-8\"><div class=\"card-content\">Dry Cleaner <p class=\"location\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> Sector-14, Gurugram</p><button class=\"btn visitbtn\">Visit now</button></div></div>" +
            "</div></div></div>";

        string Laundry = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2 bgclor\">" +
           "<div class=\"row\">" +
           "<div class=\"col-4\"><div class=\"card-img\"><img src = \"svgicons/towels.svg\" ></div></div>" +
            "<div class=\"col-8\"><div class=\"card-content\">Laundry <p class=\"location\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> Sector-14, Gurugram</p><button class=\"btn visitbtn\">Visit now</button></div></div>" +
           "</div></div></div>";

        string Car_Cleaner = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2 bgclor\">" +
          "<div class=\"row\">" +
          "<div class=\"col-4\"><div class=\"card-img\"><img src = \"svgicons/car-wash.svg\" ></div></div>" +
           "<div class=\"col-8\"><div class=\"card-content\">Car Cleaner <p class=\"location\"><i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> Sector-14, Gurugram</p><button class=\"btn visitbtn\">Visit now</button></div></div>" +
          "</div></div></div>";


        string notfound = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2 bgclor\">" +
         "<div class=\"row\">" +
         "<div class=\"col-4\"><div class=\"card-img\"><i class=\"fa fa-ban fa-3x\" style=\"color: #939393;\" aria-hidden=\"true\"></i></div></div>" +
          "<div class=\"col-8\"><div class=\"card-content pt-0\"><h1>oops!</h1><p class=\"location\">you don't have any favorites please add from above categories. Thanks</p></div></div>" +
         "</div></div></div>";

        //string Dry_Cleaner = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2\"><div class=\"card-img\">" +
        //                "<img src = \"Assest/images/washing-machine.png\" ></div><div class=\"card-content\">Dry Cleaner</div></div></div>";

        //string Laundry = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2\"><div class=\"card-img\">" +
        //                "<img src = \"Assest/images/washing-clothes.png\" ></div><div class=\"card-content\">Laundry</div></div></div>";

        //string Car_Cleaner = "<div class=\"col-12 col-md-6 col-sm-6 p-2\"><div class=\"card m-1 mt-2\"><div class=\"card-img\">" +
        //                "<img src = \"Assest/images/car-wash.png\"></div><div class=\"card-content\">Car Cleaner</div></div></div>";


        string topstory = "<div class=\" additionalitm\"  style=\" padding-top: 45px;\" ><label style=\" color: white; font-size: 17px;\" ></label>" +
                        "<div class=\" story-doubles2 owl-carosel5 owl-carousel owl-theme\">" +
                        "<div class=\" story-item item\" ><div class=\" circlecard\" ><div class=\"crdimg\"><img src=\"svgicons/store.svg\"></div><t>General Store</t></div></div>" +
                        "<div class=\" story-item item\" ><div class=\" circlecard\" ><img src=\"svgicons/medicines.svg\"><t>Pharmacy</t> </div></div>" +
                        "<div class=\" story-item item\" ><div class=\" circlecard\" ><img src=\"svgicons/washing-machine.svg\"><t>Dry Cleaner</t></div></div>" +

                        "<div class=\" story-item item\" ><div class=\" circlecard\" ><img src=\"svgicons/towels.svg\"><t>Laundry</t></div></div>" +
                        "<div class=\" story-item item\" ><div class=\" circlecard\" ><img src=\"svgicons/car-wash.svg\"><t>Car Cleaner</t></div></div>" +
                        "</div></div>";


        string Container = "<div class=\"container\">" + topstory + "<div class=\"row backshow\"><div class=\"text-center col-12\"><h5>My Favorites</h5></div>" +
                          notfound + General_Store + Pharma + Dry_Cleaner + Laundry + Car_Cleaner +
                        "</div></div>";





        categorysection.InnerHtml = Container;

        string items = "<div class=\"row \"><div class=\"col-8 col-md-8 \"><div class=\"itmdetails\"> Milk | 1 lt.</div>" +
            " </div> <div class=\"col-4 col-md-4 \"><div class=\"itemqty text-right\"> x 1</div> </div></div>";

        string scheduled_item = "<div class=\"card p-1 mt-2\"><div class=\"row\"><div class=\"col-md-12\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                "<div class=\"retailrdetails\">My General Store</div></div><div class=\"col-7 col-md-7 \"><div class=\"sheduledtime\">" +
                                "<div class=\"rounded\"><span class=\"roundbox\">1</span><div class=\"datetime\">Tomarrow 27-Sep-2020</div></div></div></div></div>" +
                                "<div class=\"itembox m-2\">" + items + "</div><div class=\"amountsection\"><div class=\"row\">" +
                                "<div class=\"col-3 col-md-3 \"><div class=\"Recurringbtn text-center\">" +
                                "<a class=\"playbtn \"><i class=\"fa fa-play\"></i></a><a class=\"stopbtn\"><i class=\"fa fa-pause\"></i></a>" +
                                "</div></div><div class=\"col-4 col-md-4 text-center\"><div class=\"totalamountbox\"><label>Rs. 200.00</label>" +
                                "</div></div><div class=\"col-5 col-md-5 \"><div class=\"paymentbox\"><a class=\"paybtn\">Pay &amp; Confirm</a>" +
                                "</div></div></div></div></div></div></div>";
    }


    public void getCustomerOrders()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.CID = "1";
        cr.Type = 50;
        ds = cr.fngetParticularItemList();
        string orders = "";
        string items = "";
        string Header_ID = "";
        decimal total = 0;
        string Delivery_Date = "";
        string Delivery_Status = "";
        string addClass = "";
        int i = 0;
        int j = 1;
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            decimal Qty = 0;
            var lastRow = ds.Tables[0].Rows.Count;
            int x = 0;
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                x++;
                if (Header_ID != DR["HEADER_ID"].ToString() && Header_ID == "0")
                {
                    if (lastRow == 1)
                    {
                        Header_ID = DR["HEADER_ID"].ToString();
                        Delivery_Date = Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE"]).ToString("dd-MMM-yyyy"));
                        Delivery_Status = DR["DELIVERY_STATUS"].ToString();
                        Qty = Qty + Convert.ToDecimal(DR["QTY"].ToString());
                        total = total + Convert.ToDecimal(DR["QTY"].ToString()) * (Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString()));
                        items = items + "<div class=\"row \"><div class=\"col-8 col-md-8 \"><div class=\"itmdetails\"><strong>" + j + ".</strong> &nbsp;" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div>" +
                             "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty text-right\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div>";

                        string plybtn = "d-none";
                        if (DR["SCHEDULER_ORDER_HEADER_ID"].ToString() != "0")
                        {
                            plybtn = "";
                        }

                        orders = orders +
                                               "<div class=\"card p-1 mt-2 " + addClass + "\"><div class=\"row\"><div class=\"col-md-12\"><div class=\"row\"><div class=\"col-7 col-md-7 \"><div class=\"retailrdetails\">" +
                                               DR["NAME"].ToString() + " </div></div><div class=\"col-5 col-md-5 \"><div class=\"sheduledtime\"><div class=\"rounded\"><span class=\"roundbox\">" + Qty + "</span><div class=\"datetime\">" + Delivery_Date + "</div>" +
                                               "</div></div></div></div><div class=\"itembox m-2\">" + items +

                                               "</div><div class=\"amountsection\"><div class=\"row\"><div class=\"col-3 col-md-3 \"><div class=\"Recurringbtn " + plybtn + " text-center\">" +
                                               "<a class=\"playbtn\"><i class=\"fa fa-play\"></i></a><a class=\"stopbtn\"><i class=\"fa fa-pause\"></i></a></div></div>" +
                                               "<div class=\"col-4 col-md-4 text-center\"><div class=\"totalamountbox\"><label>Rs. " + total + "</label></div></div><div class=\"col-5 col-md-5 \">" +
                                               "<div class=\"paymentbox\"><a class=\"paybtn\">" + Delivery_Status + "</a></div></div></div></div></div></div></div>";

                        items = "";
                        Qty = 0;
                        total = 0;
                        Delivery_Date = "";
                        Delivery_Status = "";
                        i++;
                        if (i >= 4)
                        {
                            addClass = "hideshowclass d-none";
                        }
                        j = 1;

                    }
                    else
                    {
                        Header_ID = DR["HEADER_ID"].ToString();
                    }
                }
                else if (Header_ID != DR["HEADER_ID"].ToString() && Header_ID != "0")
                {
                    if (items != "")
                    {
                        string plybtn = "d-none";
                        if (DR["SCHEDULER_ORDER_HEADER_ID"].ToString() != "0")
                        {
                            plybtn = "";
                        }
                        orders = orders +
                                             "<div class=\"card p-1 mt-2 " + addClass + "\"><div class=\"row\"><div class=\"col-md-12\"><div class=\"row\"><div class=\"col-7 col-md-7 \"><div class=\"retailrdetails\">" +
                                             DR["NAME"].ToString() + " </div></div><div class=\"col-5 col-md-5 \"><div class=\"sheduledtime\"><div class=\"rounded\"><span class=\"roundbox\">" + Qty + "</span><div class=\"datetime\">" + Delivery_Date + "</div>" +
                                             "</div></div></div></div><div class=\"itembox m-2\">" + items +

                                             "</div><div class=\"amountsection\"><div class=\"row\"><div class=\"col-3 col-md-3 \"><div class=\"Recurringbtn " + plybtn + " text-center\">" +
                                             "<a class=\"playbtn\"><i class=\"fa fa-play\"></i></a><a class=\"stopbtn\"><i class=\"fa fa-pause\"></i></a></div></div>" +
                                             "<div class=\"col-4 col-md-4 text-center\"><div class=\"totalamountbox\"><label>Rs. " + total + "</label></div></div><div class=\"col-5 col-md-5 \">" +
                                             "<div class=\"paymentbox\"><a class=\"paybtn\">" + Delivery_Status + "</a></div></div></div></div></div></div></div>";
                        items = "";
                        Qty = 0;
                        total = 0;
                        Delivery_Date = "";
                        Delivery_Status = "";
                        i++;
                        if (i >= 4)
                        {
                            addClass = "hideshowclass d-none";
                        }
                        j = 1;

                        Header_ID = DR["HEADER_ID"].ToString();
                    }
                    else
                    {
                        Header_ID = DR["HEADER_ID"].ToString();
                    }
                }
                else if (lastRow == x)
                {
                    Header_ID = DR["HEADER_ID"].ToString();
                    Delivery_Date = Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE"]).ToString("dd-MMM-yyyy"));
                    Delivery_Status = DR["DELIVERY_STATUS"].ToString();
                    Qty = Qty + Convert.ToDecimal(DR["QTY"].ToString());
                    total = total + Convert.ToDecimal(DR["QTY"].ToString()) * (Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString()));
                    items = items + "<div class=\"row \"><div class=\"col-8 col-md-8 \"><div class=\"itmdetails\"><strong>" + j + ".</strong> &nbsp;" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div>" +
                         "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty text-right\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div>";


                    string plybtn = "d-none";
                    if (DR["SCHEDULER_ORDER_HEADER_ID"].ToString() != "0")
                    {
                        plybtn = "";
                    }
                    orders = orders +
                                              "<div class=\"card p-1 mt-2 " + addClass + "\"><div class=\"row\"><div class=\"col-md-12\"><div class=\"row\"><div class=\"col-7 col-md-7 \"><div class=\"retailrdetails\">" +
                                              DR["NAME"].ToString() + " </div></div><div class=\"col-5 col-md-5 \"><div class=\"sheduledtime\"><div class=\"rounded\"><span class=\"roundbox\">" + Qty + "</span><div class=\"datetime\">" + Delivery_Date + "</div>" +
                                              "</div></div></div></div><div class=\"itembox m-2\">" + items +

                                              "</div><div class=\"amountsection\"><div class=\"row\"><div class=\"col-3 col-md-3 \"><div class=\"Recurringbtn " + plybtn + " text-center\">" +
                                              "<a class=\"playbtn\"><i class=\"fa fa-play\"></i></a><a class=\"stopbtn\"><i class=\"fa fa-pause\"></i></a></div></div>" +
                                              "<div class=\"col-4 col-md-4 text-center\"><div class=\"totalamountbox\"><label>Rs. " + total + "</label></div></div><div class=\"col-5 col-md-5 \">" +
                                              "<div class=\"paymentbox\"><a class=\"paybtn\">" + Delivery_Status + "</a></div></div></div></div></div></div></div>";
                    items = "";
                    Qty = 0;
                    total = 0;
                    Delivery_Date = "";
                    Delivery_Status = "";
                    i++;
                    if (i >= 4)
                    {
                        addClass = "hideshowclass d-none";
                    }
                    j = 1;

                }
                Delivery_Date = Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE"]).ToString("dd-MMM-yyyy"));
                Delivery_Status = DR["DELIVERY_STATUS"].ToString();
                Qty = Qty + Convert.ToDecimal(DR["QTY"].ToString());
                total = total + Convert.ToDecimal(DR["QTY"].ToString()) * (Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString()));

                items = items + "<div class=\"row \"><div class=\"col-8 col-md-8 \"><div class=\"itmdetails\"><strong>" + j + ".</strong> &nbsp;" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div>" +
                     "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty text-right\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div>";
                j++;

            }




        }
        string Last_Line = "";
        if (i >= 4)
        {
            Last_Line = "<div class=\"row\"><div class=\"col-12\"><a href=\"/Components/scheduler.aspx?cid=1\" class=\"float-right btn\">Show More</a></div></div>";
        }
        shedulersection.InnerHtml = "<div class=\"card itemcard p-2 mb-2\"><h6>My Order</h6>" + orders + "</div>" + Last_Line;
    }

    public void GetTransactionHistory()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.CID = "1";
        cr.Type = 52;
        ds = cr.fngetParticularItemList();
        string Transaction_History = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Transaction_History = Transaction_History + "<tr><td>" + Convert.ToDateTime(DR["TRX_DATE"]).ToString("dd MMM yyyy") + "</td><td>" + DR["RETAILER_NAME"].ToString() + "</td><td>" + DR["AMOUNT"].ToString() + "</td><td>" + DR["TYPE"].ToString() + "</td></tr>";
            }

        }
        if (Transaction_History != "")
        {
            transaction_History.InnerHtml = Transaction_History;
        }
        else
        {
            TransactionContainer.Visible = false;
        }



    }
}