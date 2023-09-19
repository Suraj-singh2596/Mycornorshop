using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_transaction_history : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]

    public static string fn_GetWallets()
    {
        string result = string.Empty;
        Cl_Customer objTrx = new Cl_Customer();
        objTrx.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        objTrx.Type = 11;
        DataSet ds = new DataSet();
        ds = objTrx.fn_getTRX_Details();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            result = "<div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\"><div class=\"__details\">" +
                      "<table class=\"w-100\" style=\"background: none;\"><tr><td class=\"w-75\">" +
                      "<h6>No of wallets:</h6></td><td class=\"text-right\"><h6>" + ds.Tables[0].Rows[0]["NO_OF_WALLETS"].ToString() + "</h6></td></tr><tr><td class=\"w-75\">" +
                      "<h6>Overall wallet Balance:</h6></td><td class=\"text-right\"><h6>&#8377; " + ds.Tables[0].Rows[0]["TOTAL_WALLET_BALANCE"].ToString() + "</h6></td>" +
                      "</tr></table><a class=\"viewall_trx_btn\" trxrid=\"-1\"  href=\"javascript:void(0);\">view overall transaction history</a></div></div></div>";

        }
        else
        {
            result = "<div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\"><div class=\"__details\">" +
                                  "<table class=\"w-100\" style=\"background: none;\"><tr><td class=\"w-75\">" +
                                  "<h6>No of wallets:</h6></td><td><h6>--NA--</h6></td></tr><tr><td class=\"w-75\">" +
                                  "<h6>Overall wallets Balance:</h6></td><td><h6> --NA--</h6></td>" +
                                  "</tr></table><a class=\"viewall_trx_btn\" trxrid=\"-1\" href=\"javascript:void(0);\">view overall transaction history</a></div></div></div>";
        }
        return result;
    }


    [WebMethod]

    public static string Fn_Get_indivisual_wallets()
    {
        string result = string.Empty;
        Cl_Customer objTrx = new Cl_Customer();
        objTrx.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        objTrx.Type = 11;
        DataSet ds = new DataSet();
        ds = objTrx.fn_getTRX_Details();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[1].Rows)
            {
                result = result + "<div class=\"wallets__Details boxshadow mt-2\"><div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\">" +
                "<div class=\"__details\"><table class=\"w-100\" style=\"background: none;\"><tr><td class=\"store__Name\">" +
                "<h6>" + DR["STORE_NAME"].ToString() + "</h6></td><td></td></tr><tr><td class=\"w-75\"><h6>Wallet Balance:</h6>" +
                "</td><td><h6>&#8377;" + DR["TOTAL_WALLET_BALANCE"].ToString() + "</h6></td></tr><tr class=\"d-none\"><td class=\"w-75\"><h6>Balance with shop</h6>" +
                "</td><td><h6>&#8377; -1000</h6></td></tr></table><a class=\"view_trx_btn\" trxrid=\"" + DR["RID"].ToString() + "\" href=\"javascript:void(0)\">view overall transaction history</a></div></div></div></div>";
            }
        }
        else
        {
            result = "<div class=\"wallets__Details boxshadow mt-2\"><div class=\"row\"><div class=\"col-sm-12 col-md-12 col-lg-6\">" +
            "<div class=\"__details text-center\"><img width=\"100\" src=\"../Components/wallet.png\"/><br/>oops! No Wallets</div></div></div></div>";

        }
        return result;
    }
}