﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Add_Sales_New : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    [WebMethod]
    public static string fnGetAllProducts(string search)
    {
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Search_Item = search;
        cr.Type = 17;
        ds = cr.fngetallProductsList();
        string DataConverted = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            DataConverted = DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return DataConverted;
    }
    public static object dataSetToJSON(DataSet ds)
    {
        ArrayList root = new ArrayList();
        List<Dictionary<string, object>> table;
        Dictionary<string, object> data;

        foreach (DataTable dt in ds.Tables)
        {
            table = new List<Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                data = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    data.Add(col.ColumnName, dr[col]);
                }
                table.Add(data);
            }
            root.Add(table);
        }
        JavaScriptSerializer serializer = new JavaScriptSerializer();
        return serializer.Serialize(root);
    }

    [WebMethod]
    public static string fnGetPerticularProducts(string mid)
    {
        string result = string.Empty;
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.MID = mid;
        cr.Type = 34;
        ds = cr.fn_Insertitemsadmin();
        if (ds != null)
        {
            string pic = "";
            if (ds.Tables[0].Rows[0]["IMAGE_URL"].ToString() != "")
            {
                pic = ds.Tables[0].Rows[0]["IMAGE_URL"].ToString();
            }
            else
            {

                pic = "Defaultimage.png";
            }
            result = "<div class=\"container\"><div class=\"row\"><div class=\"col-sm-2\"></div><div class=\"col-sm-8\">" +
            "<div class=\"item__Details\"><div class=\"row\"><div class=\"col-3\">" +
            "<div class=\"imagepart\"><img width=\"80\" class=\"image_block\" src=\"../Menu_Pics/" + pic + "\" />" +
            "</div></div><div class=\"col-9\"><div class=\"details\">" +
            "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"product_name\"> " + ds.Tables[0].Rows[0]["NAME"].ToString() + "</div> </div></div>" +
            "<div class=\"row m-2\"><div class=\"col-6\"><div class=\"product_price\"><label>Price in ( <i class=\"fa fa-inr\"></i> ) </label><input class=\"input__box price__ w-100\" value=\"" + ds.Tables[0].Rows[0]["PRICE"].ToString() + "\"/></div></div><div class=\"col-6\"><div class=\"product_QTY\"><label>QTY</label><input class=\"input__box qty__ w-100\" value=\"1\"/></div></div></div>" +
             "</div></div></div></div><div class=\"row mt-2\"><div class=\"col-sm-12\"><div class=\"submitbtn__box\"><button id=\"submititemsbtn\" class=\"btnstyle btn w-100\">Add</button></div></div></div></div><div class=\"col-sm-2\"></div></div></div>";

        }
        return result;

    }

    [WebMethod]
    public static string fnGetCustomerDetails(string number, string type)
    {
        string result = "";
        string location = "";
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.MOBILE = number;
        cr.Type = 22;
        ds = cr.fn_Customer_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["LOCATION1"].ToString() != "")
            {
                location = ds.Tables[0].Rows[0]["LOCATION1"].ToString();
            }

            if (type == "0")
            {
                result = "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"card p-3\">" +
                   "<div class=\"row\"><div class=\"col-sm-4\"><div class=\"user__img text-center\">" +
                  "<img src=\"../Menu_Pics/" + ds.Tables[0].Rows[0]["CUST_IMG_URL"].ToString() + "\" /></div></div><div class=\"col-sm-8\">" +
                  "<div class=\"user__details text-center\">" +
                  "<h5>" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + "</h5> " +
                  "<div>" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "</div> " +
                  "<div>" + location.Replace("<br/>", " , ") + "</div>" +
                  "</div></div></div>" +
                  "<div class=\"row mt-2\">" +
                  "<div class=\"col-5\">" +
                  "<button id=\"cancelordercreate_Btn\" class=\"btn btnstyle w-100\">Cancel</button>" +
                   "</div>" +
                   "<div class=\"col-7\">" +
                  "<button number=\"" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "\" id=\"createorderbtn\" class=\"btn btnstyle w-100 \">Create Order</button>" +
                  "</div>" +
                  "</div>" +
                  "</div>" +

                  "</div></div>";
            }
            else
            {
                result = "<a href=\"javascript:void(0);\" id=\"StoreName\"  runat=\"server\" class=\"navbar-brand\" style=\"margin-left: 40px;margin-top:-20px;\">" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() +
                         " - " + ds.Tables[0].Rows[0]["MOBILE"].ToString() +
                         "<p style=\"font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;\">" + location.Replace("<br/>", " , ") + "</p></a>";
            }

        }
        else
        {
            result = "No record found";
        }
        return result;
    }

    [WebMethod]
    public static Cl_admin Update_Offer_Data(string MID, string Flag, Cl_admin OfferData, string Qty, string Price, 
        string Item,string Price_With_GST,string GST,string GST_Included,string UOM) //, cl_subscription objSubscription
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
                MID = MID,
                Item_Name = Item,
                Price_With_GST = Price_With_GST,
                GST = GST,
                GST_Included = GST_Included,
                UOM = UOM

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
                MID = MID,
                Item_Name = Item
            });
        }
        else
        {
            OfferData.OfferDetails.RemoveAll(r => r.MID == MID && r.RID == HttpContext.Current.Request.Cookies["rid"].Value.ToString());
        }

        return OfferData;
    }


    [WebMethod]
    public static string CreateOrder(string Mobile, string Name, string Flag, string Paid_Amount, Cl_admin OfferData
        ,string GST_Number, string Invoice_No)
    {

        string RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        string Created_By = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();

        OfferData.fnSaveSaleDetails(OfferData, RID, Created_By, Mobile, Name, Flag, Paid_Amount, GST_Number, Invoice_No);

        return "1";
    }

    [WebMethod]

    public static string fngetSaleHistory()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_TYPE = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.Type = 85;
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
    public static string fnGenerateInvoice(string Header_ID)
    {
        cl_resturant cr = new cl_resturant();
        cr.Header_ID = Header_ID;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Invoice_No = "";
        cr.Type = 11;
        DataSet ds = cr.fnGenerateInvoice();
        string Link = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Link = "https://mycornershop.in/Invoice/Invoices.aspx?invoice=" + ds.Tables[0].Rows[0]["INVOICE_ID"].ToString();
        }
        return Link;
    }
}