using Newtonsoft.Json;
using paytm;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paytm;


public partial class Payments_Payment_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            string Trx_ID = HttpContext.Current.Request.Url.AbsolutePath.Split('/').Last();

            cl_resturant cr = new cl_resturant();
            DataSet ds = new DataSet();
            cr.Trx_ID = Trx_ID;
            cr.Type = 63;
            ds = cr.getTransactionDetails();

            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                ViewState["Email"] = "";
                ViewState["Pinfo"] = ds.Tables[0].Rows[0]["PINFO"].ToString();
                ViewState["key"] = ds.Tables[0].Rows[0]["PAY_U_KEY"].ToString();
                ViewState["salt"] = ds.Tables[0].Rows[0]["SALT"].ToString();

                txtName.Value = ds.Tables[0].Rows[0]["C_NAME"].ToString();
                txtMobile.Value = ds.Tables[0].Rows[0]["C_MOBILE"].ToString();
                txtRestaurantName.Value = ds.Tables[0].Rows[0]["RESTAURANT_NAME"].ToString();
                txtamount.Value = ds.Tables[0].Rows[0]["AMOUNT"].ToString();



                //txtMID.Value = ds.Tables[0].Rows[0]["PAYTM_MID"].ToString();
                //txtMKEY.Value = ds.Tables[0].Rows[0]["PAYTM_MKEY"].ToString();

                ViewState["paytm_mid"] = ds.Tables[0].Rows[0]["PAYTM_MID"].ToString();
                ViewState["paytm_mkey"] = ds.Tables[0].Rows[0]["PAYTM_MKEY"].ToString();
                ViewState["payment_gateway"] = ds.Tables[0].Rows[0]["PAYMENT_GATEWAY"].ToString();
                ViewState["mobile"] = ds.Tables[0].Rows[0]["C_MOBILE"].ToString();
                ViewState["amount"] = ds.Tables[0].Rows[0]["AMOUNT"].ToString();
                ViewState["tx_id_by_us"] = Trx_ID;
                ViewState["cust_id"] = ds.Tables[0].Rows[0]["CID"].ToString();
                ViewState["rid"] = ds.Tables[0].Rows[0]["RID"].ToString();


                transaction_id.Value = Trx_ID;

                StoreName.InnerHtml = ds.Tables[0].Rows[0]["RESTAURANT_NAME"].ToString();
                getCustomerDetails(ds.Tables[0].Rows[0]["CID"].ToString(), ds.Tables[0].Rows[0]["RID"].ToString());
            }

        }
    }


    private void getCustomerDetails(string CID, string RID)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = CID;
        cc.RID = RID;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ViewState["amount"].ToString() != "0" && ViewState["amount"].ToString() != "" && ViewState["payment_gateway"].ToString().ToUpper() == "PAYTM")
        {
            string orderid = "D" + DateTime.Now.Ticks.ToString();
            updateOrderID(orderid, ViewState["tx_id_by_us"].ToString(), ViewState["paytm_mkey"].ToString(), ViewState["paytm_mid"].ToString());
            //string merchantKey = "RD7w3sy6PxCmBO&D";
            string merchantKey = ViewState["paytm_mkey"].ToString();
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            //parameters.Add("MID", "SoxuXY65872390065256");
            parameters.Add("MID", ViewState["paytm_mid"].ToString());
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Retail");
            parameters.Add("WEBSITE", "DEFAULT");
            parameters.Add("EMAIL", "");
            parameters.Add("MOBILE_NO", ViewState["mobile"].ToString());
            //parameters.Add("MOBILE_NO", "9953075912");
            parameters.Add("CUST_ID", ViewState["mobile"].ToString());
            // parameters.Add("CUST_ID", "123");
            //parameters.Add("p_info", ViewState["Pinfo"].ToString());
            parameters.Add("ORDER_ID", orderid);
            // parameters.Add("tx_id_by_us", ViewState["tx_id_by_us"].ToString());
            parameters.Add("TXN_AMOUNT", ViewState["amount"].ToString());
            //parameters.Add("TXN_AMOUNT", "1");
            parameters.Add("CALLBACK_URL", "https://mycornershop.in/Payments/payment_success.aspx");
            //parameters.Add("CALLBACK_URL", "http://localhost:59546/Payments/payment_success_web.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.
            string checksum = CheckSum.generateCheckSum(merchantKey, parameters);
            string paytmURL = "https://securegw.paytm.in/order/process?orderid=" + orderid;
            string outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant Check Out Page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center>Please do not refresh this page...</center>"; //you can put h1 tag here
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";
            Response.Write(outputHTML);
        }
        else
        {
            try
            {
                Double amount = Convert.ToDouble(txtamount.Value);

                String text = Convert.ToString(ViewState["key"]) + "|" + transaction_id.Value.ToString() + "|" + amount + "|" + Convert.ToString(ViewState["Pinfo"]).Trim() + "|" + txtName.Value.Trim() + "|" + Convert.ToString(ViewState["Email"]).Trim() + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "|" + "1" + "||||||" + Convert.ToString(ViewState["salt"]);

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
                hash.Value = hex;

                System.Collections.Hashtable data = new System.Collections.Hashtable(); // adding values in gash table for data post
                data.Add("hash", hex.ToString());
                data.Add("txnid", transaction_id.Value);
                data.Add("key", Convert.ToString(ViewState["key"]));
                data.Add("amount", amount);
                data.Add("custid", Convert.ToString(ViewState["cust_id"]));
                data.Add("retid", Convert.ToString(ViewState["rid"]));
                data.Add("firstname", txtName.Value.Trim());
                data.Add("phone", txtMobile.Value.Trim());
                data.Add("email", Convert.ToString(ViewState["Email"]));
                data.Add("productinfo", Convert.ToString(ViewState["Pinfo"]));
                data.Add("udf1", "1");
                data.Add("udf2", "1");
                data.Add("udf3", "1");
                data.Add("udf4", "1");
                data.Add("udf5", "1");
                data.Add("surl", Convert.ToString(ConfigurationManager.AppSettings["SuccessPaymentPage"]));
                data.Add("furl", Convert.ToString(ConfigurationManager.AppSettings["FailurePaymentPage"]));

                data.Add("service_provider", "payu_paisa");

                ViewState["cust_id"] = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
                ViewState["rid"] = HttpContext.Current.Request.Cookies["rid"].Value.ToString();

                string strForm = PreparePOSTForm(Convert.ToString(ConfigurationManager.AppSettings["PaymentURL"]), data);
                Page.Controls.Add(new LiteralControl(strForm));
            }
            catch (Exception Ex)
            {
                using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
                {

                    string MailDeail = Ex.Message;
                    mm.CC.Add(new MailAddress("operations@doctorplus.biz"));

                    mm.Subject = "STD -- Error Payment Page (While making payment)";
                    mm.Body = MailDeail;
                    mm.IsBodyHtml = true;
                    mm.Priority = MailPriority.High;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Send(mm);
                }
            }
        }
    }

    public void updateOrderID(string Order_ID, string Trx_ID, string PMKey, string PMerchane_ID)
    {
        cl_resturant cr = new cl_resturant();
        DataSet ds = new DataSet();
        cr.Order_ID = Order_ID;
        cr.Trx_ID = Trx_ID;
        cr.PMKey = PMKey;
        cr.PMerchane_ID = PMerchane_ID;
        cr.Type = 95;
        ds = cr.UpdateOnlineStatus();

    }
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)      // post form
    {
        //Set a name for the form
        string formID = "PostForm";
        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" +
                       formID + "\" action=\"" + url +
                       "\" method=\"POST\">");

        foreach (System.Collections.DictionaryEntry key in data)
        {

            strForm.Append("<input type=\"hidden\" name=\"" + key.Key +
                           "\" value=\"" + key.Value + "\">");
        }


        strForm.Append("</form>");
        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." +
                         formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");
        //Return the form and the script concatenated.
        //(The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
}