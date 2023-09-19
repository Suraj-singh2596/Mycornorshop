using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Add_purchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]

    public static List<cl_resturantorder> fnGetAllProducts(string search)
    {
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Search_Item = search;
        cr.Type = 61;
        ds = cr.fngetallProductsList();
        List<cl_resturantorder> result = new List<cl_resturantorder>();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].AsEnumerable().Select(i => new cl_resturantorder()
            {
                MID = Convert.ToString(Convert.ToInt32(i.Field<Int64>(0))),
                Item_Name = i.Field<string>(1),
                IMAGE_URL = i.Field<string>(2),
                Current_Stock = Convert.ToString(Convert.ToDouble(i.Field<Double>(4))),
                Price = Convert.ToString(Convert.ToDouble(i.Field<Double>(3))),
                GST = Convert.ToString(Convert.ToInt32(i.Field<Int32>(5))),
                GST_Included = i.Field<string>(6),
            }).ToList();
        }

        return result;
    }

    [WebMethod]
    public static Cl_admin AddPurchaseData(Cl_admin PurchaseData, string MID, string Qty, string Purchase_Price, string MRP, string Selling_Price, string GST, string HSN) //, cl_subscription objSubscription
    {

        if (PurchaseData == null)
        {
            PurchaseData = new Cl_admin();
        }


        if (PurchaseData.PurchaseDetails == null)
        {
            PurchaseData.PurchaseDetails = new List<cl_addPurchase>();
        }
        // PurchaseData.PurchaseDetails.Clear();

        PurchaseData.PurchaseDetails.Add(new cl_addPurchase
        {
            MID = MID,
            Qty = Qty,
            Purchase_Price = Purchase_Price,
            MRP = MRP,
            Selling_Price = Selling_Price,
            GST = GST,
            HSN = HSN,
            RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
            Created_By = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(),
            Invoice_No = HttpContext.Current.Session["Invoice_Details"].ToString().Split(',')[2],
            Supplier_Name = HttpContext.Current.Session["Invoice_Details"].ToString().Split(',')[0],
            Invoice_Date = HttpContext.Current.Session["Invoice_Details"].ToString().Split(',')[1],
            Invoice_Amount = HttpContext.Current.Session["Invoice_Details"].ToString().Split(',')[3],

        });

        return PurchaseData;
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
    public static List<cl_addPurchase> SubmitList(List<cl_addPurchase> datarray, List<cl_addPurchase> Invoice_Data, List<cl_addPurchase> Invoice_Images)
    {
        string RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
              Created_By = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(),
              Invoice_No = Invoice_Data[0].Invoice_No,
              Supplier_Name = Invoice_Data[0].Supplier_Name,
              Invoice_Date = Invoice_Data[0].Invoice_Date,
              Invoice_Amount = Invoice_Data[0].Invoice_Amount,
              Paid_Amount = Invoice_Data[0].Total;



        for (int j = 0; j < Invoice_Images.Count; j++)
        {
            string uploadfile = "";
            if (Invoice_Images[j].Img != "")
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
                        byte[] data = Convert.FromBase64String(Invoice_Images[j].Img);
                        bw.Write(data);
                        bw.Close();
                    }
                }
                Cl_admin ca = new Cl_admin();
                ca.RID = RID;
                ca.USER_ID = Created_By;
                ca.NAME = Supplier_Name;
                ca.PRICE = Invoice_Amount;
                ca.START_DATE = Invoice_Date;
                ca.IMAGE_URL = uploadfile;
                ca.Invoice_No = Invoice_No;
                ca.Type = 89;
                DataSet ds1 = ca.fn_InsertInvoiceAttachments();
            }

        }

        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (datarray != null)
        {
            for (int i = 0; i < datarray.Count; i++)
            {
                string Gst_Inclusion = "N";
                if (datarray[i].GST_Included.ToUpper() == "TRUE")
                {
                    Gst_Inclusion = "Y";
                }
                xmlPackages += string.Format("<xPckg MID=\"{0}\" Qty=\"{1}\" Purchase_Rate=\"{2}\" MRP=\"{3}\" " +
                    "Selling_Price=\"{4}\"  GST=\"{5}\" HSN=\"{6}\" RID=\"{7}\"  Created_By=\"{8}\" Invoice_No=\"{9}\" " +
                    "Supplier_Name=\"{10}\" Invoice_Date=\"{11}\" Invoice_Amount=\"{12}\" Item_Name=\"{13}\" GST_Included=\"{14}\" " +
                    "Price_With_Tax=\"{15}\" UOM=\"{16}\" Total=\"{17}\" Comment=\"{18}\" InvoiceImage=\"{19}\" PAID_AMOUNT=\"{20}\" />"
                    , Convert.ToInt32(datarray[i].MID), Convert.ToInt32(datarray[i].Qty), Convert.ToDecimal(datarray[i].Purchase_Rate)
                    , Convert.ToDecimal(datarray[i].MRP), Convert.ToDecimal(datarray[i].Current_Selling_Price), Convert.ToInt32(datarray[i].GST)
                    , (datarray[i].HSN), Convert.ToInt32(RID), Convert.ToInt32(Created_By)
                    , Invoice_No, Supplier_Name, Convert.ToDateTime(Invoice_Date).ToString("yyyy-MM-dd")
                    , Convert.ToDecimal(Invoice_Amount), datarray[i].Item_Name, Gst_Inclusion
                    , Convert.ToDecimal(datarray[i].Price_With_Tax), (datarray[i].UOM), Convert.ToDecimal(datarray[i].Total), datarray[i].Comment, "", Convert.ToDecimal(Paid_Amount));
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);
        int Type = 74;
        string str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@XMLPURCHASE='" + string.Format("<root>{0}</root>", xPackages) + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        return datarray;
    }
}