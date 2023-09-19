using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Request.Form["username"] != "" && Request.Form["password"] != "")
        {
            DataSet ds = new DataSet();
            Cl_User_Login cl = new Cl_User_Login();
            cl.Type = 76;
            cl.UserName = Request.Form["username"];
            cl.Password = Request.Form["password"];
            ds = cl.checkCredentialsRetailer();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                HttpCookie Cookie = new HttpCookie("admin_user_id");
                Cookie.Value = ds.Tables[1].Rows[0]["USER_ID"].ToString();
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                HttpCookie rid = new HttpCookie("rid");
                rid.Value = ds.Tables[1].Rows[0]["RID"].ToString();
                rid.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(rid);
                Session["Admin"] = ds.Tables[1].Rows[0]["USER_ID"].ToString() + "," + ds.Tables[1].Rows[0]["RID"].ToString() + "," + ds.Tables[1].Rows[0]["BUSINESS_CATEGORY"].ToString();
                Response.Redirect("https://mycornershop.in/Admin/admin_items.aspx");

            }
            else
            {
                Response.Write("<script>alert('Username or password is incorrect')</script>");
            }
        }
    }



    protected void btnOTP_Submit(object sender, EventArgs e)
    {
        if (Request.Form["OTP"] != "" && Request.Form["OTP"].Length == 4)
        {
            if (Request.Form["OTP"] ==Cl_admin.Decrypt(HttpContext.Current.Request.Cookies["otp"].Value.ToString()))
            {
                DataSet ds = new DataSet();
                Cl_User_Login cl = new Cl_User_Login();
                cl.Type = 77;
                cl.UserName = Request.Form["username"];
                ds = cl.checkCredentialsRetailer();
                if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    HttpCookie Cookie = new HttpCookie("admin_user_id");
                    Cookie.Value = ds.Tables[1].Rows[0]["USER_ID"].ToString();
                    Cookie.Expires = DateTime.Now.AddDays(365);
                    HttpContext.Current.Response.Cookies.Add(Cookie);

                    HttpCookie rid = new HttpCookie("rid");
                    rid.Value = ds.Tables[1].Rows[0]["RID"].ToString();
                    rid.Expires = DateTime.Now.AddDays(365);
                    HttpContext.Current.Response.Cookies.Add(rid);
                    Session["Admin"] = ds.Tables[1].Rows[0]["USER_ID"].ToString() + "," + ds.Tables[1].Rows[0]["RID"].ToString() + "," + ds.Tables[1].Rows[0]["BUSINESS_CATEGORY"].ToString(); ;
                    Response.Redirect("https://mycornershop.in/Admin/admin_items.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Username does not exists')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Wrong OTP! Please enter valid OTP')</script>");
            }
        }
    }
    [WebMethod]
    public static string sendOTP(string Mobile)
    {

        int rand = new Random().Next(1000, 9999);
        HttpCookie Cookie = new HttpCookie("otp");
        Cookie.Value = Cl_admin.Encrypt(Convert.ToString(rand));
        Cookie.Expires = DateTime.Now.AddDays(365);
        HttpContext.Current.Response.Cookies.Add(Cookie);
        string SMS = HttpUtility.UrlEncode("Your OTP for login is " + Convert.ToString(rand));
         cl_SMS.Dyn_sms(Mobile, SMS, "");

        return "1";
    }

}