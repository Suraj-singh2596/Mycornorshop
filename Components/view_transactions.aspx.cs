using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_view_transactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]

    public static string Fn_all_trxhistory()
    {
        string result = string.Empty;
        string classchange = string.Empty;
        string classnone = string.Empty;
        string classnones = string.Empty;

        Cl_Customer objTrx = new Cl_Customer();
        objTrx.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        objTrx.Type = 12;
        DataSet ds = new DataSet();
        ds = objTrx.fn_getTRX_Details();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {

                if (DR["MODE"].ToString().ToUpper() != "PURCHASE")
                {
                    classchange = "Payment";
                    classnone = "d-none";
                }
                else
                {
                    classchange = "purchase";
                    classnones = "d-none";
                }
                result = result + "<div class=\"wallets__Details boxshadow mt-2\"><div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\">" +
                "<div class=\"__details\"><table class=\"w-100\" style=\"background: none;\"><tr><td class=\"store__Name w-100\">" +
                "<span>Date : " + Convert.ToString(Convert.ToDateTime(DR["TRX_DATE"]).ToString("dd-MMM-yyy")) + "</span></td><td><div class=\"" + classchange + "\">" + DR["MODE"].ToString().ToUpper() + "</div></td></tr><tr class=\"\"><td class=\"w-75\"><span>MOP : " + DR["MOP_or_order_no"].ToString() + "</span>" +
                "</td><td class=\"text-right\">" + DR["AMOUNT"].ToString() + " </td></tr><tr><td class=\"w-75\" ><span>" + DR["STORE_NAME"].ToString() + "</span></td><td  class=\"text-right\"></td></tr></table></div></div></div></div>";

            }
        }
        else
        {
            result = "<div class=\"wallets__Details boxshadow mt-2\"><div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\">" +
            "<div class=\"__details text-center\"><img width=\"100\" src=\"../Components/wallet.png\"/><br/>oops! No Transactions</div></div></div></div>";

        }
        return result;
    }



    [WebMethod]

    public static string Fn_all_trxhistory_rid(string rid)
    {
        string result = string.Empty;
        string classchange = string.Empty;
        string classnone = string.Empty;
        string classnones = string.Empty;
        string Mop = "";
        Cl_Customer objTrx = new Cl_Customer();
        objTrx.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        objTrx.RID = rid;
        objTrx.Type = 13;
        DataSet ds = new DataSet();
        ds = objTrx.fn_getTRX_Details();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {

                if (DR["MODE"].ToString().ToUpper() != "PURCHASE")
                {
                    classchange = "Payment";
                    classnone = "d-none";
                    Mop = "MOP : " + Convert.ToString(DR["MOP_or_order_no"].ToString() != "" ? DR["MOP_or_order_no"].ToString() : "Cash").ToUpper();
                }
                else
                {
                    Mop = "Order No. : " + DR["MOP_or_order_no"].ToString().ToUpper();
                    classchange = "purchase";
                    classnones = "d-none";
                }
                result = result + "<div class=\"wallets__Details boxshadow mt-2\"><div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\">" +
                "<div class=\"__details\"><table class=\"w-100\" style=\"background: none;\"><tr><td class=\"store__Name w-100\">" +
                "<span>Date : " + Convert.ToString(Convert.ToDateTime(DR["TRX_DATE"]).ToString("dd-MMM-yyy")) + "</span></td><td><div class=\"" + classchange + "\">" + DR["MODE"].ToString().ToUpper() + "</div></td></tr><tr class=\"\"><td class=\"w-75\"><span>" + Mop + "</span>" +
                "</td><td class=\"text-right\">" + DR["AMOUNT"].ToString() + " </td></tr><tr><td class=\"w-75\" ><span>" + DR["STORE_NAME"].ToString() + "</span></td><td  class=\"text-right\"></td></tr></table></div></div></div></div>";

            }
        }
        else
        {
            result = "<div class=\"wallets__Details boxshadow mt-2\"><div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\">" +
            "<div class=\"__details text-center\"><img width=\"100\" src=\"../Components/wallet.png\"/><br/>oops! No Transactions</div></div></div></div>";

        }
        return result;
    }
}