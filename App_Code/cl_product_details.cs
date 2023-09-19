using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cl_product_details
/// </summary>

public class cl_product_details
{
    public cl_product_details()
    {
        //
        // TODO: Add constructor logic here
        //
    }
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


    public DataSet fngetcompleteproductdetails()
    {
        str = "EXEC proc_new_crt @TYPE='" + Type + "',@RESTURANT_ID = '" + RID + "',@SDID = '" +
            SDID + "',@CID='"+ CID + "'";
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