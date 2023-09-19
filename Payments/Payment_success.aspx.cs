using paytm;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payments_Payment_success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        getCustomerDetails();
        if (Request.Form["productinfo"] == null && Request.Form.Keys.Count != 0)
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            string paytmChecksum = "";

            foreach (string key in Request.Form.Keys)
            {
                parameters.Add(key.Trim(), Request.Form[key].Trim());
            }
            if (parameters.ContainsKey("CHECKSUMHASH"))
            {
                paytmChecksum = parameters["CHECKSUMHASH"];
                parameters.Remove("CHECKSUMHASH");
            }

            if (parameters.ContainsKey("ORDERID"))
            {
                cl_resturant cr = new cl_resturant();
                DataSet ds = new DataSet();
                cr.Order_ID = parameters["ORDERID"];
                cr.Type = 100;
                ds = cr.UpdateOnlineStatus();
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    if (CheckSum.verifyCheckSum(ds.Tables[0].Rows[0]["PAYTM_MKEY"].ToString(), parameters, paytmChecksum))
                    {
                        string paytmStatus = parameters["STATUS"];
                        string txnId = parameters["TXNID"];
                        // lable2.Text = "Transaction ID : " + txnId;
                        string stat = "";
                        string Flag = "";
                        string Comment = "";
                        //  lable1.Text = "Rs." + parameters["txnAmount"];
                        if (paytmStatus == "TXN_SUCCESS")
                        {
                            Status.InnerHtml = "<i class=\"fa fa-check-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + parameters["TXNAMOUNT"] + " is success !";
                            stat = "success";
                            Flag = "Y";
                            Comment = "Payment of Rs. " + parameters["TXNAMOUNT"] + " is success !" + " on " + DateTime.UtcNow.Date;
                        }
                        else if (paytmStatus == "PENDING")
                        {
                            Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + parameters["TXNAMOUNT"] + " is pending !";
                            stat = "pending";
                            Flag = "X";
                            Comment = "Payment of Rs. " + parameters["TXNAMOUNT"] + " is pending !" + " on " + DateTime.UtcNow.Date;
                        }
                        else if (paytmStatus == "TXN_FAILURE")
                        {
                            Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + parameters["TXNAMOUNT"] + " failure !";
                            stat = "failure";
                            Flag = "N";
                            Comment = "Payment of Rs. " + parameters["TXNAMOUNT"] + " is failure !" + " on " + DateTime.UtcNow.Date;
                        }
                        updateAmountStatus(parameters["TXNAMOUNT"], ds.Tables[0].Rows[0]["TRX_ID"].ToString(), "", "", Comment, stat, Flag);
                    }
                    else
                    {
                        Response.Write("Checksum MisMatch");
                    }
                }
            }

        }
        else if (Request.Form["productinfo"] != null && Request.Form.Keys.Count != 0)
        {
            string Product = Request.Form["productinfo"];
            if (Product == "Customer Recharge")
            {
                string paytmStatus = Request.Form["status"];
                string stat = "";
                string Flag = "";
                string Comment = "";
                if (paytmStatus.ToUpper() == "SUCCESS")
                {
                    Status.InnerHtml = "<i class=\"fa fa-check-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " is success !";
                    stat = "success";
                    Flag = "Y";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is success !" + " on " + DateTime.UtcNow.Date;
                }
                else if (paytmStatus == "PENDING")
                {
                    Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " is pending !";
                    stat = "pending";
                    Flag = "X";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is pending !" + " on " + DateTime.UtcNow.Date;
                }
                else if (paytmStatus.ToUpper() == "FAILURE")
                {
                    Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " Failure !";
                    stat = "failure";
                    Flag = "N";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is failure !" + " on " + DateTime.UtcNow.Date;
                }
                updateAmountStatus(Request.Form["amount"], Request.Form["txnid"], Request.Form["firstname"], Request.Form["phone"], Comment, stat, Flag);
            }
            if (Product == "Customer Payment")
            {
                string paytmStatus = Request.Form["status"];
                string stat = "";
                string Flag = "";
                string Comment = "";
                if (paytmStatus.ToUpper() == "SUCCESS")
                {
                    Status.InnerHtml = "<i class=\"fa fa-check-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " is success !";
                    stat = "success";
                    Flag = "Y";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is success !" + " on " + DateTime.UtcNow.Date;
                }
                else if (paytmStatus == "PENDING")
                {
                    Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " is pending !";
                    stat = "pending";
                    Flag = "X";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is pending !" + " on " + DateTime.UtcNow.Date;
                }
                else if (paytmStatus.ToUpper() == "FAILURE")
                {
                    Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " Failure !";
                    stat = "failure";
                    Flag = "N";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is failure !" + " on " + DateTime.UtcNow.Date;
                }
                updateAmountStatus(Request.Form["amount"], Request.Form["txnid"], Request.Form["firstname"], Request.Form["phone"], Comment, stat, Flag);
            }
            if (Product == "Customer Draft Payment")
            {
                string paytmStatus = Request.Form["status"];
                string stat = "";
                string Flag = "";
                string Comment = "";
                if (paytmStatus.ToUpper() == "SUCCESS")
                {
                    Status.InnerHtml = "<i class=\"fa fa-check-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " is success !";
                    stat = "success";
                    Flag = "Y";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is success !" + " on " + DateTime.UtcNow.Date;
                }
                else if (paytmStatus == "PENDING")
                {
                    Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " is pending !";
                    stat = "pending";
                    Flag = "X";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is pending !" + " on " + DateTime.UtcNow.Date;
                }
                else if (paytmStatus.ToUpper() == "FAILURE")
                {
                    Status.InnerHtml = "<i class=\"fa fa-times-circle-o\" aria-hidden=\"true\"></i> Payment of Rs. " + Request.Form["amount"] + " Failure !";
                    stat = "failure";
                    Flag = "N";
                    Comment = "Payment of Rs. " + Request.Form["amount"] + " is failure !" + " on " + DateTime.UtcNow.Date;
                }
                updateAmountStatus(Request.Form["amount"], Request.Form["txnid"], Request.Form["firstname"], Request.Form["phone"], Comment, stat, Flag);
            }
        }
        else
        {
            Response.Redirect("~/Home.aspx");
        }
    }



    public void updateAmountStatus(string Amount, string Trx_ID, string Name, string Mobile, string Comment, string Status, string Flag)
    {
        cl_resturant cr = new cl_resturant();
        DataSet ds = new DataSet();
        cr.Amount = Amount;
        cr.Trx_ID = Trx_ID;
        cr.Name = Name;
        cr.Mobile_No = Mobile;
        cr.Type = 65;
        cr.PayU_Trx_ID = Trx_ID;
        cr.Comment = Comment;
        cr.Status = Status;
        cr.Flag = Flag;
        ds = cr.UpdateOnlineStatus();
        string Payumoney_id = Request.Form["payuId"];
        try
        {
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                if (Status.ToLower() == "failure")
                {
                    TryAgain.Attributes.Add("trxid", Trx_ID);
                    GoToHome.Style.Add("display", "none");
                    MyOrders.Style.Add("display", "none");
                    TryAgain.Style.Add("display", "block");
                }
                else if (Status.ToLower() == "pending")
                {
                    TryAgain.Attributes.Add("trxid", Trx_ID);
                    GoToHome.Style.Add("display", "none");
                    MyOrders.Style.Add("display", "none");
                    TryAgain.Style.Add("display", "block");
                }
                else if (Status.ToLower() == "success")
                {
                    GoToHome.Attributes.Add("headerid", ds.Tables[1].Rows[0]["HEADER_ID"].ToString());
                    GoToHome.Style.Add("display", "block");
                    MyOrders.Style.Add("display", "block");
                    TryAgain.Style.Add("display", "none");
                }

                if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
                {
                    if (ds.Tables[1].Rows[0]["RID"].ToString() == "48"
                     || ds.Tables[1].Rows[0]["RID"].ToString() == "51")
                    {
                        string usersms = "Dear " + ds.Tables[1].Rows[0]["C_NAME"].ToString() + ",\n Your order" + ds.Tables[1].Rows[0]["HEADER_ID"].ToString() + " has been placed on " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt") + ") at ecoDENT.\nIt will dispatched in 2-3 working days\nPlease download ecodent Android app from play store to track Status of your order.\n\nThis is system generated message Please do not reply.";
                        cl_SMS.WhatsApp_Dyn_sms(Mobile, usersms, ds.Tables[1].Rows[0]["RID"].ToString());

                        if (ds.Tables[4].Rows[0]["ItemCount"].ToString() != "0")
                        {
                            string CustomerSms = "Thank you for your order. Your order for " +
                                ds.Tables[4].Rows[0]["ItemCount"].ToString() +
                                " item(s) have been placed successfully. You can download the ecoDENT app from Play store to track your order- Powered by doctorplus";

                            WebClient client = new WebClient();
                            string baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=DRPLUS&channel=2&DCS=0&flashsms=0&number=" + Mobile
                                + "&text=" + CustomerSms.Replace("&", "and") + "&route=31&dlttemplateid=1307165181930333488";
                            Stream data = client.OpenRead(baseurl);
                            StreamReader reader = new StreamReader(data);
                            data.Close();
                            reader.Close();

                            if (Status == "success")
                            {
                                if (ds.Tables[5].Rows.Count > 0)
                                {
                                    if (ds.Tables[5].Rows[0]["CustMail"].ToString() != "")
                                    {
                                        EmailTemplete(ds.Tables[1].Rows[0]["RID"].ToString()
                                            , ds.Tables[1].Rows[0]["HEADER_ID"].ToString()
                                            , ds.Tables[5].Rows[0]["CustMail"].ToString());
                                        //using (MailMessage mm = new MailMessage(ds.Tables[5].Rows[0]["CustMail"].ToString(), ds.Tables[5].Rows[0]["CustMail"].ToString()))
                                        //{
                                        //    string subj = "Notification for confirmation of order at " + ds.Tables[2].Rows[0]["NAME"].ToString();
                                        //    mm.CC.Add(new MailAddress("puneet.naresh@gmail.com"));
                                        //    mm.Subject = subj;
                                        //    mm.Body = CustomerSms;
                                        //    mm.IsBodyHtml = false;
                                        //    SmtpClient smtp = new SmtpClient();
                                        //    smtp.Send(mm);
                                        //}
                                    }
                                }
                            }

                        }
                        string WhatsappMessage = "For ecoDENT order " + ds.Tables[1].Rows[0]["HEADER_ID"].ToString()
                            + "Amount of " + Amount + "has been placed by" + ds.Tables[1].Rows[0]["C_NAME"].ToString();

                        foreach (DataRow dr in ds.Tables[3].Rows)
                        {
                            Send_Notification.SendNotificationFromFirebaseecodentbusiness(dr["RID"].ToString()
                           , dr["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Admin_Delivery.aspx", "Delivery Alert", WhatsappMessage, 1);
                            insertNotification("-1", dr["USER_ID"].ToString(), "Order Whatsapp and Notification", WhatsappMessage, "Retailer", ds.Tables[1].Rows[0]["RID"].ToString());
                        }


                    }
                    else
                    {
                        if (ds.Tables[5].Rows[0]["CustMail"].ToString() != "")
                        {
                            EmailTemplete(ds.Tables[1].Rows[0]["RID"].ToString()
                                , ds.Tables[1].Rows[0]["HEADER_ID"].ToString()
                                , ds.Tables[5].Rows[0]["CustMail"].ToString());
                            //using (MailMessage mm = new MailMessage(ds.Tables[5].Rows[0]["CustMail"].ToString(), ds.Tables[5].Rows[0]["CustMail"].ToString()))
                            //{
                            //    string subj = "Notification for confirmation of order at " + ds.Tables[2].Rows[0]["NAME"].ToString();
                            //    mm.CC.Add(new MailAddress("puneet.naresh@gmail.com"));
                            //    mm.Subject = subj;
                            //    mm.Body = CustomerSms;
                            //    mm.IsBodyHtml = false;
                            //    SmtpClient smtp = new SmtpClient();
                            //    smtp.Send(mm);
                            //}
                        }
                        string SMS = "Thank you! We have received payment of Rs " + Amount + " towards your order from " + Name + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");
                        StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
                        cl_SMS.Dyn_sms(Mobile, SMS, ds.Tables[1].Rows[0]["RID"].ToString());
                        string RestaurantMsg = "You just received payment of Rs " + Amount + " from " + Name + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

                        cl_SMS.Dyn_sms(ds.Tables[2].Rows[0]["RESTAURANT_PAYMENT_SMS_NUMBER"].ToString() == "" ? ds.Tables[2].Rows[0]["RESTAURANT_NUMBER"].ToString() : ds.Tables[2].Rows[0]["RESTAURANT_PAYMENT_SMS_NUMBER"].ToString(), RestaurantMsg, ds.Tables[1].Rows[0]["RID"].ToString());

                    }

                    if (Status == "success")
                    {
                        string DocSMS = "ATTENTION! " + "\r\r" + ds.Tables[2].Rows[0]["NAME"].ToString() + " has successfully recieved a payment of Rs." + Amount
                            + " from " + ds.Tables[1].Rows[0]["C_NAME"].ToString();
                        using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
                        {
                            string MailDeail = DocSMS;
                            string subj = "Notification of " + Name + " Success of payment";
                            mm.CC.Add(new MailAddress("puneet.naresh@gmail.com"));
                            mm.Subject = subj;
                            mm.Body = MailDeail;
                            mm.IsBodyHtml = false;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Send(mm);
                        }

                    }

                }
            }
        }
        catch (Exception ex)
        {
            using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
            {
                string MailDeail = ex.Message;
                string subj = "Notification of error on payment_success.apsx of payment";
                mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
                mm.Subject = subj;
                mm.Body = MailDeail;
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mm);
            }
        }
    }



    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To, string RID)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = RID;
        cr.Receiver_User_ID = Receiver_User_ID;
        cr.Sender_User_ID = Sender_User_ID;
        cr.Sent_To = Sent_To;
        cr.Type = 103;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnInsertNotification();

        return "1";
    }

    public static void EmailTemplete(string RID, string HeaderId, string CustEmail)
    {
        string ProcedureName = "PROC_CRT_RESTURANT";
        string Parameters = @"@Type='134',@RID = '" + RID + "',@HEADER_ID = '" + HeaderId + "'";
        string m_sqlString = "EXEC " + ProcedureName + " " + Parameters;
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(m_sqlString);
        if (ds != null && ds.Tables.Count > 0)
        {
            string RetailerName = ds.Tables[0].Rows[0]["NAME"].ToString();
            string HeaderImage = "<h1>" + RetailerName + "</h1>", PlayStoreDisplay = "display:none;";
            if (RID == "48")
            {
                PlayStoreDisplay = "";
                HeaderImage = "<img align='center' alt='Light blue sphere with flowers' border='0' class='center fixedwidth' src='https://ecodent.in/images/logo3661.png?v=2.0' style=' text-decoration: none; -ms-interpolation-mode: bicubic; height: auto; border: 0; width: 100%; max-width: 322px; display: block; width='272' />";
            }
            string ProductLoop = "";
            if (ds.Tables[3].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[3].Rows)
                {
                    ProductLoop = ProductLoop + "<div class='table-body'><div style='background-color: transparent'><div class='block-grid three-up no-stack' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; border-bottom: 1px solid lightgrey; background-color: transparent; '>" +
    "<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '>" +
    "<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
    "<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 0px; padding-bottom: 10px; padding-left: 10px; '><div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
    "<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; '>" + dr["PARTICULAR"].ToString() + "</p></div></div></div></div></div>" +
    "<div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '><div class='col_cont' style='width: 100% !important'>" +
    "<div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
    "<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 5px; padding-bottom: 10px; padding-left: 5px; '>" +
    "<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
    "<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 17px; margin: 0; '>" + dr["QTY"].ToString() + "</p></div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '>" +
    "<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
    "<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 0px; '>" +
    "<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
    "<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; text-align: right; mso-line-height-alt: 17px; margin: 0; '>₹ " + dr["PRICE_WITH_QTY"].ToString() + "</p></div></div></div></div></div></div></div></div></div>";
                }
            }

            if (ds.Tables[2].Rows.Count > 0)
            {
                string Htmlresult = "" +
"" +
"<table bgcolor='#f2fafc' cellpadding='0' cellspacing='0' class='nl-container' role='presentation' style='table-layout: fixed;vertical-align: top;min-width: 320px;" +
"border-spacing: 0;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;background-color: #f2fafc;width: 100%;' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td style='word-break: break-word; vertical-align: top' valign='top'><div style='background-color: #0071c0'> " +
"<div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '> " +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='01' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 01px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='1' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div><div style='background-color: transparent'> " +
"<div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '> " +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='5' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 5px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='5' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div><div style='background-color: transparent'>" +
"<div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '>" +
"<div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<div align='center' class='img-container center fixedwidth' style='padding-right: 0px; padding-left: 0px'>" +

HeaderImage +

"</div><div style=' color: #44464a; font-family: 'Playfair Display', Georgia, serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; font-family: 'Playfair Display', Georgia, serif; color: #44464a; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 30px; line-height: 1.2; word-break: break-word; text-align: center; font-family: 'Playfair Display', Georgia, serif; mso-line-height-alt: 36px; margin: 0; '>" +
"<span style='font-size: 30px'>Thank you for shopping with us!</span></p></div></div><div align='center' class='img-container center fixedwidth' style='padding-right: 25px; padding-left: 25px'>" +
"<div style=' line-height: 1.2; font-size: 12px; color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<h3>Shipping Address</h3><p>" + ds.Tables[1].Rows[0]["ADDRESS"].ToString() + "</p></div></div></div></div></div></div></div></div><div style='background-color: transparent'>" +
"<div class='block-grid mixed-two-up' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: #ffffff; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: #ffffff; '><div class='col num8' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 448px; width: 453px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 15px; padding-bottom: 5px; padding-right: 10px; padding-left: 10px; '>" +
"<div style=' color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; '>Order No:<span style='color: #0071c0'><strong>" + HeaderId + "</strong></span></p></div></div>" +
"<div style=' color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; '>Order Date: " + ds.Tables[2].Rows[0]["OrderDate"].ToString() + "</p></div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 15px; padding-right: 0px; padding-left: 0px; '>" +
"<div class='mobile_hide'><table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='15' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 15px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='15' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div></div><div style='background-color: transparent'>" +
"<div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='15' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 15px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='15' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div>" +

"<div class='producttable'><div class='table-header'><div style='background-color: transparent'><div class='block-grid three-up no-stack' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; background-color: #f9feff; width: 226px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 15px; padding-left: 15px; '>" +
"<div style=' color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '><div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 17px; margin: 0; '>Item</p></div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; background-color: #f9feff; width: 226px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 15px; padding-left: 15px; '>     " +
"<div style=' color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '><div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; text-align: center; mso-line-height-alt: 17px; margin: 0; '>Quantity</p></div></div></div></div>" +
"</div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; background-color: #f9feff; width: 226px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 15px; padding-left: 15px; '>   " +
"<div style=' color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 14px; line-height: 1.2; word-break: break-word; text-align: right; mso-line-height-alt: 17px; margin: 0; '>Total</p></div></div></div></div></div></div></div></div></div>" +

ProductLoop +

"<div class='table-footer'><div style='background-color: transparent'><div class='block-grid three-up no-stack' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; border-bottom: 1px solid lightgrey; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
"<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '><div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 16px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 19px; margin: 0; '><span style='font-size: 16px'><strong>Subtotal</strong></span>" +
"</p></div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '><div class='col_cont' style='width: 100% !important'>" +
"<div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '><div class='col_cont' style='width: 100% !important'>" +
"<div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
"<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 16px; line-height: 1.2; word-break: break-word; text-align: right; mso-line-height-alt: 19px; margin: 0; '><span style='font-size: 16px'>₹ " + ds.Tables[2].Rows[0]["TOTAL"].ToString() + "</span>" +
"</p></div></div></div></div></div></div></div></div><div style='background-color: transparent;display:none;'><div class='block-grid three-up no-stack' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; border-bottom: 1px solid lightgrey; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
"<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 16px; line-height: 1.2; word-break: break-word; mso-line-height-alt: 19px; margin: 0; '><span style='font-size: 16px'><strong>Discount</strong></span>" +
"</p></div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '><div class='col_cont' style='width: 100% !important'>" +
"<div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<div></div></div></div></div><div class='col num4' style=' display: table-cell; vertical-align: top; max-width: 320px; min-width: 224px; width: 226px; '><div class='col_cont' style='width: 100% !important'>" +
"<div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
"<div style=' color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #393d47; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 16px; line-height: 1.2; word-break: break-word; text-align: right; mso-line-height-alt: 19px; margin: 0; '><span style='font-size: 16px'>₹ -50,00</span>" +
"</p></div></div></div></div></div></div></div></div><div style='background-color: transparent'><div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px; '>" +
"<div style=' color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.2; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; padding-left: 10px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.2; font-size: 12px; color: #0071c0; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 14px; '>" +
"<p style=' font-size: 22px; line-height: 1.2; word-break: break-word; text-align: right; mso-line-height-alt: 26px; margin: 0; '><span style='font-size: 22px'><strong><span style=''>Total ₹ " + ds.Tables[2].Rows[0]["TOTAL"].ToString() + "</span></strong></span>" +
"</p></div></div></div></div></div></div></div></div></div></div>" +

"<div style='background-color: transparent'><div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='40' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 40px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='40' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div><div style='background-color: transparent'>" +
"<div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: #ffffff; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: #ffffff; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 15px; padding-bottom: 15px; padding-right: 0px; padding-left: 0px; '>" +
"<div style=' color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; line-height: 1.5; padding-top: 15px; padding-right: 35px; padding-bottom: 15px; padding-left: 35px; '>" +
"<div class='txtTinyMce-wrapper' style=' line-height: 1.5; font-size: 12px; color: #44464a; font-family: Nunito, Arial, Helvetica Neue, Helvetica, sans-serif; mso-line-height-alt: 18px; text-align: center; '>" +
"<p style='font-size: 14px; line-height: 1.5; word-break: break-word; text-align: center; mso-line-height-alt: 21px; margin: 0; '>" +
"Download our android APP for more amazing products.</p><img style='height:80px;' src='https://ecodent.in/images/logo3661.png?v=2.0' />" +
"<img onclick='location.href='https://play.google.com/store/apps/details?id=com.doctorplus.ecodentapp'' style='height:80px;' src='https://www.vortex6.com/wp-content/uploads/2019/09/google-play-badge.png' alt='Google Play Store' />" +
"</div></div></div></div></div></div></div></div><div style='background-color: transparent'><div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important;" + PlayStoreDisplay + "'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='25' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 25px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='25' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table><div align='center' class='img-container center fixedwidth' style='padding-right: 25px; padding-left: 25px'>" +
"<div style='font-size: 1px; line-height: 25px'> </div><div style='font-size: 1px; line-height: 25px'> </div></div></div></div></div></div></div></div><div style='background-color: #b5e1ff'>" +
"<div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='01' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 01px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='1' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div><div style='background-color: #0071c0'><div class='block-grid' style=' min-width: 320px; max-width: 680px; overflow-wrap: break-word; word-wrap: break-word; word-break: break-word; margin: 0 auto; background-color: transparent; '>" +
"<div style=' border-collapse: collapse; display: table; width: 100%; background-color: transparent; '><div class='col num12' style=' min-width: 320px; max-width: 680px; display: table-cell; vertical-align: top; width: 680px; '>" +
"<div class='col_cont' style='width: 100% !important'><div style=' border-top: 0px solid transparent; border-left: 0px solid transparent; border-bottom: 0px solid transparent; border-right: 0px solid transparent; padding-top: 5px; padding-bottom: 5px; padding-right: 0px; padding-left: 0px; '>" +
"<table border='0' cellpadding='0' cellspacing='0' class='divider' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td class='divider_inner' style=' word-break: break-word; vertical-align: top; min-width: 100%; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; ' valign='top'>" +
"<table align='center' border='0' cellpadding='0' cellspacing='0' class='divider_content' height='01' role='presentation' style=' table-layout: fixed; vertical-align: top; border-spacing: 0; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-top: 0px solid transparent; height: 01px; width: 100%; ' valign='top' width='100%'>" +
"<tbody><tr style='vertical-align: top' valign='top'><td height='1' style=' word-break: break-word; vertical-align: top; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; ' valign='top'>" +
"<span></span></td></tr></tbody></table></td></tr></tbody></table></div></div></div></div></div></div></td></tr></tbody></table>";

                using (MailMessage mm = new MailMessage(CustEmail, CustEmail))
                {
                    string subj = "Notification for confirmation of order at " + RetailerName;
                    mm.Subject = subj;
                    mm.Body = Htmlresult;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Send(mm);
                }

            }
        }
    }


    //protected void Page_Load(object sender, EventArgs e)
    //{


    //    string Product = Request.Form["productinfo"];

    //    if (Product == "Customer Recharge")
    //    {
    //        lable1.Text = "Rs." + Request.Form["amount"];
    //        lable2.Text = "Transaction ID :" + Request.Form["txnid"];
    //        tryagain.HRef = "../cart.aspx?rid=" + Cl_admin.Encrypt(Request.Form["txnid"].Split('x')[0]);
    //        cl_resturant cr = new cl_resturant();
    //        DataSet ds = new DataSet();
    //        cr.Amount = Request.Form["amount"];
    //        cr.Trx_ID = Request.Form["txnid"];
    //        cr.Name = Request.Form["firstname"];
    //        cr.Mobile_No = Request.Form["phone"];
    //        cr.Type = 65;
    //        cr.PayU_Trx_ID = Request.Form["txnid"];
    //        cr.Comment = "Payment Received of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + DateTime.UtcNow.Date;
    //        cr.Status = Request.Form["status"];
    //        ds = cr.UpdateOnlineStatus();

    //        string Payumoney_id = Request.Form["payuId"];

    //        try
    //        {
    //            if (ds != null)
    //            {
    //                if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
    //                {
    //                    string SMS = "Thank you! We have received payment of Rs " + Request.Form["amount"] + " towards your order from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

    //                    cl_SMS.Dyn_sms(Request.Form["phone"], SMS, ds.Tables[1].Rows[0]["RID"].ToString());

    //                    string RestaurantMsg = "You just received payment of Rs " + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

    //                    cl_SMS.Dyn_sms(ds.Tables[2].Rows[0]["RESTAURANT_PAYMENT_SMS_NUMBER"].ToString(), RestaurantMsg, ds.Tables[1].Rows[0]["RID"].ToString());

    //                    string DocSMS = "ATTENTION!" + "\r\nPuneet has successfully recieved a payment of Rs." + Request.Form["amount"];
    //                    StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
    //                    Response.Redirect(".." + ds.Tables[1].Rows[0]["URL"].ToString());
    //                    using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
    //                    {
    //                        string MailDeail = DocSMS;
    //                        string subj = "Notification of " + Request.Form["firstname"] + " Success of payment";
    //                        mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
    //                        mm.Subject = subj;
    //                        mm.Body = MailDeail;
    //                        mm.IsBodyHtml = false;
    //                        SmtpClient smtp = new SmtpClient();
    //                        smtp.Send(mm);
    //                    }
    //                }
    //            }
    //        }
    //        catch (Exception ex)
    //        {

    //        }
    //    }

    //    if (Product == "Customer Payment")
    //    {
    //        lable1.Text = "Rs." + Request.Form["amount"];
    //        lable2.Text = "Transaction ID :" + Request.Form["txnid"];
    //        tryagain.HRef = "../cart.aspx?rid=" + Cl_admin.Encrypt(Request.Form["txnid"].Split('x')[0]);
    //        cl_resturant cr = new cl_resturant();
    //        DataSet ds = new DataSet();
    //        cr.Amount = Request.Form["amount"];
    //        cr.Trx_ID = Request.Form["txnid"];
    //        cr.Name = Request.Form["firstname"];
    //        cr.Mobile_No = Request.Form["phone"];
    //        cr.Type = 65;
    //        cr.PayU_Trx_ID = Request.Form["txnid"];
    //        cr.Comment = "Payment Received of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + DateTime.UtcNow.Date;
    //        cr.Status = Request.Form["status"];
    //        ds = cr.UpdateOnlineStatus();

    //        string Payumoney_id = Request.Form["payuId"];

    //        try
    //        {
    //            if (ds != null)
    //            {
    //                if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
    //                {
    //                    string SMS = "Thank you! We have received payment of Rs " + Request.Form["amount"] + " towards your order from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");
    //                    StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
    //                    cl_SMS.Dyn_sms(Request.Form["phone"], SMS, ds.Tables[1].Rows[0]["RID"].ToString());

    //                    string RestaurantMsg = "You just received payment of Rs " + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

    //                    cl_SMS.Dyn_sms(ds.Tables[1].Rows[0]["RESTAURANT_PAYMENT_SMS_NUMBER"].ToString(), RestaurantMsg, ds.Tables[1].Rows[0]["RID"].ToString());

    //                    string DocSMS = "ATTENTION!" + "\r\nPuneet has successfully recieved a payment of Rs." + Request.Form["amount"];

    //                    using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
    //                    {
    //                        string MailDeail = DocSMS;
    //                        string subj = "Notification of " + Request.Form["firstname"] + " Success of payment";
    //                        mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
    //                        mm.Subject = subj;
    //                        mm.Body = MailDeail;
    //                        mm.IsBodyHtml = false;
    //                        SmtpClient smtp = new SmtpClient();
    //                        smtp.Send(mm);
    //                    }
    //                }
    //            }
    //        }
    //        catch (Exception ex)
    //        {

    //        }
    //    }

    //    if (Product == "Customer Draft Payment")
    //    {
    //        lable1.Text = "Rs." + Request.Form["amount"];
    //        lable2.Text = "Transaction ID :" + Request.Form["txnid"];
    //        tryagain.HRef = "../cart.aspx?rid=" + Cl_admin.Encrypt(Request.Form["txnid"].Split('x')[0]);
    //        cl_resturant cr = new cl_resturant();
    //        DataSet ds = new DataSet();
    //        cr.Amount = Request.Form["amount"];
    //        cr.Trx_ID = Request.Form["txnid"];
    //        cr.Name = Request.Form["firstname"];
    //        cr.Mobile_No = Request.Form["phone"];
    //        cr.Type = 65;
    //        cr.PayU_Trx_ID = Request.Form["txnid"];
    //        cr.Comment = "Payment Received of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + DateTime.UtcNow.Date;
    //        cr.Status = Request.Form["status"];
    //        ds = cr.UpdateOnlineStatus();

    //        string Payumoney_id = Request.Form["payuId"];

    //        try
    //        {
    //            if (ds != null)
    //            {
    //                if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
    //                {
    //                    string SMS = "Thank you! We have received payment of Rs " + Request.Form["amount"] + " towards your order from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");
    //                    StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
    //                    cl_SMS.Dyn_sms(Request.Form["phone"], SMS, ds.Tables[1].Rows[0]["RID"].ToString());

    //                    string RestaurantMsg = "You just received payment of Rs " + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

    //                    cl_SMS.Dyn_sms(ds.Tables[1].Rows[0]["RESTAURANT_PAYMENT_SMS_NUMBER"].ToString(), RestaurantMsg, ds.Tables[1].Rows[0]["RID"].ToString());

    //                    string DocSMS = "ATTENTION!" + "\r\nPuneet has successfully recieved a payment of Rs." + Request.Form["amount"];

    //                    using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
    //                    {
    //                        string MailDeail = DocSMS;
    //                        string subj = "Notification of " + Request.Form["firstname"] + " Success of payment";
    //                        mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
    //                        mm.Subject = subj;
    //                        mm.Body = MailDeail;
    //                        mm.IsBodyHtml = false;
    //                        SmtpClient smtp = new SmtpClient();
    //                        smtp.Send(mm);
    //                    }
    //                }
    //            }
    //        }
    //        catch (Exception ex)
    //        {

    //        }
    //    }
    //}

    private void getCustomerDetails()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = Request.Form["custid"]; //HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = Request.Form["retid"];//HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ds = cc.fnGetAddress();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            //string changeStoreOption = " <a id=\"storechange\" class=\"_ChangeStore_btn\" href=\"../Components/store\">Change Store</a>";
            //if (ds.Tables[1].Rows[0]["CHANGE_STORE_FLAG"].ToString() == "N")
            //{
            //    UserName_n_Pic.Visible =false;
            //}

            HttpCookie user_type = new HttpCookie("user_type");
            user_type.Value = "customer";
            user_type.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(user_type);

            StoreName.InnerHtml = ds.Tables[1].Rows[0]["NAME"].ToString() + "<p  style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
                ds.Tables[1].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[1].Rows[0]["CITY"].ToString() +
                "</p>";
            //active_bal.InnerHtml = "<span>WALLET BALANCE</span><br/> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
            //UserName_n_Pic.InnerHtml = ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString() + "&nbsp;<i class=\"fa fa-user-circle-o fa-2x\"></i> ";
            //active_balance.InnerHtml = "<span style=\"font-size: 18px; font-weight: 100;\">Active Balance: <strong>&#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString() + "</strong></span>";
            //active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\">with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

        }
    }
}