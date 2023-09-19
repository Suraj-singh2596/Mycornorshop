using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_quick_menu_catalogue : System.Web.UI.Page
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

            HttpCookie user_type = new HttpCookie("user_type");
            user_type.Value = "retailer";
            user_type.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(user_type);

            StoreName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
              ds.Tables[0].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[0].Rows[0]["CITY"].ToString() +
              "</p>";
        }
        else
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = "";
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }



    }
    [WebMethod]
    public static string getCategoryNames()
    {
        string CG_Names = "";
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Type = 52;
        DataSet ds = cr.getRetailerDataDetails();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                CG_Names = CG_Names + "<div class=\"cascade-slider-item cat_list\" cgid='" + DR["CGID"].ToString() + "'>" + DR["CG_NAME"].ToString() + "</div>";
            }
        }

        return CG_Names;
    }

    [WebMethod]

    public static string getListByCGName(string CG_Name)
    {
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Type = 53;
        cr.CG_Name = CG_Name;
        DataSet ds = cr.getRetailerDataDetailsByCGName();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = DataTableToJSONWithStringBuilder(ds.Tables[0]);

        }
        return Total;
    }
    [WebMethod]

    public static string getListByCGNamerRetailer(string CG_Name)
    {
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Type = 54;
        cr.CG_Name = CG_Name;
        DataSet ds = cr.getRetailerDataDetailsByCGName();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = DataTableToJSONWithStringBuilder(ds.Tables[0]);

        }
        return Total;
    }

    [WebMethod]

    public static string searchGeneralList(string search)
    {
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Type = 59;
        cr.CG_Name = search;
        DataSet ds = cr.getRetailerDataDetailsByCGName();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = DataTableToJSONWithStringBuilder(ds.Tables[0]);

        }
        return Total;
    }
    [WebMethod]

    public static string searchRetailerList(string search)
    {
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Type = 60;
        cr.CG_Name = search;
        DataSet ds = cr.getRetailerDataDetailsByCGName();
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

    public static string fnActionTaken(string Flag, string MID, string Item_Name, string Comment, string Price, string MRP, string Local_Name, string Barcode)
    {
        Cl_admin cr = new Cl_admin();
        cr.MID = MID;
        cr.Flag = Flag;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.NAME = Item_Name;
        cr.DESCRIPTION = Comment;
        cr.PRICE = Price;
        cr.MRP = MRP;
        cr.LOCAL_NAME = Local_Name;
        cr.Barcode = Barcode;
        cr.Type = 57;
        DataSet ds = cr.fn_Insertitemsadmin();
        string tr = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (Flag == "Y")
            {
                tr = "<tr role=\"row\" class=\"odd\">" +
                   "<td class=\"sorting_1\">" + ds.Tables[0].Rows[0]["NAME"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["IMAGE_URL"].ToString() + "</td> " +
                   "<td>" + ds.Tables[0].Rows[0]["BARCODE"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["SUB_CATEGORY"].ToString() + "</td><td><button type=\"button\" class=\"btn btnstyle Remove\" mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "'>Remove</button></td></tr>";
            }
            if (Flag == "N")
            {
                tr = "<tr role=\"row\" class=\"odd\">" +
                    "<td class=\"sorting_1\">" + ds.Tables[0].Rows[0]["NAME"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["IMAGE_URL"].ToString() + "</td> " +
                    "<td>" + ds.Tables[0].Rows[0]["BARCODE"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["SUB_CATEGORY"].ToString() + "</td><td><button type=\"button\" class=\"btn btnstyle Add\" mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "'>Add</button></td></tr>";
            }
            if (Flag == "Z")
            {
                tr = "<td class=\"sorting_1\">" + ds.Tables[0].Rows[0]["NAME"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["IMAGE_URL"].ToString() + "</td> " +
                   "<td>" + ds.Tables[0].Rows[0]["BARCODE"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["SUB_CATEGORY"].ToString() + "</td><td><button type=\"button\" class=\"btn btnstyle Remove\" mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "'>Remove</button></td>";
            }
        }

        return tr;
    }

    [WebMethod]

    public static string Getmenubymid(string mid, string flag)
    {
        Cl_admin cr = new Cl_admin();
        cr.MID = mid;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Flag = flag;
        cr.Type = 58;
        DataSet ds = cr.fn_Insertitemsadmin();
        string tr = "";
        string title = "Update Item";
        string btn = "<div class=\"col-6\"><a class=\"btn btn-primary w-100 btnstyle\" mid='" + mid + "' id=\"UpdateItemInMyList\" href=\"javascript:void(0);\">Update Item</a></div>";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {

            if (flag.ToUpper() == "ADD")
            {
                title = "Add item";
                btn = "<div class=\"col-6\"><a class=\"btn btn-primary w-100 btnstyle\" mid='" + mid + "' id=\"AddItemToList\" href=\"javascript:void(0);\">Add Item</a></div>";
            }

            tr = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\">" +
                "<h5 class=\"modal-title\" id=\"\">" + title + "</h5><button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">" +
                "<span aria-hidden=\"true\">×</span></button></div><div class=\"modal-body\">" +
                "<div class=\"row\"><div class=\"col-sm-12 text-center\"><img  style=\"width:80px!important;\" src=\"https://mycornershop.in/Menu_Pics/" + ds.Tables[0].Rows[0]["IMAGE_URL"].ToString() + "\"/></div></div>" +
                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                "<label for=\"Item_Name\" class=\"control-label\">Name</label>" +
                "<input type=\"text\" id=\"Item_Name\" value=\"" + ds.Tables[0].Rows[0]["NAME"].ToString() + "\" class=\"form-control\" /></div>" +
                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                "<label for=\"Item_Desc\" class=\"control-label\"> Description </label>" +
                "<input type=\"text\" id=\"Item_Desc\" value=\"" + ds.Tables[0].Rows[0]["DESCRIPTION"].ToString() + "\" class=\"form-control\" /></div>" +
               "<div class=\"row\">" +
                 "<div class=\"col-6\"> " +
                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                "<label for=\"Item_Price\" class=\"control-label\">Price</label>" +
                "<input type=\"text\" id=\"Item_Price\" value=\"" + ds.Tables[0].Rows[0]["PRICE"].ToString() + "\" class=\"form-control\" /></div>" +
                "</div>" +
                 "<div class=\"col-6\"> " +
                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                "<label for=\"Item_MRP\" class=\"control-label\">MRP</label>" +
                "<input type=\"text\" value=\"" + ds.Tables[0].Rows[0]["MRP"].ToString() + "\" id=\"Item_MRP\" class=\"form-control\"></div>" +
                     "</div>" +
                 "</div>" +
                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                "<label for=\"Item_Local_Name\" class=\"control-label\"> Local Name</label>" +
                "<input id=\"Item_Local_Name\" class=\"form-control\" value=\"" + ds.Tables[0].Rows[0]["LOCAL_NAME"].ToString() + "\" type=\"text\" /></div>" +
                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                "<label for=\"Item_Barcode\" class=\"control-label\">Barcode</label>" +
                "<input id=\"Item_Barcode\" type=\"text\"value=\"" + ds.Tables[0].Rows[0]["BARCODE"].ToString() + "\" class=\"form-control\" /></div>" +
                "<div class=\"row\"><div class=\"col-6\"><button class=\"btn btn-secondary w-100 btnstyle\" type=\"button\" data-dismiss=\"modal\">Cancel</button>" +
                "</div>" + btn +
                "</div></div></div></div>";

        }

        return tr;
    }


}