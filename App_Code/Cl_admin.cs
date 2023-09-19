using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for Cl_admin
/// </summary>
public class Cl_admin
{
    public Cl_admin()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region Fields
    DataSet ds = new DataSet();
    public int Type { get; set; }
    private string str;
    public string sellingPrice;

    public string RID { get; set; }

    #endregion
    public string ACTIVE_STATUS { get; set; }
    public string NAME { get; set; }
    public string MOBILE { get; set; }
    public string USER_TYPE { get; set; }
    public string USERNAME { get; set; }
    public string PASSWORD { get; set; }
    public string MPIN { get; set; }

    public string USER_ID { get; set; }

    public string MENU_NAME { get; set; }


    public string GST_PERCENTAGE { get; set; }

    public string TAX_COMMENT { get; set; }


    public string CG_NAME { get; set; }
    public string CREATED_BY { get; set; }
    public string MTID { get; set; }
    public string CGID { get; set; }
    public string MCID { get; set; }
    public string CATEGORY_NAME { get; set; }
    public string VEG_NONVEG { get; set; }
    public string SPICEY { get; set; }


    public string CHEF_SPECIAL { get; set; }

    public string CALORIES { get; set; }

    public string PRICE { get; set; }
    public string GST_INCLUDED { get; set; }
    public string IMAGE_URL { get; set; }
    public string DESCRIPTION { get; set; }
    public string MID { get; set; }

    public string OPTIONS { get; set; }




