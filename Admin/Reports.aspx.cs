using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["records"] = "2";

        if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]) && !string.IsNullOrEmpty(Request.Params["ulid"]))
        {
            string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
            string RID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());
            HttpCookie Cookie = new HttpCookie("admin_user_id");
            Cookie.Value = User_ID;
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie rid = new HttpCookie("rid");
            rid.Value = RID;
            rid.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(rid);
        }
    }

    [WebMethod]

    public static string getOverAllSalesData(string start, string end)
    {
        string Result = "";
        try
        {
            Cl_admin ca = new Cl_admin();
            ca.Type = 96;
            ca.START_DATE = start;
            ca.END_DATE = end;
            ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            DataSet ds = ca.fn_insert_stealdeaal();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Result = cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]);
            }
             
            return Result;
        }
        catch (Exception ex)
        {
            Result = ex.Message;
        }
        return Result;
    }
}