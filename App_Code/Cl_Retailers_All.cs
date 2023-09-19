using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cl_Retailers_All
/// </summary>
public class Cl_Retailers_All
{
    public Cl_Retailers_All()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Type { get; set; }
    private string str;

    public string RID { get; set; }
    public string Trx_ID { get; set; }
    public string User_ID { get; set; }
    public string Flag { get; set; }
    public string Moblie { get; set; }
    public string Name { get; set; }
    public string Business_Name { get; set; }
    public string City { get; set; }
    public string Longitude { get; set; }
    public string Business_Category { get; set; }
    public string Pincode { get; set; }
    public string Latitude { get; set; }
    public string Address { get; set; }
    public string CG_Name { get; set; }

    DataSet ds = new DataSet();
    public DataSet getRetailerDataDetails()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@MOBILE = '" +
            Moblie + "',@CITY = '" + City + "',@C_Name = '" + Name + "',@BUSINESS_NAME = '" + Business_Name + "',@LONGITUDE = '" +
            Longitude + "',@BUSINESS_CATEGORY = '" + Business_Category + "',@PINCODE = '" + 
            Pincode + "',@LATITUDE = '" + Latitude + "',@ADDRESS = '" + Address + "'";
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
    public DataSet getRetailerDataDetailsByCGName()
    {
        str = "EXEC PROC_CRT_ADMIN_MASTER @TYPE='" + Type + "',@RID = '" + RID + "',@MOBILE = '" +
            Moblie + "',@CITY = '" + City + "',@C_Name = '" + Name + "',@BUSINESS_NAME = '" + Business_Name + "',@LONGITUDE = '" +
            Longitude + "',@BUSINESS_CATEGORY = '" + Business_Category + "',@PINCODE = '" +
            Pincode + "',@LATITUDE = '" + Latitude + "',@CG_NAME = '" + CG_Name + "'";
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