    public DataSet fnupdateaceesdetails()
    {
        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@ACTIVE_STATUS = '" +
            ACTIVE_STATUS + "',@NAME = '" + NAME + "',@MOBILE= '" + MOBILE + "',@USER_TYPE = '" +
            USER_TYPE + "',@USERNAME='" + USERNAME + "',@PASSWORD='" + PASSWORD + "',@MPIN='" +
            MPIN + "',@USER_ID='" + USER_ID + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }

    }

    public DataSet fn_Login()
    {
        str = "EXEC  PROC_STD_LOGIN_MASTER   @TYPE='" + Type + "',@USERNAME='" + USERNAME + "',@PASSWORD='" + PASSWORD + "',@USER_ID='" + USER_ID + "',@RID = '" + RID + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }

    }

    public DataSet fn_insert_menu_type()
    {
        str = "EXEC  PROC_STD_LOGIN_MASTER   @TYPE='" + Type + "',@MENU_NAME='" + MENU_NAME + "',@GST_PERCENTAGE='" + GST_PERCENTAGE
            + "',@TAX_COMMENT='" + TAX_COMMENT + "',@RID = '" + RID + "',@CG_NAME='" + CG_NAME + "',@CREATED_BY='" + CREATED_BY
            + "',@MTID='" + MTID + "',@CATEGORY_NAME='" + CATEGORY_NAME + "',@CGID='" + CGID + "',@MCID='" + MCID + "',@NAME='" + NAME +
            "',@VEG_NONVEG='" + VEG_NONVEG + "',@SPICEY='" + SPICEY + "',@CHEF_SPECIAL='" + CHEF_SPECIAL + "',@CALORIES='" + CALORIES + "',@PRICE='" + PRICE +
            "',@GST_INCLUDED='" + GST_INCLUDED + "',@IMAGE_URL='" + IMAGE_URL + "',@DESCRIPTION='" + DESCRIPTION + "',@MID='" + MID + "',@OPTIONS='" + OPTIONS + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public static string Encrypt(string clearText)
    {
        string EncryptionKey = "CRT#";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }


    public static string Decrypt(string cipherText)
    { 
        string EncryptionKey = "CRT#";
        cipherText = cipherText.Replace(" ", "+");
        cipherText = Uri.UnescapeDataString(cipherText);

        for (int i = 0; i <= 2; i++)
        {
            try
            {
                byte[] cipherBytes = Convert.FromBase64String(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    //encryptor.Padding = PaddingMode.Zeros;
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(cipherBytes, 0, cipherBytes.Length);
                            cs.Close();
                        }
                        cipherText = Encoding.Unicode.GetString(ms.ToArray());
                    }
                }
                break;
            }
            catch (Exception e)
            {
                cipherText = cipherText + "=";
            }
        }
        return cipherText;
    }

    public DataSet fn_admin()
    {
        str = "EXEC  PROC_CRT_API_MASTER   @TYPE='" + Type + "',@RID = '" + RID + "',@BUSINESS = '" + BUSINESS + "',@USER_TYPE='" + USER_TYPE + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }
    public DataSet fn_admin_Data()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@MID = '" + MID + "',@BUSINESS = '" + BUSINESS + "',@USER_ID = '" +
             USER_ID + "',@USER_TYPE='" + USER_TYPE + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }
    public DataSet fn_Customer_Data()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@MOBILE = '" + MOBILE + "',@USER_ID = '" +
            USER_ID + "',@NAME = '" + NAME + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fnAddSales()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@MOBILE = '" + MOBILE + "',@USER_ID = '" +
            USER_ID + "',@CID = '" + CID + "',@FLAG = '" + Flag + "',@AMOUNT = '" + Amount + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }
    public string CID { get; set; }

    public string Amount { get; set; }
    public string Flag { get; set; }
    public string BUSINESS { get; set; }
    public string QTY { get; set; }
    public string LOCAL_NAME { get; set; }
    public string TAGS { get; set; }
    public string HSN_NO { get; set; }
    public string MRP { get; set; }

    public string PORTION { get; set; }
    public string ORDER_SELECTION { get; set; }
    public string ODDDAYS { get; set; }
    public string EVENDAYS { get; set; }
    public string SUN { get; set; }
    public string SAT { get; set; }
    public string FRI { get; set; }
    public string THU { get; set; }
    public string WED { get; set; }
    public string TUE { get; set; }
    public string MON { get; set; }
    public string MIN_ORDER { get; set; }
    public string START_DATE { get; set; }
    public string END_DATE { get; set; }

    public string OFFER_PRICE { get; set; }
    public string REGULAR_PRICE { get; set; }
    public string ITEM_ID { get; set; }

    public string ITEM { get; set; }
    public string INSTRUCTIONS { get; set; }
    public string Search_Item { get; set; }

    public string OFFER_NAME { get; set; }

    public string ORIGINAL_PRICE { get; set; }
    public string SDID { get; set; }
    public string Deal_ID { get; set; }
    public string Offer_ID { get; set; }

    public DataSet fn_Insertitemsadmin()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@MTID = '" + MTID + "',@MCID = '" + MCID
            + "',@NAME = '" + NAME + "',@DESCRIPTION = '" + DESCRIPTION + "',@PRICE = '" + PRICE + "',@QTY = '" + QTY + "',@GST_INCLUDED = '" + GST_INCLUDED
            + "',@GST_PERCENTAGE = '" + GST_PERCENTAGE + "',@IMAGE_URL = '" + IMAGE_URL + "',@CGID = '" + CGID + "',@LOCAL_NAME = '" + LOCAL_NAME + "',@TAGS = '" + TAGS
            + "',@HSN_NO = '" + HSN_NO + "',@MENU_NAME='" + MENU_NAME + "',@TAX_COMMENT='" + TAX_COMMENT + "',@MRP='" + MRP + "',@MID='" +
            MID + "',@CATEGORY_NAME='" + CATEGORY_NAME + "',@Barcode='" + Barcode + "',@USER_ID='" + USER_ID + "',@Flag='" + Flag + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fn_InsertInvoiceAttachments()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@NAME = '" + NAME + "',@PRICE = '" + PRICE
            + "',@IMAGE_URL = '" + IMAGE_URL + "',@USER_ID='" + USER_ID + "',@INVOICE_NO='" + Invoice_No
            + "',@START_DATE = '" + START_DATE + "',@MCID = '" + MCID + "',@MRP = '" + MRP + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fngetallProductsList()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "', @MPIN = '" + MPIN + "',@Search_Item = '" + Search_Item + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }

    }
    public DataSet fnUpdateItemPurchase()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "', @USER_ID = '" + USER_ID
            + "',@NAME = '" + ITEM + "',@QTY = '" + QTY + "',@UOM = '" + UOM + "',@PURCHASE_RATE = '" + PurchaseRate
            + "',@GST_INCLUDED = '" + GST_INCLUDED + "',@AMOUNT = '" + Price_With_Tax + "',@TOTAL = '" + Total + "',@GST_PERCENTAGE = '" + GST_PERCENTAGE
            + "',@HSN_NO = '" + HSN_NO + "',@MRP = '" + MRP + "',@PRICE = '" + sellingPrice + "',@COMMENT = '" + DESCRIPTION
            + "',@PID = '" + PID + "',@MID = '" + MID + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }

    }
    public DataSet fn_insert_stealdeaal()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@BUSINESS = '" + BUSINESS + "',@PORTION='" + PORTION + "',@REGULAR_PRICE='" + REGULAR_PRICE + "',@OFFER_PRICE='" + OFFER_PRICE
            + "',@START_DATE='" + START_DATE + "',@END_DATE='" + END_DATE + "',@MIN_ORDER='" + MIN_ORDER + "',@MON='" + MON
            + "',@TUE = '" + TUE + "',@WED='" + WED + "',@THU='" + THU + "',@FRI='" + FRI + "',@SAT='" + SAT + "',@SUN='" + SUN
            + "',@EVENDAYS='" + EVENDAYS + "',@ODDDAYS='" + ODDDAYS + "',@ORDER_SELECTION='" + ORDER_SELECTION + "',@ITEM_ID='"
            + ITEM_ID + "',@FLAG='" + Flag + "',@SDID='" + SDID + "',@USER_ID='" + USER_ID + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fn_insert_deal()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@DEAL_NAME='" + NAME + "',@REGULAR_PRICE='" +
            REGULAR_PRICE + "',@OFFER_PRICE='" + OFFER_PRICE + "',@START_DATE='" + START_DATE + "',@END_DATE='" +
            END_DATE + "',@ORDER_SELECTION='" + ORDER_SELECTION + "',@MID='" + MID + "',@DESCRIPTION='" + DESCRIPTION + "',@INSTRUCTIONS='" +
            INSTRUCTIONS + "',@ITEM='" + ITEM + "',@QTY='" + QTY + "',@FLAG='" + Flag + "',@Deal_ID='" + Deal_ID + "',@USER_ID='" + USER_ID + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }


    public DataSet fn_insert_offers()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@DEAL_NAME='" + NAME + "',@REGULAR_PRICE='" +
            REGULAR_PRICE + "',@OFFER_PRICE='" + OFFER_PRICE + "',@START_DATE='" + START_DATE + "',@END_DATE='" +
            END_DATE + "',@ORDER_SELECTION='" + ORDER_SELECTION + "',@MID='" + MID + "',@INSTRUCTIONS='" +
            INSTRUCTIONS + "',@ITEM='" + ITEM + "',@QTY='" + QTY + "',@OFFER_NAME='" + OFFER_NAME + "',@DESCRIPTION='" + DESCRIPTION
            + "',@ORIGINAL_PRICE='" + ORIGINAL_PRICE + "',@GST_INCLUDED='" + GST_INCLUDED + "',@GST_PERCENTAGE='" + GST_PERCENTAGE + "',@MON='" + MON
            + "',@TUE = '" + TUE + "',@WED='" + WED + "',@THU='" + THU + "',@FRI='" + FRI + "',@SAT='" + SAT + "',@SUN='" + SUN
            + "',@FLAG = '" + Flag + "',@OFFER_ID = '" + Offer_ID + "',@IMAGE_URL = '" + IMAGE_URL + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet Invoice()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@HEADER_ID='" + Header_ID + "',@CREATED_BY = '" + USER_ID
            + "',@INVOICE_NO='" + Invoice_No + "',@FLAG = '" + Flag + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }
    public List<cl_CreateOffer> OfferDetails { get; set; }
    public List<cl_addPurchase> PurchaseDetails { get; set; }
    public string Barcode { get; set; }
    public string Invoice_No { get; set; }
    public string Header_ID { get; set; }


    public void fnSaveSubPackages(Cl_admin Cs, string OID, string Created_By)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.OfferDetails != null)
        {
            for (int i = 0; i < Cs.OfferDetails.Count; i++)
            {
                xmlPackages += string.Format("<xPckg OFFER_ID=\"{0}\" MID=\"{1}\" QTY=\"{2}\"/>"
                    , Convert.ToInt32(OID), Convert.ToInt32(Cs.OfferDetails[i].MID), Convert.ToInt32(Cs.OfferDetails[i].Qty));
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 21;

        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@USER_ID='" + Created_By + "',@XMLPACKAGES='" + string.Format("<root>{0}</root>", xPackages) + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

    }

    public void fnSaveSale(Cl_admin Cs, string RID, string Created_By, string Mobile, 
                            string Name, string Flag, string Paid_Amount, string Address, string deliveryflag, string AddressId)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.OfferDetails != null)
        {
            for (int i = 0; i < Cs.OfferDetails.Count; i++)
            {
                xmlPackages += string.Format("<xPckg PRICE=\"{0}\" MID=\"{1}\" QTY=\"{2}\" RID=\"{3}\"/>"
                    , Convert.ToDecimal(Cs.OfferDetails[i].Price), Convert.ToInt32(Cs.OfferDetails[i].MID),
                    Convert.ToInt32(Cs.OfferDetails[i].Qty), Convert.ToInt32(Cs.OfferDetails[i].RID));
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 36;

        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@USER_ID='" +
            Created_By + "',@XMLPACKAGES='" + string.Format("<root>{0}</root>", xPackages) + "',@RID='" + RID + "',@Mobile='" + Mobile
            + "',@C_Name='" + Name + "',@Flag='" + Flag + "',@Address='" + Address + "',@DELIVERYFLAG='" + deliveryflag + "',@Amount='" + Paid_Amount + "',@AddressId='"+ AddressId + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

    }

    public void fnSaveSaleDetails(Cl_admin Cs, string RID, string Created_By, string Mobile, string Name,
        string Flag, string Paid_Amount, string GST_Number, string Invoice_No)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.OfferDetails != null)
        {
            for (int i = 0; i < Cs.OfferDetails.Count; i++)
            {
                xmlPackages += string.Format("<xPckg PRICE=\"{0}\" MID=\"{1}\" QTY=\"{2}\"" +
                    " RID=\"{3}\" Price_With_GST=\"{4}\" GST=\"{5}\" GST_Included=\"{6}\" UOM=\"{7}\"/>"
                    , Convert.ToDecimal(Cs.OfferDetails[i].Price), Convert.ToInt32(Cs.OfferDetails[i].MID), Convert.ToInt32(Cs.OfferDetails[i].Qty), Convert.ToInt32(Cs.OfferDetails[i].RID)
                    , Convert.ToDecimal(Cs.OfferDetails[i].Price_With_GST), Convert.ToInt32(Cs.OfferDetails[i].GST),
                    Cs.OfferDetails[i].GST_Included, Cs.OfferDetails[i].UOM);
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 95;

        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@USER_ID='" +
            Created_By + "',@XMLPACKAGES='" + string.Format("<root>{0}</root>", xPackages) + "',@RID='" + RID + "',@Mobile='" + Mobile
            + "',@C_Name='" + Name + "',@Flag='" + Flag + "',@Amount='" + Paid_Amount + "',@GST_Number='" + GST_Number + "',@Invoice_No='" + Invoice_No + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

    }


    public void fnSaveEditeditem(Cl_admin Cs, string RID, string Created_By, string Flag, string Header_id)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.OfferDetails != null)
        {
            for (int i = 0; i < Cs.OfferDetails.Count; i++)
            {
                xmlPackages += string.Format("<xPckg PRICE=\"{0}\" MID=\"{1}\" QTY=\"{2}\" RID=\"{3}\" ITEM_NAME=\"{4}\"/>"
                    , Convert.ToDecimal(Cs.OfferDetails[i].Price), Convert.ToInt32(Cs.OfferDetails[i].MID), Convert.ToInt32(Cs.OfferDetails[i].Qty), Convert.ToInt32(Cs.OfferDetails[i].RID), Cs.OfferDetails[i].Item_Name);
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 49;

        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@USER_ID='" +
            Created_By + "',@XMLPACKAGES='" + string.Format("<root>{0}</root>", xPackages) + "',@RID='" + RID + "',@Flag='" + Flag
            + "',@HEADER_ID='" + Header_id + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

    }


    public void fnSavePurchaseList(Cl_admin Cs)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.PurchaseDetails != null)
        {
            for (int i = 0; i < Cs.PurchaseDetails.Count; i++)
            {
                xmlPackages += string.Format("<xPckg MID=\"{0}\" Qty=\"{1}\" Purchase_Price=\"{2}\" MRP=\"{3}\" " +
                    "Selling_Price=\"{4}\"  GST=\"{5}\" HSN=\"{6}\" RID=\"{7}\"  Created_By=\"{8}\" Invoice_No=\"{9}\" " +
                    "Supplier_Name=\"{10}\" Invoice_Date=\"{11}\" Invoice_Amount=\"{12}\" />"
                    , Convert.ToInt32(Cs.PurchaseDetails[i].MID));
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 74;

        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@XMLPURCHASE='" + string.Format("<root>{0}</root>", xPackages) + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

    }



    public string TAG_NAME { get; set; }

    public string ADDRESS { get; set; }
    public string BDID { get; set; }
    public string DELIVERY_CHARGES { get; set; }
    public string TO_KM { get; set; }
    public string FROM_KM { get; set; }
    public string MAXIMUM_ORDER_ALLOWED { get; set; }
    public string TIME_SLOT_END { get; set; }
    public string TIME_SLOT_START { get; set; }
    public string WEEK_DAYS { get; set; }
    public string SERVICE_CHARGE { get; set; }
    public string COUNTRY { get; set; }
    public string CONTACT_PERSION_NAME { get; set; }
    public string RESTAURANT_NUMBER { get; set; }
    public string GSTNO { get; set; }
    public string LONGITUDE { get; set; }
    public string LATITUDE { get; set; }
    public string PINCODE { get; set; }
    public string STATE { get; set; }
    public string CITY { get; set; }
    public string LOCATION { get; set; }

    public string ACTIVE_FLAG { get; set; }

    public string HOME_DELIVERY { get; set; }
    public string DELIVERY_RADIUS { get; set; }
    public string MINIMUM_AMOUNT { get; set; }
    public string DELIVERY_CHARGES_ALWAYS { get; set; }


    public string CONTACT_PERSON { get; set; }
    public string BUSINESS_CATEGORY { get; set; }

    public string BBID { get; set; }
    public string UOM { get; set; }
    public string PurchaseRate { get; set; }
    public string Price_With_Tax { get; set; }
    public string Total { get; set; }
    public string PID { get; set; }

    public DataSet fn_Updatedasboarddata()
    {
        str = "EXEC  PROC_CRT_ADMIN_MASTER  @TYPE='" + Type + "',@RID='" + RID + "',@WEEK_DAYS='" + WEEK_DAYS + "',@TIME_SLOT_START='" + TIME_SLOT_START
            + "',@TIME_SLOT_END='" + TIME_SLOT_END + "',@MAXIMUM_ORDER_ALLOWED='" + MAXIMUM_ORDER_ALLOWED
            + "',@FROM_KM = '" + FROM_KM + "',@TO_KM = '" + TO_KM + "',@DELIVERY_CHARGES = '" + DELIVERY_CHARGES + "',@BDID = '" + BDID + "',@ACTIVE_FLAG = '" + ACTIVE_FLAG + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fn_Updatedchages()
    {
        str = "EXEC  PROC_CRT_ADMIN_MASTER  @TYPE='" + Type + "',@RID='" + RID + "',@HOME_DELIVERY='" + HOME_DELIVERY + "',@DELIVERY_RADIUS='" + DELIVERY_RADIUS
           + "',@MINIMUM_AMOUNT='" + MINIMUM_AMOUNT + "',@DELIVERY_CHARGES='" + DELIVERY_CHARGES + "',@DELIVERY_CHARGES_ALWAYS='" + DELIVERY_CHARGES_ALWAYS
           + "',@CONTACT_PERSON='" + CONTACT_PERSON + "',@NAME='" + NAME + "',@BUSINESS_CATEGORY='" + BUSINESS_CATEGORY + "',@RESTAURANT_NUMBER='" + RESTAURANT_NUMBER
           + "',@CITY='" + CITY + "',@PINCODE='" + PINCODE + "',@ADDRESS='" + ADDRESS + "',@IMAGE_URL='" + IMAGE_URL + "',@BBID='" + BBID + "',@ACTIVE_FLAG='" + ACTIVE_FLAG + "'";
        dal d = dal.GetInstance();
        ds = d.GetDataSet(str);
        if (ds != null)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }



}

public class cl_addPurchase
{
    public string MID { get; set; }
    public string Purchase_Price { get; set; }
    public string RID { get; set; }
    public string Qty { get; set; }
    public string MRP { get; set; }
    public string Selling_Price { get; set; }
    public string GST { get; set; }
    public string HSN { get; set; }
    public string Invoice_No { get; set; }
    public string Supplier_Name { get; set; }
    public string Invoice_Date { get; set; }
    public string Invoice_Amount { get; set; }
    public string Created_By { get; set; }
    public string Comment { get; set; }
    public string Current_Selling_Price { get; set; }
    public string UOM { get; set; }
    public string Purchase_Rate { get; set; }
    public string GST_Included { get; set; }
    public string Price_With_Tax { get; set; }
    public string Total { get; set; }
    public string Item_Name { get; set; }
    public string Img { get; set; }

}

public class cl_CreateOffer
{
    public string MID { get; set; }
    public string OID { get; set; }
    public string RID { get; set; }
    public string Qty { get; set; }
    public string Price { get; set; }
    public string Table_No { get; set; }
    public string Item_Name { get; set; }
    public string Option_Name { get; set; }
    public string Price_With_GST { get; set; }
    public string GST { get; set; }
    public string GST_Included { get; set; }
    public string UOM { get; set; }
}