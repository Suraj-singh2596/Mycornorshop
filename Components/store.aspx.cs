using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_store : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //getCustomerDetails();
        //if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]) && !string.IsNullOrEmpty(Request.Params["ulid"]))
        //{
        //    string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
        //    string RID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());
        //    HttpCookie Cookie = new HttpCookie("user_id");
        //    Cookie.Value = User_ID;
        //    Cookie.Expires = DateTime.Now.AddDays(365);
        //    HttpContext.Current.Response.Cookies.Add(Cookie);

        //    HttpCookie rid = new HttpCookie("rid");
        //    rid.Value = RID;
        //    rid.Expires = DateTime.Now.AddDays(365);
        //    HttpContext.Current.Response.Cookies.Add(rid);

        //    getUserData(User_ID);
        //}
        //string user_id = Cl_admin.Encrypt("1");
    }

    [WebMethod]
    public static string getUserData()
    {
        if (HttpContext.Current.Request.Cookies.AllKeys.Contains("user_id") != false)
        {
            cl_resturant cr = new cl_resturant();
            cr.User_ID = (HttpContext.Current.Request.Cookies["user_id"].Value.ToString());
            cr.Type = 69;
            DataSet ds = cr.getCustomerDataDetails();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {

                HttpCookie cidCookie = new HttpCookie("cid");
                cidCookie.Value = (ds.Tables[0].Rows[0]["CUST_ID"].ToString());
                cidCookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(cidCookie);

                HttpCookie CNameCookie = new HttpCookie("cust_name");
                CNameCookie.Value = ds.Tables[0].Rows[0]["CUST_NAME"].ToString();
                CNameCookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(CNameCookie);

                HttpCookie user_type_Cookie = new HttpCookie("user_type");
                user_type_Cookie.Value = ds.Tables[0].Rows[0]["USER_TYPE"].ToString();
                user_type_Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(user_type_Cookie);

            }
        }
        return "";
    }

    [WebMethod]
    public static string getNearStores(string lattitude, string longitude)
    {
        Cl_Customer cc = new Cl_Customer();
        cc.Type = 10;
        cc.lattitude = lattitude;
        cc.longitude = longitude;
        if (HttpContext.Current.Response.Cookies.AllKeys.Contains("rid") != false)
        {
            cc.RID = (HttpContext.Current.Request.Cookies["rid"].Value.ToString());
        }
        else
        {
            cc.RID = "";
        }
        DataSet ds = cc.fnGetLocations();
        string stores = "", swiperdiv = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string bannerimg = "<div class=\"swiper-slide\"><div class=\"items boxshadow\">" +
                    "<img class=\"storimg visitstore\" width=\"100\" rid='" + (DR["RID"].ToString()) + "' src=\"/Menu_Pics/" + DR["IMAGE_URL"].ToString() + "\" />" +
                    "</div></div>";
                string Imgurl = "/Menu_Pics/" + DR["RETAILER_PROFILE_PIC"].ToString();
                swiperdiv = "<div class=\"containers\"><div class=\"swiper-container\">" +
                    "<div class=\"swiper-wrapper\">" + bannerimg +
                    "</div><div class=\"owner__image\">" +
                    "<img class=\"rounded-circle \"  src=\"" + Imgurl + "\" /></div></div></div>";

                string star_ = "";
                if (Convert.ToDouble(DR["STAR_RATING"]) > 0.0 && Convert.ToDouble(DR["STAR_RATING"]) < 0.6)
                {
                    star_ = "<i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 0.6 && Convert.ToDouble(DR["STAR_RATING"]) < 1.1)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 1.1 && Convert.ToDouble(DR["STAR_RATING"]) < 1.6)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 1.6 && Convert.ToDouble(DR["STAR_RATING"]) < 2.1)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 2.1 && Convert.ToDouble(DR["STAR_RATING"]) < 2.6)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 2.6 && Convert.ToDouble(DR["STAR_RATING"]) < 3.1)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 3.1 && Convert.ToDouble(DR["STAR_RATING"]) < 3.6)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 3.6 && Convert.ToDouble(DR["STAR_RATING"]) < 4.1)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 4.1 && Convert.ToDouble(DR["STAR_RATING"]) < 4.6)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }
                else if (Convert.ToDouble(DR["STAR_RATING"]) > 4.6 && Convert.ToDouble(DR["STAR_RATING"]) < 5.1)
                {
                    star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
                }

                stores = stores + "<div class=\"card w-100 mt-2 mb-2\"><div class=\"row\"><div class=\"col-sm-4 col-md-4 col-lg-4\"><div class=\"store__img\">" +
                   "" + swiperdiv + "</div></div><div class=\" col-sm-8 col-md-8 col-lg-8 m-2\">" +
                   "<div class=\"store__details\"><div class=\"row\"><div class=\"col-8 pr-0 pt-1\" style=\"padding-left: 20px;\">" +
                   "<span class=\"shop__name visitstore\" rid='" + (DR["RID"].ToString()) + "'>" + DR["NAME"].ToString() + "</span><p class=\"near__by\">" + DR["LOCATION"].ToString() + ", " + DR["CITY"].ToString() + "</p></div>" +
                   "<div class=\"col-4 pl-0\" style=\"text-align: right;\"><span class=\"star__rating\">" +
                   star_ + "</span>" +
                   "<p class=\"rating__count\">" + DR["RATING_COUNT"].ToString() + " ratings</p></div></div><div class=\"row\"><div class=\"col-6\">" +
                   "<a href=\"tel:" + DR["RESTAURANT_NUMBER"].ToString() + "\"></a><span class=\"order__count\"><i class=\"fa fa-phone\"></i>+91 " + DR["RESTAURANT_NUMBER"].ToString() + "</span></div>" +
                   "<div class=\"col-6\"><span><a class=\"text-black float-right\" style=\"color:black;padding-right: 12px;\" href=\"http://maps.google.com?q=" + DR["LATITUDE"].ToString() + "," + DR["LONGITUDE"].ToString() + "\">" + DR["DISTANCE"].ToString() + " km</a></span></div>" +
                   "</div></div></div></div></div>";
            }
        }

        //if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        //{
        //    foreach (DataRow DR in ds.Tables[0].Rows)
        //    {
        //        string bannerimg = "";
        //        foreach (DataRow DRI in ds.Tables[1].Rows)
        //        {
        //            if (DRI["RID"].ToString() == DR["RID"].ToString())
        //            {
        //                if (DRI["IMAGE_URL"].ToString() != "")
        //                {
        //                    bannerimg = bannerimg + "<div class=\"swiper-slide\">" +
        //                                            "<div class=\"items boxshadow\"><img class=\"storimg visitstore\" width=\"100\" rid='" + DRI["RID"].ToString() + "' src=\"/Menu_Pics/" + DRI["IMAGE_URL"].ToString() + "\" /></div></div>";
        //                }
        //                else
        //                {

        //                    bannerimg = "<div class=\"swiper-slide\">" +
        //                                "<div class=\"items boxshadow\"><img class=\"storimg visitstore\" width=\"100\" rid='" + DRI["RID"].ToString() + "' src=\"/Menu_Pics/3330160.jpg\" /></div></div>";

        //                }


        //            }
        //            string Imgurl = "../owner.png";
        //            if (DR["RETAILER_PROFILE_PIC"].ToString() != "")
        //            {
        //                Imgurl = "/Menu_Pics/" + DR["RETAILER_PROFILE_PIC"].ToString();

        //            }


        //            swiperdiv = "<div class=\"containers\"><div class=\"swiper-container\">" +
        //            "<div class=\"swiper-wrapper\">" +
        //            "" + bannerimg + "" +
        //            "</div><div class=\"owner__image\">" +
        //            "<img class=\"rounded-circle \"  src=\"" + Imgurl + "\" /></div></div></div>";


        //        }
        //        string star_ = "";
        //        if (Convert.ToDouble(DR["STAR_RATING"]) > 0.0 && Convert.ToDouble(DR["STAR_RATING"]) < 0.6)
        //        {
        //            star_ = "<i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 0.6 && Convert.ToDouble(DR["STAR_RATING"]) < 1.1)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 1.1 && Convert.ToDouble(DR["STAR_RATING"]) < 1.6)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 1.6 && Convert.ToDouble(DR["STAR_RATING"]) < 2.1)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 2.1 && Convert.ToDouble(DR["STAR_RATING"]) < 2.6)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 2.6 && Convert.ToDouble(DR["STAR_RATING"]) < 3.1)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 3.1 && Convert.ToDouble(DR["STAR_RATING"]) < 3.6)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 3.6 && Convert.ToDouble(DR["STAR_RATING"]) < 4.1)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 4.1 && Convert.ToDouble(DR["STAR_RATING"]) < 4.6)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star-half-o\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }
        //        else if (Convert.ToDouble(DR["STAR_RATING"]) > 4.6 && Convert.ToDouble(DR["STAR_RATING"]) < 5.1)
        //        {
        //            star_ = "<i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i><i class=\"fa fa-star\" style=\"color: gold!important;\" aria-hidden=\"true\"></i>";
        //        }



        //        stores = stores + "<div class=\"card w-100 mt-2 mb-2\"><div class=\"row\"><div class=\"col-sm-4 col-md-4 col-lg-4\"><div class=\"store__img\">" +
        //           "" + swiperdiv + "</div></div><div class=\" col-sm-8 col-md-8 col-lg-8 m-2\">" +
        //           "<div class=\"store__details\"><div class=\"row\"><div class=\"col-8 pr-0 pt-1\" style=\"padding-left: 20px;\">" +
        //           "<span class=\"shop__name visitstore\" rid='" + DR["RID"].ToString() + "'>" + DR["NAME"].ToString() + "</span><p class=\"near__by\">" + DR["LOCATION"].ToString() + ", " + DR["CITY"].ToString() + "</p></div>" +
        //           "<div class=\"col-4 pl-0\" style=\"text-align: right;\"><span class=\"star__rating\">" +
        //           star_ +

        //        "</span>" +

        //           "<p class=\"rating__count\">" + DR["RATING_COUNT"].ToString() + " ratings</p></div></div><div class=\"row\"><div class=\"col-6\">" +
        //           "<a href=\"tel:" + DR["RESTAURANT_NUMBER"].ToString() + "\"></a><span class=\"order__count\"><i class=\"fa fa-phone\"></i>+91 " + DR["RESTAURANT_NUMBER"].ToString() + "</span></div>" +
        //           "<div class=\"col-6\"><span><a class=\"text-black float-right\" style=\"color:black;padding-right: 12px;\" href=\"http://maps.google.com?q=" + DR["LATITUDE"].ToString() + "," + DR["LONGITUDE"].ToString() + "\">" + DR["DISTANCE"].ToString() + "km</a></span></div>" +
        //           "</div></div></div></div></div>";
        //    }
        //}
        return stores;
    }

    [WebMethod]
    public static List<Cl_Customer> getRetailersLatLong(string lattitude, string longitude)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 10;
        cc.lattitude = lattitude;
        cc.longitude = longitude;
        if (HttpContext.Current.Response.Cookies.AllKeys.Contains("rid") != false)
        {
            cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        }
        else
        {
            cc.RID = "";
        }
        ds = cc.fnGetLocations();
        List<Cl_Customer> LocationList = new List<Cl_Customer>();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            LocationList = (from rows in ds.Tables[0].AsEnumerable()
                            select new Cl_Customer
                            {
                                lattitude = rows["LATITUDE"].ToString(),
                                longitude = rows["LONGITUDE"].ToString(),
                                NAME = rows["NAME"].ToString(),
                                Address = rows["ADDRESS"].ToString()
                            }).ToList();
        }
        return LocationList;
    }

    [WebMethod]
    public static string getUserLocation()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 18;
        if (HttpContext.Current.Response.Cookies.AllKeys.Contains("user_id") != false)
        {
            cc.CID = (HttpContext.Current.Request.Cookies["user_id"].Value.ToString());
        }
        else
        {
            cc.CID = "1";
        }
        ds = cc.fnGetLocations();
        string data = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            data = cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return data;
    }

    [WebMethod]

    public static string storeInCookie(string Value, string Name)
    {
        HttpCookie Cookie = new HttpCookie(Name);
        Cookie.Value = Cl_admin.Decrypt(Value);
        Cookie.Expires = DateTime.Now.AddDays(365);
        HttpContext.Current.Response.Cookies.Add(Cookie);
        return "";
    }
}