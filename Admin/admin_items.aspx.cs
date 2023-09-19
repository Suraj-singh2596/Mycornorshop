using Newtonsoft.Json.Serialization;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        getAdminDetails();
        trrigernotification();
    }

    public void trrigernotification()
    {
        Send_Notification.SendNotificationFromFirebaseCloudIOS("2", "dHVnf1jL4UADsndlynuAfH:APA91bE6QmgjJFMCun8wdFDySPxB3ABsK4Enq9sRRYMn78DOaNaGgY31PuNw48t3UuNV9bP2Iz7-j_FfHybL53OKdcH6gy2cfUP6zwFAcyYhdbtQ30p0GZQA3i2lnuovQ9ZTtldA1g7C",
            "https://mycornershop.in/Components/supplier.aspx", "IOS Test Title",
            "IOS Test Message",1);
    }

    [WebMethod]
    public static string getItemAndOffersCount()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.Type = 30;
        ds = ca.fn_admin_Data();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = ds.Tables[0].Rows[0]["STEAL_DEAL_COUNT"].ToString() + "|" + ds.Tables[0].Rows[0]["DEALS_COUNT"].ToString() + "|" + ds.Tables[0].Rows[0]["OFFERS_COUNT"].ToString() + "|" +
             ds.Tables[0].Rows[0]["ITEMS_COUNT"].ToString();

            HttpCookie user_type = new HttpCookie("user_type");
            user_type.Value = "retailer";
            user_type.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(user_type);
        }
        return Total;
    }


    [WebMethod]
    public static string getAllItems()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.Type = 31;
        ds = ca.fn_admin_Data();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = SerializeObject(ds);

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

    public static string fnAddNewItem(string MID, string Flag)
    {
        string tags = string.Empty;
        string values = string.Empty;
        Cl_admin objitem = new Cl_admin();
        objitem.BUSINESS = HttpContext.Current.Request.Cookies["business"].Value.ToString();
        objitem.MID = MID;
        objitem.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objitem.Type = 7;
        DataSet Ds = new DataSet();
        Ds = objitem.fn_admin_Data();
        string Category_options = "";
        string Category_options2 = "";
        string selectCategory = "";
        string selectCategory2 = "";
        string cgid = "";
        string modal = "";
        if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        {

            if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[3].Rows.Count > 0)
            {
                foreach (DataRow DR in Ds.Tables[0].Rows)
                {
                    string Tag = Ds.Tables[3].Rows[0]["TAGS"].ToString();
                    string[] TagsRelated = Tag.Split('|');
                    string flag = "0";
                    foreach (string Tagged in TagsRelated)
                    {
                        if (Tagged == DR["TAG_NAME"].ToString())
                        {
                            tags = tags + "<div class=\"selectedtag tagselect\">" + DR["TAG_NAME"].ToString() + "</div>";
                            flag = "1";
                        }
                    }
                    if (flag == "0")
                    {
                        tags = tags + "<div class=\"tagscss tagselect\">" + DR["TAG_NAME"].ToString() + "</div>";
                    }

                }
                values = " <div class=\"row\">" + tags + "</div>";
            }
            else
            {
                foreach (DataRow DR in Ds.Tables[0].Rows)
                {
                    tags = tags + "<div class=\"tagscss tagselect\">" + DR["TAG_NAME"].ToString() + "</div>";
                }
                values = " <div class=\"row\">" + tags + "</div>";
            }


        }
        if (Ds != null && Ds.Tables[1].Rows.Count > 0 && Ds.Tables.Count > 0)
        {
            foreach (DataRow DR in Ds.Tables[1].Rows)
            {
                if (MID != "")
                {
                    if (Ds.Tables[3].Rows[0]["CGID"].ToString() == DR["CGID"].ToString())
                    {
                        Category_options = Category_options + "<option selected cgid=\"" + DR["CGID"].ToString() + "\">" + DR["CG_NAME"].ToString() + "</option>";
                        cgid = DR["CGID"].ToString();
                    }
                    else
                    {
                        Category_options = Category_options + "<option cgid=\"" + DR["CGID"].ToString() + "\">" + DR["CG_NAME"].ToString() + "</option>";
                    }
                }
                else
                {
                    Category_options = Category_options + "<option cgid=\"" + DR["CGID"].ToString() + "\">" + DR["CG_NAME"].ToString() + "</option>";
                    cgid = Ds.Tables[1].Rows[0]["CGID"].ToString();
                }


            }
            selectCategory = "<select id=\"Category\" class=\"form-control\">" + Category_options + "</select>";

        }
        if (Ds != null && Ds.Tables[2].Rows.Count > 0)
        {
            string abc = "";
            foreach (DataRow DR in Ds.Tables[2].Rows)
            {
                if (MID != "")
                {
                    if (Ds.Tables[3].Rows[0]["MCID"].ToString() == DR["MCID"].ToString())
                    {
                        Category_options2 = Category_options2 + "<option selected cgid=\"" + DR["CGID"].ToString() + "\" mtid='" + DR["MTID"].ToString() + "'  mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</option>";
                    }
                    else
                    {
                        Category_options2 = Category_options2 + "<option class=\"d-none\" cgid=\"" + DR["CGID"].ToString() + "\" mtid='" + DR["MTID"].ToString() + "'  mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</option>";
                    }
                }
                else
                {
                    if (cgid != "" && cgid == DR["CGID"].ToString() && abc == "")
                    {
                        Category_options2 = Category_options2 + "<option selected cgid=\"" + DR["CGID"].ToString() + "\" mtid='" + DR["MTID"].ToString() + "'  mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</option>";
                        abc = "1";
                    }
                    else if (cgid != "" && cgid == DR["CGID"].ToString() && abc == "1")
                    {
                        Category_options2 = Category_options2 + "<option cgid=\"" + DR["CGID"].ToString() + "\" mtid='" + DR["MTID"].ToString() + "'  mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</option>";
                        abc = "1";
                    }
                    else
                    {
                        Category_options2 = Category_options2 + "<option class=\"d-none\" cgid=\"" + DR["CGID"].ToString() + "\" mtid='" + DR["MTID"].ToString() + "'  mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</option>";
                    }

                }


            }
            selectCategory2 = "<select id=\"subcategorys\" class=\"form-control\">" + Category_options2 + "</select>";

        }
        if (MID == "")
        {
            modal = "";

            modal = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\">" +
                          "<h5 class=\"modal-title\" id=\"exampleModalLabel\">Add Item</h5>" +
                          "<button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>" +
                          "<div class=\"modal-body\">" +

                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"QTYtypes\" class=\"control-label\">Barcode No</label>" +
                          "<input name=\"QTYtype\" type=\"text\" id=\"barcode\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          "</div>" +

                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"regular1\" class=\"control-label\">Item Name <sup> * </sup><small style=\"color:#394963\">(use '-' as separator to input item portion. eg: Daal-1kg)</small></label>" +
                          "<input type=\"text\" id=\"itemname\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\" style=\"margin-top: -7px;\">" +
                          "<label for=\"Description\" class=\"control-label\">Description</label><textarea id=\"Description\" class=\"form-control\"></textarea><span class=\"pmd-textfield-focused\"></span>" +
                          "</div>" +
                          "<div class=\"row\"><div class=\"col-12\">" +
                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"regular1\" class=\"control-label\">Category</label><div id=\"option1\">" + selectCategory + "</div>" +
                          "</div></div>" +
                          "<div class=\"col-2 d-none\"><i id=\"addcategorybtn\" class=\"fa fa-plus-square fa-2x\" aria-hidden=\"true\" style=\"margin-top: 30px; color: #4e73df;\"></i></div>" +
                          "</div><div class=\"row\"><div class=\"col-12\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"regular1\" class=\"control-label\">Sub Category</label><div id=\"option2\">" + selectCategory2 + "</div></div></div><div class=\"col-2 d-none\"><i id=\"addsub_category\" class=\"fa fa-plus-square fa-2x\" aria-hidden=\"true\" style=\"color: #4e73df;\"></i></div></div>" +
                          "<div class=\"row\"><div class=\"col-md-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"localname\" class=\"control-label\">Local Name</label><input type=\"text\" id=\"localname\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          "</div></div></div>" +
                          "<div class=\"row\"><div class=\"col-md-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                          "<label for=\"regular1\" class=\"control-label\">MRP</label><input type=\"number\" id=\"mrp\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          "</div></div><div class=\"col-md-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"regular1\" class=\"control-label\">Selling Price</label><input type=\"number\" id=\"sprice\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          "</div></div></div>" +
                          //"<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          //"<label for=\"QTYtypes\" class=\"control-label\">Barcode No</label>" +
                          //"<input name=\"QTYtype\" type=\"text\" id=\"barcode\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          //"</div>" +
                          "<a href=\"javascript:void(0);\" id=\"Gstdetails\" class=\" d-sm-inline-block btn btn-sm btn-primary shadow-sm\"><i class=\"fa fa-plus fa-sm text-white-50\"></i>Add GST Details</a>" +
                          "<br><br><div id=\"gstform\" style=\"display: none;\"><div class=\"row\"><div class=\"col-6\">" +
                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"GSTPERCENT\" class=\"control-label\">" +
                          "GST Percentage</label><input type=\"number\" id=\"GSTPERCENT\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          "</div></div><div class=\"col-6\">" +
                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\" style=\"\">" +
                          "<label for=\"regular1\" class=\"control-label\">GST Included</label><select id=\"GSTINCLUDED\" class=\"form-control\">" +
                          "<option value=\"Y\">Yes</option><option value=\"N\">No</option></select><span class=\"pmd-textfield-focused\"></span></div></div><div class=\"col-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                          "<label for=\"Hsnnumber\" class=\"control-label\">HSN No.</label><input type=\"text\" id=\"Hsnnumber\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
                          "</div></div></div></div>" +
                          "<a href=\"javascript:void(0);\" id=\"Addtags\" class=\" d-sm-inline-block btn btn-sm btn-primary shadow-sm\"><i class=\"fa fa-plus fa-sm text-white-50\"></i>Add Tags</a>" +
                          "<br><br><div id=\"tagsnames\" style=\"display:none;\">" + values + "</div>" +


                          "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" style=\"width: 100px;\" class=\"control-label\"></label>" +
                            "<div id=\"status\"></div>" +
                            "<input type=file accept=\"image/*\" capture=\"camera\" onchange=\"+readURL(this)\" class=\"img-upload-input\" editor=\"#img-upload-panel\" target=\"#image\" status=\"#status\" passurl=\"\" pshape=\"square\" w=300 h=300 size=\"{150,150}\"/>" +

                            //  "<input type=\"file\"  accept=\"image/*\" name=\"image\" id=\"file\"  onchange=\"loadFile(event)\" style=\"display: none;\">" +
                            "<label for=\"file\" style=\"cursor: pointer;\"></label><img src=\"\" alt=\"\" id=\"image\"/>" +
                          "<br><br>" +
                           "</div></div>" +
                            "<div class=\"modal-footer\">" +
                          "<button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>" +
                          "<a id=\"submititems\" class=\"btn btn-primary\" mid='" + MID + "' flag='" + Flag + "' href=\"javascript:void(0);\">Submit</a>" +

                          "</div>";
        }
        else
        {
            if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[3].Rows.Count > 0)
            {
                modal = "";

                modal = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\">" +
             "<h5 class=\"modal-title\" id=\"exampleModalLabel\">Add Item</h5>" +
             "<button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>" +
             "<div class=\"modal-body\">" +
             "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"regular1\" class=\"control-label\">Item Name</label>" +
             "<input type=\"text\" value='" + Ds.Tables[3].Rows[0]["NAME"].ToString() + "' id=\"itemname\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
             "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\" style=\"margin-top: -7px;\">" +
             "<label for=\"Description\" class=\"control-label\">Description</label><textarea id=\"Description\" class=\"form-control\">" + Ds.Tables[3].Rows[0]["DESCRIPTION"].ToString() + "</textarea><span class=\"pmd-textfield-focused\"></span>" +
             "</div>" +
             "<div class=\"row\"><div class=\"col-12\">" +
             "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"regular1\" class=\"control-label\">Category</label><div id=\"option1\">" + selectCategory + "</div>" +
             "</div></div>" +
             "<div class=\"col-2 d-none\"><i id=\"addcategorybtn\" class=\"fa fa-plus-square fa-2x\" aria-hidden=\"true\" style=\"margin-top: 30px; color: #4e73df;\"></i></div>" +
             "</div><div class=\"row\"><div class=\"col-12\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"regular1\" class=\"control-label\">Sub Category</label><div id=\"option2\">" + selectCategory2 + "</div></div></div><div class=\"col-2 d-none\"><i id=\"addsub_category\" class=\"fa fa-plus-square fa-2x\" aria-hidden=\"true\" style=\"color: #4e73df;\"></i></div></div>" +
             "<div class=\"row\"><div class=\"col-md-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"localname\" class=\"control-label\">Local Name</label><input type=\"text\" value='" + Ds.Tables[3].Rows[0]["LOCAL_NAME"].ToString() + "' id=\"localname\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
             "</div></div></div>" +
             "<div class=\"row\"><div class=\"col-md-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
             "<label for=\"regular1\" class=\"control-label\">MRP</label><input type=\"number\" value='" + Ds.Tables[3].Rows[0]["MRP"].ToString() + "' id=\"mrp\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
             "</div></div><div class=\"col-md-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"regular1\" class=\"control-label\">Selling Price</label><input type=\"number\" value='" + Ds.Tables[3].Rows[0]["PRICE"].ToString() + "' id=\"sprice\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
             "</div></div></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"QTYtypes\" class=\"control-label\">Barcode No</label>" +
             "<input name=\"QTYtype\" type=\"text\" id=\"barcode\" value='" + Ds.Tables[3].Rows[0]["BARCODE"].ToString() + "' class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
             "</div>" +
             "<a href=\"javascript:void(0);\" id=\"Gstdetails\" class=\" d-sm-inline-block btn btn-sm btn-primary shadow-sm\"><i class=\"fa fa-plus fa-sm text-white-50\"></i>Add GST Details</a>" +
             "<br><br><div id=\"gstform\" style=\"display: none;\"><div class=\"row\"><div class=\"col-6\">" +
             "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"GSTPERCENT\" class=\"control-label\">" +
             "GST Percentage</label><input type=\"number\" value='" + Ds.Tables[3].Rows[0]["GST_PERCENTAGE"].ToString() + "' id=\"GSTPERCENT\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
             "</div></div><div class=\"col-6\">" +
             "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\" style=\"\">" +
             "<label for=\"regular1\" class=\"control-label\">GST included</label><select id=\"GSTINCLUDED\" class=\"form-control\">" +
             "<option value=\"Y\">Yes</option><option value=\"N\">No</option></select><span class=\"pmd-textfield-focused\"></span></div></div><div class=\"col-6\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
             "<label for=\"Hsnnumber\" class=\"control-label\">HSN No.</label><input type=\"text\" value='" + Ds.Tables[3].Rows[0]["HSN_NO"].ToString() + "' id=\"Hsnnumber\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span>" +
             "</div></div></div></div>" +
             "<a href=\"javascript:void(0);\" id=\"Addtags\" class=\" d-sm-inline-block btn btn-sm btn-primary shadow-sm\"><i class=\"fa fa-plus fa-sm text-white-50\"></i>Add Tags</a>" +
             "<br><br><div id=\"tagsnames\">" + values + "</div>" +


             "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" style=\"width: 100px;\" class=\"control-label\"></label>" +
               "<div id=\"status\"></div>" +
           "<input type=file accept=\"image/*\" capture=\"camera\" class=\"img-upload-input\" editor=\"#img-upload-panel\" target=\"#image\" status=\"#status\" passurl=\"\" pshape=\"square\" w=300 h=300 size=\"{150,150}\"/>" +
               //   "<input type=\"file\"  accept=\"image/*\" name=\"image\" id=\"file\"  onchange=\"loadFile(event)\" style=\"display: none;\">" +
               "<img src='" + "../Menu_Pics/" + Ds.Tables[3].Rows[0]["IMAGE_URL"].ToString() + "' alt=\"\" id=\"image1\"/><img  alt=\"\" id=\"image\"/>" +
             "<br><br>" +

             "</div></div>" +
             "<div class=\"modal-footer\">" +
             "<button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>" +
             "<a id=\"submititems\" class=\"btn btn-primary\" mid='" + MID + "' flag='" + Flag + "' href=\"javascript:void(0);\">Submit</a>" +
            "</div>";
            }
        }

        return modal;
    }

    [WebMethod]

    public static string Gettabledata()
    {
        string ret_data = string.Empty;
        string descrop = string.Empty;
        string tabledata = "";
        Cl_admin objitem = new Cl_admin();
        objitem.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objitem.Type = 4;
        DataSet Ds = new DataSet();
        Ds = objitem.fn_admin_Data();

        if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in Ds.Tables[0].Rows)
            {
                string option1 = "";
                string option2 = "";
                string opt = "";
                foreach (DataRow DRR in Ds.Tables[1].Rows)
                {
                    option1 = option1 + "<option value=\"" + DRR["CGID"].ToString() + "\">" + DRR["CG_NAME"].ToString() + "</option>";
                }
                foreach (DataRow DRRR in Ds.Tables[2].Rows)
                {
                    option2 = option2 + "<option value=\"" + DRRR["MCID"].ToString() + "\">" + DRRR["CATEGORY_NAME"].ToString() + "</option>";
                }

                string gstinclude = "";

                if (DR["DESCRIPTION"].ToString() == "")
                {
                    descrop = "----------";
                }
                else
                {
                    descrop = DR["DESCRIPTION"].ToString();
                }

                if (DR["GST_INCLUDED"].ToString() == "Y")
                {
                    gstinclude = "<i class=\"fa fa-check\"></i>";
                    opt = opt + "<option value=\"Y\">Yes</option><option value=\"N\">No</option>";
                }
                else
                {
                    gstinclude = "<i class=\"fa fa-times\"></i>";
                    opt = opt + "<option value=\"N\">No</option><option value=\"Y\">Yes</option>";
                }

                ret_data = ret_data +
                                        "<tr><td><span class=\"textfield\">" + DR["ITEM_NAME"].ToString() + "</span>" +
                                        "<input type = \"text\" class=\"inputfield itmname\" tags=\"" + DR["TAGS"].ToString() + "\" hsn=\"" + DR["HSN_NO"].ToString() + "\" localname=\"" + DR["LOCAL_NAME"].ToString() + "\"  value=\"" + DR["ITEM_NAME"].ToString() + "\" /></td>" +
                                        "<td><span class=\"textfield\">" + descrop + "</span>" +
                                        "<input type = \"text\" class=\"inputfield descrption\" value=\"" + DR["DESCRIPTION"].ToString() + "\" /></td>" +
                                         "<td><span class=\"textfield\">" + DR["CG_NAME"].ToString() + "</span>" +
                                        "<select  style=\"width: 120px;\" type = \"text\" class=\"inputfield cgroup\"  ><option disabled selected value=\"" + DR["CGID"].ToString() + "\">" + DR["CG_NAME"].ToString() + "</option>" + option1 + "</select></td>" +
                                        "<td><span class=\"textfield\">" + DR["CATEGORY_NAME"].ToString() + "</span>" +
                                        "<select style=\"width: 120px;\" type = \"text\" class=\"inputfield category\"><option disabled selected value=\"" + DR["MCID"].ToString() + "\">" + DR["CATEGORY_NAME"].ToString() + "</option>" + option2 + "</select></td>" +
                                        "<td><span class=\"textfield\">" + DR["PRICE"].ToString() + "</span>" +
                                        "<input style=\"width: 60px;\" type = \"text\" class=\"inputfield price\" value=\"" + DR["PRICE"].ToString() + "\" /></td>" +
                                        "<td><span class=\"textfield\">" + DR["QTY"].ToString() + "</span>" +
                                        "<input style=\"width: 60px;\" type = \"text\" class=\"inputfield qty\" value=\"" + DR["QTY"].ToString() + "\" /></td>" +
                                        "<td><span class=\"textfield\">" + gstinclude + "</span>" +
                                        "<select style=\"width: 60px;\" type = \"text\" class=\"inputfield gstinclude\">" + opt + "</select></td>" +
                                        "<td><span class=\"textfield\">" + DR["GST_PERCENTAGE"].ToString() + "</span>" +
                                        "<input style=\"width: 60px;\" type = \"text\" class=\"inputfield gstpercent\" value=\"" + DR["GST_PERCENTAGE"].ToString() + "\" /></td>" +
                                        "<td><a class=\"editbtn\" mid='" + DR["MID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-pencil\"></i></a>&nbsp;" +
                                        "<a class=\"updatebtn\"mid='" + DR["MID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-check\"></i></a>&nbsp;" +
                                        "<a class=\"cancelbtn\" href=\"javascript:void(0);\"><i class=\"fa fa-times\"></i></a>&nbsp;" +
                                        "<a class=\"deletebtn\" mid='" + DR["MID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-trash\"></i></a></td></tr>&nbsp;";
            }

            tabledata = "" +
                                    "<thead><tr><th>ITEM NAME</th><th>DESCRIPTION</th><th>CATEGORY GROUP</th><th>CATEGORY</th><th>PRICE date</th>" +
                                     "<th>QTY/PORTION</th><th>GST INCLUDED</th><th>GST PERCENTAGE</th><th>EDIT</th></tr></thead>" +
                                    "<tbody>" + ret_data + " </tbody><tfoot> <tr> <th>ITEM NAME</th> <th>DESCRIPTION</th> <th>CATEGORY GROUP</th> <th>CATEGORY</th> <th>PRICE date</th>" +
                                    "<th>QTY/PORTION</th> <th>GST INCLUDED</th> <th>GST PERCENTAGE</th> <th>EDIT</th>" +
                                      "</tr> </tfoot>";
        }
        return tabledata;
    }

    [WebMethod]
    public static string fninsertmenuitems(string itemname, string CGID, string MCID, string localname,
       string hsnno, string price, string sellingprice, string gstpercent, string GSTIn, string ImgSource,
       string Description, string QTY, string tagname)
    {
        string dataa = "";
        string uploadfile = string.Empty;
        string amount = "";
        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName();
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName();
                    if (dInfo.GetFiles(uploadfile).Length <= 0)
                    {
                        IsImageExists = false;
                        break;
                    }
                }
            }

            using (FileStream fs = new FileStream(DocPicFilePath + uploadfile, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgSource);
                    bw.Write(data);
                    bw.Close();
                }
            }

        }
        Cl_admin CA = new Cl_admin();
        CA.CGID = CGID;
        CA.MCID = MCID;
        CA.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        CA.NAME = itemname;
        CA.DESCRIPTION = Description;
        CA.LOCAL_NAME = localname;
        CA.HSN_NO = hsnno;
        CA.TAGS = tagname.Replace(",", "");
        if (price == "")
        {
            amount = sellingprice;
        }
        else if (sellingprice == "")
        {
            amount = price;
        }
        else
        {
            amount = sellingprice;

        }
        CA.PRICE = amount;
        CA.QTY = QTY;
        CA.GST_INCLUDED = GSTIn;
        CA.GST_PERCENTAGE = gstpercent;
        CA.IMAGE_URL = uploadfile;
        CA.Type = 5;
        DataSet ds = CA.fn_Insertitemsadmin();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            dataa = ds.Tables[0].Rows[0]["Result"].ToString();
        }



        return dataa;
    }

    [WebMethod]
    public static string fninsertcategory(string cat_name, string gstpcent, string taxcmnt, string ImgSource)
    {
        string dataa = "";
        string uploadfile = string.Empty;
        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName();
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName();
                    if (dInfo.GetFiles(uploadfile).Length <= 0)
                    {
                        IsImageExists = false;
                        break;
                    }
                }
            }

            using (FileStream fs = new FileStream(DocPicFilePath + uploadfile, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgSource);
                    bw.Write(data);
                    bw.Close();
                }
            }

        }
        Cl_admin CA = new Cl_admin();
        CA.MENU_NAME = cat_name;
        CA.GST_PERCENTAGE = gstpcent;
        CA.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        CA.TAX_COMMENT = taxcmnt;
        CA.IMAGE_URL = uploadfile;
        CA.Type = 6;
        DataSet ds = CA.fn_Insertitemsadmin();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            dataa = ds.Tables[0].Rows[0]["Result"].ToString();
        }



        return dataa;
    }

    public static string GetMENUImageName()
    {

        Random random = new Random();
        int ran = random.Next(100, 999);

        string x = DateTime.Now.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        string ImageName = "";

        ImageName = "myCornershopImg-" + x + ran + ".png";

        return ImageName;
    }


    [WebMethod]

    public static string fngetReportsTotalRevenue()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.Type = 1;
        ds = ca.fn_admin_Data();
        string Revenue_Report = "<div class=\"col-xl-3 col-md-6 mb-4\"><div class=\"card border-left-primary shadow h-100 py-2\"><div class=\"card-body\">" +
                                 "<div class=\"row no-gutters align-items-center\"><div class=\"col mr-2\"><div class=\"text-xs font-weight-bold text-primary text-uppercase mb-1\">Total Revenue</div>" +
                                 "<div class=\"h5 mb-0 font-weight-bold text-gray-800\">Rs. " + ds.Tables[0].Rows[0]["TOTAL_REVENUE"].ToString() + "</div></div><div class=\"col-auto\"><i class=\"fas fa-calendar fa-2x text-gray-300\"></i>" +
                                 "</div></div></div></div></div><div class=\"col-xl-3 col-md-6 mb-4\"><div class=\"card border-left-success shadow h-100 py-2\"><div class=\"card-body\">" +
                                 "<div class=\"row no-gutters align-items-center\"><div class=\"col mr-2\"><div class=\"text-xs font-weight-bold text-success text-uppercase mb-1\">Earnings (Annual)</div>" +
                                 "<div class=\"h5 mb-0 font-weight-bold text-gray-800\">Rs. " + ds.Tables[0].Rows[0]["EARNINGS"].ToString() + "</div></div><div class=\"col-auto\"><i class=\"fas fa-dollar-sign fa-2x text-gray-300\"></i>" +
                                 "</div></div></div></div></div><div class=\"col-xl-3 col-md-6 mb-4\"><div class=\"card border-left-info shadow h-100 py-2\"><div class=\"card-body\">" +
                                 "<div class=\"row no-gutters align-items-center\"><div class=\"col mr-2\"><div class=\"text-xs font-weight-bold text-warning text-uppercase mb-1\">Total Orders</div>" +
                                 "<div class=\"h5 mb-0 font-weight-bold text-gray-800\">" + ds.Tables[0].Rows[0]["TOTAL_ORDERS"].ToString() + "</div></div><div class=\"col-auto\"><i class=\"fas fa-clipboard-list fa-2x text-gray-300\"></i>" +
                                 "</div></div></div></div></div><div class=\"col-xl-3 col-md-6 mb-4\"><div class=\"card border-left-warning shadow h-100 py-2\"><div class=\"card-body\">" +
                                 "<div class=\"row no-gutters align-items-center\"><div class=\"col mr-2\"><div class=\"text-xs font-weight-bold text-warning text-uppercase mb-1\">Pending Orders</div>" +
                                 "<div class=\"h5 mb-0 font-weight-bold text-gray-800\">" + ds.Tables[0].Rows[0]["PENDING_ORDERS"].ToString() + "</div></div><div class=\"col-auto\"><i class=\"fas fa-comments fa-2x text-gray-300\"></i>" +
                                 "</div></div></div></div></div>";

        return Revenue_Report;
    }

    [WebMethod]

    public static string fngetEarningOverview()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.Type = 2;
        ds = ca.fn_admin_Data();
        string Earning = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Earning = Earning + DR["TOTAL_EARNING_MONTH_WISE"].ToString() + ",";
            }

        }
        return Earning;
    }

    [WebMethod]

    public static string fngetRevenueSource()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.Type = 3;
        ds = ca.fn_admin_Data();
        string Amount = "";
        string MOP = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Amount = Amount + DR["RECEIVED_AMOUNT"].ToString() + ",";
                MOP = MOP + DR["MOP"].ToString() + ",";
            }


        }
        return Amount + "|" + MOP;
    }


    [WebMethod]

    public static string fnUpdateMenuItem(string Item_Name, string MTID, string MCID, string LocalName, string HSN_No, string MRP
        , string Selling_Price, string GST_Percentage, string GST_Included, string ImgSource, string Description,
        string selectedTags, string MID, string Flag, string Barcode)
    {

        string dataa = "";
        string uploadfile = "";
        string amount = "";
        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName();
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName();
                    if (dInfo.GetFiles(uploadfile).Length <= 0)
                    {
                        IsImageExists = false;
                        break;
                    }
                }
            }

            using (FileStream fs = new FileStream(DocPicFilePath + uploadfile, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgSource);
                    bw.Write(data);
                    bw.Close();
                }
            }

        }

        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.MENU_NAME = Item_Name;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.MCID = MCID;
        ca.LOCAL_NAME = LocalName;
        ca.MTID = MTID;
        ca.HSN_NO = HSN_No;
        ca.MRP = MRP;
        ca.PRICE = Selling_Price;
        ca.GST_PERCENTAGE = GST_Percentage;
        ca.GST_INCLUDED = GST_Included;
        ca.IMAGE_URL = uploadfile;
        ca.DESCRIPTION = Description;
        ca.TAGS = selectedTags;
        ca.MID = MID;
        ca.Barcode = Barcode;
        ca.Flag = Flag;
        ca.Type = 5;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ds = ca.fn_Insertitemsadmin();
        string row_g = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0 && Flag == "ADD")
        {
            row_g = "<tr role=\"row\" class=\"odd\"><td class=\"sorting_1\"><label class=\"switch\">" +
                            "<input available=\"Y\" mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "' class=\" avability\" type=\"checkbox\" checked=\"\">" +
                            "<span class=\"slider round\"></span></label></td><td>1</td><td>" + ds.Tables[0].Rows[0]["NAME"].ToString() + "</td>" +
                            "<td>" + ds.Tables[0].Rows[0]["DESCRIPTION"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["CATEGORY_NAME"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["CG_NAME"].ToString() + "</td>" +
                            "<td>" + ds.Tables[0].Rows[0]["PRICE"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["MRP"].ToString() + "</td><td>" + ds.Tables[0].Rows[0]["GST_INCLUDED"].ToString() + "</td>" +
                            "<td>" + ds.Tables[0].Rows[0]["GST_PERCENTAGE"].ToString() + "</td><td><i mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "' name='" + ds.Tables[0].Rows[0]["NAME"].ToString() + "' class=\"fa fa-edit editItem\"></i>" +
                            "<i mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "' name='" + ds.Tables[0].Rows[0]["NAME"].ToString() + "' class=\"fa fa-tick d-none tickItem\"></i></td><td>" +
                            "<i mid='" + ds.Tables[0].Rows[0]["MID"].ToString() + "' name='" + ds.Tables[0].Rows[0]["NAME"].ToString() + "' class=\"fa fa-trash deleteItem\"></i></td></tr>";
        }

        return row_g;
    }

    [WebMethod]
    public static string fnDeleteItem(string MID)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.MID = MID;
        ca.Type = 11;
        ds = ca.fn_admin_Data();
        return "1";
    }

    [WebMethod]
    public static string fnGetStealDealModal(string SDID)
    {
        string a = "";
        if (SDID == "")
        {
            a = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\">" +
            "<h5 class=\"modal-title\" id=\" \">Add Steal Deals</h5><button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">" +
            "<span aria-hidden=\"true\">×</span></button></div><div class=\"modal-body\">" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
            "<label for=\"regular1\" class=\"control-label\">Item(s) Name</label>" +
            "<input id=\"stealitems\"  placeholder=\"Search items for stealdeal\" class=\"form-control\"/><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">" +
            "Portion(Kg/gm/l/ml)</label><input type=\"text\" id=\"stealportion\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">Regular Price</label>" +
            "<input type=\"text\" id=\"regularprice\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
            "<label for=\"regular1\" class=\"control-label\">Selling Price</label>" +
            "<input type=\"number\" id=\"offerprice\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +

            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">Start Date (mm/dd/yyyy)</label>" +
            "<input class=\"form-control datepick\" type=\"date\" id=\"datepicker\" /><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">End Date (mm/dd/yyyy)</label>" +
            "<input type=\"date\" id=\"enddate\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Min Order amount with this offer</label>" +
            "<input type=\"number\" id=\"minorder\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +

            "<div class=\"row\">" +
            "<div class=\"col-6\"><div class=\"form-group \"><label class=\"control-label\">Choose week days for offer</label>" +
             "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" value=\"Y\" id=\"customCheck1\">" +
     " <label class=\"custom-control-label\" for=\"customCheck1\">Sunday</label></div>" +
             "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"customCheck2\">" +
            "<label class=\"custom-control-label\" for=\"customCheck2\">Monday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"customCheck3\">" +
     " <label class=\"custom-control-label\" for=\"customCheck3\">Tuesday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"customCheck4\">" +
     " <label class=\"custom-control-label\" for=\"customCheck4\">Wednesday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"customCheck5\">" +
     " <label class=\"custom-control-label\" for=\"customCheck5\">Thursday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"customCheck6\">" +
     " <label class=\"custom-control-label\" for=\"customCheck6\">Friday</label></div>" +
     "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"customCheck7\">" +
     " <label class=\"custom-control-label\" for=\"customCheck7\">Saturday</label></div>" +

            "</div></div>" +
             "<div class=\"col-6\">" +
             "<div class=\"form-group\" style=\"\"><label class=\"control-label\">Offer for Odd/Even Days</label>" +
            "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"odd\">" +
          "<label class=\"custom-control-label\" for=\"odd\">ODD</label></div>" +
          "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"even\">" +
          "<label class=\"custom-control-label\" for=\"even\">EVEN</label></div>" +
       "</div></div></div>" +



            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Offer Selection Option</label>" +
            "<select type=\"text\" id=\"offerselection\" class=\"form-control\"><option selected value=\"\">None</option><option value=\"ONCE_IN_MONTH\">Once in month</option><option value=\"ONCE_IN_WEEK\">Once in week</option></select><span class=\"pmd-textfield-focused\"></span></div></div><div class=\"modal-footer\">" +
            "<button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button><a class=\"btn btn-primary\" id=\"AddStealDealbtn\" href=\"javascript:void(0);\">Create Steal Deal</a>" +
            "</div></div>";
        }
        else
        {
            Cl_admin objAdmin = new Cl_admin();
            objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            objAdmin.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            objAdmin.SDID = SDID;
            objAdmin.Type = 32;
            DataSet ds = new DataSet();
            ds = objAdmin.fn_insert_stealdeaal();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                a = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\">" +
            "<h5 class=\"modal-title\" id=\" \">Update Steal Deal</h5><button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">" +
            "<span aria-hidden=\"true\">×</span></button></div><div class=\"modal-body\">" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
            "<label for=\"regular1\" class=\"control-label\">Item(s) Name</label>" +
            "<input value='" + ds.Tables[0].Rows[0]["ITEM_NAME"].ToString() + "'  readonly class=\"form-control\"/><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">" +
            "Portion(Kg/gm/l/ml)</label><input type=\"text\" readonly value='" + ds.Tables[0].Rows[0]["PORTION"].ToString() + "' class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">Regular Price</label>" +
            "<input type=\"text\" readonly value='" + ds.Tables[0].Rows[0]["REGULAR_PRICE"].ToString() + "' class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
            "<label for=\"regular1\" class=\"control-label\">Selling Price</label>" +
            "<input type=\"number\" id=\"offerprice\" value='" + ds.Tables[0].Rows[0]["OFFER_PRICE"].ToString() + "' class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +

            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-v-label-completed\"><label for=\"regular1\" class=\"control-label\">Start Date (mm/dd/yyyy)</label>" +
            "<input class=\"form-control datepick\" value='" + Convert.ToDateTime(ds.Tables[0].Rows[0]["START_DATE"]).ToString("yyyy-MM-dd") + "' type =\"date\" id=\"datepicker\" /><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">End Date (mm/dd/yyyy)</label>" +
            "<input type=\"date\" id=\"enddate\" value='" + Convert.ToDateTime(ds.Tables[0].Rows[0]["END_DATE"]).ToString("yyyy-MM-dd") + "' class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Min Order amount with this offer</label>" +
            "<input type=\"number\" value='" + ds.Tables[0].Rows[0]["MIN_ORDER"].ToString() + "' id=\"minorder\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +

            "<div class=\"row\">" +
            "<div class=\"col-6\"><div class=\"form-group \"><label class=\"control-label\">Choose week days for offer</label>" +
             "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["MON"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck1\">" +
     " <label class=\"custom-control-label\" for=\"customCheck1\">Sunday</label></div>" +
             "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["TUE"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck2\">" +
            "<label class=\"custom-control-label\" for=\"customCheck2\">Monday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["WED"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck3\">" +
     " <label class=\"custom-control-label\" for=\"customCheck3\">Tuesday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["THU"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck4\">" +
     " <label class=\"custom-control-label\" for=\"customCheck4\">Wednesday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["FRI"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck5\">" +
     " <label class=\"custom-control-label\" for=\"customCheck5\">Thursday</label></div>" +
    "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["SAT"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck6\">" +
     " <label class=\"custom-control-label\" for=\"customCheck6\">Friday</label></div>" +
     "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["SUN"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"customCheck7\">" +
     " <label class=\"custom-control-label\" for=\"customCheck7\">Saturday</label></div>" +

            "</div></div>" +
             "<div class=\"col-6\">" +
             "<div class=\"form-group\" style=\"\"><label class=\"control-label\">Offer for Odd/Even Days</label>" +
            "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["ODDDAYS"].ToString() == "Y" ? "checked" : "") + "  value=\"Y\" id=\"odd\">" +
          "<label class=\"custom-control-label\" for=\"odd\">ODD</label></div>" +
          "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" " + Convert.ToString(ds.Tables[0].Rows[0]["EVENDAYS"].ToString() == "Y" ? "checked" : "") + " value=\"Y\" id=\"even\">" +
          "<label class=\"custom-control-label\" for=\"even\">EVEN</label></div>" +
       "</div></div></div>" +



            "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Offer Selection Option</label>" +
            "<select type=\"text\" id=\"offerselection\" class=\"form-control\"><option " + Convert.ToString(ds.Tables[0].Rows[0]["ORDER_SELECTION"].ToString() == "" ? "selected" : "") + " value=\"\">None</option>" +
            "<option '" + Convert.ToString(ds.Tables[0].Rows[0]["ORDER_SELECTION"].ToString() == "ONCE_IN_MONTH" ? "selected" : "") + "' value=\"ONCE_IN_MONTH\">Once in month</option><option '" + Convert.ToString(ds.Tables[0].Rows[0]["ORDER_SELECTION"].ToString() == "ONCE_IN_WEEK" ? "selected" : "") + "' value=\"ONCE_IN_WEEK\">Once in week</option></select><span class=\"pmd-textfield-focused\"></span></div></div><div class=\"modal-footer\">" +
            "<button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button><a class=\"btn btn-primary\" sdid='" + SDID + "' id=\"AddStealDealbtn\" href=\"javascript:void(0);\">Update Steal Deal</a>" +
            "</div></div>";
            }
        }

        return a;
    }




    [WebMethod]

    public static string GetStealDealData()
    {
        string ret_data = "";
        string descrop = string.Empty;
        string tabledata = "";
        Cl_admin objitem = new Cl_admin();
        objitem.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objitem.Type = 12;
        DataSet Ds = new DataSet();
        Ds = objitem.fn_admin_Data();

        if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in Ds.Tables[0].Rows)
            {
                string weekDay = "";
                if (DR["MON"].ToString() == "Y")
                {
                    weekDay = weekDay + "Mon ";
                }
                if (DR["TUE"].ToString() == "Y")
                {
                    weekDay = weekDay + "Tue ";
                }
                if (DR["WED"].ToString() == "Y")
                {
                    weekDay = weekDay + "Wed ";
                }
                if (DR["THU"].ToString() == "Y")
                {
                    weekDay = weekDay + "Thu ";
                }
                if (DR["FRI"].ToString() == "Y")
                {
                    weekDay = weekDay + "Fri ";
                }
                if (DR["SAT"].ToString() == "Y")
                {
                    weekDay = weekDay + "Sat ";
                }
                if (DR["SUN"].ToString() == "Y")
                {
                    weekDay = weekDay + "Sun ";
                }

                string Odd_Even = "";
                if (DR["EVENDAYS"].ToString() == "Y")
                {
                    Odd_Even = Odd_Even + "Even Days ";
                }
                if (DR["ODDDAYS"].ToString() == "Y")
                {
                    Odd_Even = Odd_Even + "Odd Days ";
                }
                string Notifbtn = "";
                if (DR["NOTIFICATION_TRIGGER_FLAG"].ToString() == "Y" && DR["NOTIFICATION_TRIGGER_FLAG"].ToString() != "")
                {
                    if (DR["NOTIFICATION_TRIGGER_COUNT"].ToString() != "0")
                    {
                        Notifbtn = "<a sdid=\"" + DR["SDID"].ToString() + "\" count=\"" + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + "\" class=\"notificationtrigrbtn notifyStealDeal btnstyle\">Notify <span class=\"notif_count\"> " + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + " <span></a>";
                    }
                    else
                    {
                        Notifbtn = "<a class=\"disablenotifibtn \">Notify <span class=\"notif_count\"> " + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + " <span></a>";
                    }


                }




                ret_data = ret_data + "<tr>" +
                    "<td><span class=\"textfield\">" + DR["ITEM_NAME"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["PORTION"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["REGULAR_PRICE"].ToString() + " / " + DR["OFFER_PRICE"].ToString() + "</span></td>" +

                    "<td><span class=\"textfield\">" + Convert.ToDateTime(DR["START_DATE"]).ToString("dd MMM yyyy") + " - " + Convert.ToDateTime(DR["END_DATE"]).ToString("dd MMM yyyy") + "</span></td>" +
                   "<td><span class=\"textfield\">" + DR["MIN_ORDER"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + weekDay + "</span></td>" +
                    "<td><span class=\"textfield\">" + Odd_Even + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["ORDER_SELECTION"].ToString() + "</span></td>" +
                     "<td><span class=\"textfield\">" + Notifbtn + "</span></td>" +
                    "<td><a class=\"editbtnstealdeal\" sdid='" + DR["SDID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-pencil\"></i></a>&nbsp;" +
                    "<a class=\"updatebtnstealdeal d-none\"sdid='" + DR["SDID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-check\"></i></a>&nbsp;" +
                    "<a class=\"cancelbtnstealdeal d-none\" href=\"javascript:void(0);\"><i class=\"fa fa-times\"></i></a>&nbsp;" +
                    "<a class=\"deletebtnstealdeal\" name='" + DR["ITEM_NAME"].ToString() + "'  sdid='" + DR["SDID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-trash\"></i></a></td>" +
                    "</tr>";

            }

            tabledata =
                                    "<thead><tr><th>ITEM NAME</th><th>PORTION</th><th>REGULAR/OFFER PRICE</th><th>START/END DATE</th><th>MIN ORDER AMOUNT</th>" +
                                     "<th>WEEK DAY</th><th>EVEN/ODD DAYS</th><th>ORDER SELECTION</th><th>NOTIFY</th><th>EDIT</th></tr></thead>" +
                                    " <tbody>" + ret_data + " </tbody> <tfoot> <tr><th>ITEM NAME</th><th>PORTION</th><th>REGULAR/OFFER PRICE</th><th>START/END DATE</th><th>MIN ORDER AMOUNT</th>" +
                                     "<th>WEEK DAY</th><th>EVEN/ODD DAYS</th><th>ORDER SELECTION</th><th>NOTIFY</th><th>EDIT</th>" +
                                      "</tr> </tfoot>";
        }
        return tabledata;
    }

    [WebMethod]

    public static string getOffersData()
    {
        string ret_data = "";
        string descrop = string.Empty;
        string tabledata = "";
        Cl_admin objitem = new Cl_admin();
        objitem.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objitem.Type = 13;
        DataSet Ds = new DataSet();
        Ds = objitem.fn_admin_Data();

        if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in Ds.Tables[0].Rows)
            {

                string Notifbtn = "";
                if (DR["NOTIFICATION_TRIGGER_FLAG"].ToString() == "Y" && DR["NOTIFICATION_TRIGGER_FLAG"].ToString() != "")
                {
                    if (DR["NOTIFICATION_TRIGGER_COUNT"].ToString() != "0")
                    {
                        Notifbtn = "<a oid=\"" + DR["OID"].ToString() + "\" count=\"" + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + "\" class=\"notificationtrigrbtn notifyoffersbtn btnstyle\">Notify <span class=\"notif_count\"> " + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + " <span></a>";
                    }
                    else
                    {
                        Notifbtn = "<a class=\"disablenotifibtn \">Notify <span class=\"notif_count\"> " + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + " <span></a>";
                    }


                }


                ret_data = ret_data + "<tr>" +
                    "<td><span class=\"textfield\">" + DR["OFFER_NAME"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["DESCRIPTION1"].ToString().Replace("~", "<br/>").Replace(",", "") + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["ORIGINAL_PRICE"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["OFFER_PRICE"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["OFFER_IMAGE"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + Notifbtn + "</span></td>" +
                    "<td><a class=\"editbtnoffer\" offer_id='" + DR["OID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-pencil\"></i></a>&nbsp;" +
                    "<a class=\"updatebtnoffer d-none\"offer_id='" + DR["OID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-check\"></i></a>&nbsp;" +
                    "<a class=\"cancelbtnoffer d-none\" href=\"javascript:void(0);\"><i class=\"fa fa-times\"></i></a>&nbsp;" +
                    "<a class=\"deletebtnoffer\" name='" + DR["OFFER_NAME"].ToString() + "' offer_id='" + DR["OID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-trash\"></i></a></td>" +

                    "</tr>";

            }

            tabledata =
                                    "<thead><tr><th>OFFER NAME</th><th>ITEMS</th><th>REGULAR PRICE</th><th>OFFER PRICE</th><th>IMAGE</th>" +
                                     "<th>NOTIFY</th><th>EDIT</th></tr></thead>" +
                                    "<tbody>" + ret_data + " </tbody>  <tfoot> <tr><th>OFFER NAME</th><th>ITEMS</th><th>REGULAR PRICE</th><th>OFFER PRICE</th><th>IMAGE</th>" +
                                     "<th>NOTIFY</th><th>EDIT</th>" +
                                      "</tr> </tfoot>";
        }
        return tabledata;
    }

    [WebMethod]

    public static string getDealData()
    {
        string ret_data = "";
        string descrop = string.Empty;
        string tabledata = "";
        Cl_admin objitem = new Cl_admin();
        objitem.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objitem.Type = 14;
        DataSet Ds = new DataSet();
        Ds = objitem.fn_admin_Data();

        if (Ds != null && Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in Ds.Tables[0].Rows)
            {
                string Notifbtn = "";
                if (DR["NOTIFICATION_TRIGGER_FLAG"].ToString() == "Y" && DR["NOTIFICATION_TRIGGER_FLAG"].ToString() != "")
                {
                    if (DR["NOTIFICATION_TRIGGER_COUNT"].ToString() != "0")
                    {
                        Notifbtn = "<a deal_id=\"" + DR["DEAL_ID"].ToString() + "\" count=\"" + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + "\" class=\"notificationtrigrbtn notifyBestOffer btnstyle\">Notify <span class=\"notif_count\"> " + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + " <span></a>";
                    }
                    else
                    {
                        Notifbtn = "<a class=\"disablenotifibtn \">Notify <span class=\"notif_count\"> " + DR["NOTIFICATION_TRIGGER_COUNT"].ToString() + " <span></a>";
                    }


                }
                ret_data = ret_data + "<tr>" +
                    "<td><span class=\"textfield\">" + DR["DEAL_NAME"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["DESCRIPTION"].ToString().Replace("~", "<br/>").Replace(",", "") + "</span></td>" +
                    "<td><span class=\"textfield\">" + HttpUtility.HtmlDecode(DR["DESCRIPTION1"].ToString().Replace("~", "<br/>").Replace(",", "")) + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["GENERAL_PRICE"].ToString() + "</span></td>" +
                    "<td><span class=\"textfield\">" + DR["OFFER_PRICE"].ToString() + "</span></td>" +

                    "<td><span class=\"textfield\">" + Convert.ToDateTime(DR["START_DATE"]).ToString("dd MMM yyyy") + " - " + Convert.ToDateTime(DR["END_DATE"]).ToString("dd MMM yyyy") + "</span></td>" +
                   "<td><span class=\"textfield\">" + Notifbtn + "</span></td>" +
                    "<td><a class=\"editbtndeal\" deal_id='" + DR["DEAL_ID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-pencil\"></i></a>&nbsp;" +
                    "<a class=\"updatebtndeal d-none\"deal_id='" + DR["DEAL_ID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-check\"></i></a>&nbsp;" +
                    "<a class=\"cancelbtndeal d-none\" href=\"javascript:void(0);\"><i class=\"fa fa-times\"></i></a>&nbsp;" +
                    "<a class=\"deletebtndeal\" name='" + DR["DEAL_NAME"].ToString() + "' deal_id='" + DR["DEAL_ID"].ToString() + "' href=\"javascript:void(0);\"><i class=\"fa fa-trash\"></i></a></td>" +
                    "</tr>";

            }

            tabledata =
                                    "<thead><tr><th>DEAL NAME</th><th>DESCRIPTION</th><th>ITEMS (with qty and options)</th><th>REGULAR PRICE</th><th>OFFER PRICE</th><th>START/END DATE</th>" +
                                     "<th>NOTIFY</th><th>EDIT</th></tr></thead>" +
                                    "<tbody>" + ret_data + " </tbody> <tfoot> <tr><th>DEAL NAME</th><th>DESCRIPTION</th><th>ITEMS (with qty and options)</th><th>REGULAR PRICE</th><th>OFFER PRICE</th><th>START/END DATE</th>" +
                                     "<th>NOTIFY</th><th>EDIT</th>" +
                                      "</tr> </tfoot> ";
        }
        return tabledata;
    }

    [WebMethod]

    public static List<cl_resturantorder> fnGetAllProducts(string Search_Value)
    {
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Search_Item = Search_Value;
        cr.Type = 17;
        ds = cr.fngetallProductsList();
        List<cl_resturantorder> result = new List<cl_resturantorder>();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].AsEnumerable().Select(i => new cl_resturantorder()
            {
                MID = Convert.ToString(Convert.ToInt32(i.Field<Int64>(0))),
                Item_Name = i.Field<string>(5),
                Qty = i.Field<string>(12),
                Price = Convert.ToString(Convert.ToInt32(i.Field<Int64>(11))),
                MRP = Convert.ToString(Convert.ToInt32(i.Field<Int64>(25))),
                Barcode = i.Field<string>(27),
                Option_Name = i.Field<string>(22),


            }).ToList();
        }

        return result;
    }


    [WebMethod]

    public static string insertstealdealdata(string Name, string Portion, string MRP, string offer_price, string start_date,
        string end_date, string MIN_order, string SUN, string MON, string TUE, string WED, string THU, string FRI, string SAT,
        string Odd, string Even, string Order_selection, string Flag, string SDID)
    {

        Cl_admin objAdmin = new Cl_admin();
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objAdmin.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        objAdmin.SDID = SDID;
        objAdmin.ITEM_ID = Name;
        objAdmin.PORTION = Portion;
        objAdmin.REGULAR_PRICE = MRP;
        objAdmin.OFFER_PRICE = offer_price;
        objAdmin.START_DATE = start_date;
        objAdmin.END_DATE = end_date;
        objAdmin.MIN_ORDER = MIN_order;
        objAdmin.SUN = SUN.Replace("undefined", "");
        objAdmin.MON = MON.Replace("undefined", "");
        objAdmin.TUE = TUE.Replace("undefined", "");
        objAdmin.WED = WED.Replace("undefined", "");
        objAdmin.THU = THU.Replace("undefined", "");
        objAdmin.FRI = FRI.Replace("undefined", "");
        objAdmin.SAT = SAT.Replace("undefined", "");
        objAdmin.ODDDAYS = Odd.Replace("undefined", "");
        objAdmin.EVENDAYS = Even.Replace("undefined", "");
        objAdmin.ORDER_SELECTION = Order_selection;
        objAdmin.Flag = Flag;
        objAdmin.Type = 18;
        DataSet ds = new DataSet();
        ds = objAdmin.fn_insert_stealdeaal();

        return "1";
    }

    /*deal --------------------------------------------*/

    [WebMethod]

    public static string gen_dealmodal(string Deal_ID)
    {
        string deal = "";
        if (Deal_ID == "")
        {
            deal = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\">" +
                               "<div class=\"modal-header\"><h5 class=\"modal-title\" id=\"\">Add Deals</h5>" +
                               "<button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">" +
                               "<span aria-hidden=\"true\">×</span></button></div><div class=\"modal-body\">" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"dealname\" class=\"control-label\">Deal Name</label>" +
                               "<input id=\"dealname\" placeholder=\"\" class=\"form-control\"/></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"dealitems\" class=\"control-label\">Deal Items</label>" +
                               "<input id=\"dealitems\" placeholder=\"Search items for deal\" class=\"form-control\"/></div>" +
                               "<div id=\"selecteditems\" class=\" \"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                               "<label for=\"regular1\" class=\"control-label\">Description</label>" +
                               "<input type=\"text\" id=\"Description\" class=\"form-control\"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"regular1\" class=\"control-label\">Qty</label>" +
                               "<input type=\"text\" id=\"itmqty\" class=\"form-control\"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"regular1\" class=\"control-label\">Regular Price</label>" +
                               "<input type=\"text\" id=\"itmprice\" class=\"form-control\"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"regular1\" class=\"control-label\">Selling Price</label>" +
                               "<input type=\"text\"  id=\"ofrprice\" class=\"form-control\"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                               "<label for=\"regular1\" class=\"control-label\">Instructions</label>" +
                               "<input type=\"text\" id=\"instruction\" class=\"form-control\"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"regular1\" class=\"control-label\">Start Date</label>" +
                               "<input type=\"date\" id=\"datestart\" class=\"form-control\"></div>" +
                               "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                               "<label for=\"regular1\" class=\"control-label\">End Date</label>" +
                               "<input type=\"date\" id=\"dateend\" class=\"form-control\"></div></div>" +
                               "<div class=\"modal-footer\"><button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>" +
                               "<a class=\"btn btn-primary\" id=\"createdeal\" href=\"javascript:void(0);\">Create Deal</a></div></div></div>";

        }
        else
        {
            Cl_admin objAdmin = new Cl_admin();
            objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            objAdmin.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            objAdmin.Deal_ID = Deal_ID;
            objAdmin.Type = 33;
            DataSet ds = new DataSet();
            ds = objAdmin.fn_insert_deal();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                deal = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\">" +
                              "<div class=\"modal-header\"><h5 class=\"modal-title\" id=\"\">Update Deal</h5>" +
                              "<button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">" +
                              "<span aria-hidden=\"true\">×</span></button></div><div class=\"modal-body\">" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"dealname\" class=\"control-label\">Deal Name</label>" +
                              "<input readonly value='" + ds.Tables[0].Rows[0]["Deal_Name"].ToString() + "' placeholder=\"\" class=\"form-control\"/></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"dealitems\" class=\"control-label\">Deal Items</label>" +
                              "<input readonly value='" + ds.Tables[0].Rows[0]["DESCRIPTION1"].ToString() + "' placeholder=\"Search items for deal\" class=\"form-control\"/></div>" +
                              "<div id=\"selecteditems\" class=\" \"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                              "<label for=\"regular1\" class=\"control-label\">Description</label>" +
                              "<input type=\"text\" value='" + ds.Tables[0].Rows[0]["Description"].ToString() + "' id=\"Description\" class=\"form-control\"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"regular1\" class=\"control-label\">Qty</label>" +
                              "<input type=\"text\" readonly value='" + ds.Tables[0].Rows[0]["QTY"].ToString() + "' id=\"itmqty\" class=\"form-control\"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"regular1\" class=\"control-label\">Regular Price</label>" +
                              "<input type=\"text\" readonly value='" + ds.Tables[0].Rows[0]["General_Price"].ToString() + "' id=\"itmprice\" class=\"form-control\"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"regular1\" class=\"control-label\">Selling Price</label>" +
                              "<input type=\"text\" value='" + ds.Tables[0].Rows[0]["Offer_Price"].ToString() + "'   id=\"ofrprice\" class=\"form-control\"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                              "<label for=\"regular1\" class=\"control-label\">Instructions</label>" +
                              "<input type=\"text\"  value='" + ds.Tables[0].Rows[0]["Instructions"].ToString() + "'  id=\"instruction\" class=\"form-control\"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"regular1\" class=\"control-label\">Start Date</label>" +
                              "<input type=\"date\" id=\"datestart\"  value='" + Convert.ToDateTime(ds.Tables[0].Rows[0]["START_DATE"]).ToString("yyyy-MM-dd") + "' class=\"form-control\"></div>" +
                              "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                              "<label for=\"regular1\" class=\"control-label\">End Date</label>" +
                              "<input type=\"date\" id=\"dateend\"  value='" + Convert.ToDateTime(ds.Tables[0].Rows[0]["END_DATE"]).ToString("yyyy-MM-dd") + "' class=\"form-control\"></div></div>" +
                              "<div class=\"modal-footer\"><button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>" +
                              "<a class=\"btn btn-primary\" deal_id='" + Deal_ID + "' id=\"createdeal\" href=\"javascript:void(0);\">Update Deal</a></div></div></div>";

            }

        }

        return deal;
    }

    [WebMethod]

    public static string insertdealitems(string dealname, string description, string itmqty, string reg_price, string ofrprice,
        string instruction, string startdate, string enddate, string MID, string dealitemsname, string Flag, string Deal_ID)
    {
        string result = string.Empty;
        Cl_admin objDeal = new Cl_admin();
        objDeal.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objDeal.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        objDeal.NAME = dealname;
        objDeal.DESCRIPTION = description;
        objDeal.QTY = itmqty;
        objDeal.REGULAR_PRICE = reg_price;
        objDeal.OFFER_PRICE = ofrprice;
        objDeal.ITEM = dealitemsname;
        objDeal.MID = MID;
        objDeal.INSTRUCTIONS = instruction;
        objDeal.START_DATE = startdate;
        objDeal.END_DATE = enddate;
        objDeal.Deal_ID = Deal_ID;
        objDeal.Flag = Flag;
        objDeal.Type = 19;
        DataSet ds = new DataSet();
        ds = objDeal.fn_insert_deal();

        return "1";
    }





    [WebMethod]
    public static string fnGetofferModal(string Offer_ID)
    {
        string ofrmdl = "";
        if (Offer_ID == "")
        {

            string photos = "<div class=\"row\"><div  class=\"col-3 p-2\"><div imgname=\"babycare.png\" class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/babycare.png\"/><div class=\"ofrtxt\">Babycare offer </div></div></div>" +
                "<div  class=\"offerImgbtn col-3 p-2\"><div imgname=\"beautyproducts.png\" class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/beautyproducts.png\"/><div class=\"ofrtxt\">Beauty Products offer </div></div></div>" +
                "<div class=\"col-3   p-2\"> <div imgname=\"Beverages.png\"  class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/Beverages.png\"/><div class=\"ofrtxt\">Beverages offer </div></div></div>" +
                "<div  class=\"col-3   p-2\"><div imgname=\"candy.png\" class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/candy.png\"/><div class=\"ofrtxt\">Candy offer </div></div></div>" +
                "<div  class=\"col-3   p-2\"><div imgname=\"Dal.png\" class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/Dal.png\"/><div class=\"ofrtxt\">Pulses offer </div></div></div>" +
                "<div class=\"col-3   p-2\"><div imgname=\"GroceryOffers.png\"  class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/GroceryOffers.png\"/><div class=\"ofrtxt\">Grocery offer </div></div></div>" +
                "<div class=\"col-3   p-2\"><div  imgname=\"households.png\"  class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/households.png\"/><div class=\"ofrtxt\">Households offer </div></div></div>" +
                "<div  class=\"col-3   p-2\"><div imgname=\"masala.png\" class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/masala.png\"/><div class=\"ofrtxt\">Spices offer </div></div></div>" +
                "<div class=\"col-3   p-2\"><div  imgname=\"snacks.png\"  class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/snacks.png\"/><div class=\"ofrtxt\">Snacks offer </div></div></div>" +
                "<div  class=\"col-3   p-2\"><div imgname=\"personalcare.png\" class=\"offerImgbtn\"><img style=\"width:100%\" src=\"../Assest/images/Offerimage/personalcare.png\"/><div class=\"ofrtxt\">Personal care offer </div></div></div></div>";


            ofrmdl = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\">" +
                 "<h5 class=\"modal-title\" id=\" \">Add offers</h5><button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">" +
                 "<span aria-hidden=\"true\">×</span></button></div><div class=\"modal-body\">" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                 "<label for=\"regular1\" class=\"control-label\">Offer Name</label>" +
                 "<input id=\"ofr_name\"   class=\"form-control\"/><span class=\"pmd-textfield-focused\"></span></div>" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">" +
                 "Offer items</label><input type=\"text\" placeholder=\"Search items for offer\" id=\"ofr_items\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
                 "<div id=\"selecteditems\"></div>" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">" +
                 "Original Price</label><input type=\"number\" id=\"ofr_ori_price\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed d-none\"><label for=\"regular1\" class=\"control-label\">Offer Price</label>" +
                 "<input type=\"number\" id=\"ofrprice\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                 "<label for=\"regular1\" class=\"control-label\">Offer Price</label>" +
                 "<input type=\"number\" id=\"ofrprices\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">Start Date</label>" +
                 "<input class=\"form-control datepick\" type=\"date\" id=\"ofrstartdate\" data-date=\"\" data-date-format=\"dd-M-yy\" name=\"date\" value=\"\" style=\"\"/><span class=\"pmd-textfield-focused\"></span></div>" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">End Date</label>" +
                 "<input type=\"date\" id=\"ofrenddate\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +
                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label d-none\"><label for=\"regular1\" class=\"control-label\">Min Order amount with this offer</label>" +
                 "<input type=\"number\" id=\"ofr\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div>" +

                 "<div class=\"row\">" +
                 "<div class=\"col-6\"><div class=\"form-group \"><label class=\"control-label\">Choose week days for valid offer</label>" +
                  "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\" value=\"Y\" id=\"ofrsun\">" +
          " <label class=\"custom-control-label\" for=\"ofrsun\">Sunday</label></div>" +
                  "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"ofrmon\">" +
                 "<label class=\"custom-control-label\" for=\"ofrmon\">Monday</label></div>" +
         "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"ofrtue\">" +
          " <label class=\"custom-control-label\" for=\"ofrtue\">Tuesday</label></div>" +
         "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"ofrwed\">" +
          " <label class=\"custom-control-label\" for=\"ofrwed\">Wednesday</label></div>" +
         "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"ofrthu\">" +
          " <label class=\"custom-control-label\" for=\"ofrthu\">Thursday</label></div>" +
         "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"ofrfri\">" +
          " <label class=\"custom-control-label\" for=\"ofrfri\">Friday</label></div>" +
          "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"Y\" id=\"ofrsat\">" +
          " <label class=\"custom-control-label\" for=\"ofrsat\">Saturday</label></div>" +

                 "</div></div>" +
                  "<div class=\"col-6\">" +
                  "<div class=\"form-group\" style=\"\"><label class=\"control-label\">GST INCLUDED</label>" +
                 "<div class=\"custom-control custom-checkbox\"><input type=\"checkbox\" class=\"custom-control-input\"  value=\"N\" id=\"ofrYES\">" +
               "<label class=\"custom-control-label\" for=\"ofrYES\">Yes</label></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"><label for=\"regular1\" class=\"control-label\">GST Percentage(%)</label>" +
                 "<input type=\"number\" id=\"gstpercent\" class=\"form-control\"><span class=\"pmd-textfield-focused\"></span></div><div class=\"form-group d-none\" style=\"\"><label class=\"control-label\">GST Percentage(%)</label>" +
                 "<div class=\"custom-control custom-checkbox\"><input type=\"number\" class=\"custom-control-input\"  >" +
               "<label class=\"custom-control-label\" for=\"ofrYES\">Yes</label></div>" +
                "</div></div></div></div>" +


                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Instruction</label>" +
                 "<input type=\"text\" id=\"ofr_instruct\" class=\"form-control\"/><span class=\"pmd-textfield-focused\"></span></div>" +

                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Description</label>" +
                 "<input type=\"text\" id=\"ofr_description\" class=\"form-control\"/><span class=\"pmd-textfield-focused\"></span></div>" +
                  "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"regular1\" class=\"control-label\">Choose Offer Image</label>" +
                 " " + photos + "</div>" +

                 "<div class=\"form-group pmd-textfield pmd-textfield-floating-label d-none\"><label for=\"regular1\" style=\"width: 100px;\" class=\"control-label\">Offer Image</label>" +
                 "<div id=\"status\"></div>" +
       //"<input type=file class=\"img-upload-input\" editor=\"#img-upload-panel\" target=\"#image\" status=\"#status\" passurl=\"\" pshape=\"square\" w=300 h=300 size=\"{150,150}\"/>" +
       "<input type=file class=\"img-upload-input\"  id=\"fileUpload\" />" +


                 "<img src=\"\" alt=\"\" id=\"image\"/>" +

                 "</div></div>" +
                 "" +
                 "<div class=\"modal-footer\">" +
                 "<button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button><a class=\"btn btn-primary\" id=\"Addoffersbtn\" href=\"javascript:void(0);\">Create Offer</a>" +
                 "</div></div>";

        }
        else
        {

        }

        return ofrmdl;
    }

    [WebMethod]
    public static Cl_admin Update_Offer_Data(string MID, string Flag, Cl_admin OfferData, string Qty, string Price) //, cl_subscription objSubscription
    {

        if (OfferData == null)
            OfferData = new Cl_admin();

        if (OfferData.OfferDetails == null)
            OfferData.OfferDetails = new List<cl_CreateOffer>();


        if (Flag == "ADD")
        {
            OfferData.OfferDetails.Add(new cl_CreateOffer
            {

                Price = Price,
                Qty = Qty,
                RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                MID = MID

            });

        }
        else if (Flag == "SUB")
        {
            OfferData.OfferDetails.RemoveAll(r => r.MID == MID && r.RID == HttpContext.Current.Request.Cookies["rid"].Value.ToString());
            OfferData.OfferDetails.Add(new cl_CreateOffer
            {
                Price = Price,
                Qty = Qty,
                RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                MID = MID
            });
        }
        else
        {
            OfferData.OfferDetails.RemoveAll(r => r.MID == MID && r.RID == HttpContext.Current.Request.Cookies["rid"].Value.ToString());
        }

        return OfferData;
    }



    [WebMethod]
    public static string insertoffersitems(string ofrname, string ofr_original_price, string ofr_Price, string sun, string mon,
        string tue, string wed, string thu, string fri, string sat, string startdate, string enddate, string instruction,
        string description, string gst, string gstpercent, string Offer_ID, string Flag, string ImgSource, string offerSelectImg, Cl_admin OfferData)
    {
        string uploadfile = "";

        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName();
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName();
                    if (dInfo.GetFiles(uploadfile).Length <= 0)
                    {
                        IsImageExists = false;
                        break;
                    }
                }
            }

            using (FileStream fs = new FileStream(DocPicFilePath + uploadfile, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgSource);
                    bw.Write(data);
                    bw.Close();
                }
            }

        }

        Cl_admin objAdmin = new Cl_admin();
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objAdmin.OFFER_NAME = ofrname;
        objAdmin.ORIGINAL_PRICE = ofr_original_price;
        objAdmin.OFFER_PRICE = ofr_Price;
        objAdmin.INSTRUCTIONS = instruction;
        objAdmin.DESCRIPTION = description;
        objAdmin.START_DATE = startdate;
        objAdmin.END_DATE = enddate;
        objAdmin.SUN = sun.Replace("undefined", "");
        objAdmin.MON = mon.Replace("undefined", "");
        objAdmin.TUE = tue.Replace("undefined", "");
        objAdmin.WED = wed.Replace("undefined", "");
        objAdmin.THU = thu.Replace("undefined", "");
        objAdmin.FRI = fri.Replace("undefined", "");
        objAdmin.SAT = sat.Replace("undefined", "");
        objAdmin.GST_INCLUDED = gst.Replace("undefined", "");
        objAdmin.GST_PERCENTAGE = gstpercent.Replace("%", "");
        objAdmin.Flag = Flag;
        objAdmin.Offer_ID = Offer_ID;
        objAdmin.Type = 20;
        //objAdmin.IMAGE_URL = uploadfile;
        objAdmin.IMAGE_URL = offerSelectImg;
        DataSet ds = new DataSet();
        ds = objAdmin.fn_insert_offers();

        if (Flag.ToUpper() == "ADD" && ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string OID = ds.Tables[0].Rows[0]["OFFER_ID"].ToString();
            string Created_By = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            if (OfferData != null)
            {
                OfferData.fnSaveSubPackages(OfferData, OID, Created_By);
            }
        }
        return "1";
    }



    [WebMethod]

    public static string fn_markAvailable(string MID, string VALUE)
    {
        string result = "";
        Cl_admin objAdmin = new Cl_admin();
        objAdmin.ITEM = MID;
        objAdmin.Flag = VALUE;
        objAdmin.Type = 42;
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet Ds = objAdmin.fn_insert_deal();
        return result;
    }






    //------------------------------for update notif_count----------------
    [WebMethod]

    public static string update_Notif_count(string offerid)
    {
        string Title = "";
        string Message = "";
        string result = "";
        Cl_admin objAdmin = new Cl_admin();
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objAdmin.SDID = offerid;
        objAdmin.Type = 44;
        DataSet ds = new DataSet();
        ds = objAdmin.fn_insert_stealdeaal();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].Rows[0]["CUSTOMER_COUNT"].ToString();
            Title = "[Steal Deal of the day]: " + ds.Tables[1].Rows[0]["NAME"].ToString() + " at " + ds.Tables[1].Rows[0]["PERCENT_OFF"].ToString() + "% off";
            Message = "Steal Deal at " + ds.Tables[2].Rows[0]["NAME"].ToString() + " to offer " + ds.Tables[1].Rows[0]["NAME"].ToString() + " at only Rs " + ds.Tables[1].Rows[0]["OFFER_PRICE"].ToString();
        }


        return result + "|" + Title + "|" + Message;
    }


    [WebMethod]

    public static string update_bestoffer_count(string offerid)
    {
        string result = "";
        string Title = "";
        string Message = "";
        Cl_admin objAdmin = new Cl_admin();
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objAdmin.SDID = offerid;
        objAdmin.Type = 45;
        DataSet ds = new DataSet();
        ds = objAdmin.fn_insert_stealdeaal();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].Rows[0]["CUSTOMER_COUNT"].ToString();
            Title = ds.Tables[1].Rows[0]["DEAL_NAME"].ToString() + ": upto " + ds.Tables[1].Rows[0]["PERCENT_OFF"].ToString() + "% discount. Grab it today!";
            Message = "Grab the new offer at " + ds.Tables[2].Rows[0]["NAME"].ToString() + " before the stock ends";

        }


        return result + "|" + Title + "|" + Message;
    }



    [WebMethod]

    public static string update_offer_count(string offerid)
    {
        string result = "";
        string Title = "";
        string Message = "";
        Cl_admin objAdmin = new Cl_admin();
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objAdmin.SDID = offerid;
        objAdmin.Type = 46;
        DataSet ds = new DataSet();
        ds = objAdmin.fn_insert_stealdeaal();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].Rows[0]["CUSTOMER_COUNT"].ToString();
            Title = ds.Tables[1].Rows[0]["OFFER_NAME"].ToString() + ": upto " + ds.Tables[1].Rows[0]["PERCENT_OFF"].ToString() + "% discount. Grab it today!";
            Message = "Grab the new offer at " + ds.Tables[2].Rows[0]["NAME"].ToString() + " before the stock ends";
        }


        return result + "|" + Title + "|" + Message;
    }


    //------------------------------for update notif_count----------------


    [WebMethod]
    public static string sendNotification(string Title, string Message)
    {
        Cl_admin objAdmin = new Cl_admin();
        objAdmin.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objAdmin.Type = 47;
        DataSet ds = new DataSet();
        ds = objAdmin.fn_insert_stealdeaal();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                insertNotification(HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(), DR["USER_ID"].ToString(), Title, Message, "Customer");
                Send_Notification.SendNotificationFromFirebaseCloud(DR["RID"].ToString(),
                    DR["DEVICE_ID"].ToString(), "https://mycornershop.in/Home.aspx", Title, Message, 1);
            }
        }


        return "1";
    }
    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Receiver_User_ID = Receiver_User_ID;
        cr.Sender_User_ID = Sender_User_ID;
        cr.Sent_To = Sent_To;
        cr.Type = 103;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnInsertNotification();

        return "1";
    }


    private static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
    {
        ContractResolver = new LowercaseContractResolver()
    };

    public static string SerializeObject(object o)
    {
        return JsonConvert.SerializeObject(o, Formatting.Indented, Settings);
    }

    public class LowercaseContractResolver : DefaultContractResolver
    {
        protected override string ResolvePropertyName(string propertyName)
        {
            return propertyName.ToLower();
        }
    }

}