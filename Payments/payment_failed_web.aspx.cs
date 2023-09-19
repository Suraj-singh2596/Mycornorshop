using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payments_payment_failed_web : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        string Product = Request.Form["productinfo"];
        if (Product == "Customer Recharge")
        {
            lable1.Text = "Rs." + Request.Form["amount"];
            lable2.Text = "Transaction ID :" + Request.Form["txnid"];
            //tryagain.HRef = "../cart.aspx?rid=" + Cl_admin.Encrypt(Request.Form["txnid"].Split('x')[0]);

            tryagain.HRef = "/Payments/Payment_details.aspx/trxid/" + Request.Form["txnid"];
            cl_resturant cr = new cl_resturant();
            DataSet ds = new DataSet();
            cr.Amount = Request.Form["amount"];
            cr.Trx_ID = Request.Form["txnid"];
            cr.Name = Request.Form["firstname"];
            cr.Mobile_No = Request.Form["phone"];
            cr.Type = 64;
            cr.PayU_Trx_ID = Request.Form["txnid"];
            cr.Comment = "Payment failed of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + DateTime.UtcNow.Date;
            cr.Status = Request.Form["status"];
            ds = cr.UpdateOnlineStatus();

            string Payumoney_id = Request.Form["payuId"];

            try
            {
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
                    {
                        string SMS = "Payment failed of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

                        cl_SMS.Dyn_sms(Request.Form["phone"], SMS, "");

                        string DocSMS = "ATTENTION!" + "\r\nPuneet has failed to recieved a payment of Rs." + Request.Form["amount"];
                        StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
                        using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
                        {
                            string MailDeail = DocSMS;
                            string subj = "Notification of " + Request.Form["firstname"] + " failed of payment";
                            mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
                            mm.Subject = subj;
                            mm.Body = MailDeail;
                            mm.IsBodyHtml = false;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Send(mm);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        if (Product == "Customer Payment")
        {
            lable1.Text = "Rs." + Request.Form["amount"];
            lable2.Text = "Transaction ID :" + Request.Form["txnid"];
            //tryagain.HRef = "../cart.aspx?rid=" + Cl_admin.Encrypt(Request.Form["txnid"].Split('x')[0]);
            tryagain.HRef = "/Payments/Payment_details.aspx/trxid/" + Request.Form["txnid"];
            cl_resturant cr = new cl_resturant();
            DataSet ds = new DataSet();
            cr.Amount = Request.Form["amount"];
            cr.Trx_ID = Request.Form["txnid"];
            cr.Name = Request.Form["firstname"];
            cr.Mobile_No = Request.Form["phone"];
            cr.Type = 64;
            cr.PayU_Trx_ID = Request.Form["txnid"];
            cr.Comment = "Payment failed of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + DateTime.UtcNow.Date;
            cr.Status = Request.Form["status"];
            ds = cr.UpdateOnlineStatus();

            string Payumoney_id = Request.Form["payuId"];

            try
            {
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
                    {
                        string SMS = "Payment failed of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");
                        StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
                        cl_SMS.Dyn_sms(Request.Form["phone"], SMS, "");

                        string DocSMS = "ATTENTION!" + "\r\nPuneet has failed to recieved a payment of Rs." + Request.Form["amount"];

                        using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
                        {
                            string MailDeail = DocSMS;
                            string subj = "Notification of " + Request.Form["firstname"] + " failed of payment";
                            mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
                            mm.Subject = subj;
                            mm.Body = MailDeail;
                            mm.IsBodyHtml = false;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Send(mm);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        if (Product == "Customer Draft Payment")
        {
            lable1.Text = "Rs." + Request.Form["amount"];
            lable2.Text = "Transaction ID :" + Request.Form["txnid"];
            //tryagain.HRef = "../cart.aspx?rid=" + Cl_admin.Encrypt(Request.Form["txnid"].Split('x')[0]);
            tryagain.HRef = "/Payments/Payment_details.aspx/trxid/" + Request.Form["txnid"];
            cl_resturant cr = new cl_resturant();
            DataSet ds = new DataSet();
            cr.Amount = Request.Form["amount"];
            cr.Trx_ID = Request.Form["txnid"];
            cr.Name = Request.Form["firstname"];
            cr.Mobile_No = Request.Form["phone"];
            cr.Type = 64;
            cr.PayU_Trx_ID = Request.Form["txnid"];
            cr.Comment = "Payment failed of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + DateTime.UtcNow.Date;
            cr.Status = Request.Form["status"];
            ds = cr.UpdateOnlineStatus();

            string Payumoney_id = Request.Form["payuId"];

            try
            {
                if (ds != null)
                {
                    if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
                    {
                        string SMS = "Payment failed of Rs." + Request.Form["amount"] + " from " + Request.Form["firstname"] + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

                        cl_SMS.Dyn_sms(Request.Form["phone"], SMS, "");

                        string DocSMS = "ATTENTION!" + "\r\nPuneet has failed to recieved a payment of Rs." + Request.Form["amount"];
                        StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
                        using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
                        {
                            string MailDeail = DocSMS;
                            string subj = "Notification of " + Request.Form["firstname"] + " failed of payment";
                            mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
                            mm.Subject = subj;
                            mm.Body = MailDeail;
                            mm.IsBodyHtml = false;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Send(mm);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }

}