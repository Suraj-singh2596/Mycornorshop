using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]))
        {
            string RetailerID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());
            HttpCookie aCookie = new HttpCookie("rid");
            aCookie.Value = RetailerID;
            aCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(aCookie);

            if (!string.IsNullOrEmpty(Request.Params["deliveryparamid"]))
            {
                HttpCookie deliveryparamid = new HttpCookie("deliveryparamid");
                deliveryparamid.Value = Cl_admin.Decrypt(Request.QueryString["deliveryparamid"].ToString());
                deliveryparamid.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(deliveryparamid);
            }

            if (HttpContext.Current.Request.Cookies["user_id"] == null && !string.IsNullOrEmpty(Request.Params["ulid"]))
            {
                string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
                getUserData(User_ID);

                HttpCookie Cookie = new HttpCookie("user_id");
                Cookie.Value = User_ID;
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                //getContentOverallImage(RetailerID);
                //getMenuLists(RetailerID);
                itemcounts(RetailerID);
                getCustomerDetails(RetailerID);
                GetNotification_count();
            }
            if (HttpContext.Current.Request.Cookies["user_id"] != null)
            {
                string User_ID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
                getUserData(User_ID);

                HttpCookie Cookie = new HttpCookie("user_id");
                Cookie.Value = User_ID;
                Cookie.Expires = DateTime.Now.AddDays(-1);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                //getContentOverallImage(RetailerID);
                //getMenuLists(RetailerID);
                itemcounts(RetailerID);
                getCustomerDetails(RetailerID);
                GetNotification_count();
            }
            if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]) && !string.IsNullOrEmpty(Request.Params["ulid"]))
            {
                string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
                getUserData(User_ID);

                HttpCookie Cookie = new HttpCookie("user_id");
                Cookie.Value = User_ID;
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                //getContentOverallImage(RetailerID);
                //getMenuLists(RetailerID);
                itemcounts(RetailerID);
                getCustomerDetails(RetailerID);
                GetNotification_count();
            }


            RID.Value = RetailerID;

        }
        else if (HttpContext.Current.Request.Cookies["rid"] != null && HttpContext.Current.Request.Cookies["user_id"] != null)
        {

            string RetailerID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            string User_ID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();

            if (HttpContext.Current.Request.Cookies["cid"] == null)
            {
                getUserData(User_ID);
            }

            HttpCookie aCookie = new HttpCookie("rid");
            aCookie.Value = RetailerID;
            aCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(aCookie);



            HttpCookie Cookie = new HttpCookie("user_id");
            Cookie.Value = User_ID;
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            //Session["Customer"] = null;

            RID.Value = RetailerID;
            //getContentOverallImage(RetailerID);
            //getMenuLists(RetailerID);
            itemcounts(RetailerID);
            getCustomerDetails(RetailerID);
            GetNotification_count();
        }
        Session["OTP"] = null;

        if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() != "48" &&
            HttpContext.Current.Request.Cookies["rid"].Value.ToString() != "51")
        {
            contactus.Visible = false;
        }
        else
        {
            contactus.Visible = true;
        }

    }

    public void getUserData(string User_ID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.User_ID = User_ID;
        cr.Type = 69;
        ds = cr.getCustomerDataDetails();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {

            HttpCookie cidCookie = new HttpCookie("cid");
            cidCookie.Value = ds.Tables[0].Rows[0]["CUST_ID"].ToString();
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
    public void itemcounts(string RID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 46;
        ds = cr.fngetParticularItemList();
        string item_count = "0";

        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            item_count = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();

            HttpCookie Cookie = new HttpCookie("item_count");
            Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }



        Mycart2.InnerHtml = item_count;

    }

    public void getMenuLists(string RID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 49;
        ds = cr.fnInsertData();

        string DeliveryCharges = "";
        string DeliverAmount = "";
        string DeliverySection = "";
        string DeliverySections = "";
        string BannerSection = "";

        string Images = "";
        string stealdealsection = "";
        string steal_deal = "";
        string OderConfirmation = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[3].Rows.Count > 0)
            {

                if (ds.Tables[1].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
                {
                    if (ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                    {
                        if (ds.Tables[0].Rows[0]["TOTAL"].ToString() != "0")
                        {
                            if (Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                            {
                                DeliveryCharges = "Free Delivery! you have achieved minimum order amount";
                                DeliverAmount = "Free";
                            }
                            else
                            {
                                DeliveryCharges = "Add Rs " + Convert.ToString(Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) - Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString())) + " to get the free delivery";
                                //DeliveryCharges = "Shop above Rs " + ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString() + " for free delivery";
                                DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                            }
                        }
                        else
                        {
                            DeliveryCharges = "Shop above Rs " + ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString() + " more for free delivery";
                            DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                        }
                    }
                }
                else
                {
                    DeliveryCharges = "You will be charged Rs " + ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString() + " extra for delivering the order";
                    DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                }


                DeliverySection = "<div class=\" container\"><div class=\"container\"><div class=\"row\"><div class=\"col-6\"><div class=\"deliv_image\">" +
                               "<img src =\"images/fast-free-delivery.jpg\"/> </div> </div> <div class=\"col-6\"> <div class=\"offertext\">" +
                                 "<h1 class=\"titletext\"></h1><label><span id=\"deliveryamount\">" + DeliveryCharges + "</span></label>" +
                                 "</div></div></div></div></div>";

                decimal total_steal_amount = Convert.ToDecimal(ds.Tables[1].Rows[0]["MAX_ORDER_AMOUNT"].ToString()) - Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString());
                if (total_steal_amount <= 0)
                {
                    total_steal_amount = 0;
                }

                string stealClass = "";
                //string steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + ds.Tables[1].Rows[0]["MAX_ORDER_AMOUNT"].ToString() +
                //    "<br><br>Add items worth Rs " + Convert.ToString(total_steal_amount) + " to your cart to qualify for steal deal";

                string steal_deal_line = "Add items worth Rs " + Convert.ToString(total_steal_amount) + " to your cart to qualify for steal deal <br/><br/>";
                if (ds.Tables[1].Rows[0]["MAX_ORDER_AMOUNT"].ToString() == "0")
                {
                    stealClass = "d-none";
                    steal_deal_line = "yey! you have achieved minimum order amount";
                }
                if (total_steal_amount == 0)
                {
                    stealClass = "d-none";
                    steal_deal_line = "yey! you have achieved minimum order amount";
                }
                string Minimum_Amount_steal_Deal = "";
                Minimum_Amount_steal_Deal = "<div class=\" container\"><div class=\"container\"><div class=\"row\"><div class=\"col-12\"> " +
                    "<div class=\"offertext\"><span id=\"minAmountStealDeal\" style=\"font-size:11px;font-weight:600;\">" + steal_deal_line + "</span>" +
                    "</div></div></div></div></div>";

                OderConfirmation = "<div class=\"container\"><div class=\"row\"><div onclick='fnredirecttoorderpage($(this))' class=\"col-12\"> <div class=\"orderdeliverytext\">" +
                                 "<h1 class=\"titletext\"></h1><label><span>Order Confirmation msg here </span></label>" +
                                 "</div></div></div></div>";

                DeliverySections = "<div class=\"container delivofr\"><div class=\"row\"><div class=\"col-sm-2\"></div>" +
                    "<div class=\"col-sm-8\">" +
                    "" + DeliverySection + "" +
                    "</div></div><hr/><div class=\"row stealclass " + stealClass + "\"style=\"background: antiquewhite;\"><div class=\"col-sm-2\"></div>" + Minimum_Amount_steal_Deal +
                    "</div></div>" + OderConfirmation + "";


                if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
                {
                    foreach (DataRow DR in ds.Tables[2].Rows)
                    {
                        string dis = "";
                        string dis1 = "d-none";
                        if (DR["EXISTS_QTY"].ToString() == "1")
                        {
                            dis1 = "";
                            dis = "d-none";
                        }

                        string Date = DateTime.Now.ToString("dd");
                        string Day = "ODD";
                        if (Convert.ToDecimal(Date) % 2 == 0)
                        {
                            Day = "EVEN";
                        }
                        string img = "";

                        if (DR["IMAGE_PATH"].ToString() != "")
                        {
                            img = "../Menu_Pics/" + DR["IMAGE_PATH"].ToString();

                        }
                        else
                        {
                            img = "images/Defaultimage.png";
                        }

                        if (Day == "ODD" && DR["ODDDAYS"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\">" + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";



                        }
                        if (Day == "EVEN" && DR["EVENDAYS"].ToString() == "Y")
                        {

                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        string weekDay = DateTime.Now.ToString("ddd");
                        if (weekDay == "Mon" && DR["MON"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        if (weekDay == "Tue" && DR["TUE"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        if (weekDay == "Wed" && DR["WED"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        if (weekDay == "Thu" && DR["THU"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        if (weekDay == "Fri" && DR["FRI"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        if (weekDay == "Sat" && DR["SAT"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstyle\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }
                        if (weekDay == "Sun" && DR["SUN"].ToString() == "Y")
                        {
                            steal_deal = steal_deal + "<div class=\"stealdeal\" rid='" + DR["RID"].ToString() + "' sdid = '" + DR["SDID"].ToString() + "'><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\"><img src = \"" + img + "\" >" +
               "</div></div> <div class=\"col-8\"><div class=\"itemdetails\"><div class=\"itemprice\">₹ <strike> " + DR["REGULAR_PRICE"].ToString() + "</strike><span style=\"font-weight:bold;\">&nbsp; " + DR["OFFER_PRICE"].ToString() + "</span><span class=\"offpercnt\"> " + DR["PERCENT_OFF"].ToString() + "% off </span></div>" +
                "<div class=\"itemname\">" + DR["NAME"].ToString() + "  " + DR["PORTION"].ToString() + "</div> <div class=\"itemqty\">1 Unit</div>" +
                "<div class=\"addtocartbtn\"><a href=\"javascript:void(0);\" class=\"addcartbtn btnstyle " + dis + "\">Add +</a>" +
                "<a href=\"javascript:void(0);\" class=\"addplusminusbtn " + dis1 + "\"><span><i class=\"fa fa-minus decreaseqty1 btnstyle\"></i></span>&nbsp; <span  class=\"value\">1</span>&nbsp;<i class=\"fa fa-plus increaseqty1 btnstylesss\"></i><span></span></a></div>" +
                "</div> </div> </div> </div> <hr>";
                        }


                    }
                }
                if (steal_deal != "")
                {
                    stealdealsection = "<div  class=\"container\"  style=\"background:white; margin-top:10px; \"><label> Today's Steal Deal</label><div class=\"todaydeal mt-2\"><div class=\"container\">" +
                        "<hr>" + steal_deal + "</div></div> </div>";
                }

                if (ds != null && ds.Tables.Count > 0 && ds.Tables[4].Rows.Count > 0)
                {
                    foreach (DataRow DR in ds.Tables[4].Rows)
                    {
                        Images = Images +
                               "<div class=\"swiper-slide\">" +
                               "<div class=\"items boxshadow\"><img style = \"width: 100%;\" src=\"../Menu_Pics/" + DR["IMAGE_URL"].ToString() + "\" /></div>" +
                               "</div>";
                    }
                    if (Images != "")
                    {
                        BannerSection = "<div class=\"container containers\"><div class=\"swiper-container\"><div class=\"swiper-wrapper\">" + Images +
                            "</div></div></div>";
                    }
                }

            }



            string searchbar = "<div class=\"searchbox container\"><div class=\"row\"><div class=\"col-sm-12\"><div class=\"searcitembox boxshadow\" style=\"width:100%;display:flex\"><div style=\"width:10%;text-align:center;padding-top: 3px; font-size:14px;padding-left: 10px;\"><i class=\"fa fa-search\"></i></div>" +
                           "<div  style=\"width:90%\"><input class=\"inputseacrh\" id=\"searchforitem\" type=\"text\" placeholder=\"Search here...\"/></div></div></div></div></div>";

            section1.InnerHtml = searchbar + BannerSection + DeliverySections + stealdealsection;
        }
    }

    public void getContentOverallImage(string RID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.Type = 15;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        ds = cr.fnInsertData();
        string Category_loop = "";
        string Offer_loop = "";
        string Offer_loop1 = "";
        string Shop_By_Category = "";
        string Offers = "";
        string Best_Special = "";
        string Special_Deals = "";
        string Special_Deals_loop = "";

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string img = "";

                if (DR["IMAGE_URL"].ToString() != "")
                {
                    img = "../Menu_Pics/" + DR["IMAGE_URL"].ToString();
                }
                else
                {
                    img = "../Menu_Pics/Category1-removebg-preview.png";
                }

                Category_loop = Category_loop + "<li class=\"cards_item call_item\" cgid='" + DR["CGID"].ToString() + "' rid='" + DR["RID"].ToString() + "'>" +
                    "<a rid='" + DR["RID"].ToString() + "' cgid='" + DR["CGID"].ToString() + "' mcid='" + DR["MCID"].ToString() + "' href=\"Javascript:void(0)\"  class=\"openproducts\"  >" +
                    "<div class=\"card boxshadow " + DR["BG_COLOR"].ToString() + "\"style=\"border-radius: 5px!important;\"><div class=\"card_image\">" +
                     "<img src =" + img + ">" +
                     "</div> <div class=\"card_content\">" + DR["CG_NAME"].ToString() + "</div></div></a></li>";

            }

        }

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[1].Rows)
            {
                string img = "";
                if (DR["OFFER_IMAGE"].ToString() != "")
                {
                    img = "background-image:url(Assest/images/Offerimage/" + DR["OFFER_IMAGE"].ToString() + ");";
                }
                else
                {
                    img = "";
                }
                //img = "Assest/images/" + DR["IMAGE_URL"].ToString();

                //Offer_loop1 = Offer_loop1 + " <div class=\"story-item item boxshadow\" style=" + img + ">" +
                //             "<div class=\"row\"><div class=\"col-5 pr-0\"><div class=\"offeritempic\"></div></div><div class=\"col-7 pl-0\"><div class=\"overlay \">" +
                //             "<h5>" + DR["OFFER_NAME"].ToString() + "</h5><hr /><p style=\"font-size: 8px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;\">" + DR["OFFER_ITEMS"].ToString() + "</p>" +
                //             "<p style=\"font-size: 9px; margin-bottom: 0px;\">Get upto<b style=\"font-size: 20px;\">" + DR["PERCENT_OFF"].ToString() + "%</b> off</p>" +
                //             "<a offer_id = '" + DR["OID"].ToString() + "' class=\"btn ordernow offerRedirect\" style=\"padding: 0px;\">Order now</a></div></div></div></div> ";


                Offer_loop1 = Offer_loop1 + " <div class=\"story-item item boxshadow\" style=" + img + ">" +
                             "<div class=\"row\"><div class=\"col-5 pr-0\"><div class=\"offeritempic\"></div></div><div class=\"col-7 pl-0\"><a offer_id = '" + DR["OID"].ToString() + "' class=\"offerRedirect\"><div class=\"overlay \">" +
                             "<h5>" + DR["OFFER_NAME"].ToString() + "</h5><hr /><p style=\"font-size: 8px;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;\">" + DR["OFFER_ITEMS"].ToString() + "</p>" +
                             "<p style=\"font-size: 9px; margin-bottom: 0px;\">Get upto<b style=\"font-size: 20px;\">" + DR["PERCENT_OFF"].ToString() + "%</b> off</p>" +
                             "<a class=\"btn ordernow \" style=\"padding: 0px;\">Order now</a></div></a></div></div></div> ";


            }

            if (Offer_loop1 != "")
            {
                Best_Special = "<section class=\"section-item\"><div class=\" card-body card-bodypadding card1\" style=\"margin-top: -15px;\">" +
                               "<label>Best Offer</label><div id=\"owl-carosel4\" class=\"story-doubles owl-carousel owl-theme\">" + Offer_loop1 +
                               "</div></div></section>";
            }
        }
        //tag
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[3].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[3].Rows)
            {
                string img = "";
                if (DR["TAG_IMAGE"].ToString() != "")
                {
                    img = "background-image:url(Assest/images/" + DR["TAG_IMAGE"].ToString() + ");";
                }
                else
                {
                    img = "";
                }
                Offer_loop = Offer_loop + "<a class=\"redirectbyTagName\" tag_name ='" + DR["TAG_NAME"].ToString() + "' > <div class=\"story-item item\" style='" + img + "'>" +

                                "<span>" + DR["TAG_NAME"].ToString() + "<span>" +
                             "</div> </a>";

            }

            if (Offer_loop != "")
            {
                Offers = " <section class=\"section-item\"style=\"padding-top:15px; padding-bottom:15px; margin-top:15px; margin-bottom:15px; background:#dbe2e4\">" +
                       " <div class=\" card-body card-bodypadding card1\">" +
                        " <div id =\"owl-carosel2\" class=\"story-double owl-carousel owl-theme\">" + Offer_loop + "</div></div></section>";
            }
        }


        if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[2].Rows)
            {
                string btnDisplay = "";
                string btnDisplay1 = "style=\"display:none;\"";
                string Qty = "1";
                if (DR["EXISTS_ORDER_QTY"].ToString() != "0")
                {
                    btnDisplay = "style=\"display:none;\"";
                    btnDisplay1 = "";
                    Qty = DR["EXISTS_ORDER_QTY"].ToString();
                }

                string img = "";

                if (DR["IMAGE_PATH"].ToString() != "")
                {
                    img = "../Menu_Pics/" + DR["IMAGE_PATH"].ToString();
                }
                else
                {
                    img = "../images/Defaultimage.png";
                }

                Special_Deals_loop = Special_Deals_loop + "<div class=\"story-item item\" rid='" + DR["RID"].ToString() + "' deal_id='" + DR["Deal_ID"].ToString() + "'><div class=\"card boxshadow align-items-center\">" +   //loop begin here
                        "<img class=\"card-img-top itemimage\" style=\"height: 65px;\" src=\"" + img + "\" />" +  //Image path for deal
                        "<div class=\"itemdetails text-left p-2\"><div class=\"price\">&#8377<s style=\"font-weight:300;\">" + DR["General_Price"].ToString() + "</s>  " + DR["Offer_Price"].ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pan style=\"color:red;\">" + DR["PERCENT_OFF"].ToString() + "% off</pan></div>" +  //Price for the deal
                        "<div class=\"detail\">" + DR["Deal_Name"].ToString() + "</div></div><div class=\"card-body p-0\">" +  //name of the product
                        "<div class=\"addbtn\" " + btnDisplay + " >Add +</div><div class=\"additem\" " + btnDisplay1 + "><div class=\"qtySelector text-center\">" +
                        "<i class=\"fa fa-minus decreaseQty btnstyle\"></i><input readonly type=\"text\" class=\"qtyValue\" value=" + Qty + " />" +
                        "<i class=\"fa fa-plus increaseQty btnstyle\"></i></div></div></div></div></div>"; //loop end here


            }
        }
        if (Special_Deals_loop != "")
        {
            Special_Deals = "<section class=\"section-item\"><div class=\"card-body card-bodypadding card1\">" +
                        "<label>Special Deal</label>" + //Deal Header
                        "<div id =\"owl-carosel3\" class=\"story-Grof owl-carousel owl-theme\">" + Special_Deals_loop +

            "</div></div></section>";
        }

        if (Category_loop != "")
        {
            Shop_By_Category = "<section class=\"section-item\" style=\"background:white; padding-bottom:15px;\"><div class=\"card-body card-bodypadding\">" +
                                 "<label>Shop by Category</label><div class=\"main  w-100\"><ul class=\"cards\">" +
                                 Category_loop +
                                 "</ul></div></div></section>";
        }




        string addtionaltiles = "<section class=\"section-item\"><div id=\"cat_sub\" class=\" card-body card-bodypadding card1\" style=\"margin-top: -15px;\"></div></section>";


        containerSection.InnerHtml = Special_Deals + Best_Special + Shop_By_Category + Offers + addtionaltiles;
    }

    public void getCustomerDetails(string RID)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = RID;
        ds = cc.fnGetAddress();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            //string changeStoreOption = " <a id=\"storechange\" class=\"_ChangeStore_btn\" href=\"../Components/store\">Change Store</a>";
            //if (ds.Tables[1].Rows[0]["CHANGE_STORE_FLAG"].ToString() == "N")
            //{
            //    UserName_n_Pic.Visible =false;
            //}

            HttpCookie user_type = new HttpCookie("user_type");
            user_type.Value = "customer";
            user_type.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(user_type);

            StoreName.InnerHtml = ds.Tables[1].Rows[0]["NAME"].ToString() + "<p  style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
                ds.Tables[1].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[1].Rows[0]["CITY"].ToString() +
                "</p>";
            //active_bal.InnerHtml = "<span>WALLET BALANCE</span><br/> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
            //UserName_n_Pic.InnerHtml = ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString() + "&nbsp;<i class=\"fa fa-user-circle-o fa-2x\"></i> ";
            //active_balance.InnerHtml = "<span style=\"font-size: 18px; font-weight: 100;\">Active Balance: <strong>&#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString() + "</strong></span>";
            active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\">with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

        }
    }

    [WebMethod]
    public static string fnGetCat()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 59;
        ds = cr.fnInsertData();
        string Content = "";
        string MCID = "";
        string Menu_Category = "";
        string CGID = "";
        string CG_Name = "";

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Content = "";
            var lastRow = ds.Tables[0].Rows.Count;
            int x = 0;
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                //string image = "src=\"Assest/images/additionaltiles/fruits.png\"";
                string image = "src=\"../Menu_Pics/demopicture.png\"";
                if (DR["IMAGE_URL"].ToString() != "")
                {
                    image = "src=\"../Menu_Pics/" + DR["IMAGE_URL"].ToString() + "\"";
                }

                x++;
                if (CGID != DR["CGID"].ToString() && CGID == "")
                {
                    if (lastRow == 1)
                    {
                        CGID = DR["CGID"].ToString();
                        Menu_Category = Menu_Category + "<div class=\"story-item item\"><a class=\"redirectBymcid\" cname='" + DR["CG_NAME"].ToString() + "' cgid='" + CGID + "' mcid='" + DR["MCID"].ToString() + "'>" +
                    "<div class=\"card\"><div class=\"_addtinlimg\"><img style=\"margin-left: 15px;\" " + image + " alt=\"\"/>" +
                            "</div><div class=\"_additiontext\">" + DR["CATEGORY_NAME"].ToString() + "</div></a></div></div>";
                        Content = Content + "<div class=\"additionalitm\">" +
                                "<label style=\"color: #3c7f70;font-size:17px;\">" + DR["CG_NAME"].ToString() + "</label><div class=\"story-doubles2 owl-carousel owl-carosel5 owl-theme\">" +
                                Menu_Category +
                                "</div></div>";
                        Menu_Category = "";
                        CG_Name = "";

                    }
                    else
                    {
                        CGID = DR["CGID"].ToString();
                        MCID = DR["MCID"].ToString();
                    }
                }
                else if (CGID != DR["CGID"].ToString() && CGID != "")
                {
                    if (Menu_Category != "")
                    {
                        Content = Content + "<div class=\"additionalitm\">" +
                                "<label style=\"color:white; font-size:17px;\">" + CG_Name + "</label><div class=\"story-doubles2 owl-carosel5 owl-carousel owl-theme\">" +
                                Menu_Category +
                                "</div></div>";


                        Menu_Category = "";
                        CG_Name = "";
                        CGID = DR["CGID"].ToString();
                        MCID = DR["MCID"].ToString();
                    }
                    else
                    {
                        if (lastRow == x)
                        {
                            CGID = DR["CGID"].ToString();
                            Menu_Category = Menu_Category + "<div class=\"story-item item\"><a class=\"redirectBymcid\" cname='" + DR["CG_NAME"].ToString() + "' cgid='" + CGID + "' mcid='" + DR["MCID"].ToString() + "' >" +
                            "<div class=\"card\"><div class=\"_addtinlimg\"><img style=\"margin-left: 15px;\" " + image + " alt=\"\"/>" +
                                    "</div><div class=\"_additiontext\">" + DR["CATEGORY_NAME"].ToString() + "</div></a></div></div>";
                            CG_Name = DR["CG_NAME"].ToString();
                            MCID = DR["MCID"].ToString();

                            Content = Content + "<div class=\"additionalitm\">" +
                                        "<label style=\"color:white; font-size:17px;\">" + CG_Name + "</label><div class=\"story-doubles2 owl-carosel5 owl-carousel owl-theme\">" +
                                        Menu_Category +
                                        "</div></div>";

                            Menu_Category = "";
                            CG_Name = "";
                            MCID = "";
                        }
                    }
                }
                else if (lastRow == x)
                {
                    CGID = DR["CGID"].ToString();
                    Menu_Category = Menu_Category + "<div class=\"story-item item\"><a class=\"redirectBymcid\" cname='" + DR["CG_NAME"].ToString() + "' cgid='" + CGID + "' mcid='" + DR["MCID"].ToString() + "' >" +
                    "<div class=\"card\"><div class=\"_addtinlimg\"><img style=\"margin-left: 15px;\" " + image + " alt=\"\"/>" +
                            "</div><div class=\"_additiontext\">" + DR["CATEGORY_NAME"].ToString() + "</div></a></div></div>";
                    CG_Name = DR["CG_NAME"].ToString();
                    MCID = DR["MCID"].ToString();

                    Content = Content + "<div class=\"additionalitm\">" +
                                "<label style=\"color:white; font-size:17px;\">" + CG_Name + "</label><div class=\"story-doubles2 owl-carosel5 owl-carousel owl-theme\">" +
                                Menu_Category +
                                "</div></div>";
                    Menu_Category = "";
                    CG_Name = "";
                    MCID = "";

                }
                Menu_Category = Menu_Category + "<div class=\"story-item item\"><a class=\"redirectBymcid\" cname='" + DR["CG_NAME"].ToString() + "' cgid='" + CGID + "' mcid='" + DR["MCID"].ToString() + "' >" +
                    "<div class=\"card\"><div class=\"_addtinlimg\"><img style=\"margin-left: 15px;\" " + image + " alt=\"\"/>" +
                            "</div><div class=\"_additiontext\">" + DR["CATEGORY_NAME"].ToString() + "</div></a></div></div>";
                CG_Name = DR["CG_NAME"].ToString();
                MCID = DR["MCID"].ToString();
            }


        }


        return Content;
    }

    [WebMethod]

    public static List<cl_resturantorder> fnGetAllProducts(string Search_Value)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Search_Item = Search_Value;
        cr.Type = 60;
        ds = cr.fngetallProductsList();
        List<cl_resturantorder> result = new List<cl_resturantorder>();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].AsEnumerable().Select(i => new cl_resturantorder()
            {
                MID = (Convert.ToString(Convert.ToInt32(i.Field<Int64>(0)))),
                Item_Name = (i.Field<string>(1)),
                CGID = (Convert.ToString(Convert.ToInt32(i.Field<Int64>(2)))),
                MCID = (Convert.ToString(Convert.ToInt32(i.Field<Int64>(3)))),
                RID = (HttpContext.Current.Request.Cookies["rid"].Value.ToString()),
                CG_NAME = (i.Field<string>(5)),
                IMAGE_URL = (i.Field<string>(6)),
                // Price = (Convert.ToString(Convert.ToDouble(i.Field<double>(7))))
                //Price = (Convert.ToString(Convert.ToDecimal(i.Field<decimal>(7))))

            }).ToList();
        }

        return result;
    }
    [WebMethod]

    public static List<cl_resturantorder> fnGetAllProductsByCategory(string Search_Value)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Search_Item = Search_Value;
        cr.Type = 99;
        ds = cr.fngetallProductsList();
        List<cl_resturantorder> result = new List<cl_resturantorder>();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].AsEnumerable().Select(i => new cl_resturantorder()
            {

                CGID = (Convert.ToString(Convert.ToInt32(i.Field<Int64>(1)))),
                MCID = (Convert.ToString(Convert.ToInt32(i.Field<Int64>(0)))),
                Option_Name = (i.Field<string>(2)),
                IMAGE_URL = (i.Field<string>(3)),
                CG_NAME = (i.Field<string>(4))
                // Price = (Convert.ToString(Convert.ToDouble(i.Field<double>(7))))
                //Price = (Convert.ToString(Convert.ToDecimal(i.Field<decimal>(7))))

            }).ToList();
        }

        return result;
    }

    [WebMethod]

    public static string fnGetTrxID(string Amount, string RID)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.Amount = Amount;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 66;
        cr.URL = HttpContext.Current.Request.UrlReferrer.PathAndQuery.ToString();
        ds = cr.fngetTrxID();
        string Trx_ID = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Trx_ID = ds.Tables[0].Rows[0]["TRX_ID"].ToString();
        }
        return Trx_ID;
    }

    [WebMethod]
    public static string sendOTP(string Mobile)
    {

        HttpContext.Current.Session["OTP"] = null;
        int rand = new Random().Next(1000, 9999);
        HttpContext.Current.Session["OTP"] = rand;

        string SMS = "Your OTP to login at mycornershop is " + rand + " -powered by AAA Benefit";

        WebClient client = new WebClient();

        string baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=AAABEN&channel=2&DCS=0&flashsms=0&number=" + Mobile
            + "&text=" + SMS.Replace("&", "and") + "&route=31&dlttemplateid=1307161717638426405";
        Stream data = client.OpenRead(baseurl);
        StreamReader reader = new StreamReader(data);
        data.Close();
        reader.Close();

        //string SMS = HttpUtility.UrlEncode("Your OTP for login is #" + Convert.ToString(rand));
        //cl_SMS.Dyn_sms(Mobile, SMS, "");

        return "1";
    }
    [WebMethod]
    public static string generateUserLogin(string Mobile, string OTP)
    {
        string OTP_Mached = "N|";

        if (HttpContext.Current.Session["OTP"].ToString() == OTP)
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.Mobile_No = Mobile;
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.Type = 68;
            ds = cr.UpdateOnlineStatus();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                OTP_Mached = "Y|../Home.aspx";

                HttpCookie Cookie = new HttpCookie("user_id");
                Cookie.Value = ds.Tables[0].Rows[0]["USER_ID"].ToString();
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

            }

        }


        return OTP_Mached;
    }

    [WebMethod]

    public static string fnReceiveAmount(string Amount, string RID)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.Amount = Amount;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 71;
        cr.URL = HttpContext.Current.Request.UrlReferrer.PathAndQuery.ToString();
        ds = cr.fngetTrxID();
        string Trx_ID = "";
        string Msg = "N";
        string Prepaid_Balance = "";
        Prepaid_Balance = "<span>WALLET BALANCE</span> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
        Msg = ds.Tables[0].Rows[0]["MSG"].ToString();

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
        {
            Trx_ID = ds.Tables[1].Rows[0]["TRX_ID"].ToString();
        }
        return Msg + "|" + Trx_ID + "|" + Prepaid_Balance;
    }
    [WebMethod]

    public static string fnUpdateDeviceID(string currentToken)
    {
        if (HttpContext.Current.Response.Cookies.AllKeys.Contains("cid") != false)
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
            cr.Device_ID = currentToken;
            cr.Type = 75;
            ds = cr.fngetTrxID();
        }
        return "1";
    }


    public void GetNotification_count()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
        cr.Type = 102;
        ds = cr.fngetTrxID();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["COUNTNOTIF"].ToString() != "0")
            {
                Notif_count.InnerHtml = ds.Tables[0].Rows[0]["COUNTNOTIF"].ToString();
            }
            else
            {
                Notif_count.Visible = false;
            }
        }
    }


    [WebMethod]
    public static string Fn_updateSeenFlag()
    {
        string result = "";
        DataSet ds = new DataSet();
        Cl_Customer cr = new Cl_Customer();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
        cr.Type = 16;
        ds = cr.fnGetAddress();
        return result;
    }



    [WebMethod]
    public static string getalldataofhomepage()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 49;
        ds = cr.fnInsertData();
        string table = "";
        string table1 = "";
        string table2 = "";
        string table3 = "";
        string table4 = "";


        if (ds != null && ds.Tables.Count > 0)
        {
            table = ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
            table1 = ds.Tables[1].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[1]) : "";
            table2 = ds.Tables[2].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[2]) : "";
            table3 = ds.Tables[3].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[3]) : "";
            table4 = ds.Tables[4].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[4]) : "";
        }
        return table + "~" + table1 + "~" + table2 + "~" + table3 + "~" + table4;
    }

    [WebMethod]

    public static string getAllCategories()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.Type = 15;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        ds = cr.fnInsertData();
        string table = "";
        if (ds != null && ds.Tables.Count > 0)
        {
            table = LowercaseJsonSerializer.SerializeObject(ds);

        }
        return table;
    }

    [WebMethod]

    public static string getotherCategories()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 59;
        ds = cr.fnInsertData();
        string table = "";
        //string table2 = "";
        if (ds != null)
        {
            table = LowercaseJsonSerializer.SerializeObject(ds);
            //table = ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
            //table2 = ds.Tables[1].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[1]) : "";
        }
        return table;
        // return table + "~" + table2;
    }

    [WebMethod]
    public static string encryptData(string value)
    {
        return cl_encrypt.Encrypt(value);
    }

    [WebMethod]
    public static string getConfirmationMsg(string HeaderId)
    {
        string Msg = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Header_ID = HeaderId;
        cr.Type = 130;
        ds = cr.fnInsertData();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["ItemCount"].ToString() != "0")
            {
                Msg = "<div style='font-size: 15px;font-weight: bold;'>Thank you for your order.</div><div style='font-size: 12px;'>Your order <strong>(#" + HeaderId
                    + ")</strong> of <strong>" + ds.Tables[0].Rows[0]["ItemCount"].ToString()
                    + "</strong> item(s) has been placed successfully. ~" + ds.Tables[1].Rows[0]["Msg"].ToString() + "</div>";
            }
        }
        return Msg;
    }

    [WebMethod]
    public static string getLatestOrders()
    {
        string Msg = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 135;
        ds = cr.fnInsertData();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Msg = cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]);
        }
        return Msg;
    }

}