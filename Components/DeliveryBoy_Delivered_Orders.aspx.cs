using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_DeliveryBoy_Delivered_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["records"] = "2";
        if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.QueryString["rid"]) && !string.IsNullOrEmpty(Request.QueryString["ulid"]))
        {
            string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
            string RID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());

            HttpCookie Cookie = new HttpCookie("delivery_user_id");
            Cookie.Value = User_ID;
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie rid = new HttpCookie("rid");
            rid.Value = RID;
            rid.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(rid);


        }
        GetNotification_count();
        getAdminDetails();
    }


    public void getAdminDetails()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString(); ;
        ca.USER_TYPE = "DELIVERYBOY";
        ca.Type = 25;
        ds = ca.fn_admin_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie user_type = new HttpCookie("user_type");
            user_type.Value = "delivery";
            user_type.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(user_type);

            StoreName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
              "Delivery Agent-" + ds.Tables[1].Rows[0]["PERSON_NAME"].ToString() + "</p>";
        }
        else
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = "";
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }



    }
    [WebMethod]

    public static string getCustomerOrdersbydates(string startdate, string enddate)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.STARTDATE = startdate;
        cr.ENDDATE = enddate;
        cr.User_ID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        cr.Type = 108;
        ds = cr.fnGenerateInvoice();
        string Orders = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Orders = Orders + "<div class=\"card container p-1 mt-2 \"><div class=\"row\" header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
                                    "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                                    "<div class=\"rtname\">" + DR["C_Name"].ToString() + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div>" +
                                    "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                                    "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["ORDER_NO"].ToString() + " </div>" +
                                    "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                                    "<div class=\"col-4 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  </div>" +
                                    "</div><div class=\"col-4 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                                    "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                                    "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                                    "</div></div><div class=\"items__append\" style=\"display:none;\">" +

                                    "</div></div><div class=\"amountsection pl-2 \">" +
                                    "<div class=\"row\">" +

                                    "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
                                    "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</span></div></div>" +

                                    "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                                    "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                                    "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                    "<div class=\" \"><strong>Delivery Date:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                                    "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

                                    "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + "\"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                                 "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                                 "</div></div>" +

                                    "</div><div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
                                        "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox\">" +
                                        "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
                                        "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/></div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
                                        "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
                                        "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
                                        "</div><div class=\"col-2 pl-0\"><button type=\"button\" " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "disabled" : "") + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "active" : "") + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed='" + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "true" : "false") + "' autocomplete=\"off\">" +
                                        "<div class=\"handle\">" + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "D" : "P") + "</div></button></div><div class=\"col-3 pl-0\"><a class=\"btnstyle " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "" : "notifybtnshow") + " notifybtn\">" + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified" : "Save & Notify") + "</a></div></div></div></div></div>" +
                                       "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
                                        "</div></div></div>";
            }
        }
        return Orders;
    }

    [WebMethod]

    public static string getCustomerOrdersbydatesNextRecords(string startdate, string enddate)
    {
        string Orders = "";
        if (HttpContext.Current.Session["records"].ToString() != "-1")
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.STARTDATE = startdate;
            cr.ENDDATE = enddate;
            cr.User_ID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
            cr.Type = 117;
            cr.RTID = HttpContext.Current.Session["records"].ToString();
            ds = cr.fnGenerateInvoice();

            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    Orders = Orders + "<div class=\"card container p-1 mt-2 \"><div class=\"row\" header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
                                        "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                                        "<div class=\"rtname\">" + DR["C_Name"].ToString() + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div>" +
                                        "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                                        "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["ORDER_NO"].ToString() + " </div>" +
                                        "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                                        "<div class=\"col-4 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  </div>" +
                                        "</div><div class=\"col-4 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                                        "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                                        "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                                        "</div></div><div class=\"items__append\" style=\"display:none;\">" +

                                        "</div></div><div class=\"amountsection pl-2 \">" +
                                        "<div class=\"row\">" +

                                        "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
                                        "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</span></div></div>" +

                                        "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                                        "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                                        "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                        "<div class=\" \"><strong>Delivery Date:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                                        "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

                                        "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + "\"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                                     "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                                     "</div></div>" +

                                        "</div><div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
                                            "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox\">" +
                                            "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
                                            "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/></div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
                                            "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
                                            "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
                                            "</div><div class=\"col-2 pl-0\"><button type=\"button\" " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "disabled" : "") + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "active" : "") + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed='" + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "true" : "false") + "' autocomplete=\"off\">" +
                                            "<div class=\"handle\">" + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "D" : "P") + "</div></button></div><div class=\"col-3 pl-0\"><a class=\"btnstyle " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "" : "notifybtnshow") + " notifybtn\">" + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified" : "Save & Notify") + "</a></div></div></div></div></div>" +
                                           "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
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

    public static string getCustomerOrdersbydatesRefresh(string Header_ID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Type = 118;
        ds = cr.fnGenerateInvoice();
        string Orders = "";

        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Orders = Orders + "<div class=\"col-md-12\"><div class=\"container\">" +
                                    "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                                    "<div class=\"rtname\">" + DR["C_Name"].ToString() + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div>" +
                                    "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                                    "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["ORDER_NO"].ToString() + " </div>" +
                                    "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                                    "<div class=\"col-4 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  </div>" +
                                    "</div><div class=\"col-4 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                                    "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                                    "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                                    "</div></div><div class=\"items__append\" style=\"display:none;\">" +

                                    "</div></div><div class=\"amountsection pl-2 \">" +
                                    "<div class=\"row\">" +

                                    "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
                                    "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</span></div></div>" +

                                    "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                                    "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                                    "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                    "<div class=\" \"><strong>Delivery Date:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                                    "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

                                    "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + "\"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                                 "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                                 "</div></div>" +

                                    "</div><div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
                                        "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox\">" +
                                        "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
                                        "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/></div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
                                        "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
                                        "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
                                        "</div><div class=\"col-2 pl-0\"><button type=\"button\" " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "disabled" : "") + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "active" : "") + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed='" + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "true" : "false") + "' autocomplete=\"off\">" +
                                        "<div class=\"handle\">" + Convert.ToString(DR["ITEM_SERVED_FLAG"].ToString() == "Y" ? "D" : "P") + "</div></button></div><div class=\"col-3 pl-0\"><a class=\"btnstyle " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "" : "notifybtnshow") + " notifybtn\">" + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified" : "Save & Notify") + "</a></div></div></div></div></div>" +
                                       "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
                                        "</div>";
            }
        }
        return Orders;
    }

    [WebMethod]
    public static string NotifyCustomer(string Header_ID)
    {
        string Title = "Hey! Checkout items available for delivery";
        string Message = "Your retailer has marked items availablity.";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Type = 104;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnUpdateFlagDelivery();

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {

            // cl_SMS.Dyn_sms(cust_number, Msg, HttpContext.Current.Request.Cookies["rid"].Value.ToString());
            insertNotification(HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(), ds.Tables[0].Rows[0]["USER_ID"].ToString()
               , Title, Message, "Customer");
            Send_Notification.SendNotificationFromFirebaseCloud(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                ds.Tables[0].Rows[0]["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/scheduler.aspx", Title, Message, 1);
        }

        return "1";
    }
    [WebMethod]
    public static string getItemsByHeader(string Header_ID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Type = 91;
        ds = cr.fnGenerateInvoice();
        string items = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {

                string checkedItem = "";
                string product_imgage = "";
                if (DR["SERVED"].ToString() == "Y")
                {
                    checkedItem = "checked";
                }

                if (DR["IMAGE_PATH"].ToString() != "")
                {
                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/" + DR["IMAGE_PATH"].ToString() + "\"/>";
                }
                else
                {

                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/Defaultimage.png\"/>";
                }



                string NA = "";

                if (DR["IS_AVAILABLE"].ToString() == "N" && DR["IS_AVAILABLE"].ToString() != "")
                {
                    NA = "<div class=\"itemoverlay\" style=\"background:#c0c0c080;position:absolute;height:100%;width:100%;text-align:end;\"><div style=\"position:absolute;bottom:8px;align-items:unset;width:50%;border:1px solid;text-align:center;border-radius:15px;right:0;background:white;color:#cc2727;\">Currently unavailable</div></div>";
                }

                else
                {
                    NA = "";
                }
                items = items + "<div class=\"card mt-3\"><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\" style=\"height: 90px;width: 100%;\"> " +
                                                "" + product_imgage + "</div></div><div class=\"col-8\"> " +
                                                "<div class=\"itemdetails\"><div class=\"itemprice\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "<label class=\"switch switcher pull-right\"> " +
                                                "<input " + checkedItem + " " + Convert.ToString(DR["NOTIFIED_BY_DELIVERYBOY"].ToString() == "Y" ? "disabled" : "") + " lineid='" + DR["LINE_ID"].ToString() + "' type =\"checkbox\" />" +
                                                "<span class=\"slider round\"></span></label></div><div class=\"itemname\">" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div> " +
                                                 "<div class=\"itemqty\" style=\"display: none;\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div></div>" + NA + "</div>";
            }
        }
        return items;
    }

    [WebMethod]
    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Receiver_User_ID = Receiver_User_ID;
        cr.Sender_User_ID = Sender_User_ID;
        cr.Sent_To = Sent_To;
        cr.Type = 103;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnInsertNotification();

        return "1";
    }
    [WebMethod]
    public static string MarkDelivered(string Header_ID, string Line_ID, string Flag, string Order_No)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Line_ID = Line_ID;
        cr.Flag = Flag;
        cr.Type = 82;

        ds = cr.fnUpdateFlagDelivery();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (Flag == "Y" && Header_ID != "")
            {
                string Title = "Delivery alert for Order# " + Order_No;
                string Message = "Your order# " + Order_No + " for " + ds.Tables[1].Rows[0]["ITEM_COUNT"].ToString() + " item(s) have been delivered";
                insertNotification(HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString(), ds.Tables[0].Rows[0]["USER_ID"].ToString()
               , Title, Message, "Customer");
                Send_Notification.SendNotificationFromFirebaseCloud(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                    ds.Tables[0].Rows[0]["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/scheduler.aspx", Title, Message, 1);
            }

        }
        return "1";
    }

    [WebMethod]

    public static string AmountReceived(string Header_ID, string Amount, string MOP)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.User_ID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        cr.Amount = Amount;
        cr.MOP = MOP;
        cr.Type = 83;
        ds = cr.fnUpdateFlagDelivery();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string Title = "Payment Received - Rs " + Amount;
            string Message = "We, at " + ds.Tables[1].Rows[0]["NAME"].ToString() + " have received your payment of Rs " + Amount + " as " + MOP + " on " + DateTime.Now.ToString("dd-MMM-yyyy hh:mm:tt");
            insertNotification(HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString(), ds.Tables[0].Rows[0]["USER_ID"].ToString()
           , Title, Message, "Customer");
            Send_Notification.SendNotificationFromFirebaseCloud(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                ds.Tables[0].Rows[0]["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/scheduler.aspx", Title, Message, 1);

        }
        return "1";
    }
    [WebMethod]

    public static string todaysCollection()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        cr.Type = 84;
        ds = cr.fnUpdateFlagDelivery();
        string collection = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            collection = ds.Tables[0].Rows[0]["RECEIVED_AMOUNT"].ToString();
        }
        return collection;
    }


    public void GetNotification_count()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        cr.Type = 102;
        ds = cr.fngetTrxID();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["COUNTNOTIF"].ToString() != "0")
            {
                Notif_count.InnerHtml = ds.Tables[0].Rows[0]["COUNTNOTIF"].ToString();
            }
            else
            {
                Notif_count.Visible = false;
            }


        }
    }


    [WebMethod]

    public static string Fn_updateSeenFlag()
    {
        string result = "";
        DataSet ds = new DataSet();
        Cl_Customer cr = new Cl_Customer();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        cr.Type = 16;
        ds = cr.fnGetAddress();
        return result;
    }

}