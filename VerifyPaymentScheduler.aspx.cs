using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

public partial class VerifyPaymentScheduler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkPayment();
    }
    public void checkPayment()
    {
        string ProcedureName = "PROC_CRT_RESTURANT";
        string Parameters = @"@Type='131'";
        string m_sqlString = "EXEC " + ProcedureName + " " + Parameters;
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(m_sqlString);
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string key = dr["PAY_U_KEY"].ToString(), command = "verify_payment", trxid = dr["TRX_ID"].ToString(),
                    salt = dr["SALT"].ToString(), RID = dr["RID"].ToString(), Pinfo = dr["PINFO"].ToString(),
                    Name = dr["C_NAME"].ToString(), Mobile_No = dr["C_MOBILE"].ToString();
                string text = key + "|" + command + "|" + trxid + "|" + salt;
                byte[] message = Encoding.UTF8.GetBytes(text);

                UnicodeEncoding UE = new UnicodeEncoding();
                byte[] hashValue;
                SHA512Managed hashString = new SHA512Managed();
                string hex = "";
                hashValue = hashString.ComputeHash(message);
                foreach (byte x in hashValue)
                {
                    hex += String.Format("{0:x2}", x);
                }

                if (ServicePointManager.SecurityProtocol.HasFlag(SecurityProtocolType.Tls12) == false)
                {
                    ServicePointManager.SecurityProtocol = ServicePointManager.SecurityProtocol | SecurityProtocolType.Tls12;
                }

                var request = (HttpWebRequest)WebRequest.Create("https://info.payu.in/merchant/postservice.php?form=2");

                var postData = "key=" + Uri.EscapeDataString(key);
                postData += "&command=" + Uri.EscapeDataString(command);
                postData += "&var1=" + Uri.EscapeDataString(trxid);
                postData += "&hash=" + Uri.EscapeDataString(hex);
                var data = Encoding.ASCII.GetBytes(postData);

                request.Method = "POST";
                request.Accept = "text/plain";
                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;

                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }
                var response = (HttpWebResponse)request.GetResponse();
                var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
                var userObj = JObject.Parse(responseString);
                string Status = Convert.ToString(userObj["status"]);
                string PaymentStatus = Convert.ToString(userObj["transaction_details"][trxid]["status"]);
                if (Status == "1" && PaymentStatus == "success")
                {
                    string Amount = Convert.ToString(userObj["transaction_details"][trxid]["transaction_amount"]);
                    string Comment = "Payment of Rs. " + Amount + " is success !" + " on " + DateTime.UtcNow.Date;
                    string Flag = "Y";
                    string Proc = "PROC_CRT_RESTURANT";
                    string Type = "65";
                    if (Pinfo == "Customer Payment" && RID == "48")
                    {
                        Proc = "Proc_Ecodent";
                        Type = "6";
                    }
                    string Param = @"@Type='" + Type + "',@AMOUNT = '" + Amount + "',@Trx_ID = '" +
                    trxid + "',@PayU_Trx_ID = '" + trxid + "',@ORDER_STATUS = '" + PaymentStatus + "',@RID = '" +
                    RID + "',@C_NAME = '" + Name + "',@Mobile = '" + Mobile_No + "',@COMMENT = '" + Comment + "',@Flag = '" + Flag + "'";
                    string Query = "EXEC " + Proc + " " + Param;
                    dal dd = dal.GetInstance();
                    DataSet dsd = d.GetDataSet(Query);
                    if (dsd != null && dsd.Tables.Count > 0 && dsd.Tables[0].Rows.Count > 0)
                    {
                        string HeaderId = "";
                        if (Type == "6")
                        {
                            HeaderId = dsd.Tables[0].Rows[0]["HEADER_ID"].ToString();
                        }
                        else
                        {
                            HeaderId = dsd.Tables[1].Rows[0]["HEADER_ID"].ToString();
                        }
                        if (HeaderId != "")
                        {
                            string HeaderParam = @"@Type='132',@HEADER_ID = '" + HeaderId + "',@Trx_ID = '" +
                            trxid + "',@RID = '" + RID + "'";
                            string HeaderQuery = "EXEC " + "PROC_CRT_RESTURANT" + " " + HeaderParam;
                            dal Headerd = dal.GetInstance();
                            DataSet Headerds = d.GetDataSet(Query);
                            if (Headerds != null && Headerds.Tables.Count > 0)
                            {
                                string OrderDate = Headerds.Tables[3].Rows[0]["ORDER_DATETIME"].ToString();
                                string ItemCount = Headerds.Tables[2].Rows[0]["ItemCount"].ToString();
                                string CEmail = Headerds.Tables[0].Rows[0]["E_MAIL"].ToString();
                                string RetailerName = Headerds.Tables[1].Rows[0]["NAME"].ToString();
                                sendNotification(RID, Name, Mobile_No, HeaderId, OrderDate, ItemCount,
                                    "success", CEmail, RetailerName, Amount);
                            }
                        }
                    }
                }
            }


        }

    }

    public static void sendNotification(string RID, string CName, string CMobile, string HeaderId,
        string OrderDate, string ItemCount, string Status, string CEmail, string RetailerName,
        string Amount)
    {
        if (RID == "48" || RID == "51")
        {
            string usersms = "Dear " + CName + ",\n Your order " + HeaderId + " has been placed on " + Convert.ToDateTime(OrderDate).ToString("dd-MM-yyyy hh:mm:tt") + ") at ecoDENT.\nIt will dispatched in 2-3 working days\nPlease download ecodent Android app from play store to track Status of your order.\n\nThis is system generated message Please do not reply.";
            cl_SMS.WhatsApp_Dyn_sms(CMobile, usersms, RID);

            if (ItemCount != "0")
            {
                string CustomerSms = "Thank you for your order. Your order for " +
                    ItemCount +
                    " item(s) have been placed successfully. You can download the ecoDENT app from Play store to track your order- Powered by doctorplus";

                WebClient client = new WebClient();
                string baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=DRPLUS&channel=2&DCS=0&flashsms=0&number=" + CMobile
                    + "&text=" + CustomerSms.Replace("&", "and") + "&route=31&dlttemplateid=1307165181930333488";
                Stream data = client.OpenRead(baseurl);
                StreamReader reader = new StreamReader(data);
                data.Close();
                reader.Close();

                if (Status == "success")
                {
                    if (CEmail != "")
                    {
                        EmailTemplete(RID, HeaderId, CEmail);

                        //using (MailMessage mm = new MailMessage(CEmail, CEmail))
                        //{
                        //    string subj = "Notification for confirmation of order at " + RetailerName;
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
            string WhatsappMessage = "For ecoDENT order " + HeaderId
                + "Amount of " + Amount + "has been placed by" + CName;

            string ProcedureName = "PROC_CRT_RESTURANT";
            string Parameters = @"@Type='133',@RID = '" + RID + "'";
            string m_sqlString = "EXEC " + ProcedureName + " " + Parameters;
            dal d = dal.GetInstance();
            DataSet ds = d.GetDataSet(m_sqlString);
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[1].Rows)
                {
                    Send_Notification.SendNotificationFromFirebaseecodentbusiness(RID
                   , dr["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Admin_Delivery.aspx", "Delivery Alert", WhatsappMessage, 1);
                    insertNotification("-1", dr["USER_ID"].ToString(), "Order Whatsapp and Notification", WhatsappMessage, "Retailer", RID);
                }
            }

            string DocSMS = "ATTENTION!" + "\r\r" + RetailerName + " has successfully recieved a payment of Rs." + Amount;
            using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
            {
                string MailDeail = DocSMS;
                string subj = "Notification of " + CName + " Success of payment";
                mm.CC.Add(new MailAddress("puneet.naresh@gmail.com"));
                mm.Subject = subj;
                mm.Body = MailDeail;
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mm);
            }
        }
    }
    public static void insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To, string RID)
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
}
