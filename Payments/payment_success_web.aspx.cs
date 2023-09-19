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
using paytm;
using Paytm;
public partial class Payments_payment_success_web : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
                        lable2.Text = "Transaction ID : " + txnId;
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
                if (ds.Tables[0].Rows[0]["MESSAGE"].ToString() == "Y")
                {
                    string SMS = "Thank you! We have received payment of Rs " + Amount + " towards your order from " + Name + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");
                    StoreName.InnerHtml = ds.Tables[2].Rows[0]["NAME"].ToString();
                    cl_SMS.Dyn_sms(Mobile, SMS, ds.Tables[1].Rows[0]["RID"].ToString());

                    string RestaurantMsg = "You just received payment of Rs " + Amount + " from " + Name + " " + Convert.ToDateTime(ds.Tables[1].Rows[0]["PAYMENT_DATE"]).ToString("dd-MM-yyyy hh:mm:tt");

                    cl_SMS.Dyn_sms(ds.Tables[1].Rows[0]["RESTAURANT_PAYMENT_SMS_NUMBER"].ToString(), RestaurantMsg, ds.Tables[1].Rows[0]["RID"].ToString());

                    string DocSMS = "ATTENTION!" + "\r\rRestaurant has successfully recieved a payment of Rs." + Amount;

                    using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
                    {
                        string MailDeail = DocSMS;
                        string subj = "Notification of " + Name + " Success of payment";
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
            using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
            {
                string MailDeail = ex.Message;
                string subj = "Notification of error on payment_success_web.apsx of payment";
                mm.CC.Add(new MailAddress("deepanshu.iglobalsolution@gmail.com"));
                mm.Subject = subj;
                mm.Body = MailDeail;
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mm);
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
}