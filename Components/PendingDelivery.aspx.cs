using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PendingDelivery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getAdminDetails();
    }


    public void getAdminDetails()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.Type = 25;
        ds = ca.fn_admin_Data();
        if (ds != null && ds.Tables.Count > 0)
        {
            StoreName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
              ds.Tables[0].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[0].Rows[0]["CITY"].ToString() +
              "</p>";
        }

    }

    [WebMethod]
    public static string getSuggestionMobileNo(string Mobile)
    {
        string Result = "";
        string RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        string ProcedureName = "PROC_CRT_RESTURANT";
        string Parameters = @"@Mobile='" + HttpUtility.HtmlEncode(Mobile) + "',@RID='"
            + RID + "',@Type='129'";
        string m_sqlString = "EXEC " + ProcedureName + " " + Parameters;
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(m_sqlString);
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Result = cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return Result;
    }

    [WebMethod]
    public static string getDataByMobileNo(string Mobile, string Flag)
    {
        string Orders = "";
        string RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        string ProcedureName = "PROC_CRT_RESTURANT";
        string Parameters = @"@Mobile='" + HttpUtility.HtmlEncode(Mobile) + "',@RID='"
            + RID + "',@Flag='" + Flag + "',@Type='128'";
        string m_sqlString = "EXEC " + ProcedureName + " " + Parameters;
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(m_sqlString);
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string dispatchbtn = "";
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
                string status = DR["STATUS"].ToString();
                if (DR["STATUS"].ToString() == "DELIVERED")
                {
                    status = "Dispatched";
                    trackbtn = "<div class=\"col-6\"><a trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn mt-2\">Track Order</a></div>";
                }
                else
                {
                    dispatchbtn = "<div class=\"col-6\"><a style=\"font-size:13px;background: linear-gradient(107deg,rgb(163 163 163)0%,rgb(131 131 131)100%)!important;\" class=\"btn btnstyle delievrymark w-100 text-white mt-2 p-0\" flag=\"Y\" headerid='" +
                                            DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "'>Dispatch Order</a></div>";
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
                               "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span data-toggle='tooltip' data-placement='top' title='" + DR["DispatchedDate"].ToString() + "'>" + textInfo.ToTitleCase(status) + "</span></div></div>" +

                               "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
                               "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

                               "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
                               "<div class=\" \"><strong>Delivery Date:</strong></div></div><div class=\"col-7 col-md-7 \">" +
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
                                   Chatbtn + dispatchbtn +
                                   "</div></div> " +
                                   // 
                                   "</div></div></div>";


            }
        }
        //if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        //{
        //    foreach (DataRow DR in ds.Tables[0].Rows)
        //    {
        //        string Initiate_Order = "d-none";
        //        string Create_invoice = "d-none";
        //        string view_invoice = "";
        //        string A_NA = "NA";
        //        string btnDisable = "";
        //        string btnNotify = "notifybtnshow";
        //        string btnActive = "";
        //        string btnTrue = "";
        //        string btnsaveNotify = "Save & Notify";
        //        string AddSaleBtn = "";

        //        if (DR["NOTIFIED_CUSTOMER_ITEM_AVAILABLITY"].ToString() == "Y")
        //        {
        //            btnDisable = "disabled";
        //            btnNotify = "";
        //            btnsaveNotify = "<i class=\"fa fa-check\" aria-hidden=\"true\"></i>Notified";
        //            AddSaleBtn = "d-none";
        //        }
        //        if (DR["ITEM_AVAILABLE_FLAG"].ToString() == "Y")
        //        {
        //            A_NA = "A";
        //            btnActive = "active";
        //            btnTrue = "true";
        //        }
        //        if (DR["CREATE_INVOICE_FLAG"].ToString() == "Y" && DR["INVOICE_ID"].ToString() == "0")
        //        {
        //            view_invoice = "d-none";
        //            Create_invoice = "";
        //        }
        //        else
        //        {
        //            AddSaleBtn = "d-none";
        //        }
        //        if (Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) > 0)
        //        {
        //            Initiate_Order = "";
        //        }

        //        string hidesec = "";
        //        if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "48"
        //            || HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "51"
        //            && HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString() == "2420")
        //        {
        //            hidesec = "";
        //        }
        //        else
        //        {
        //            hidesec = "d-none";
        //        }

        //        string trackbtn = "";
        //        if (DR["PictureUrl"].ToString() != "")
        //        {
        //            trackbtn = "<div class=\"col-6\"><a trackid=\"" + DR["TrackId"].ToString() + "\" comnt=\"" + DR["DispatchComments"].ToString() + "\" imgurl=\"" + DR["PictureUrl"].ToString() + "\" class=\"trackorderbtn mt-2\">Track Order</a></div>";
        //        }
        //        string status = "";
        //        if (DR["STATUS"].ToString() == "DELIVERED")
        //        {
        //            status = "Dispatched";
        //        }

        //        string chatstatus = "<i style=\"color:#bbb;\" class=\"fa fa-comment\" aria-hidden=\"true\"></i>";
        //        if (DR["Chatstatus"].ToString().ToLower() != "closed")
        //        {
        //            chatstatus = "<i style=\"color:#04ff04;\" class=\"fa fa-comment\" aria-hidden=\"true\"></i>";
        //        }

        //        string Chatbtn = "";
        //        if (DR["isChatModuleEnable"].ToString() == "Y")
        //        {
        //            Chatbtn = "<div class=\"col-6\"><button onclick=\"location.href='../../Chat.aspx?headerid=" + cl_encrypt.Encrypt(DR["HEADER_ID"].ToString()) + "'\" type=\"button\" header_id='" + DR["HEADER_ID"].ToString() + "' class=\"chatnowbtn w-100\">" + chatstatus + "&nbsp;Chat </button></div>";
        //        }

        //        if (DR["CONFIRMED_ORDER"].ToString() == "Y")
        //        {
        //            string custname = DR["C_Name"].ToString() == "" ? DR["cust_name"].ToString() : DR["C_Name"].ToString();

        //            Orders = Orders + "<div class=\"card container p-1 mt-2 \"><div class=\"row refresh\" orderid='" + DR["ORDER_NO"].ToString() + "' header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
        //                           "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
        //                           "<div class=\"rtname\">" + custname + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div>" +
        //                           "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
        //                           "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number\">Order No: # " + DR["ORDER_NO"].ToString() + " </div><select name='" + DR["DELIVER_BOY_NAME"].ToString() + "' class=\"assign_to_select \"><option>" + DR["DELIVER_BOY_NAME"].ToString() + "</option></select>" +
        //                           "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
        //                           "<div class=\"col-5 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  <a href=\"Add_items.aspx?header_id=" + DR["HEADER_ID"].ToString() + "\" class=\"btnstyle addbtnstyle " + AddSaleBtn + "\">+</a></div>" +
        //                           "</div><div class=\"col-3 col-md-4 p-0\"><div class=\"itemprice text-right\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
        //                           "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show__itemsmore text-right\" header_id='" + DR["HEADER_ID"].ToString() + "'>Show Items <strong>" +
        //                           "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
        //                           "</div></div><div  class=\"items__append\" style=\"display:none;\">" +

        //                           "</div></div><div class=\"amountsection pl-2 \">" +
        //                           "<div class=\"row\">" +

        //                           "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Order Status:</strong></div></div>" +
        //                           "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</span></div></div>" +

        //                           "<div class=\"col-5 col-md-5 text-center\"><div class=\"  text-left\"><strong>Delivery Charges:</strong></div></div>" +
        //                           "<div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["DELIVERY_CHARGES"].ToString() + "</span></div></div>" +

        //                           "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
        //                           "<div class=\" \"><strong>Delivery Date:</strong></div></div><div class=\"col-7 col-md-7 \">" +
        //                           "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

        //                             "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + " \"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
        //                        "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span>" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
        //                        "</div></div>" +

        //                           "</div><div  style=\"border-top: 1px solid lightgray; margin-top: 5px; padding-top: 10px; color: #2ab5b7; padding: 5px;\"><div class=\"amountsection\">" +
        //                               "<div class=\"row\"><div class=\"col-7 col-md-7 text-center  pr-0\"><div class=\"totalamountbox " + hidesec + "\">" +
        //                               "<label><select><option>Cash</option><option>Paytm</option><option>Online</option><option>Card</option>" +
        //                               "<option>Other</option></select><div class=\"\"><input type=\"number\" style=\"width:50px;border:none; font-size:12px;\" value='" + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "' placeholder=\"Amount\"/>" +
        //                               "</div><span header_id='" + DR["HEADER_ID"].ToString() + "' class=\"recivedamt btnstyle \">Receive</span></label></div><div class=\"recievingamount\" style=\"display:none;\">" +
        //                               "<input placeholder=\"Paymen tstatus\" disabled value='" + DR["STATUS"].ToString() + "'/><input placeholder=\"Total amount\" disabled value='₹ " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "'/>" +
        //                               "<input type=\"number\" class=\"Recievedamount\" placeholder=\"Recived amount\"/></div>" +
        //                               "</div><div class=\"col-5 pl-0\"><button type=\"button\"  " + btnDisable + " class=\"btn btn-sm btn-toggle alldelecerdbtn " + btnActive + "\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "' data-toggle=\"button\" aria-pressed=\"" + btnTrue + "\" autocomplete=\"off\">" +
        //                               "<div class=\"handle handlebtn\">" + A_NA + "</div></button><a class=\" " + btnNotify + " notifybtn  btn\" custnumber=\"" + DR["C_NUMBER"].ToString() + "\"  style=\"float:right;\">" + btnsaveNotify + "</a></div></div></div></div></div>" +
        //                              "<div class=\"col-12\"><span>Paid amount <strong>Rs. " + DR["RECEIVED_AMOUNT"].ToString() + "</strong></span>&nbsp;&nbsp; & <span>Pending amount <strong>Rs. " + Convert.ToString(Convert.ToDecimal(DR["AMOUNT"].ToString()) + Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString()) - Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString())) + "</strong></span></div>" +
        //                              //
        //                              "<div class=\"col-12\">" +

        //                               "<div class=\"row\">" +

        //                               "<div class=\"col-sm-6 " + Initiate_Order + "\"><div style=\"font-size:13px;\" class=\"btn btnstyle w-100 text-white mt-2 p-0\" header_id='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "'>" +
        //                               "<input type=\"number\" class=\"refundvalueinput\" value=\"" + Convert.ToString(Convert.ToDecimal(DR["RECEIVED_AMOUNT"].ToString()) - Convert.ToDecimal(DR["AMOUNT"].ToString()) - Convert.ToDecimal(DR["DELIVERY_CHARGES"].ToString())) + "\"/>" +
        //                               "<a class=\"vieweditbtn ml-2\">Initiate Refund</a></div></div>" +
        //                              "<div class=\"col-6 " + Create_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"N\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>Generate Invoice</a></div>" +
        //                               "<div class=\"col-6 " + view_invoice + "\"><a style=\"font-size:13px;\" class=\"btn btnstyle invoice w-100 text-white mt-2 p-0\" flag=\"Y\" header_id='" + DR["HEADER_ID"].ToString() + "' invoice='" + DR["INVOICE_ID"].ToString() + "'>View Invoice</a></div>" +
        //                               //  "<div class=\"col-6\"><a  style=\"font-size:13px;background:linear-gradient(107deg,rgb(163 163 163)0%,rgb(131 131 131)100%)!important;\" class=\"btn btnstyle delievrymark w-100 text-white mt-2 p-0\" flag=\"Y\" headerid='" + DR["HEADER_ID"].ToString() + "' order_no='" + DR["ORDER_NO"].ToString() + "'>Dispatch Order</a></div>" +
        //                               trackbtn + Chatbtn +
        //                               "</div></div> " +
        //                               // 
        //                               "</div></div></div>";
        //        }
        //        else if (DR["CONFIRMED_ORDER"].ToString() == "N")
        //        {
        //            string custname = DR["C_Name"].ToString() == "" ? DR["cust_name"].ToString() : DR["C_Name"].ToString();

        //            Orders = Orders + "<div class=\"card container p-1 mt-2 \" style=\"border: 2px solid grey;\" ><div class=\"row\" orderid='" + DR["ORDER_NO"].ToString() + "' header_id='" + DR["HEADER_ID"].ToString() + "'><div class=\"col-md-12\"><div class=\"container\">" +
        //                           "<div class=\"row\" style=\"border-radius: 5px;color: white;\"><div class=\"col-8 col-md-8  p-0\"><div class=\"retailrdetails\">" +
        //                           "<div class=\"rtname\">" + custname + " - <a style=\"color:white\" href=\"tel:" + DR["C_NUMBER"].ToString() + "\"> " + DR["C_NUMBER"].ToString() + "</a> </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + DR["CUSTOMER_ADDRESS"].ToString() + "</div>" +
        //                           "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
        //                           "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyy")) + " </div><div class=\"order__number d-none\">Order No: # " + DR["ORDER_NO"].ToString() + " </div><select class=\"assign_to_select d-none \"><option>" + DR["DELIVER_BOY_NAME"].ToString() + "</option></select>" +
        //                           "</div></div></div></div><hr class=\"mt-1\"/><div class=\"itembox m-2 pt-2 pb-2 \"><div class=\"row \">" +
        //                           "<div class=\"col-5 col-md-4 \"><div class=\"itmdetails\">Total items &nbsp; <strong>" + DR["QTY"].ToString() + "</strong>  </div>" +
        //                           "</div><div class=\"col-3 col-md-4 p-0\"><div class=\"itemprice text-right d-none\">Rs. <strong>" + DR["AMOUNT"].ToString() + "</strong></div>" +
        //                           "</div><div class=\"col-4 col-md-4 \"><div class=\"itemqty show_subscribed_items text-right\" style=\"color: #17aaac;\" cid='" + DR["CID"].ToString() + "'>Show Items <strong>" +
        //                           "<i style=\"font-weight: bold;\" class=\"fa fa-angle-down\"></i></strong></div>" +
        //                           "</div></div><div  class=\"items__append\" style=\"display:none;\">" +

        //                           "</div></div><div class=\"amountsection pl-2 \">" +
        //                           "<div class=\"row\">" +

        //                          "</div></div><div class=\"amountsection pl-2 text-left\"><div class=\"row\"><div class=\"col-5 col-md-5 \">" +
        //                           "<div class=\" \"><strong>Delivery Date:</strong></div></div><div class=\"col-7 col-md-7 \">" +
        //                           "<div class=\"paymentbox\"><span style=\"font-size:10px;\">" + Convert.ToString(Convert.ToDateTime(DR["DELIVERY_DATE_BY_CUSTOMER"]).ToString("dd-MMM-yyy")) + " " + DR["DELIVERY_TIME"].ToString() + "</span></div></div></div>" +

        //                             "<div class=\"row " + Convert.ToString(DR["INSTRUCTIONS"].ToString() != "" ? "" : "d-none") + " \"><div class=\"col-5 col-md-5 text-center\"><div class=\"totalamountbox text-left\"><strong>Instructions:</strong>" +
        //                        "</div></div><div class=\"col-7 col-md-7 \"><div class=\"paymentbox\"><span style=\"font-size:10px;\">" + DR["INSTRUCTIONS"].ToString() + "</span></div>" +
        //                        "</div></div>" +
        //                          "</div></div></div></div>";

        //        }

        //    }
        //}
        return Orders;
    }
}