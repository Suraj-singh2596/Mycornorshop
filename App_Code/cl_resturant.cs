using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cl_resturant
/// </summary>
public class cl_resturant
{
    public cl_resturant()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// 
    /// </summary>
   #region Fields
    DataSet ds = new DataSet();
    public int Type { get; set; }
    private string str;
    public string RID { get; set; }
    public string Table_No { get; set; }
    public string Mobile_No { get; set; }
    public string Header_ID { get; set; }
    public string Name { get; set; }
    #endregion
    public List<cl_resturantorder> OrderDetails { get; set; }
    public List<cl_resturantKitchenFlags> KitchenFlag { get; set; }
    public string MPIN { get; set; }
    public string MCID { get; set; }
    public string MTID { get; set; }
    public string RTID { get; set; }
    public string Invoice_No { get; set; }
    public string CGID { get; set; }
    public string User_ID { get; set; }
    public string Amount { get; set; }
    public string Tip { get; set; }
    public string MOP { get; set; }
    public string Flag { get; set; }
    public string Line_ID { get; set; }
    public string Row_No { get; set; }

    // by suraj 

    public string TABLE_NAME { get; set; }

    public string NO_OF_CHAIRS { get; set; }

    public string OPEN_COVERED { get; set; }

    public string QR_CODE_URL { get; set; }

    public string QR_CODE_IMAGE { get; set; }

    public string USER_TYPE { get; set; }


    public string USERNAME { get; set; }

    public string MOBILE { get; set; }


    public string EDIT_RIGHTS { get; set; }

    public string IS_MANAGER { get; set; }
    public string IS_ADMIN { get; set; }
    public string Qty { get; set; }
    public string Active_Flag { get; set; }
    public string Trx_ID { get; set; }
    public string Status { get; set; }
    public string PayU_Trx_ID { get; set; }
    public string Comment { get; set; }
    public string OID { get; set; }
    public string CID { get; set; }
    public string Option_Name { get; set; }
    public string Tag { get; set; }
    public string Offer_ID { get; set; }
    public string Deal_ID { get; set; }
    public string Address_ID { get; set; }
    public string Date { get; set; }
    public string PrePaid_Flag { get; set; }
    public string Other_Payment_flag { get; set; }
    public string OtherPaymentMethod { get; set; }
    public string SDID { get; set; }
    public string Search_Item { get; set; }

    //--------------------------------------------------------

