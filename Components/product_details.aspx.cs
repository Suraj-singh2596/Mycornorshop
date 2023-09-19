using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_product_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        itemcounts();
        getCustomerDetails();
    }
    public void itemcounts()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 46;
        ds = cr.fngetParticularItemList();
        string item_count = "0";

        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            item_count = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();

            HttpCookie Cookie = new HttpCookie("item_count");
            Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }



        Mycart2.InnerHtml = item_count;
    }

    public void getCustomerDetails()
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
            //active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\">with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

        }
    }



    [WebMethod]

    public static string getcompleteproductdetails(string menuid, string urltype)
    {
        string data = "";
        cl_product_details pd = new cl_product_details();
        pd.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        pd.SDID = cl_encrypt.Decrypt(menuid);
        pd.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        if (urltype == "sd")
        {
            pd.Type = 1;
        }else if (urltype == "dl")
        {
            pd.Type = 2;
        }else if (urltype == "ofr")
        {
            pd.Type = 3;
        }
        else if (urltype == "Gn")
        {
            pd.Type = 4;
        }
        DataSet DS = new DataSet();
        DS = pd.fngetcompleteproductdetails();
        if (DS != null && DS.Tables.Count>0)
        {
            data = LowercaseJsonSerializer.SerializeObject(DS);
        }
       
        return data;
    }


    [WebMethod]
    public static string decryptData(string value)
    {
        return cl_encrypt.Decrypt(value);
    }
}