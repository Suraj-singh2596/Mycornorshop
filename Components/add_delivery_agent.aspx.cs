using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_add_delivery_agent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string basicdetails(string name, string mobile)
    { 
        Cl_admin CA = new Cl_admin();
        CA.NAME = name;
        CA.MOBILE = mobile;
        CA.RID= HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        CA.Type = 75;
        CA.USER_ID= HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        DataSet ds = new DataSet();
        ds = CA.fn_Customer_Data();
         
        return "";
    }



    [WebMethod]
    public static string GetDeliveryagents()
    {
        string data = "";
        Cl_admin CA = new Cl_admin();
       
        CA.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        CA.Type = 76;
        CA.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        DataSet ds = new DataSet();
        ds = CA.fn_Customer_Data();
        if(ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                data = data + "<div class=\"row mt-2\"><div style=\"width: 40%\">"+DR["PERSON_NAME"].ToString()+ "</div>" +
                    "<div style=\"width: 40%\">" + DR["USER_NAME"].ToString() + "</div><div  style=\"width: 20%;text-align: right;padding-right: 10px;\">" +
                    "<i style=\"color:red;\" username='" + DR["USER_NAME"].ToString() + "' class=\"fa fa-trash deleteAgent\"></i></div></div>";
            }
        }
        return data ;
    }
    [WebMethod]
    public static string DeleteDeliveryAgent(string Mobile)
    {
         
        Cl_admin CA = new Cl_admin();
  
        CA.MOBILE = Mobile;
        CA.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        CA.Type = 77;
        CA.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        DataSet ds = new DataSet();
        ds = CA.fn_Customer_Data();

        return "";
    }
}