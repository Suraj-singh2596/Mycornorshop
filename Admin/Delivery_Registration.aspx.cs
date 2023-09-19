using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Admin_Delivery_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        DataSet ds = cr.getRetailerDataDetails();

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("user_id");
            Cookie.Value = ds.Tables[0].Rows[0]["USER_ID"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie aCookie = new HttpCookie("rid");
            aCookie.Value = ds.Tables[0].Rows[0]["RID"].ToString();
            aCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(aCookie);

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