    public DataSet fngetallItemsList()
    {
        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@RESTURANT_ID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@MPIN = '" + MPIN + "',@Mobile = '" + Mobile_No + "',@Amount = '" + Amount + "'";
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
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@MPIN = '" + MPIN + "',@Mobile = '" + Mobile_No + "',@Search_Item = '" + Search_Item + "'";
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

    public DataSet fnUpdateFlag()
    {
        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@RESTURANT_ID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@MPIN = '" + MPIN + "',@Mobile = '" + Mobile_No + "',@Amount = '" +
            Amount + "',@Line_ID = '" + Line_ID + "',@Flag = '" +
            Flag + "',@CREATED_BY = '" + User_ID + "',@Header_ID = '" + Header_ID + "',@Row_NO = '" +
            Row_No + "',@Qty = '" + Qty + "'";
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

    public DataSet fnInsertData()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@MID = '" +
           MTID + "',@OID = '" + OID + "',@QTY = '" + Qty + "',@CID = '" +
           CID + "',@SIZE = '" + Option_Name + "',@FLAG = '" + Flag + "',@SDID = '" + SDID + "',@Header_ID = '" +
           Header_ID + "',@OFFER_ID = '" + Offer_ID + "',@DEAL_ID = '" + Deal_ID + "',@ADDRESS_ID = '" + Address_ID + "',@DATE = '" +
           Date + "',@PrePaid_Flag = '" + PrePaid_Flag + "',@Other_Payment_flag = '" + Other_Payment_flag + "',@OtherPaymentMethod = '" + 
           OtherPaymentMethod + "',@COMMENT = '" + Comment + "',@Delivery_ID = '" + Delivery_ID + "',@DELIVERY_BOY_ID = '" + Delivery_Boy_ID + "'";
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

    public DataSet fnInsertRecuringData()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@MID = '" +
           MTID + "',@OID = '" + OID + "',@QTY = '" + Qty + "',@CID = '" + CID + "',@SIZE = '" + Option_Name + "',@FLAG = '" + Flag + "',@Header_ID = '" +
           Header_ID + "',@SUN = '" + Sun + "',@SUN_QTY = '" + Sun_Qty + "',@MON = '" + Mon + "',@MON_QTY = '" + Mon_Qty + "',@TUE = '" + Tue + "',@TUE_QTY = '" + 
           Tue_Qty + "',@WED = '" + Wed + "',@WED_QTY = '" + Wed_Qty + "',@THU = '" + Thu + "',@THU_QTY = '" + Thu_Qty + "',@FRI = '" + Fri + "',@FRI_QTY = '" + 
           Fri_Qty + "',@SAT = '" + Sat + "',@SAT_QTY = '" + Sat_Qty + "',@DATE = '" + Date + "',@FREQ = '" + Frequency + "',@LINE_ID = '" + Line_ID + "'";
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


    public string Sun { get; set; }
    public string Mon { get; set; }
    public string Tue { get; set; }
    public string Wed { get; set; }
    public string Thu { get; set; }
    public string Fri { get; set; }
    public string Sat { get; set; }
    public string Sun_Qty { get; set; }
    public string Mon_Qty { get; set; }
    public string Tue_Qty { get; set; }
    public string Wed_Qty { get; set; }
    public string Thu_Qty { get; set; }
    public string Fri_Qty { get; set; }
    public string Sat_Qty { get; set; }
     
    public DataSet fngetParticularItemList()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RESTURANT_ID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@MCID = '" + MCID + "',@MTID = '" + MTID + "',@RTID = '" + RTID + "',@SEQ_NO = '" +
            Count + "',@CGID = '" + CGID + "',@CID = '" + CID + "',@TAGS = '" + Tag + "',@NAME = '" + Name + "'";
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

    public DataSet fngetTrxID()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@URL = '" +
            URL + "',@Amount = '" + Amount + "',@CID = '" + CID + "',@TAGS = '" + Tag + "',@DEVICE_ID= '" + Device_ID + "'";
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
    public string Count { get; set; }
    public string URL { get; set; }
    public string Device_ID { get; set; }
    public string ENDDATE { get; set; }
    public string STARTDATE { get; set; }
    public string Delivery_ID { get; set; }
    public string Frequency { get; set; }
    public string Delivery_Boy_ID { get; set; }

    public DataSet fnGenerateInvoice()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@MCID = '" + MCID + "',@MTID = '" + MTID + "',@RTID = '" +
            RTID + "',@Header_ID = '" + Header_ID + "',@INVOICE_NO = '" + Invoice_No + "',@CREATED_BY = '" +
            User_ID + "',@Amount = '" + Amount + "',@MOP = '" + MOP + "',@STARTDATE='" + STARTDATE + "',@ENDDATE='" + ENDDATE + "'";
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
    public string PictureUrl { get; set; }
    public string DispatchComments { get; set; }

    public DataSet fnUpdateFlagDelivery()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@Header_ID = '" + Header_ID + "',@LINE_ID = '" +
            Line_ID + "',@FLAG = '" + Flag + "',@USER_ID = '" + User_ID + "',@MOP = '" + MOP + "',@AMOUNT = '" + Amount 
            + "',@DELIVERY_BOY_ID = '" + Delivery_Boy_ID 
            + "',@TITLE = '" + Title + "',@COMMENT = '" + Comment + "',@PictureUrl = '" + PictureUrl + "',@DispatchComments = '" + DispatchComments + "'";
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

    public DataSet fnInsertNotification()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@Sender_User_ID = '" +
            Sender_User_ID + "',@TITLE = '" + Title + "',@COMMENT = '" + Comment + "',@Receiver_User_ID = '" + 
            Receiver_User_ID + "',@Sent_To = '" + Sent_To + "'";
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

    public DataSet fnBookTable()
    {
        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@MCID = '" + MCID + "',@MTID = '" + MTID + "',@RTID = '" +
            RTID + "',@Header_ID = '" + Header_ID + "',@INVOICE_NO = '" + Invoice_No + "',@CREATED_BY = '" +
            User_ID + "',@Mobile = '" + Mobile_No + "',@C_NAME = '" + Name + "'";
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

    public DataSet fnAddAmount()
    {
        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@TIP = '" + Tip + "',@MOP = '" + MOP + "',@AMOUNT = '" +
            Amount + "',@Header_ID = '" + Header_ID + "',@INVOICE_NO = '" + Invoice_No + "',@CREATED_BY = '" +
            User_ID + "',@Flag = '" + Flag + "',@ACTIVE_STATUS = '" + Active_Flag + "'";
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

    public DataSet getTransactionDetails()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@Trx_ID = '" +
            Trx_ID + "',@TIP = '" + Tip + "',@MOP = '" + MOP + "',@AMOUNT = '" +
            Amount + "',@Header_ID = '" + Header_ID + "',@INVOICE_NO = '" + Invoice_No + "',@CREATED_BY = '" +
            User_ID + "',@Flag = '" + Flag + "',@ACTIVE_STATUS = '" + Active_Flag + "'";
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

    public DataSet getCustomerDataDetails()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@Trx_ID = '" +
            Trx_ID + "',@User_ID = '" + User_ID + "',@Flag = '" + Flag + "',@ACTIVE_STATUS = '" + Active_Flag + "'";
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
    public string Order_ID { get; set; }
    public string Title { get; set; }
    public string PMKey { get; set; }
    public string PMerchane_ID { get; set; }
    public string Receiver_User_ID { get; set; }
    public string Sender_User_ID { get; set; }
    public string Sent_To { get; set; }

    public DataSet UpdateOnlineStatus()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@AMOUNT = '" + Amount + "',@Trx_ID = '" +
            Trx_ID + "',@PayU_Trx_ID = '" + PayU_Trx_ID + "',@ORDER_STATUS = '" + Status + "',@RID = '" +
            RID + "',@C_NAME = '" + Name + "',@Mobile = '" + Mobile_No + "',@COMMENT = '" + Comment + "',@Order_ID = '" + 
            Order_ID + "',@PMKEY = '" + PMKey + "',@PMERCHANT_ID = '" + PMerchane_ID + "',@Flag = '" + Flag + "'";
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

    //-----------------------------by suraj
    public DataSet fnInsertTable()
    {
        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "',@TABLE_NO = '" +
            Table_No + "',@TABLE_NAME = '" + TABLE_NAME + "',@NO_OF_CHAIRS = '" + NO_OF_CHAIRS + "',@OPEN_COVERED = '" +
            OPEN_COVERED + "',@QR_CODE_URL='" + QR_CODE_URL + "',@QR_CODE_IMAGE='" + QR_CODE_IMAGE + "',@RTID='" +
            RTID + "',@USER_TYPE='" + USER_TYPE + "',@USERNAME='" + USERNAME + "',@MOBILE='" + MOBILE + "',@NAME='" +
            Name + "',@EDIT_RIGHTS='" + EDIT_RIGHTS + "',@IS_MANAGER='" + IS_MANAGER + "',@IS_ADMIN='" + IS_ADMIN + "'";
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
    //------------------------------------------------

    public void fnSaveSubPackages(cl_resturant Cs, out string ResultMessage, out string TransactionID, string Punched_By)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.OrderDetails != null)
        {
            for (int i = 0; i < Cs.OrderDetails.Count; i++)
            {
                xmlPackages += string.Format("<xPckg RID=\"{0}\" MOBILE_NO=\"{1}\" PUNCHED_BY=\"{2}\" MID=\"{3}\" ITEM_NAME=\"{4}\" QTY=\"{5}\" SIZE=\"{6}\" PRICE=\"{7}\"/>"
                    , Convert.ToInt32(Cs.OrderDetails[i].RID), Cs.Mobile_No, Punched_By, Convert.ToInt32(Cs.OrderDetails[i].MID)
                    , Cs.OrderDetails[i].Item_Name, Convert.ToDecimal(Cs.OrderDetails[i].Qty), Convert.ToInt32(Cs.OrderDetails[i].OID), Convert.ToDecimal(Cs.OrderDetails[i].Price));
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 2;

        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@Header_ID='" + Cs.Header_ID + "',@TID='" + Cs.Table_No + "',@RID='" +
            Cs.RID + "',@C_Name='" + Cs.Name + "',@XMLPACKAGES='" + string.Format("<root>{0}</root>", xPackages) + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            ResultMessage = Convert.ToString(ds.Tables[0].Rows[0]["ResultSaved"]);
            TransactionID = Convert.ToString(ds.Tables[0].Rows[0]["Transaction_ID"]);
        }
        else
        {
            ResultMessage = "Failed";
            TransactionID = null;
        }


    }

    public void fnUpdateFlag(cl_resturant Cs, string Header_ID, string RID, string Punched_By)
    {
        string xmlPackages = string.Empty;
        string xPackages = string.Empty;
        if (Cs.KitchenFlag != null)
        {
            for (int i = 0; i < Cs.KitchenFlag.Count; i++)
            {
                xmlPackages += string.Format("<xPckg LINE_ID=\"{0}\" />"
                    , Convert.ToInt32(Cs.KitchenFlag[i].LINE_ID));
            }
        }
        xPackages += string.Format("<xPackages>{0}</xPackages>", xmlPackages);

        Type = 28;

        str = "EXEC PROC_STD_RESTURANT @TYPE='" + Type + "',@Header_ID='" + Header_ID + "',@Created_By='" + Punched_By + "',@RID='" +
            RID + "',@XMLPACKAGES='" + string.Format("<root>{0}</root>", xPackages) + "'";
        dal d = dal.GetInstance();

        DataSet ds = d.GetDataSet(str);

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string Msg = "Y";
        }
        else
        {
            string Msg = "N";
        }


    }
}


public class cl_resturantKitchenFlags
{
    public string MID { get; set; }
    public string LINE_ID { get; set; }
    public string OID { get; set; }
    public string RID { get; set; }
    public string Qty { get; set; }
    public string Price { get; set; }
    public string Table_No { get; set; }
    public string Item_Name { get; set; }
    public string Option_Name { get; set; }
}
public class cl_resturantorder
{
    public string MID { get; set; }

    public string CGID { get; set; }

    public string MCID { get; set; }
    public string OID { get; set; }
    public string RID { get; set; }
    public string Qty { get; set; }
    public string Price { get; set; }
    public string Table_No { get; set; }
    public string Item_Name { get; set; }
    public string Option_Name { get; set; }
    public string CG_NAME { get; set; }
    public string IMAGE_URL { get; set; }
    public string MRP { get; set; }
    public string Barcode { get; set; }
    public string Current_Stock { get; set; }
    public string GST { get; set; }
    public string GST_Included { get; set; }
}