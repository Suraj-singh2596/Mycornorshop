using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getNotifications();
    }
    public void getNotifications()
    {
        Cl_User cu = new Cl_User();
        DataSet ds = new DataSet();
        if (HttpContext.Current.Request.Cookies["admin_user_id"] != null && HttpContext.Current.Request.Cookies["user_type"].Value.ToString() == "retailer")
        {
            cu.CID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        }
        else if (HttpContext.Current.Request.Cookies["delivery_user_id"] != null && HttpContext.Current.Request.Cookies["user_type"].Value.ToString() == "delivery")
        {
            cu.CID = HttpContext.Current.Request.Cookies["delivery_user_id"].Value.ToString();
        }
        else
        {
            cu.CID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
        }
        cu.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cu.Type = 15;
        string Notification = "";
        ds = cu.fn_getuser_date();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string href = "javascript:void(0);";
                string UserDetails = "";
                if (DR["LinkHref"].ToString()!="")
                {
                    href = DR["LinkHref"].ToString();
                }

                if (DR["NOTIF_TITLE"].ToString().ToLower() == "chat alert")
                {

                    UserDetails = "<div class='row p-2'><div class='col-6'><strong>" + DR["FIRST_NAME"].ToString() + "</strong></div><div class='col-6'><strong><a href='tel:=+91" + DR["MOBILE"].ToString() + "'>" + DR["MOBILE"].ToString() + "</a></strong></div></div>";
                }

                Notification = Notification + "<div onclick='fnredirectbtn($(this))' redirectto=" + href + " class=\"card mt-3\"><label class=\"title m-0 editpersonal\">" + DR["NOTIF_TITLE"].ToString() + " <span class=\"float-right\">" + Convert.ToDateTime(DR["NOTIF_DATETIME"]).ToString("dd-MMM-yyyy hh:mm:tt") + "</span></label>" +
                                "<hr class=\"mt-0 mb-0\" />" + UserDetails + "<div class=\"p-2\"><p>" + DR["NOTIF_TEXT"].ToString() + "</p>" +
                                "</div></div>";
            }
        }
        Notifications.InnerHtml = Notification;
    }
}