using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cl_User
/// </summary>
public class Cl_User
{
    public Cl_User()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    #region Fields
    DataSet ds = new DataSet();
    public int Type { get; set; }
    private string str;
    #endregion

    public string CID { get; set; }
    public string RID { get; set; }
    public DataSet fn_getuser_date()
    {
        str = "EXEC PROC_CRT_RETAILER_CUSTOMER @TYPE='" + Type + "',@CID='" + CID + "',@RID='" + RID + "'";
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
 
 