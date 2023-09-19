using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payments_Payment_failed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getCustomerDetails();

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

    private void getCustomerDetails()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
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
            active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\">with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

        }
    }

}