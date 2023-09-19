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

public partial class Payments_payment_details_web : System.Web.UI.Page
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
                //ViewState["salt"] = ds.Tables[0].Rows[0]["SALT"].ToString();


                transaction_id.Value = Trx_ID;

                StoreName.InnerHtml = ds.Tables[0].Rows[0]["RESTAURANT_NAME"].ToString();
            }




        }
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
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
            parameters.Add("CALLBACK_URL", "https://mycornershop.in/Payments/payment_success_web.aspx");
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

}