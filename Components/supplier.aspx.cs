using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_supplier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getAdminDetails();
    }

    public void getAdminDetails()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.Type = 25;
        ds = ca.fn_admin_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }
        else
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = "";
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }

        //StoreName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
        //      ds.Tables[0].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[0].Rows[0]["CITY"].ToString() +
        //      "</p>";
    }
    [WebMethod]
    public static string InsertSupplier(string Supplier_Name, string Invoice_Date, string Invoice_Number, string Invoice_Amount, string Paid_Amount)
    {
        HttpContext.Current.Session["Invoice_Details"] = Supplier_Name + "," + Invoice_Date + "," + Invoice_Number + "," + Invoice_Amount + "," + Paid_Amount;
        return "1";
    }

    [WebMethod]
    public static string getlastFiveInvoices()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.Type = 86;
        ds = ca.fn_admin_Data();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return Total;
    }
    public static string DataTableToJSONWithStringBuilder(DataTable table)
    {
        var JSONString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            JSONString.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                JSONString.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    if (j < table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == table.Columns.Count - 1)
                    {
                        JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == table.Rows.Count - 1)
                {
                    JSONString.Append("}");
                }
                else
                {
                    JSONString.Append("},");
                }
            }
            JSONString.Append("]");
        }
        return JSONString.ToString();
    }

    [WebMethod]
    public static string getInvoices(string FindData)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.Type = 87;
        ca.BUSINESS = FindData;
        ds = ca.fn_admin_Data();
        string DataConverted = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            DataConverted = DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return DataConverted;
    }
    [WebMethod]
    public static string getInvoicesByInvoiceNo(string Invoice_No)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.Type = 88;
        ca.BUSINESS = Invoice_No;
        ds = ca.fn_admin_Data();
        string DataConverted = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            DataConverted = DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return DataConverted;
    }
}