using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_View_Purchase_Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string getInvoiceLines(List<cl_addPurchase> datarray)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.NAME = datarray[0].Supplier_Name;
        ca.PRICE = datarray[0].Invoice_Amount;
        ca.START_DATE = datarray[0].Invoice_Date;
        ca.Invoice_No = datarray[0].Invoice_No;
        ca.Type = 90;
        ds = ca.fn_InsertInvoiceAttachments();
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
    public static string RemoveImages(string ImageUrl)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.IMAGE_URL = ImageUrl;
        ca.Type = 91;
        ds = ca.fn_InsertInvoiceAttachments();
        return "1";
    }

    [WebMethod]

    public static string UpdateInvoiceChanges(string Supplier, string Date, string Invoiceno,
        string Amount, string Paid_Amount, string Pids, string Newattacments)
    {
        var Data = Pids.Split(',');
        for (int i = 0; i < Data.Length; i++)
        {
            Cl_admin ca = new Cl_admin();
            DataSet ds = new DataSet();
            ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            ca.NAME = Supplier;
            ca.PRICE = Amount;
            ca.START_DATE = Date;
            ca.Invoice_No = Invoiceno;
            ca.MRP = Paid_Amount;
            ca.MCID = Data[i];
            ca.Type = 92;
            ds = ca.fn_InsertInvoiceAttachments();
        }
        string Attachment_Name = "";
        var Attachments = Newattacments.Split(',');
        for (int j = 0; j < Attachments.Length; j++)
        {
            string uploadfile = "";
            if (Attachments[j] != "")
            {
                string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
                DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);
                bool IsImageExists = true;
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
                        byte[] data = Convert.FromBase64String(Attachments[j]);
                        bw.Write(data);
                        bw.Close();
                    }
                }
                Attachment_Name = Attachment_Name + "," + uploadfile;
                Cl_admin ca = new Cl_admin();
                ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(); ;
                ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
                ca.NAME = Supplier;
                ca.PRICE = Amount;
                ca.START_DATE = Date;
                ca.IMAGE_URL = uploadfile;
                ca.Invoice_No = Invoiceno;
                ca.Type = 89;
                DataSet ds1 = ca.fn_InsertInvoiceAttachments();
            }
        }

        return Attachment_Name;
    }

    public static string GetMENUImageName()
    {

        Random random = new Random();
        int ran = random.Next(100, 999);

        string x = DateTime.Now.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        string ImageName = "myCornershopPurchaseImg-" + x + ran + ".png";

        return ImageName;
    }

    [WebMethod]

    public static string deletePurchaseInvoiceLine(string PID)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.MCID = PID;
        ca.Type = 93;
        ds = ca.fn_InsertInvoiceAttachments();
        return "1";
    }

    [WebMethod]

    public static string fnUpdateChangesLinesInvoice(string Name, string Item_Qty, string Item_UOM, string Item_Purchase_rate,
        string Item_Tax_Included, string Item_Price_With_Tax, string Total, string GST, string Item_HSN, string Item_MRP,
        string Item_Selling_Price, string Item_Comment, string PID, string MID)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.ITEM = Name;
        ca.QTY = Item_Qty;
        ca.UOM = Item_UOM;
        ca.PurchaseRate = Item_Purchase_rate;
        ca.GST_INCLUDED = Item_Tax_Included;
        ca.Price_With_Tax = Item_Price_With_Tax;
        ca.Total = Total;
        ca.GST_PERCENTAGE = GST;
        ca.HSN_NO = Item_HSN;
        ca.MRP = Item_MRP;
        ca.sellingPrice = Item_Selling_Price;
        ca.DESCRIPTION = Item_Comment;
        ca.PID = PID;
        ca.MID = MID;
        ca.Type = 94;
        ds = ca.fnUpdateItemPurchase();

        return "1";
    }
    [WebMethod]

    public static string fnGetAllProducts(string FindData)
    {
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Search_Item = FindData;
        cr.Type = 17;
        ds = cr.fngetallProductsList();
        string Total = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Total = DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return Total;
    }
}