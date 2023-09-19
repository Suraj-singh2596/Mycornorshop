using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cl_Scheduler
/// </summary>
public class Cl_Scheduler
{
    public Cl_Scheduler()
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
    public string Mobile_No { get; set; }
    public string Header_ID { get; set; }
    public string Name { get; set; }
    #endregion

    public DataSet fnCreateOrder()
    {
        str = "EXEC PROC_CRT_SCHEDULER @TYPE='" + Type + "',@RID = '" + RID + "'";
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