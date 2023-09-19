using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cl_chats
/// </summary>
public class Cl_chats
{
    public Cl_chats()
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


    public string cid { get; set; }
    public string userId { get; set; }

    public string ChatID { get; set; }
    public string Msg { get; set; }
    public string ImageUrl { get; set; }
    public string ResponseBy { get; set; }
    public string UserType { get; set; }
    public string ResponseTime { get; set; }
    public DataSet fnchatfunctions()
    {
        str = "EXEC Proc_CrtChatFunction @TYPE='" + Type + "'," +
            "@RID = '" + RID + "',@HEADER_ID = '" +Header_ID +
            "',@cid = '" + cid + "',@userId= '" + userId +
            "',@ChatID= '" + ChatID + "',@Msg= '" + Msg +
            "',@ImageUrl= '" + ImageUrl + "',@ResponseBy= '" +
            ResponseBy + "',@UserType= '" + UserType + "',@ResponseTime= '" + ResponseTime + "'";
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