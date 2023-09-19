using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cl_User_Login
/// </summary>
public class Cl_User_Login
{
    public Cl_User_Login()
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
    public object UserName { get; set; }
    public object Password { get; set; }

    #endregion

    public DataSet checkCredentialsCustomer()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "'," +
            "@USERNAME = '" + UserName + "',@PASSWORD = '" + Password + "'";
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

    public DataSet checkCredentialsRetailer()
    {
        str = "EXEC PROC_CRT_RESTURANT @TYPE='" + Type + "',@RID = '" + RID + "'," +
            "@USER_NAME = '" + UserName + "',@PASSWORD = '" + Password + "'";
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