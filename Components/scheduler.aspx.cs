using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_scheduler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["records"] = "2";
        getCustomerDetails();
    }



    public void getCustomerDetails()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ds = cc.fnGetAddress();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string changeStoreOption = "<p id=\"storechange\" class=\"_ChangeStore_btn\">Change Store</p>";
            if (ds.Tables[1].Rows[0]["CHANGE_STORE_FLAG"].ToString() == "N")
            {
                changeStoreOption = "";
            }

            active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\"> with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();


        }
    }

    [WebMethod]

    public static string getCustomerOrderByDate(string startdate, string enddate)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.User_ID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Type = 101;
        cr.STARTDATE = startdate;
        cr.ENDDATE = enddate;
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        ds = cr.fnGenerateInvoice();
        string Orders = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string Create_invoice = "d-none";
                string view_invoice = "";
                decimal total = Convert.ToDecimal(DR["AMOUNT"].ToString());
                decimal received_amount = Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString());
                string partially_Paid = "";
                string comment = "";
                string PayBth = "";
                if (DR["STATUS"].ToString().ToUpper() == "ORDER DRAFTED" && DR["RECEIVED_AMOUNT"].ToString() != "0" && total - received_amount > 0)
                {
                    partially_Paid = "Your order is not yet placed but partially paid.";
                    PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                    comment = " Please pay Rs. " + Convert.ToString(total - received_amount) + " to place your order";
                }
                else if (DR["STATUS"].ToString().ToUpper() == "ORDER DRAFTED" && DR["RECEIVED_AMOUNT"].ToString() == "0" && total - received_amount > 0)
                {
                    partially_Paid = "Your order is not yet placed.";
                    comment = "Please pay Rs. " + Convert.ToString(total - received_amount) + " as COD or ";
                    PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                }
                else if (DR["STATUS"].ToString().ToUpper() == "ORDER PLACED" && DR["RECEIVED_AMOUNT"].ToString() != "0" && total - received_amount > 0)
                {
                    partially_Paid = "Your order is placed. ";
                    comment = "Please pay Rs. " + Convert.ToString(total - received_amount) + " as COD or ";
                    PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100 \">Pay Online</button></div>";
                }
                else if (DR["STATUS"].ToString().ToUpper() == "ORDER PLACED" && DR["RECEIVED_AMOUNT"].ToString() == "0" && total - received_amount > 0)
                {
                    partially_Paid = "Your order is placed. ";
                    comment = "Please pay Rs. " + Convert.ToString(total - received_amount) + " as COD or";
                    PayBth = "<div class=\"col-6\"><button  header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                }
                else
                {
                    partially_Paid = "";
                    comment = "";
                    PayBth = "";
                }

                string trackbtn = "";
                if (DR["TrackId"].ToString() != "")
                {
                    trackbtn = "<div class=\"col-6\"><button trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn w-100 mt-2 mb-2\">Track Order</button></div>";
                }


                string chatstatus = "<i style=\"color:#bbb;\" class=\"fa fa-comment\" aria-hidden=\"true\"></i>";
                if (DR["Chatstatus"].ToString().ToLower() != "closed")
                {
                    chatstatus = "<i style=\"color:#04ff04;\" class=\"fa fa-comment\" aria-hidden=\"true\"></i>";
                }

                string Chatbtn = "";
                if (DR["isChatModuleEnable"].ToString() == "Y")
                {
                    Chatbtn = "<div class=\"col-6\"><button onclick=\"location.href='../../Chat.aspx?headerid=" + cl_encrypt.Encrypt(DR["HEADER_ID"].ToString()) + "'\" type=\"button\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"chatnowbtn w-100\">" + chatstatus + "&nbsp;Chat </button></div>";
                }
                string status = DR["STATUS"].ToString();
                if (DR["STATUS"].ToString() == "DELIVERED")
                {
                    status = "Dispatched";
                }
                if (DR["CREATE_INVOICE_FLAG"].ToString() == "Y" && DR["INVOICE_ID"].ToString() == "0")
                {
                    view_invoice = "d-none";
                    Create_invoice = "";
                }


                Orders = Orders + "<div class=\"card container p-1 mt-2\"><div class=\"row\" header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
                                 "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                                 "<div class=\"rtname\">" + DR["NAME"].ToString() + " </div><div style=\"font-size: 13px;color: #2ab5b7; font-weight: 500;\">+91 " + DR["RET_NUMBER"].ToString() + "</div>" +
                                 "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                                 "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["HEADER_ID"].ToString() + " </div>" +
                                 "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                                 "<div class=\"col-5 col-md-5 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  </div>" +
                                 "</div><div class=\"col-3 col-md-3 \"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                                 "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                                 "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                                 "</div></div><div class=\"items__append\" style=\"display:none;\">" +

                                 "</div></div><div class=\"amountsection pl-2 \">" +
                                 "<div class=\"row\">" +
                                 "<div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Order Status:</strong>" +
                                 "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + textInfo.ToTitleCase(status) + "</span></div>" +
                                 "</div>" +

                                  "<div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Paid:</strong>" +
                                 "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["RECEIVED_AMOUNT"].ToString() + " " + textInfo.ToTitleCase(DR["MOP"].ToString().ToLower().Replace("prepaid balance", "wallet")) + "" + "</span></div>" +
                                 "</div>" +



                                  "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                                  "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +
                                 "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                 "<div class=\"totalamountbox\"><strong>Estimated Delivery By:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                                 "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +


                                 "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + "\"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                                 "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                                 "</div></div>" +

                                 "</div>" +
                                 "<div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\">" +
                                 "<p class=\"mb-0\">" + partially_Paid + "" + comment + "</p></div>" +
                                 "<div class=\"row\">" +

                                  "<div class=\"col-6 " + Create_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 mb-2 p-0\" flag=\"N\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>Generate Invoice</a></div>" +
                                  "<div class=\"col-6 " + view_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 mb-2 p-0\" flag=\"Y\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>View Invoice</a></div>" +


                                   PayBth +
                                   trackbtn +
                                    Chatbtn +
                                     "</div>" +
                                 "</div></div></div>";



            }
        }
        return Orders;
    }

    [WebMethod]

    public static string getCustomerOrderByDateNextRecords(string startdate, string enddate)
    {
        string Orders = "";
        if (HttpContext.Current.Session["records"].ToString() != "-1")
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.User_ID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
            cr.Type = 119;
            cr.STARTDATE = startdate;
            cr.ENDDATE = enddate;
            cr.RTID = HttpContext.Current.Session["records"].ToString();
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            ds = cr.fnGenerateInvoice();

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    string Create_invoice = "d-none";
                    string view_invoice = "";
                    decimal total = Convert.ToDecimal(DR["AMOUNT"].ToString());
                    decimal received_amount = Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString());
                    string partially_Paid = "";
                    string comment = "";
                    string PayBth = "";
                    if (DR["STATUS"].ToString().ToUpper() == "ORDER DRAFTED" && DR["RECEIVED_AMOUNT"].ToString() != "0" && total - received_amount > 0)
                    {
                        partially_Paid = "Your order is not yet placed but partially paid.";
                        comment = " Please pay Rs. " + Convert.ToString(total - received_amount) + " to place your order";
                        PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                    }
                    else if (DR["STATUS"].ToString().ToUpper() == "ORDER DRAFTED" && DR["RECEIVED_AMOUNT"].ToString() == "0" && total - received_amount > 0)
                    {
                        partially_Paid = "Your order is not yet placed.";
                        comment = "Please pay Rs. " + Convert.ToString(total - received_amount) + " as COD or  ";
                        PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                    }
                    else if (DR["STATUS"].ToString().ToUpper() == "ORDER PLACED" && DR["RECEIVED_AMOUNT"].ToString() != "0" && total - received_amount > 0)
                    {
                        partially_Paid = "Your order is placed. ";
                        comment = "Please pay Rs. " + Convert.ToString(total - received_amount) + " as COD or  ";
                        PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                    }
                    else if (DR["STATUS"].ToString().ToUpper() == "ORDER PLACED" && DR["RECEIVED_AMOUNT"].ToString() == "0" && total - received_amount > 0)
                    {
                        partially_Paid = "Your order is placed. ";
                        comment = "Please pay Rs. " + Convert.ToString(total - received_amount) + " as COD or  ";
                        PayBth = "<div class=\"col-6\"><button href=\"javascript:void(0);\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"onlinePay2 w-100\">Pay Online</button></div>";
                    }
                    else
                    {
                        partially_Paid = "";
                        comment = "";
                        PayBth = "";
                    }


                    string trackbtn = "";
                    if (DR["TrackId"].ToString() != "")
                    {
                        trackbtn = "<div class=\"col-6\"><button type=\"button\" trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn w-100 mt-2 mb-2\">Track Order</button></div>";
                    }


                    string chatstatus = "<i style=\"color:#bbb;\" class=\"fa fa-comment\" aria-hidden=\"true\"></i>";
                    if (DR["Chatstatus"].ToString().ToLower() != "closed")
                    {
                        chatstatus = "<i style=\"color:#04ff04;\" class=\"fa fa-comment\" aria-hidden=\"true\"></i>";
                    }
                    string Chatbtn = "";
                    if (DR["isChatModuleEnable"].ToString() == "Y")
                    {
                        Chatbtn = "<div class=\"col-6\"><button onclick=\"location.href='../../Chat.aspx?headerid=" + cl_encrypt.Encrypt(DR["HEADER_ID"].ToString()) + "'\" type=\"button\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"chatnowbtn w-100\">" + chatstatus + "&nbsp;Chat </button></div>";
                    }
                    string status = DR["STATUS"].ToString();
                    if (DR["STATUS"].ToString() == "DELIVERED")
                    {
                        status = "Dispatched";
                    }
                    if (DR["CREATE_INVOICE_FLAG"].ToString() == "Y" && DR["INVOICE_ID"].ToString() == "0")
                    {
                        view_invoice = "d-none";
                        Create_invoice = "";
                    }


                    Orders = Orders + "<div class=\"card container p-1 mt-2\"><div class=\"row\" header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
                                     "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                                     "<div class=\"rtname\">" + DR["NAME"].ToString() + " </div><div style=\"font-size: 13px;color: #2ab5b7; font-weight: 500;\">+91 " + DR["RET_NUMBER"].ToString() + "</div>" +
                                     "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                                     "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["HEADER_ID"].ToString() + " </div>" +
                                     "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                                     "<div class=\"col-5 col-md-5 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  </div>" +
                                     "</div><div class=\"col-3 col-md-3 \"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                                     "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                                     "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                                     "</div></div><div class=\"items__append\" style=\"display:none;\">" +

                                     "</div></div><div class=\"amountsection pl-2 \">" +
                                     "<div class=\"row\">" +
                                     "<div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Order Status:</strong>" +
                                     "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + textInfo.ToTitleCase(status) + "</span></div>" +
                                     "</div>" +

                                      "<div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Paid:</strong>" +
                                     "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["RECEIVED_AMOUNT"].ToString() + " " + textInfo.ToTitleCase(DR["MOP"].ToString().ToLower().Replace("prepaid balance", "wallet")) + "" + "</span></div>" +
                                     "</div>" +



                                      "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                                      "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +
                                     "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                     "<div class=\"totalamountbox\"><strong>Estimated Delivery By:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                                     "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +


                                     "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + "\"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                                     "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                                     "</div></div>" +

                                      "</div>" +
                                     "<div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\">" +
                                     "<p class=\"mb-0\">" + partially_Paid + "" + comment + "</p></div>" +
                                    "<div class=\"row\">" +

                                     "<div class=\"col-6 " + Create_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 mb-2 p-0\" flag=\"N\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>Generate Invoice</a></div>" +
                                  "<div class=\"col-6 " + view_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 mb-2 p-0\" flag=\"Y\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>View Invoice</a></div>" +


                                   PayBth +
                                   trackbtn +
                                      Chatbtn +
                                     "</div>" +
                                     "</div></div></div>";



                }

                HttpContext.Current.Session["records"] = Convert.ToString(Convert.ToInt32(HttpContext.Current.Session["records"]) + 1);
            }
            else
            {
                HttpContext.Current.Session["records"] = "-1";
            }
        }
        return Orders;
    }

    [WebMethod]
    public static string getItemsByHeader(string Header_ID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();

        cr.Header_ID = Header_ID;
        cr.Type = 96;
        ds = cr.fnGenerateInvoice();
        string items = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {


                string product_imgage = "";
                string NA = "";
               
                if (DR["IS_AVAILABLE"].ToString() == "N" && DR["IS_AVAILABLE"].ToString() != "")
                {
                    NA = "<div class=\"itemoverlay\" style=\"background:#c0c0c080;position:absolute;height:100%;width:100%;text-align:end;\"><div style=\"position:absolute;bottom:8px;align-items:unset;width:50%;border:1px solid;text-align:center;border-radius:15px;right:0;background:white;color:#cc2727;\">Currently unavailable</div></div>";
                }
                else if (DR["SERVED"].ToString() == "N" && DR["SERVED"].ToString() != "")
                {
                    NA = "<div class=\"itemoverlay\" style=\"background:#ffbbbb80;position:absolute;height:100%;width:100%;text-align:end;\"><div style=\"position:absolute;bottom:8px;align-items:unset;width:50%;border:1px solid;text-align:center;border-radius:15px;right:0;background:white;color:#8c8c8c;\">Not delivered</div></div>";
                }
                else
                {
                    NA = "";
                }

                if (DR["IMAGE_PATH"].ToString() != "")
                {
                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/" + DR["IMAGE_PATH"].ToString() + "\"/>";
                }
                else
                {

                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/Defaultimage.png\"/>";
                }
                items = items + "<div class=\"card mt-3\"><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\" style=\"height: 90px;width: 100%;\"> " +
                                                   "" + product_imgage + "</div></div><div class=\"col-8\"> " +
                                                   "<div class=\"itemdetails\"><div class=\"itemprice\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() +
                                                    "</div><div class=\"itemname\">" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div> " +
                                                    "<div class=\"itemqty\" style=\"display: none;\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div></div>" + NA + "</div>";
            }
        }
        return items;
    }

    [WebMethod]

    public static string GenerateTrxID(string Header_ID)
    {
        cl_resturant cc = new cl_resturant();
        DataSet ds = new DataSet();
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cc.Header_ID = Header_ID;
        cc.Type = 67;
        ds = cc.fnInsertData();
        string Trx_ID = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Trx_ID = ds.Tables[0].Rows[0]["TRX_ID"].ToString();
        }
        return Trx_ID;
    }

    [WebMethod]

    public static string DeleteOrder(string Header_ID)
    {
        cl_resturant cc = new cl_resturant();
        DataSet ds = new DataSet();
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cc.Header_ID = Header_ID;
        cc.Type = 70;
        ds = cc.fnInsertData();
        return "1";
    }
}