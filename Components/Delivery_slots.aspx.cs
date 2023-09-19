using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Delivery_slots : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    [WebMethod]

    public static string insertnewdeliverySlots(string days, string starttime, string endtime, string maxorder)
    {

        Cl_admin d = new Cl_admin();
        d.Type = 62;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        d.TIME_SLOT_START = starttime;
        d.TIME_SLOT_END = endtime;
        d.MAXIMUM_ORDER_ALLOWED = maxorder;
        d.WEEK_DAYS = days;
        DataSet ds = d.fn_Updatedasboarddata();
        return "Y";

    }


    [WebMethod]

    public static string getslotbydayname(string days)
    {

        string dataTable = "";
        Cl_admin d = new Cl_admin();
        d.Type = 64;
        d.TIME_SLOT_START = days;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = d.fn_Updatedasboarddata();
        string check = "";
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                if (DR["ACTIVE_FLAG"].ToString() == "Y")
                {
                    check = "checked";
                }
                else
                {
                    check = "";
                }

                dataTable = dataTable + "<div class=\"form-check\"><input dsid=\"" + DR["BDID"].ToString() + "\" " + check + " class=\"form-check-input UPDATESLOT\"  type=\"checkbox\" value=\"" + DR["WEEK_DAYS"].ToString() + "\" id=\"" + DR["BDID"].ToString() + "-" + DR["WEEK_DAYS"].ToString() + "\" /><label class=\"form-check-label\" for=\"" + DR["BDID"].ToString() + "-" + DR["WEEK_DAYS"].ToString() + "\">" + DR["WEEK_DAYS"].ToString() + "</label></div>";
            }

        }


        return dataTable;
    }



    [WebMethod]

    public static string getslots()
    {
        string dataTable = "";
        Cl_admin d = new Cl_admin();
        d.Type = 63;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = d.fn_Updatedasboarddata();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                dataTable = dataTable + "<div class=\"daysnames\">" +
                                        "<div class=\"dayname\" name=\"" + DR["TIME_SLOT_START"].ToString() + "\" style=\"padding-left: 25px; \">" + DR["TIME_SLOT_START"].ToString() + " - " + DR["TIME_SLOT_END"].ToString() + "</div>" +
                                         "<div class=\"slotsshow\">" +
                                          "</div>" +
                                    "</div>";

            }

        }
        return dataTable;
    }


    [WebMethod]

    public static string updateslots(string dsid, string flag)
    {
        string data = "";
        Cl_admin d = new Cl_admin();
        d.Type = 65;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        d.BDID = dsid;
        d.ACTIVE_FLAG = flag;
        DataSet ds = d.fn_Updatedasboarddata();

        return "Y";
    }


    //[WebMethod]

    //public static string Markunavailability(string Markflag, string deliveryMsg)
    //{
    //    Cl_admin d = new Cl_admin();
    //    d.Type = 18;
    //    d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    d.ADDRESS = deliveryMsg;
    //    d.ACTIVE_FLAG = Markflag;
    //    DataSet ds = d.fn_Updatedasboarddata();
    //    return "Y";
    //}


}