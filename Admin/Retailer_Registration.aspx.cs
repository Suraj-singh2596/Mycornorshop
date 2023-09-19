using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Retailer_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]) && !string.IsNullOrEmpty(Request.Params["ulid"]))
        {
            string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
            string RetailerID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());

            HttpCookie Cookie = new HttpCookie("admin_user_id");
            Cookie.Value = User_ID;
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie aCookie = new HttpCookie("rid");
            aCookie.Value = RetailerID;
            aCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(aCookie);
            getAdminDetails(RetailerID, User_ID);
        }
        HttpCookie user_type = new HttpCookie("user_type");
        user_type.Value = "retailer";
        user_type.Expires = DateTime.Now.AddDays(365);
        HttpContext.Current.Response.Cookies.Add(user_type);
    }

    public void getAdminDetails(string RetailerID, string User_ID)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = RetailerID;
        ca.USER_ID = User_ID;
        ca.Type = 25;
        ds = ca.fn_admin_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            Mobile.Value = ds.Tables[0].Rows[0]["RESTAURANT_NUMBER"].ToString();
            Mobile.Attributes.Add("readonly", "readonly");
            Otp_Area.Style.Add("display", "none");
            SubmitDetails.Attributes.Add("flag", "Y");
            SubmitDetails.Attributes.Add("flag", "Y");

        }
        else
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = "";
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }



    }

    [WebMethod]

    public static string CheckMobile(string Mobile)
    {
        string Result = "N";
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.Moblie = Mobile;
        cr.Type = 51;
        DataSet ds = cr.getRetailerDataDetails();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Result = "Y";
        }
        return Result;
    }

    [WebMethod]

    public static string generateUserLogin(string Mobile, string OTP)
    {
        string OTP_Mached = "N|";

        if (HttpContext.Current.Session["OTP"].ToString() == OTP)
        {
            DataSet ds = new DataSet();
            Cl_Retailers_All cr = new Cl_Retailers_All();
            cr.Moblie = Mobile;
            cr.Type = 51;
            ds = cr.getRetailerDataDetails();

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                OTP_Mached = "Y|../Admin/admin_dashboard.aspx?rid=" + Cl_admin.Encrypt(ds.Tables[0].Rows[0]["RID"].ToString()) +
                    "&ulid=" + Cl_admin.Encrypt(ds.Tables[0].Rows[0]["USER_ID"].ToString());
            }

        }


        return OTP_Mached;
    }

    [WebMethod]
    public static string ProceedForRegistration(string Mobile, string Name, string Business_Name, string Address, string City,
        string Pincode, string Latitude, string Longitude, string Business_Category)
    {
        Cl_Retailers_All cr = new Cl_Retailers_All();
        cr.Moblie = Mobile;
        cr.Name = Name;
        cr.Business_Name = Business_Name;
        cr.Address = Address;
        cr.City = City;
        cr.Pincode = Pincode;
        cr.Latitude = Latitude;
        cr.Longitude = Longitude;
        cr.Business_Category = Business_Category;
        cr.Type = 50;
        if (HttpContext.Current.Request.Cookies["rid"] != null)
        {
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        }
        else
        {
            cr.RID = "";
        }
        if (HttpContext.Current.Request.Cookies["admin_user_id"] != null)
        {
            cr.User_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        }
        else
        {
            cr.User_ID = "";
        }
        DataSet ds = cr.getRetailerDataDetails();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("admin_user_id");
            Cookie.Value = ds.Tables[0].Rows[0]["USER_ID"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie aCookie = new HttpCookie("rid");
            aCookie.Value = ds.Tables[0].Rows[0]["RID"].ToString();
            aCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(aCookie);

            HttpCookie Cookieb = new HttpCookie("business");
            Cookieb.Value = ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString();
            Cookieb.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookieb);

            string SMS = "NEW RETAILER - " + Name + " - " + Mobile + " in " + City + " has done self-registration via " + ds.Tables[0].Rows[0]["CREATED_BY"].ToString();

            cl_SMS.Dyn_sms("9650601555", SMS, "");
            cl_SMS.Dyn_sms("8826984882", SMS, "");

            using (MailMessage mm = new MailMessage("puneet.iglobalsolution@gmail.com", "puneet.iglobalsolution@gmail.com"))
            {
                string MailDeail = SMS;
                string subj = "NEW RETAILER REGISTRATION ALERT";
                mm.CC.Add(new MailAddress("puneet.naresh@mycornershop.in"));
                mm.Subject = subj;
                mm.Body = MailDeail;
                mm.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mm);
            }
        }
        return "1";
    }
}