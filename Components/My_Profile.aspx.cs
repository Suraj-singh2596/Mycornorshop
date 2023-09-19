using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_My_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        user_details();
        ///   getCustomerDetails();
        //itemcounts(HttpContext.Current.Request.Cookies["rid"].Value.ToString());
    }
    private void user_details()
    {

        Cl_User objuser = new Cl_User();
        objuser.CID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
        //objuser.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objuser.Type = 7;
        DataSet ds = new DataSet();
        ds = objuser.fn_getuser_date();
        if (ds != null && ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
        {
            // StoreName.InnerHtml = ds.Tables[1].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
            //ds.Tables[1].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[1].Rows[0]["CITY"].ToString() +
            //"</p>";
            username.InnerHtml = ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
            mobile.InnerHtml = "+91 " + ds.Tables[0].Rows[0]["MOBILE"].ToString();
            email.InnerHtml = ds.Tables[0].Rows[0]["CUST_EMAIL"].ToString();
            username__input.Value = ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString();
            mobile__input.Value = ds.Tables[0].Rows[0]["MOBILE"].ToString();
            email__input.Value = ds.Tables[0].Rows[0]["CUST_EMAIL"].ToString();



            custid.Value = ds.Tables[0].Rows[0]["CUST_ID"].ToString();

            HttpCookie Cookie = new HttpCookie("cid");
            Cookie.Value = ds.Tables[0].Rows[0]["CUST_ID"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
            //style="background-image: url(http://i.pravatar.cc/500?img=7);"
            if (ds.Tables[0].Rows[0]["CUST_IMG_URL"].ToString() != "")
            {
                imgurl.Value = ds.Tables[0].Rows[0]["CUST_IMG_URL"].ToString();
                imagePreview.Style.Add("background-image", "../Menu_Pics/" + ds.Tables[0].Rows[0]["CUST_IMG_URL"].ToString());
            }
            else
            {
                imgurl.Value = "default-user-avatar.png";
                imagePreview.Style.Add("background-image", "../Menu_Pics/default-user-avatar.png");
            }

            // usertype.InnerHtml = ds.Tables[0].Rows[0]["USERTYPE"].ToString();
            //usernametop.InnerHtml = "<span>Welcome " + ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString() + "</span> &nbsp;&nbsp;<i class=\"fa fa-user-circle-o\"></i></span>";

            //mainbalance.InnerHtml = "<span>" + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString() + " </span>";

            string address = ds.Tables[0].Rows[0]["ADDRESS_DETAILS"].ToString().Replace("|", " , ");
            //fulladdress.InnerHtml = address;

        }
    }


    public void getCustomerDetails()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
        //cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ds = cc.fnGetAddress();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            //string changeStoreOption = "<p id=\"storechange\" class=\"_ChangeStore_btn\">Change Store</p>";
            //if (ds.Tables[1].Rows[0]["CHANGE_STORE_FLAG"].ToString() == "N")
            //{
            //    changeStoreOption = "";
            //}

            //StoreName.InnerHtml = ds.Tables[1].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
            //ds.Tables[1].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[1].Rows[0]["CITY"].ToString() +
            //"</p>" + changeStoreOption;
            //UserName_n_Pic.InnerHtml = ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString() + "&nbsp;<i class=\"fa fa-user-circle-o fa-2x\"></i> ";
            //active_balance.InnerHtml = "<span style=\"font-size: 18px; font-weight: 100;\">Active Balance: <strong>₹ " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString() + "</strong></span>";
            // active_bal.InnerHtml = "<span>WALLET BALANCE</span><br/> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
            active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\"> with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
            retailer_number.InnerHtml = ds.Tables[1].Rows[0]["RESTAURANT_NUMBER"].ToString();

        }
    }


    [WebMethod]
    public static string fnGetAllAddress()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 4;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        ds = cc.fnGetAddress();
        string Address = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {



            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string fa_Heart = "fa-heart-o";
                if (DR["DEFAULT_ADDRESS_FLAG"].ToString() == "Y")
                {
                    fa_Heart = "fa-heart text-danger";
                }
                string checked_radio1 = "";
                string checked_radio2 = "";
                string checked_radio3 = "";
                if (DR["ADDRESS_TYPE"].ToString() == "Home")
                {
                    checked_radio1 = "checked";
                    checked_radio2 = "";
                    checked_radio3 = "";
                }
                else if (DR["ADDRESS_TYPE"].ToString() == "Office")
                {
                    checked_radio1 = "";
                    checked_radio2 = "checked";
                    checked_radio3 = "";
                }
                else if (DR["ADDRESS_TYPE"].ToString() == "Other")
                {
                    checked_radio1 = "";
                    checked_radio2 = "";
                    checked_radio3 = "checked";
                }
                Address = Address + "<div class=\"card border-left-primary shadow mt-2 mb-2\">" +
                     "<div class=\"card-body\">" +
                     "<div class=\"row pt-2 pb-2\">" +
                     "<div class=\"col-12\"><a href=\"../Components/address\"><i add_id='" + DR["CUST_ADD_ID"].ToString() + "' style=\"float: right; margin-top: -18px; margin-right: -15px;font-size: 13px;color: #17c3d4;\" class=\"fa fa-pencil editaddress_btn\"></i></a></div>" +
                    "<div class=\"col-12\"><i class=\"fa fa-user\"></i> <span style=\"font-size: 20px;color: #7c7c7c;font-weight:bold;\">" + DR["CUST_NAME"].ToString() + " </span></div>" +
                    "<div class=\"col-12\"><i class=\"fa fa-phone\"></i> <span>" + DR["CUST_MOBILE"].ToString() + "</span></div>" +
                    "</div><hr/>" +
                                   "<div class=\"row no-gutters align-items-center\"><div class=\"col mr-2\">" +
                                   "<i class=\"defaultaddress fa " + fa_Heart + "\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' aria-hidden=\"true\" style=\"float: right; margin-top: -78px; margin-right: -15px;font-size: 25px;\"></i>" +
                                   "<div>" + DR["ADDRESS"].ToString() + "," + DR["LOCATION"].ToString() + "," +
                                   DR["CITY"].ToString() + "," + DR["STATE"].ToString() + "," + DR["PINCODE"].ToString() + "," + DR["LANDMARK"].ToString() + "<hr/> <div class=\"addressoptions\" style=\"margin-top: 5px;\">" +
                                   "<form>" +
                                   "<label class=\"radio-inline\"><input type=\"radio\" flag=\"1\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' name=\"optradio\" " + checked_radio1 + "> Home</label>&nbsp;&nbsp;" +
                                   "<label class=\"radio-inline\"><input type=\"radio\" flag=\"2\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' name=\"optradio\" " + checked_radio2 + "> Office</label>&nbsp;&nbsp;" +
                                   "<label class=\"radio-inline\"><input type=\"radio\" flag=\"3\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' name=\"optradio\" " + checked_radio3 + "> Other</label>" +
                                   "</form></div></div></div></div></div></div>";
            }

        }



        return Address;
    }

    //public void itemcounts(string RID)
    //{
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
    //    cr.Type = 46;
    //    ds = cr.fngetParticularItemList();
    //    string item_count = "0";

    //    if (ds != null && ds.Tables[0].Rows.Count > 0)
    //    {
    //        item_count = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();

    //        HttpCookie Cookie = new HttpCookie("item_count");
    //        Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
    //        Cookie.Expires = DateTime.Now.AddDays(365);
    //        HttpContext.Current.Response.Cookies.Add(Cookie);
    //    }



    //    Mycart2.InnerHtml = item_count;
    //}




    [WebMethod]

    public static string Updateuserdata(string ImgSource, string username, string usermobile, string useremail, string custid)
    {


        string uploadfile = string.Empty;
        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName();
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName();
                    if (dInfo.GetFiles(uploadfile).Length <= 0)
                    {
                        IsImageExists = false;
                        break;
                    }
                }
            }

            using (FileStream fs = new FileStream(DocPicFilePath + uploadfile, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgSource);
                    bw.Write(data);
                    bw.Close();
                }
            }

        }

        Cl_Customer ObjCust = new Cl_Customer();
        ObjCust.IMAGE_URl = uploadfile;
        ObjCust.NAME = username;
        ObjCust.MOBILE = usermobile;
        ObjCust.EMAIL = useremail;
        ObjCust.CID = custid;
        ObjCust.Type = 14;
        DataSet Ds = new DataSet();
        Ds = ObjCust.fnUpdateUserData();
        return "1";
    }


    public static string GetMENUImageName()
    {

        Random random = new Random();
        int ran = random.Next(100, 999);

        string x = DateTime.Now.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        string ImageName = "";

        ImageName = "myCornershopUser_img-" + x + ran + ".png";

        return ImageName;
    }
}