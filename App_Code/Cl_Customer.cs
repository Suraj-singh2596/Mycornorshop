using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
/// <summary>
/// Summary description for Cl_Customer
/// </summary>
public class Cl_Customer
{
    public Cl_Customer()
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
    public string CID { get; set; }
    #endregion
    public string ADDRESS_ID { get; set; }
    public string Flag { get; set; }
    public string Address { get; set; }
    public string Location { get; set; }
    public string Area { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string Pincode { get; set; }
    public string Landmark { get; set; }
    public string NAME { get; set; }
    public string MOBILE { get; set; }

    public string lattitude { get; set; }
    public string longitude { get; set; }
    public string EMAIL { get; set; }

    public string IMAGE_URl { get; set; }
    public DataSet fnGetAddress()
    {
        str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@RID='" + RID + "',@CID='" + CID + "',@ADDRESS_ID='" + 
            ADDRESS_ID + "',@FLAG='" + Flag + "'";
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

    public DataSet fnGetLocations()
    {
        str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@RID='" + RID + "',@CID='" + CID + "',@ADDRESS_ID='" +
            ADDRESS_ID + "',@LAT='" + lattitude + "',@LONG='" + longitude + "'";
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

    public string ADDRESS_1 { get; set; }
    public DataSet fnInsertAddress()
    {
        str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@RID='" + RID + "',@CID='" + CID + "',@ADDRESS_TYPE='" +
            Flag + "',@ADDRESS='" + Address + "',@LOCATION='" + Location + "',@CITY='" + City + "',@STATE='" + State + "',@PINCODE='" +
            Pincode + "',@LANDMARK='" + Landmark + "',@NAME='" + NAME + "',@MOBILE='" + MOBILE + "',@ADDRESS_ID='" + ADDRESS_ID + "',@ADDRESS_1='" + ADDRESS_1 + "'";
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
    //public DataSet fnInsertAddress()
    //{
    //    str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@RID='" + RID + "',@CID='" + CID + "',@ADDRESS_TYPE='" +
    //        Flag + "',@ADDRESS='" + Address + "',@LOCATION='" + Location + "',@CITY='" + City + "',@STATE='" + State + "',@PINCODE='" +
    //        Pincode + "',@LANDMARK='" + Landmark + "',@NAME='" + NAME + "',@MOBILE='" + MOBILE + "',@ADDRESS_ID='" + ADDRESS_ID + "'";
    //    dal d = dal.GetInstance();
    //    ds = d.GetDataSet(str);
    //    if (ds != null)
    //    {
    //        return ds;
    //    }
    //    else
    //    {
    //        return null;
    //    }

    //}


    public DataSet fnUpdateUserData()
    {
        str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@CUST_ID='" + CID + "',@FIRST_NAME='" + NAME
            + "',@CUST_EMAIL='" + EMAIL + "',@MOBILE='" + MOBILE + "',@CUST_IMG_URL='" + IMAGE_URl + "'";
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
    public DataSet fn_getTRX_Details()
    {
        str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@RID='" + RID + "',@CID='" + CID + "',@ADDRESS_TYPE='" +
            Flag + "',@ADDRESS='" + Address + "',@LOCATION='" + Location + "',@CITY='" + City + "',@STATE='" + State + "',@PINCODE='" +
            Pincode + "',@LANDMARK='" + Landmark + "',@NAME='" + NAME + "',@MOBILE='" + MOBILE + "',@ADDRESS_ID='" + ADDRESS_ID + "'";
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