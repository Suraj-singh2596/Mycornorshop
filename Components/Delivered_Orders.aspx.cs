using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Components_Delivered_Orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["records"] = "2";


        if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]) && !string.IsNullOrEmpty(Request.Params["ulid"]))
        {
            string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
            string RID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());
            HttpCookie Cookie = new HttpCookie("admin_user_id");
            Cookie.Value = User_ID;
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie rid = new HttpCookie("rid");
            rid.Value = RID;
            rid.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(rid);
        }
        getAdminDetails();
    }




    public void getAdminDetails()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.USER_TYPE = "RETAILER";
        ca.Type = 25;
        ds = ca.fn_admin_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie user_type = new HttpCookie("user_type");
            user_type.Value = "retailer";
            user_type.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(user_type);

            StoreName.InnerHtml = "Delivered Orders <p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;visibility: hidden;\">" +
               ds.Tables[0].Rows[0]["CITY"].ToString() + "" + ds.Tables[0].Rows[0]["LOCATION"].ToString() + "</p>";
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
        cr.Type = 107;
        ds = cr.fnGenerateInvoice();
        string Orders = "";
        string subscribeorder = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string Initiate_Order = "d-none";
                string Create_invoice = "d-none";
                string view_invoice = "";
                string A_NA = "NA";
                string btnDisable = "";
                string btnNotify = "notifybtnshow";
                string btnActive = "";
                string btnTrue = "";
                string btnsaveNotify = "Save & Notify";
                string AddSaleBtn = "";

                if (DR["NOTIFIED_CUSTOMER_ITEM_AVAILABLITY"].ToString() == "Y")
                {
                    btnDisable = "disabled";
                    btnNotify = "";
                    btnsaveNotify = "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified";
                    AddSaleBtn = "d-none";
                }
                if (DR["ITEM_AVAILABLE_FLAG"].ToString() == "Y")
                {
                    A_NA = "A";
                    btnActive = "active";
                    btnTrue = "true";
                }
                if (DR["CREATE_INVOICE_FLAG"].ToString() == "Y" && DR["INVOICE_ID"].ToString() == "0")
                {
                    view_invoice = "d-none";
                    Create_invoice = "";
                }
                else
                {
                    AddSaleBtn = "d-none";
                }
                if (Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) > 0)
                {
                    Initiate_Order = "";
                }


                string trackbtn = "";
                if (DR["PictureUrl"].ToString() != "")
                {
                    trackbtn = "<div class=\"col-6\"><a trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn mt-2\">Track Order</a></div>";
                }
                string status = "";
                if (DR["STATUS"].ToString() == "DELIVERED")
                {
                    status = "Dispatched";
                }
                string hidesec = "";
                if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "48" && HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString() == "2420")
                {
                    hidesec = "";
                }
                else
                {
                    hidesec = "d-none";
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

                string MobileNum = "";
                if (DR["C_NUMBER"].ToString().Trim() != DR["PreferredMobile"].ToString().Trim())
                {
                    MobileNum = "<a style='color:#1ba9aa' href='javascript:void(0);'>Preferred Mobile: <i class='fa fa-phone' aria-hidden='true'></i>&nbsp;" + DR["PreferredMobile"].ToString().Trim() + "</a>";
                }
                string custname = DR["C_Name"].ToString() == "" ? DR["cust_name"].ToString() : DR["C_Name"].ToString();

                Orders = Orders + "<div class=\"card container p-1 mt-2 \"><div class=\"row refresh\" orderid='" + DR["ORDER_NO"].ToString() + "' header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
                               "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                               "<div class=\"rtname\">" + custname + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div><div>" + MobileNum + "</div>" +
                               "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                               "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["HEADER_ID"].ToString() + " </div><select name='" + DR["DELIVER_BOY_NAME"].ToString() + "' class=\"assign_to_select \"><option>" + DR["DELIVER_BOY_NAME"].ToString() + "</option></select>" +
                               "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                               "<div class=\"col-5 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  <a href=\"Add_items.aspx?header_id=" + DR["HEADER_ID"].ToString() + "\" class=\"btnstyle addbtnstyle " + AddSaleBtn + "\">+</a></div>" +
                               "</div><div class=\"col-3 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                               "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                               "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                               "</div></div><div  class=\"items__append\" style=\"display:none;\">" +

                               "</div></div><div class=\"amountsection pl-2 \">" +
                               "<div class=\"row\">" +

                               "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
                               "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span data-toggle='tooltip' data-placement='top'  title='" + DR["DispatchedDate"].ToString() + "' >" + textInfo.ToTitleCase(status) + "</span></div></div>" +

                               "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                               "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                               "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                               "<div class=\" \"><strong>Estimated Delivery By:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                               "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

                                 "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + " \"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                            "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                            "</div></div>" +

                               "</div><div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
                                   "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox " + hidesec + "\">" +
                                   "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
                                   "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none; font-size:12px;\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/>" +
                                   "</div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
                                   "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
                                   "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
                                   "</div><div class=\"col-5 pl-0\"><button type=\"button\"  " + btnDisable + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + btnActive + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed=\"" + btnTrue + "\" autocomplete=\"off\">" +
                                   "<div class=\"handle handlebtn\">" + A_NA + "</div></button><a class=\" " + btnNotify + " notifybtn  btn\" custnumber=\"" + DR["C_NUMBER"].ToString() + "\"  style=\"float:right;\">" + btnsaveNotify + "</a></div></div></div></div></div>" +
                                  "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
                                  //
                                  "<div class=\"col-12\">" +

                                   "<div class=\"row\">" +

                                   "<div class=\"col-sm-6 " + Initiate_Order + "\"><div style=\"font-size:13px;\" class=\"btn btnstyle w-100 text-white mt-2 p-0\" header_id='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "'>" +
                                   "<input type=\"number\" class=\"refundvalueinput\" value=\"" + Convert.ToString(Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "\"/>" +
                                   "<a class=\"vieweditbtn ml-2\">Initiate Refund</a></div></div>" +
                                  "<div class=\"col-6 " + Create_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"N\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>Generate Invoice</a></div>" +
                                   "<div class=\"col-6 " + view_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"Y\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>View Invoice</a></div>" + trackbtn +
                                   Chatbtn +
                                   "</div></div> " +
                                   // 
                                   "</div></div></div>";


            }
        }
        return Orders;
    }

    [WebMethod]

    public static string getCustomerOrdersbydatesNextRecords(string startdate, string enddate)
    {
        if (HttpContext.Current.Session["records"].ToString() != "-1")
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.STARTDATE = startdate;
            cr.ENDDATE = enddate;
            cr.RTID = HttpContext.Current.Session["records"].ToString();
            cr.Type = 114;
            ds = cr.fnGenerateInvoice();
            string Orders = "";
            string subscribeorder = "";
            TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    string Initiate_Order = "d-none";
                    string Create_invoice = "d-none";
                    string view_invoice = "";
                    string A_NA = "NA";
                    string btnDisable = "";
                    string btnNotify = "notifybtnshow";
                    string btnActive = "";
                    string btnTrue = "";
                    string btnsaveNotify = "Save & Notify";
                    string AddSaleBtn = "";

                    if (DR["NOTIFIED_CUSTOMER_ITEM_AVAILABLITY"].ToString() == "Y")
                    {
                        btnDisable = "disabled";
                        btnNotify = "";
                        btnsaveNotify = "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified";
                        AddSaleBtn = "d-none";
                    }
                    if (DR["ITEM_AVAILABLE_FLAG"].ToString() == "Y")
                    {
                        A_NA = "A";
                        btnActive = "active";
                        btnTrue = "true";
                    }
                    if (DR["CREATE_INVOICE_FLAG"].ToString() == "Y" && DR["INVOICE_ID"].ToString() == "0")
                    {
                        view_invoice = "d-none";
                        Create_invoice = "";
                    }
                    else
                    {
                        AddSaleBtn = "d-none";
                    }
                    if (Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) > 0)
                    {
                        Initiate_Order = "";
                    }

                    string trackbtn = "";
                    if (DR["TrackId"].ToString() != "")
                    {
                        trackbtn = "<div class=\"col-6\"><a trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn mt-2\">Track Order</a></div>";
                    }

                    string status = "";
                    if (DR["STATUS"].ToString() == "DELIVERED")
                    {
                        status = "Dispatched";
                    }

                    string hidesec = "";
                    if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "48" && HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString() == "2420")
                    {
                        hidesec = "";
                    }
                    else
                    {
                        hidesec = "d-none";
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
                    string MobileNum = "";
                    if (DR["C_NUMBER"].ToString().Trim() != DR["PreferredMobile"].ToString().Trim())
                    {
                        MobileNum = "<a style='color:#1ba9aa' href='javascript:void(0);'>Preferred Mobile: <i class='fa fa-phone' aria-hidden='true'></i>&nbsp;" + DR["PreferredMobile"].ToString().Trim() + "</a>";
                    }

                    string custname = DR["C_Name"].ToString() == "" ? DR["cust_name"].ToString() : DR["C_Name"].ToString();

                    Orders = Orders + "<div class=\"card container p-1 mt-2 \"><div class=\"row refresh\" orderid='" + DR["ORDER_NO"].ToString() + "' header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
                                   "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                                   "<div class=\"rtname\">" + custname + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div><div>" + MobileNum + "</div>" +
                                   "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                                   "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["HEADER_ID"].ToString() + " </div><select name='" + DR["DELIVER_BOY_NAME"].ToString() + "' class=\"assign_to_select \"><option>" + DR["DELIVER_BOY_NAME"].ToString() + "</option></select>" +
                                   "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                                   "<div class=\"col-5 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  <a href=\"Add_items.aspx?header_id=" + DR["HEADER_ID"].ToString() + "\" class=\"btnstyle addbtnstyle " + AddSaleBtn + "\">+</a></div>" +
                                   "</div><div class=\"col-3 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                                   "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                                   "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                                   "</div></div><div  class=\"items__append\" style=\"display:none;\">" +

                                   "</div></div><div class=\"amountsection pl-2 \">" +
                                   "<div class=\"row\">" +

                                   "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
                                   "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span data-toggle='tooltip' data-placement='top'  title='" + DR["DispatchedDate"].ToString() + "' >" + textInfo.ToTitleCase(status) + "</span></div></div>" +

                                   "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                                   "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                                   "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                                   "<div class=\" \"><strong>Estimated Delivery By:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                                   "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

                                     "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + " \"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                                "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                                "</div></div>" +

                                   "</div><div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
                                       "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox " + hidesec + "\">" +
                                       "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
                                       "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none; font-size:12px;\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/>" +
                                       "</div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
                                       "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
                                       "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
                                       "</div><div class=\"col-5 pl-0\"><button type=\"button\"  " + btnDisable + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + btnActive + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed=\"" + btnTrue + "\" autocomplete=\"off\">" +
                                       "<div class=\"handle handlebtn\">" + A_NA + "</div></button><a class=\" " + btnNotify + " notifybtn  btn\" custnumber=\"" + DR["C_NUMBER"].ToString() + "\"  style=\"float:right;\">" + btnsaveNotify + "</a></div></div></div></div></div>" +
                                      "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
                                      //
                                      "<div class=\"col-12\">" +

                                       "<div class=\"row\">" +

                                       "<div class=\"col-sm-6 " + Initiate_Order + "\"><div style=\"font-size:13px;\" class=\"btn btnstyle w-100 text-white mt-2 p-0\" header_id='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "'>" +
                                       "<input type=\"number\" class=\"refundvalueinput\" value=\"" + Convert.ToString(Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "\"/>" +
                                       "<a class=\"vieweditbtn ml-2\">Initiate Refund</a></div></div>" +
                                      "<div class=\"col-6 " + Create_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"N\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>Generate Invoice</a></div>" +
                                       "<div class=\"col-6 " + view_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"Y\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>View Invoice</a></div>" + trackbtn +
                                       Chatbtn +
                                       "</div></div> " +
                                       // 
                                       "</div></div></div>";



                }
                HttpContext.Current.Session["records"] = Convert.ToString(Convert.ToInt32(HttpContext.Current.Session["records"]) + 1);
            }
            else
            {
                HttpContext.Current.Session["records"] = "-1";
            }
            return Orders;
        }
        else
        {
            return "";
        }

    }

    [WebMethod]

    public static string getCustomerOrdersbydatesRefresh(string Header_ID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Type = 111;
        ds = cr.fnGenerateInvoice();
        string Orders = "";
        string subscribeorder = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string Initiate_Order = "d-none";
                string Create_invoice = "d-none";
                string view_invoice = "";
                string A_NA = "NA";
                string btnDisable = "";
                string btnNotify = "notifybtnshow";
                string btnActive = "";
                string btnTrue = "";
                string btnsaveNotify = "Save & Notify";
                string AddSaleBtn = "";

                if (DR["NOTIFIED_CUSTOMER_ITEM_AVAILABLITY"].ToString() == "Y")
                {
                    btnDisable = "disabled";
                    btnNotify = "";
                    btnsaveNotify = "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified";
                    AddSaleBtn = "d-none";
                }
                if (DR["ITEM_AVAILABLE_FLAG"].ToString() == "Y")
                {
                    A_NA = "A";
                    btnActive = "active";
                    btnTrue = "true";
                }
                if (DR["CREATE_INVOICE_FLAG"].ToString() == "Y" && DR["INVOICE_ID"].ToString() == "0")
                {
                    view_invoice = "d-none";
                    Create_invoice = "";
                }
                else
                {
                    AddSaleBtn = "d-none";
                }
                if (Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) > 0)
                {
                    Initiate_Order = "";
                }

                string trackbtn = "";
                if (DR["TrackId"].ToString() != "")
                {
                    trackbtn = "<div class=\"col-6\"><a trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn mt-2\">Track Order</a></div>";
                }

                string status = "";
                if (DR["STATUS"].ToString() == "DELIVERED")
                {
                    status = "Dispatched";
                }
                string hidesec = "";
                if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "48" && HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString() == "2420")
                {
                    hidesec = "";
                }
                else
                {
                    hidesec = "d-none";
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
                string custname = DR["C_Name"].ToString() == "" ? DR["cust_name"].ToString() : DR["C_Name"].ToString();

                string MobileNum = "";
                if (DR["C_NUMBER"].ToString().Trim() != DR["PreferredMobile"].ToString().Trim())
                {
                    MobileNum = "<a style='color:#1ba9aa' href='javascript:void(0);'>Preferred Mobile: <i class='fa fa-phone' aria-hidden='true'></i>&nbsp;" + DR["PreferredMobile"].ToString().Trim() + "</a>";
                }
                Orders = Orders + "<div class=\"col-md-12\"><div class=\"container\">" +
                               "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
                               "<div class=\"rtname\">" + custname + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div><div>" + MobileNum + "</div>" +
                               "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
                               "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["HEADER_ID"].ToString() + " </div><select name='" + DR["DELIVER_BOY_NAME"].ToString() + "' class=\"assign_to_select \"><option>" + DR["DELIVER_BOY_NAME"].ToString() + "</option></select>" +
                               "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
                               "<div class=\"col-5 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  <a href=\"Add_items.aspx?header_id=" + DR["HEADER_ID"].ToString() + "\" class=\"btnstyle addbtnstyle " + AddSaleBtn + "\">+</a></div>" +
                               "</div><div class=\"col-3 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
                               "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
                               "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
                               "</div></div><div  class=\"items__append\" style=\"display:none;\">" +

                               "</div></div><div class=\"amountsection pl-2 \">" +
                               "<div class=\"row\">" +

                               "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
                               "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span data-toggle='tooltip' data-placement='top'  title='" + DR["DispatchedDate"].ToString() + "'>" + textInfo.ToTitleCase(status) + "</span></div></div>" +

                               "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                               "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                               "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                               "<div class=\" \"><strong>Estimated Delivery By:</strong></div></div><div class=\"col-7 col-md-7 \">" +
                               "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

                                 "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + " \"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
                            "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
                            "</div></div>" +

                               "</div><div style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
                                   "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox " + hidesec + "\">" +
                                   "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
                                   "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none; font-size:12px;\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/>" +
                                   "</div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
                                   "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
                                   "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
                                   "</div><div class=\"col-5 pl-0\"><button type=\"button\"  " + btnDisable + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + btnActive + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed=\"" + btnTrue + "\" autocomplete=\"off\">" +
                                   "<div class=\"handle handlebtn\">" + A_NA + "</div></button><a class=\" " + btnNotify + " notifybtn  btn\" custnumber=\"" + DR["C_NUMBER"].ToString() + "\"  style=\"float:right;\">" + btnsaveNotify + "</a></div></div></div></div></div>" +
                                  "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
                                  //
                                  "<div class=\"col-12\">" +

                                   "<div class=\"row\">" +

                                   "<div class=\"col-sm-6 " + Initiate_Order + "\"><div style=\"font-size:13px;\" class=\"btn btnstyle w-100 text-white mt-2 p-0\" header_id='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "'>" +
                                   "<input type=\"number\" class=\"refundvalueinput\" value=\"" + Convert.ToString(Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "\"/>" +
                                   "<a class=\"vieweditbtn ml-2\">Initiate Refund</a></div></div>" +
                                  "<div class=\"col-6 " + Create_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"N\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>Generate Invoice</a></div>" +
                                   "<div class=\"col-6 " + view_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"Y\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>View Invoice</a></div>" + trackbtn +
                                    Chatbtn +
                                   "</div></div> " +
                                   // 
                                   "</div>";


            }
        }
        return Orders;
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
                if (DR["IS_AVAILABLE"].ToString() == "Y")
                {
                    checkedItem = "checked";
                }
                string NA = "";


                if (DR["SERVED"].ToString() == "N" && DR["SERVED"].ToString() != "")
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
                                                "<div class=\"itemdetails\"><div class=\"itemprice\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "<label class=\"switch switcher pull-right\"> " +
                                                "<input " + checkedItem + " " + Convert.ToString(DR["NOTIFIED_CUSTOMER_ITEM_AVAILABLITY"].ToString() == "Y" ? "disabled" : "") + " lineid='" + DR["LINE_ID"].ToString() + "' type =\"checkbox\" />" +
                                                "<span class=\"slider round\"></span></label></div><div class=\"itemname\">" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div> " +
                                                 "<div class=\"itemqty\" style=\"display: none;\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div></div>" + NA + "</div>";
            }
        }
        return items;
    }


    [WebMethod]
    public static string getItemsBySchedule(string CID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = CID;
        cr.Type = 109;
        ds = cr.fngetTrxID();
        string items = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {

                string product_imgage = "";

                if (DR["IMAGE_URL"].ToString() != "")
                {
                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/" + DR["IMAGE_URL"].ToString() + "\"/>";
                }
                else
                {

                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/Defaultimage.png\"/>";
                }
                items = items + "<div class=\"card mt-3\"><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\" style=\"height: 90px;width: 100%;\"> " +
                                                "" + product_imgage + "</div></div><div class=\"col-8\"> " +
                                                "<div class=\"itemdetails\"><div class=\"itemprice\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "" +

                                                "</div><div class=\"itemname\">" + DR["NAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "</div> " +
                                                 "<div class=\"itemqty\" style=\"display: none;\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div></div></div>";
            }
        }
        return items;
    }


    [WebMethod]

    public static string MarkDelivered(string Header_ID, string Line_ID, string Flag, string Order_No)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Line_ID = Line_ID;
        cr.Flag = Flag;
        cr.Type = 88;
        ds = cr.fnUpdateFlagDelivery();
        return "1";
    }

    [WebMethod]

    public static string AmountReceived(string Header_ID, string Amount, string MOP)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
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
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Type = 84;
        ds = cr.fnUpdateFlagDelivery();
        string collection = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            collection = ds.Tables[0].Rows[0]["RECEIVED_AMOUNT"].ToString();
        }
        return collection;
    }

    [WebMethod]

    public static string getDeliveryBoysList(string Name)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Type = 86;
        ds = cr.fnUpdateFlagDelivery();
        string options = "";
        string select = "";
        string selected = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                select = select + "<option user_id='" + DR["USER_ID"].ToString() + "'>" + DR["PERSON_NAME"].ToString() + "</option>";

            }

        }
        select = "<option disabled>None</option>" + select;

        return select;
    }

    [WebMethod]
    public static string AssignDeliveryBoy(string Header_ID, string Delivery_Boy_ID)
    {
        string Title = "Hey! you have got a new order to deliver";
        string Message = "Click to view items for delivery.";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Delivery_Boy_ID = Delivery_Boy_ID;
        cr.Header_ID = Header_ID;
        cr.Type = 87;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnUpdateFlagDelivery();

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            insertNotification(HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(), Delivery_Boy_ID
                , Title, Message, "DeliveryBoy");
            Send_Notification.SendNotificationFromFirebaseCloudDelivery(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                ds.Tables[0].Rows[0]["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Delivery.aspx", Title, Message, 1);
        }

        return "1";
    }

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
    public static string NotifyCustomer(string Header_ID, string Msg, string cust_number, string availableitems, string Order_No)
    {
        string Title = "";
        string Message = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Type = 90;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnUpdateFlagDelivery();

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (availableitems == "0")
            {
                Title = "[Order# " + Order_No + " Updates]: All items are available";
                Message = ds.Tables[1].Rows[0]["NAME"].ToString() + " has confirmed the availability of all items for Order# " + Order_No;
            }
            else
            {
                Title = "[Order# " + Order_No + " Updates]: few items are unavailable";
                Message = "Few items are currently unavailable for your Order# " + Order_No + " at " + ds.Tables[1].Rows[0]["NAME"].ToString();
            }
            // cl_SMS.Dyn_sms(cust_number, Msg, HttpContext.Current.Request.Cookies["rid"].Value.ToString());
            insertNotification(HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(), ds.Tables[0].Rows[0]["USER_ID"].ToString()
               , Title, Message, "Customer");
            Send_Notification.SendNotificationFromFirebaseCloud(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                ds.Tables[0].Rows[0]["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/scheduler.aspx", Title, Message, 1);
        }

        return "1";
    }
    [WebMethod]
    public static string Invoice(string Header_ID, string Invoice, string Flag)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 39;
        ca.Header_ID = Header_ID;
        ca.Invoice_No = Invoice;
        ca.Flag = Flag;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        DataSet ds = ca.Invoice();
        string Invoice_No = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Invoice_No = ds.Tables[0].Rows[0]["INVOICE_ID"].ToString();
        }
        return Invoice_No;
    }

    [WebMethod]
    public static string InitiateRefund(string Header_ID, string Amount, string Order_No)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Amount = Amount;
        cr.Type = 105;
        ds = cr.fnUpdateFlagDelivery();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string Title = "Rs " + Amount + " refunded to your wallet, in referrence to your order #" + Order_No;
            string Message = ds.Tables[1].Rows[0]["NAME"].ToString() + " has refunded Rs " + Amount + " to your wallet, in referrence to your order #" + Order_No;
            insertNotification(HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(), ds.Tables[0].Rows[0]["USER_ID"].ToString()
                , Title, Message, "Customer");
            Send_Notification.SendNotificationFromFirebaseCloud(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                ds.Tables[0].Rows[0]["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Delivery.aspx", Title, Message, 1);
        }
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
        {
            Total = ds.Tables[2].Rows[0]["AMOUNT"].ToString();
        }
        return Total;
    }
}