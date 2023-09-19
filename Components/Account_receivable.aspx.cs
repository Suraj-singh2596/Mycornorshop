using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Account_receivable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // getNotifications();
    }


    [WebMethod]

    public static string Fn_all_trxhistory_rid()
    {
        string result = string.Empty;
        Cl_admin objTrx = new Cl_admin();
        objTrx.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(); ;
        objTrx.Type = 41;
        DataSet ds = objTrx.fn_insert_stealdeaal();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
 
                    result = result + "<div class=\"card mt-3\"><label class=\"title m-0 editpersonal\">" + DR["CNAME"].ToString() + "<span> - " + DR["MOBILE"].ToString() + "</span><div>" + DR["ADDRESS"].ToString().Replace("<br/>", ", ") + "</div></label>" +
                           "<hr class=\"mt-0 mb-0\" /><div class=\"p-2\"><div>Order Amount <span class=\"pull-right\">" + DR["TOTAL_AMOUNT"].ToString() + "</span></div>" +
                           "<div>Paid Amount<span class=\"pull-right\">" + DR["RECEIVED_AMOUNT"].ToString() + "</span></div>" +
                           "<div>Pending Amount <span class=\"pull-right\">" + DR["PENDING"].ToString() + "</span></div>" +
                           "</div><hr class=\"mt-0 mb-0\" /><div>" +
                           "<input class=\"LinkAmount\" style=\"padding-left: 15px;background: #c6c6c6;margin-left:15px;margin-top: 5px;border-radius: 5px;width:30%;\" type=\"number\" value=\"" + DR["PENDING"].ToString() + "\" >" +
                           "<a class=\"pull-right btnstyle sendpaymentlinkbtn\" mobile='"+ DR["MOBILE"].ToString() + "' cid='" + DR["CID"].ToString() + "'>Send payment link <i class=\"fa fa-send\"></i> </a>" +
                           "</div></div>";
                
            }
        }

        return result;
    }

    [WebMethod]
 
    public static string sendPaymentLink(string Mobile, string Amount, string Flag, string CID)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 43;
        ca.MOBILE = Mobile;
        ca.Amount = Amount;
        ca.Flag = Flag;
        ca.CID = CID;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fnAddSales();
        string Trx_ID = "";
        if (Flag == "Y")
        {
            Trx_ID = ds.Tables[0].Rows[0]["TRX_ID"].ToString();
            string SMS = "Please use below link to pay Rs " + Amount + " to " + ds.Tables[1].Rows[0]["NAME"].ToString() + " as you have pending dues.";

            string link = "https://mycornershop.in/Payments/payment_details_web/" + Trx_ID;
            cl_SMS.Dyn_sms(Mobile, SMS + "\n" + link, "");
        }
        return "1";
    }
}