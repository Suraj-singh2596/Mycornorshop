using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Items_Items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rest_id.Value = HttpContext.Current.Request.Cookies["rid"].Value.ToString(); ;
        getCustomerDetails();
        getTotalCountOrderingItems();
    }

    public void getTotalCountOrderingItems()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 46;
        ds = cr.fngetParticularItemList();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            total_items.InnerHtml = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {
                if (ds.Tables[1].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
                {


                    if (ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                    {
                        if (ds.Tables[0].Rows[0]["TOTAL"].ToString() != "0")
                        {
                            if (Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                            {
                                deliveyFreeAmount.InnerHtml = "Yey! you will get free delivery";
                            }
                            else
                            {
                                deliveyFreeAmount.InnerHtml = "Add Rs " + Convert.ToString(Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) - Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString())) + " to get the free delivery";

                            }
                        }
                        else
                        {
                            deliveyFreeAmount.InnerHtml = "Shop above Rs " + ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() + " for free delivery";
                        }
                    }
                }
            }
            else
            {
                deliveyFreeAmount.InnerHtml = "You will be charged Rs " + ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString() + " extra for delivering the order";
            }
        }
        else
        {
            total_items.InnerHtml = "";
        }
    }
    [WebMethod]
    public static string getMenuListsByTag(string Tag)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Tag = Tag;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 44;
        ds = cr.fngetParticularItemList();

        string xyz = "";
        string Menu_Category = "";
        string Menu_category_name = "";
        string Menu_Item_List = "";
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow DRT in ds.Tables[0].Rows)
            {

                string img = "";
                string image_url = "";
                string margin_top = "margin-top:16px;margin-bottom:5px;";
                if (DRT["IMAGE_URL"].ToString() != "")
                {
                    img = "../Menu_Pics/" + DRT["IMAGE_URL"].ToString();
                    image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
                    margin_top = "margin-top:16px;margin-bottom:5px;";
                }
                else
                {

                    img = "../Menu_Pics/Defaultimage.png";
                    image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
                }
                string description = "";
                if (DRT["DESCRIPTION"].ToString() != "")
                {
                    description = "(" + DRT["DESCRIPTION"].ToString().Trim() + ")";
                }


                string btnDisplay = "display:none;";
                string btnDisplay1 = "";
                string qtyShow = "1";
                if (DRT["EXISTS_ORDER_QTY"].ToString() != "0")
                {
                    btnDisplay1 = "display:none;";
                    btnDisplay = "";
                    qtyShow = DRT["EXISTS_ORDER_QTY"].ToString();
                }
                string reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
                  "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
                  "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
                  "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
                  "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
                  "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";


                Menu_Item_List = Menu_Item_List +
                // Menu_category_name +
                "<div class=\"itemcard select-items unselected\" mcid='" + DRT["MCID"].ToString() + "' veg_non ='" + DRT["VEG_NONVEG"].ToString() + "'>" +
                "<div class=\"row\">" +
                 "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
                        "<div class=\"row\"><div style = \"width: 100%;\">" +
                        "<div class=\"img_btn_box\">" +
                        image_url + "</div></div></div></div>" +
                "<div class=\"detailsection\" style=\"width: 70%;\">" +
                 "<span class=\"itm-amt\" amount=" + DRT["SHOW_PRICE"].ToString() + ">" +
                        "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + DRT["SHOW_PRICE"].ToString() + "</span>" +
                        "<div style=\"width: 90%;\">" +
                        "<a href=\"\"  class=\"itm-name text-dark\" MID='" + DRT["MID"].ToString() + "'>" + DRT["NAME"].ToString() + "</a>" +
                        "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
                        "</div>" +
                        "<div class=\"row\">" +
                        "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss\" MID='" + DRT["MID"].ToString() + "'>" + reloadicon + "</a></div>" +
                        "</div>" +
                        "<div style = \"width: 40%;\" ><span class=\"additem\">" +
                        "<a class=\"addbtn2 btn\" style=" + btnDisplay + margin_top + ">" +
                        "<div class=\"qtySelector text-center\">" +
                        "<i class=\"fa fa-minus decreaseQty btnstyle\"></i>" +
                        "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
                        "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
                        "</div></a></span>" +
                        "<span class=\"additem\">" +
                        "<a class=\"addbtn btn btnstyle\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
                        "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div></div>";
            }
            if (Menu_Item_List != "")
            {
                Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
                    "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
                    + "</div></div></div><br/>"; ;
            }
        }
        return Menu_Category + Menu_Item_List;
        //string Html_Header = "";
        //if (ds != null && ds.Tables[1].Rows.Count > 0)
        //{
        //    // string img = "../Assest/images/tea_coffee_bavrage-removebg-preview-removebg-preview.png";
        //    string img = "../Assest/images/Breakfast.png";
        //    if (ds.Tables[1].Rows[0]["IMAGE_URL"].ToString() != "")
        //    {
        //        img = "../Assest/images/" + ds.Tables[1].Rows[0]["IMAGE_URL"].ToString();
        //    }
        //    //Html_Header = " <div class=\"topshow grad2\"><div class=\"row \"><div class=\"col-1\"><a href=\"../Home.aspx?rid=" + RID + "\"><i style = \"color:white;\" class=\"fa fa-arrow-left\" aria-hidden=\"true\"></i></a>" +
        //    //              "</div><div class=\"col-4\"><div class=\"img-item\"><img src =" + img + " /></div></div><div class=\"col-6\">" +
        //    //              "<div class=\"subcategory-name text-center\"><label>" + ds.Tables[1].Rows[0]["MENU_NAME"].ToString() + "</label></div></div></div></div>";

        //    Html_Header = " <div class=\"topshow grad2\"><div class=\"row \"><div class=\"col-1\"><a  class=\"subcategory-name\" href=\"../Home.aspx?rid=" + Cl_admin.Encrypt(RID) + "&ulid=" + Cl_admin.Encrypt(HttpContext.Current.Session["Customer"].ToString().Split(',')[0]) + "\"><i style = \"color:white;\" class=\"fa fa-arrow-left d-none\" aria-hidden=\"true\"></i></a>" +
        //                  "</div><div class=\"col-9\">" +
        //                  "<div class=\"subcategory-name text-center\"><label>" + ds.Tables[1].Rows[0]["MENU_NAME"].ToString() + "</label></div></div>" +
        //                  "<div class=\"col-2\" style=\"max-width: 15.666667%;\"><a class=\"subcategory-name\"><i style=\"color:white;font-size:23px;\" class=\"fa fa-user-circle\" aria-hidden=\"true\"></i></a></div>" +
        //                  "</div></div>";
        //}
        //header_html.InnerHtml = Html_Header;
    }

    //[WebMethod]
    //public static string getMenuByOffers(string Offer_ID)
    //{
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    cr.CGID = Offer_ID;
    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
    //    cr.Type = 43;
    //    ds = cr.fngetParticularItemList();


    //    string xyz = "";

    //    string Menu_Item_List = "";
    //    if (ds != null && ds.Tables[0].Rows.Count > 0)
    //    {

    //        foreach (DataRow DRT in ds.Tables[0].Rows)
    //        {



    //            string img = "";
    //            string image_url = "";
    //            string margin_top = "margin-top:16px;margin-bottom:5px;";
    //            if (DRT["IMAGE_URL"].ToString() != "")
    //            {
    //                img = "../Menu_Pics/" + DRT["IMAGE_URL"].ToString();
    //                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
    //                margin_top = "margin-top:16px;margin-bottom:5px;";
    //            }
    //            else
    //            {

    //                img = "../Menu_Pics/Defaultimage.png";
    //                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\"alt=\"" + DRT["NAME"].ToString() + "\"></div>";
    //            }
    //            string description = "";
    //            if (DRT["DESCRIPTION"].ToString() != "")
    //            {
    //                description = DRT["DESCRIPTION"].ToString().Trim().Replace("~", "<br/>");
    //            }


    //            string div = "";

    //            if (xyz != DRT["CATEGORY_NAME"].ToString())
    //            {
    //                if (xyz == "")
    //                {
    //                    //Menu_category_name = Menu_category_name + "<div class=\"subcategories subactive\" mcid='" + DRT["MCID"].ToString() + "'>" + DRT["CATEGORY_NAME"].ToString() + "</div>"; ;
    //                    xyz = DRT["CATEGORY_NAME"].ToString();
    //                }
    //                else
    //                {
    //                    //Menu_category_name = Menu_category_name + "<div class=\"subcategories\" mcid='" + DRT["MCID"].ToString() + "'>" + DRT["CATEGORY_NAME"].ToString() + "</div>";
    //                    xyz = DRT["CATEGORY_NAME"].ToString();
    //                }
    //                //xyz = DRT["CATEGORY_NAME"].ToString();
    //                //Menu_category_name = "<div class=\"hide_name\"><div class=\"row\"><div style=\"width: 100%; margin-left: 20px; color: white;\">" +
    //                //                              "<h6 class=\"sub_cateogry\" style=\"margin-left:0px;\"><span class=\"subcateg\">" + xyz + "</span></h5></div></div>";
    //                //div = "</div>";
    //            }
    //            string btnDisplay = "display:none;";
    //            string btnDisplay1 = "";
    //            string qtyShow = "1";
    //            if (DRT["EXISTS_ORDER_QTY"].ToString() != "0")
    //            {
    //                btnDisplay1 = "display:none;";
    //                btnDisplay = "";
    //                qtyShow = DRT["EXISTS_ORDER_QTY"].ToString();
    //            }


    //            Menu_Item_List = Menu_Item_List +
    //            // Menu_category_name +
    //            "<div class=\"itemcard select-items unselected\" mcid='" + DRT["MCID"].ToString() + "' veg_non ='" + DRT["VEG_NONVEG"].ToString() + "'>" +
    //            "<div class=\"row\">" +
    //             "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
    //                    "<div class=\"row\"><div style = \"width: 100%;\">" +
    //                    "<div class=\"img_btn_box\">" +
    //                    image_url + "</div></div></div></div>" +
    //            "<div class=\"detailsection\" style=\"width: 70%;\">" +
    //             "<span class=\"itm-amt\" amount=" + DRT["SHOW_PRICE"].ToString() + ">" +
    //                    "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + DRT["SHOW_PRICE"].ToString() + "</span>" +
    //                    "<div style=\"width: 90%;\">" +
    //                    "<a href=\"\"  class=\"itm-name text-dark\" MID='" + DRT["MID"].ToString() + "'>" + DRT["NAME"].ToString() + "</a>" +
    //                    "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
    //                    "</div>" +
    //                    "<div class=\"row\">" +
    //                    "<div style = \"width: 60%;\">" +
    //                    "</div>" +
    //                    "<div style = \"width: 40%;\" ><span class=\"additem\">" +
    //                    "<a class=\"addbtn2 btn \" style=" + btnDisplay + margin_top + ">" +
    //                    "<div class=\"qtySelector text-center\">" +
    //                    "<i class=\"fa fa-minus decreaseQty btnstyle\"></i>" +
    //                    "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
    //                    "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
    //                    "</div></a></span>" +
    //                    "<span class=\"additem\">" +
    //                    "<a class=\"addbtn btn btnstyle\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
    //                    "</span>" +
    //                    "</div>" +
    //                    "</div>" +
    //                    "</div>" +
    //                    "</div></div>";
    //        }

    //    }
    //    return Menu_Item_List;

    //    //string Html_Header = "";
    //    //if (ds != null && ds.Tables[1].Rows.Count > 0)
    //    //{

    //    //    string img = "../Assest/images/banner1.jpg";
    //    //    if (ds.Tables[1].Rows[0]["IMAGE_URL"].ToString() != "")
    //    //    {
    //    //        img = "../Assest/images/" + ds.Tables[1].Rows[0]["IMAGE_URL"].ToString();
    //    //    }


    //    //    Html_Header = " <div class=\"topshow grad2\"><div class=\"row grad2\"><div class=\"col-1\"><a  class=\"subcategory-name\"  href=\"../Home.aspx?rid=" + Cl_admin.Encrypt(HttpContext.Current.Session["RID"].ToString()) + "&ulid=" + Cl_admin.Encrypt(HttpContext.Current.Session["Customer"].ToString().Split(',')[0]) + "\"><i style = \"color:white;\" class=\"fa fa-arrow-left d-none\" aria-hidden=\"true\"></i></a>" +
    //    //                      "</div><div class=\"col-9\">" +
    //    //                      "<div class=\"subcategory-name text-center\"><label>" + ds.Tables[1].Rows[0]["MENU_NAME"].ToString() + "</label></div></div>" +
    //    //                     "<div class=\"col-2\" style=\"max-width: 15.666667%;\"><a class=\"subcategory-name\"><i style=\"color:white;font-size:23px;\" class=\"fa fa-user-circle\" aria-hidden=\"true\"></i></a></div>" +
    //    //                      "</div></div>";
    //    //}
    //    //header_html.InnerHtml = Html_Header;

    //    //, string Sun, string Sun_Qty, string Mon, string Mon_Qty, string Tue, string Tue_Qty, string Wed, string Wed_Qty, string Thu, string Thu_Qty, string Fri, string Fri_Qty,
    //    //string Sat, string Sat_Qty
    //}

    [WebMethod]
    public static string fnInsertRecuring(string MID, string OID, string eventname, string Qty, string Option_Name
        , string Sun, string Sun_Qty, string Mon, string Mon_Qty, string Tue, string Tue_Qty, string Wed, string Wed_Qty, string Thu,
        string Thu_Qty, string Fri, string Fri_Qty, string Sat, string Sat_Qty, string Date, string Freq, string Line_ID)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.MTID = MID;
        cr.OID = OID;
        cr.Qty = Qty;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Option_Name = Option_Name;
        cr.Flag = eventname;
        cr.Type = 85;
        cr.Sun = Sun;
        cr.Mon = Mon;
        cr.Tue = Tue;
        cr.Wed = Wed;
        cr.Thu = Thu;
        cr.Fri = Fri;
        cr.Sat = Sat;
        cr.Sun_Qty = Sun_Qty;
        cr.Mon_Qty = Mon_Qty;
        cr.Tue_Qty = Tue_Qty;
        cr.Wed_Qty = Wed_Qty;
        cr.Thu_Qty = Thu_Qty;
        cr.Fri_Qty = Fri_Qty;
        cr.Sat_Qty = Sat_Qty;
        cr.Date = Date;
        cr.Frequency = Freq;
        cr.Line_ID = Line_ID;
        ds = cr.fnInsertRecuringData();

        return "1";
    }



    [WebMethod]
    public static string Receive_Payment(string RID, string Header_ID, string Amount, string Tip, string MOP)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.MOP = MOP;
        cr.Header_ID = Header_ID;
        cr.Tip = Tip;
        cr.Amount = Amount;
        cr.User_ID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 19;
        ds = cr.fnAddAmount();
        return "1";
    }

    [WebMethod]
    public static string fnOrderPuch(string Price, string MID, string OID, string eventname, string Qty, string Item_Name, string Option_Name)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.MTID = MID;
        cr.OID = OID;
        cr.Qty = Qty;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Option_Name = Option_Name;
        cr.Flag = eventname;
        cr.Type = 2;
        ds = cr.fnInsertData();
        string Total = "|";
        string DeliverAmount = "";
        string Delivery_Flag = "Y";
        string Minimum_Amount = "";
        string steal_deal_Min_order_amount = "";
        string Discount = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[1].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
            {
                if (ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                {
                    if (ds.Tables[0].Rows[0]["TOTAL"].ToString() != "0")
                    {
                        if (Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                        {
                            DeliverAmount = "0";
                            Delivery_Flag = "N";
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                        else
                        {
                            Delivery_Flag = "X";
                            DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                    }
                    else
                    {
                        Delivery_Flag = "Z";
                        DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                        Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                    }
                }
            }
            else
            {
                Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                Delivery_Flag = "Y";
            }

            Total = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString() + "|" + Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString());
            Discount = ds.Tables[0].Rows[0]["TOTAL_DISCOUNT"].ToString();
            HttpCookie Cookie = new HttpCookie("item_count");
            Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

        }
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
        {
            steal_deal_Min_order_amount = ds.Tables[2].Rows[0]["MIN_ORDER"].ToString();
        }
        return Total + "|" + DeliverAmount + "|" + Delivery_Flag + "|" + Minimum_Amount + "|" + steal_deal_Min_order_amount + "|" + Discount;
        //return Total + "|" + DeliverAmount + "|" + Delivery_Flag + "|" + Minimum_Amount;

    }

    [WebMethod]
    public static string fnOrderPuchByOffer(string Offer_ID, string Qty, string eventname)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Offer_ID = Offer_ID;
        cr.Qty = Qty;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Flag = eventname;
        cr.Type = 45;
        ds = cr.fnInsertData();
        string Total = "|";
        string DeliverAmount = "";
        string Delivery_Flag = "Y";
        string Minimum_Amount = "";
        string steal_deal_Min_order_amount = "";
        string Discount = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[1].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
            {
                if (ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                {
                    if (ds.Tables[0].Rows[0]["TOTAL"].ToString() != "0")
                    {
                        if (Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                        {
                            DeliverAmount = "0";
                            Delivery_Flag = "N";
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                        else
                        {
                            Delivery_Flag = "X";
                            DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                    }
                    else
                    {
                        Delivery_Flag = "Z";
                        DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                        Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                    }
                }
            }
            else
            {
                Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                Delivery_Flag = "Y";
            }

            Total = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString() + "|" + Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString());
            Discount = ds.Tables[0].Rows[0]["TOTAL_DISCOUNT"].ToString();
            HttpCookie Cookie = new HttpCookie("item_count");
            Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
        {
            steal_deal_Min_order_amount = ds.Tables[2].Rows[0]["MIN_ORDER"].ToString();
        }
        return Total + "|" + DeliverAmount + "|" + Delivery_Flag + "|" + Minimum_Amount + "|" + steal_deal_Min_order_amount + "|" + Discount;
        //return Total + "|" + DeliverAmount + "|" + Delivery_Flag + "|" + Minimum_Amount;

    }

    [WebMethod]
    public static string fnOrderPuchByDeal(string Deal_ID, string Qty, string eventname)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Deal_ID = Deal_ID;
        cr.Qty = Qty;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Flag = eventname;
        cr.Type = 47;
        ds = cr.fnInsertData();
        string Total = "|";
        string DeliverAmount = "";
        string Delivery_Flag = "Y";
        string Minimum_Amount = "";
        string steal_deal_Min_order_amount = "";
        string Discount = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[1].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
            {
                if (ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                {
                    if (ds.Tables[0].Rows[0]["TOTAL"].ToString() != "0")
                    {
                        if (Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                        {
                            DeliverAmount = "0";
                            Delivery_Flag = "N";
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                        else
                        {
                            Delivery_Flag = "X";
                            DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                    }
                    else
                    {
                        Delivery_Flag = "Z";
                        DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                        Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                    }
                }
            }
            else
            {
                Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                Delivery_Flag = "Y";
            }

            Total = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString() + "|" + Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString());
            Discount = ds.Tables[0].Rows[0]["TOTAL_DISCOUNT"].ToString();
            HttpCookie Cookie = new HttpCookie("item_count");
            Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
        {
            steal_deal_Min_order_amount = ds.Tables[2].Rows[0]["MIN_ORDER"].ToString();
        }
        return Total + "|" + DeliverAmount + "|" + Delivery_Flag + "|" + Minimum_Amount + "|" + steal_deal_Min_order_amount + "|" + Discount;

    }

    [WebMethod]
    public static string fnOrderPuchByStealDeal(string SDID, string Qty, string eventname)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.SDID = SDID;
        cr.Qty = Qty;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Flag = eventname;
        cr.Type = 51;
        ds = cr.fnInsertData();
        string Total = "|";
        string DeliverAmount = "";
        string Delivery_Flag = "Y";
        string Minimum_Amount = "";
        string steal_deal_Min_order_amount = "0";
        string Discount = "0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[1].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
            {
                if (ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                {
                    if (ds.Tables[0].Rows[0]["TOTAL"].ToString() != "0")
                    {
                        if (Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                        {
                            DeliverAmount = "0";
                            Delivery_Flag = "N";
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                        else
                        {
                            Delivery_Flag = "X";
                            DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                            Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                        }
                    }
                    else
                    {
                        Delivery_Flag = "Z";
                        DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                        Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                    }
                }
            }
            else
            {
                Minimum_Amount = ds.Tables[1].Rows[0]["MINIMUM_AMOUNT"].ToString();
                DeliverAmount = ds.Tables[1].Rows[0]["DELIVERY_CHARGES"].ToString();
                Delivery_Flag = "Y";
            }

            Total = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString() + "|" + Convert.ToDecimal(ds.Tables[0].Rows[0]["TOTAL"].ToString());
            Discount = ds.Tables[0].Rows[0]["TOTAL_DISCOUNT"].ToString();
            HttpCookie Cookie = new HttpCookie("item_count");
            Cookie.Value = ds.Tables[0].Rows[0]["ITEM_COUNT"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
        {
            steal_deal_Min_order_amount = ds.Tables[2].Rows[0]["MIN_ORDER"].ToString();
        }
        return Total + "|" + DeliverAmount + "|" + Delivery_Flag + "|" + Minimum_Amount + "|" + steal_deal_Min_order_amount + "|" + Discount;
    }

    public void getCustomerDetails()
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 7;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ds = cc.fnGetAddress();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\"> with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

            //active_bal.InnerHtml = "<span>WALLET BALANCE</span><br/> &#8377; " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
        }
    }

    //[WebMethod]

    //public static string getItemsByCGID(string CGID, string MCID, string Item_Name)
    //{
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    cr.CGID = (CGID);
    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
    //    cr.MCID = MCID;
    //    cr.Name = Item_Name;
    //    cr.Type = 72;
    //    ds = cr.fngetParticularItemList();

    //    string Menu_Category = "";
    //    string Menu_category_name = "";
    //    string Menu_Item_List = "";

    //    if (ds != null && ds.Tables[0].Rows.Count > 0)
    //    {
    //        foreach (DataRow DRT in ds.Tables[0].Rows)
    //        {
    //            string img = "";
    //            string image_url = "";
    //            string margin_top = "margin-top:16px;margin-bottom:5px;";

    //            if (DRT["IMAGE_URL"].ToString() != "")
    //            {
    //                img = "../Menu_Pics/" + DRT["IMAGE_URL"].ToString();
    //                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
    //                margin_top = "margin-top:16px;margin-bottom:5px;";
    //            }
    //            else
    //            {

    //                img = "../Menu_Pics/Defaultimage.png";
    //                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
    //            }
    //            string description = "";
    //            if (DRT["DESCRIPTION"].ToString() != "")
    //            {
    //                description = "(" + DRT["DESCRIPTION"].ToString().Trim() + ")";
    //            }
    //            string btnDisplay = "display:none;";
    //            string btnDisplay1 = "";
    //            string qtyShow = "1";
    //            if (DRT["EXISTS_ORDER_QTY"].ToString() != "0")
    //            {
    //                btnDisplay1 = "display:none;";
    //                btnDisplay = "";
    //                qtyShow = DRT["EXISTS_ORDER_QTY"].ToString();
    //            }
    //            string MRP = "";
    //            string PERCENTAGE = "";
    //            if (DRT["MRP"].ToString() != "" && DRT["MRP"].ToString() != null)
    //            {
    //                MRP = "<strike style =\"\"> " + DRT["MRP"].ToString() + "</strike>";
    //                PERCENTAGE = DRT["PERCENT_OFF"].ToString() + "% off";
    //            }
    //            string dis_none = "";

    //            if (ds.Tables[1].Rows[0]["RECURRING_ORDER_FLAG"].ToString() != "Y")
    //            {
    //                dis_none = "d-none";
    //            }


    //            string reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
    //              "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
    //              "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
    //              "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
    //              "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
    //              "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";

    //            Menu_Item_List = Menu_Item_List +

    //           "<div class=\"itemcard select-items unselected\" mcid='" + DRT["MCID"].ToString() + "' veg_non ='" + DRT["VEG_NONVEG"].ToString() + "'>" +
    //            "<div class=\"row\">" +
    //             "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
    //                    "<div class=\"row\"><div style = \"width: 100%;\">" +
    //                    "<div class=\"img_btn_box\">" +
    //                    image_url + "</div></div></div></div>" +
    //            "<div class=\"detailsection\" style=\"width: 70%;\">" +
    //             "<span class=\"itm-amt\" amount=" + DRT["PRICE"].ToString() + ">" +
    //                    "<i class=\"fa fa-inr\" aria-hidden=\"true\" style=\"font-weight:100;\"></i>" + MRP + " <span style=\"font-weight:bold;\">" + DRT["PRICE"].ToString() + "</span><span class=\"offpercnt\">" + PERCENTAGE + "  </span>" +
    //                    "<div style=\"width: 90%;\">" +
    //                    "<a href=\"\"  class=\"itm-name text-dark\" MID='" + DRT["MID"].ToString() + "'>" + DRT["NAME"].ToString() + "</a>" +
    //                    "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
    //                    "</div>" +
    //                    "<div class=\"row\">" +
    //                    "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss " + dis_none + "\" MID='" + DRT["MID"].ToString() + "'>" + reloadicon + "</a></div>" +
    //                    "</div>" +
    //                    "<div style = \"width: 40%;\" ><span class=\"additem\">" +
    //                    "<a class=\"addbtn2 btn\" style=" + btnDisplay + margin_top + ">" +
    //                    "<div class=\"qtySelector text-center\">" +
    //                    "<i class=\"fa fa-minus decreaseQty btnstyle\" ></i>" +
    //                    "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
    //                    "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
    //                    "</div></a></span>" +
    //                    "<span class=\"additem\">" +
    //                    "<a class=\"addbtn btn btnstyle\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
    //                    "</span>" +
    //                    "</div>" +
    //                    "</div>" +
    //                    "</div>" +
    //                    "</div></div>";
    //        }

    //        HttpCookie aCookie = new HttpCookie("mcidcount");
    //        aCookie.Value = "1";
    //        aCookie.Expires = DateTime.Now.AddDays(365);
    //        HttpContext.Current.Response.Cookies.Add(aCookie);

    //        HttpContext.Current.Session["MID"] = null;
    //        HttpContext.Current.Session["MID"] = "2";
    //        if (Menu_Item_List != "")
    //        {
    //            Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
    //                "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
    //                + "</div></div></div><br/>"; ;
    //        }
    //    }
    //    else
    //    {
    //        HttpContext.Current.Session["MID"] = "-1";
    //    }

    //    return Menu_Item_List;
    //}

    //[WebMethod]
    //public static string getAllTagData(string Tag_Name)
    //{
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();

    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();

    //    cr.Name = Tag_Name;
    //    cr.Type = 79;
    //    ds = cr.fngetParticularItemList();

    //    string Menu_Category = "";
    //    string Menu_category_name = "";
    //    string Menu_Item_List = "";

    //    if (ds != null && ds.Tables[0].Rows.Count > 0)
    //    {
    //        foreach (DataRow DRT in ds.Tables[0].Rows)
    //        {
    //            string img = "";
    //            string image_url = "";
    //            string margin_top = "margin-top:16px;margin-bottom:5px;";

    //            if (DRT["IMAGE_URL"].ToString() != "")
    //            {
    //                img = "../Menu_Pics/" + DRT["IMAGE_URL"].ToString();
    //                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
    //                margin_top = "margin-top:16px;margin-bottom:5px;";
    //            }
    //            else
    //            {

    //                img = "../Menu_Pics/Defaultimage.png";
    //                image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
    //            }
    //            string description = "";
    //            if (DRT["DESCRIPTION"].ToString() != "")
    //            {
    //                description = "(" + DRT["DESCRIPTION"].ToString().Trim() + ")";
    //            }
    //            string btnDisplay = "display:none;";
    //            string btnDisplay1 = "";
    //            string qtyShow = "1";
    //            if (DRT["EXISTS_ORDER_QTY"].ToString() != "0")
    //            {
    //                btnDisplay1 = "display:none;";
    //                btnDisplay = "";
    //                qtyShow = DRT["EXISTS_ORDER_QTY"].ToString();
    //            }
    //            string dis_none = "";

    //            if (ds.Tables[1].Rows[0]["RECURRING_ORDER_FLAG"].ToString() != "Y")
    //            {
    //                dis_none = "d-none";
    //            }


    //            string reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
    //              "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
    //              "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
    //              "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
    //              "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
    //              "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";

    //            Menu_Item_List = Menu_Item_List +

    //           "<div class=\"itemcard select-items unselected\" mcid='" + DRT["MCID"].ToString() + "' veg_non ='" + DRT["VEG_NONVEG"].ToString() + "'>" +
    //            "<div class=\"row\">" +
    //             "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
    //                    "<div class=\"row\"><div style = \"width: 100%;\">" +
    //                    "<div class=\"img_btn_box\">" +
    //                    image_url + "</div></div></div></div>" +
    //            "<div class=\"detailsection\" style=\"width: 70%;\">" +
    //             "<span class=\"itm-amt\" amount=" + DRT["PRICE"].ToString() + ">" +
    //                    "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + DRT["PRICE"].ToString() + "</span>" +
    //                    "<div style=\"width: 90%;\">" +
    //                    "<a href=\"\"  class=\"itm-name text-dark\" MID='" + DRT["MID"].ToString() + "'>" + DRT["NAME"].ToString() + "</a>" +
    //                    "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
    //                    "</div>" +
    //                    "<div class=\"row\">" +
    //                    "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss " + dis_none + "\" MID='" + DRT["MID"].ToString() + "'>" + reloadicon + "</a></div>" +
    //                    "</div>" +
    //                    "<div style = \"width: 40%;\" ><span class=\"additem\">" +
    //                    "<a class=\"addbtn2 btn\" style=" + btnDisplay + margin_top + ">" +
    //                    "<div class=\"qtySelector text-center\">" +
    //                    "<i class=\"fa fa-minus decreaseQty btnstyle\" ></i>" +
    //                    "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
    //                    "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
    //                    "</div></a></span>" +
    //                    "<span class=\"additem\">" +
    //                    "<a class=\"addbtn btn btnstyle\" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
    //                    "</span>" +
    //                    "</div>" +
    //                    "</div>" +
    //                    "</div>" +
    //                    "</div></div>";
    //        }

    //        HttpCookie aCookie = new HttpCookie("mcidcount");
    //        aCookie.Value = "1";
    //        aCookie.Expires = DateTime.Now.AddDays(365);
    //        HttpContext.Current.Response.Cookies.Add(aCookie);

    //        HttpContext.Current.Session["MID"] = null;
    //        HttpContext.Current.Session["MID"] = "2";
    //        if (Menu_Item_List != "")
    //        {
    //            Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
    //                "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
    //                + "</div></div></div><br/>"; ;
    //        }
    //    }
    //    else
    //    {
    //        HttpContext.Current.Session["MID"] = "-1";
    //    }

    //    return Menu_Item_List;
    //}

    [WebMethod]

    public static string getCGIDData(string CGID, string MCID, string Item_Name)
    {
        string Menu_Item_List = "";
        if (HttpContext.Current.Request.Cookies["MID"].Value.ToString() != null && HttpContext.Current.Request.Cookies["MID"].Value.ToString() != "-1")
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.CGID = (CGID);
            cr.Count = HttpContext.Current.Request.Cookies["MID"].Value.ToString();
            cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
            cr.MCID = MCID;
            cr.Name = Item_Name;
            cr.Type = 73;
            ds = cr.fngetParticularItemList();

            string Menu_category_name = "";

            string Menu_Category = "";
            if (ds != null && ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
            {
                foreach (DataRow DRT in ds.Tables[0].Rows)
                {

                    string img = "";
                    string image_url = "";
                    string margin_top = "margin-top:16px;margin-bottom:5px;";
                    if (DRT["IMAGE_URL"].ToString() != "")
                    {
                        img = "../Menu_Pics/" + DRT["IMAGE_URL"].ToString();
                        image_url = "<div class=\"food_pic\"><img src = \"" + img + "\"alt=\"" + DRT["NAME"].ToString() + "\"></div>";
                        margin_top = "margin-top:16px;margin-bottom:5px;";
                    }
                    else
                    {

                        img = "../Menu_Pics/Defaultimage.png";
                        image_url = "<div class=\"food_pic\"><img src = \"" + img + "\"alt=\"" + DRT["NAME"].ToString() + "\"></div>";
                    }
                    string description = "";
                    if (DRT["DESCRIPTION"].ToString() != "")
                    {
                        description = "(" + DRT["DESCRIPTION"].ToString().Trim() + ")";
                    }


                    string btnDisplay = "display:none;";
                    string btnDisplay1 = "";
                    string qtyShow = "1";
                    if (DRT["EXISTS_ORDER_QTY"].ToString() != "0")
                    {
                        btnDisplay1 = "display:none;";
                        btnDisplay = "";
                        qtyShow = DRT["EXISTS_ORDER_QTY"].ToString();
                    }

                    string MRP = "";
                    string PERCENTAGE = "";
                    if (DRT["MRP"].ToString() != "" && DRT["MRP"].ToString() != null)
                    {
                        MRP = "<strike style =\"\"> " + DRT["MRP"].ToString() + "</strike>";
                        PERCENTAGE = DRT["PERCENT_OFF"].ToString() + "% off";

                    }

                    string dis_none = "";

                    if (ds.Tables[1].Rows[0]["RECURRING_ORDER_FLAG"].ToString() != "Y")
                    {
                        dis_none = " d-none ";
                    }

                    string reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
                  "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
                  "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
                  "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
                  "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
                  "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";

                    Menu_Item_List = Menu_Item_List +

                    "<div class=\"itemcard select-items unselected\" mcid='" + DRT["MCID"].ToString() + "' veg_non ='" + DRT["VEG_NONVEG"].ToString() + "'>" +
                "<div class=\"row\">" +
                 "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
                        "<div class=\"row\"><div style = \"width: 100%;\">" +
                        "<div class=\"img_btn_box\">" +
                        image_url + "</div></div></div></div>" +
                "<div class=\"detailsection\" style=\"width: 70%;\">" +
                 "<span class=\"itm-amt\" amount=" + DRT["PRICE"].ToString() + ">" +
                        "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + MRP + " <span style=\"font-weight:bold;\">" + DRT["PRICE"].ToString() + "</span><span class=\"offpercnt\">" + PERCENTAGE + "  </span>" +
                        "<div style=\"width: 90%;\">" +
                        "<a href=\"\"  class=\"itm-name text-dark\" MID='" + DRT["MID"].ToString() + "'>" + DRT["NAME"].ToString() + "</a>" +
                        "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
                        "</div>" +
                        "<div class=\"row\">" +
                        "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss " + dis_none + "\" MID='" + DRT["MID"].ToString() + "'>" + reloadicon + "</a></div>" +
                        "</div>" +
                        "<div style = \"width: 40%;\" ><span class=\"additem\">" +
                        "<a class=\"addbtn2 btn \" style=" + btnDisplay + margin_top + ">" +
                        "<div class=\"qtySelector text-center\">" +
                        "<i class=\"fa fa-minus decreaseQty btnstyle\"></i>" +
                        "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
                        "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
                        "</div></a></span>" +
                        "<span class=\"additem\">" +
                        "<a class=\"addbtn btn btnstyle \" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
                        "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div></div>";
                }
                if (Menu_Item_List != "")
                {
                    Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
                        "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
                        + "</div></div></div><br/>"; ;
                }

                HttpContext.Current.Session["mid"] = Convert.ToString(Convert.ToInt32(HttpContext.Current.Request.Cookies["MID"].Value.ToString()) + 1);

                HttpCookie Cookie = new HttpCookie("mcidcount");
                Cookie.Value = Convert.ToString(Convert.ToInt32(HttpContext.Current.Request.Cookies["mcidcount"].Value.ToString()) + 1);
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                HttpCookie item_name = new HttpCookie("item_name");
                item_name.Value = "";
                item_name.Expires = DateTime.Now.AddDays(1);
                HttpContext.Current.Response.Cookies.Add(item_name);
            }
            else
            {

                HttpCookie Cookie = new HttpCookie("mcidcount");
                Cookie.Value = "-1";
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                HttpCookie aCookie = new HttpCookie("onlycgid");
                aCookie.Value = "-1";
                aCookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(aCookie);

                HttpCookie item_name = new HttpCookie("item_name");
                item_name.Value = "";
                item_name.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(item_name);


                HttpContext.Current.Session["mid"] = "-1";
            }
        }
        return Menu_Item_List;
    }

    [WebMethod]

    public static string gettagDataAll(string Item_Name)
    {
        string Menu_Item_List = "";
       // if (HttpContext.Current.Session["mid"].ToString() != "-1")
       if(HttpContext.Current.Request.Cookies["MID"].Value.ToString() != "-1")
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.Count = HttpContext.Current.Request.Cookies["MID"].Value.ToString();// HttpContext.Current.Session["MID"].ToString();
            cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
            cr.Name = Item_Name;
            cr.Type = 80;
            ds = cr.fngetParticularItemList();

            string Menu_category_name = "";

            string Menu_Category = "";
            if (ds != null && ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
            {
                foreach (DataRow DRT in ds.Tables[0].Rows)
                {

                    string img = "";
                    string image_url = "";
                    string margin_top = "margin-top:16px;margin-bottom:5px;";
                    if (DRT["IMAGE_URL"].ToString() != "")
                    {
                        img = "../Menu_Pics/" + DRT["IMAGE_URL"].ToString();
                        image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
                        margin_top = "margin-top:16px;margin-bottom:5px;";
                    }
                    else
                    {

                        img = "../Menu_Pics/Defaultimage.png";
                        image_url = "<div class=\"food_pic\"><img src = \"" + img + "\" alt=\"" + DRT["NAME"].ToString() + "\"></div>";
                    }
                    string description = "";
                    if (DRT["DESCRIPTION"].ToString() != "")
                    {
                        description = "(" + DRT["DESCRIPTION"].ToString().Trim() + ")";
                    }


                    string btnDisplay = "display:none;";
                    string btnDisplay1 = "";
                    string qtyShow = "1";
                    if (DRT["EXISTS_ORDER_QTY"].ToString() != "0")
                    {
                        btnDisplay1 = "display:none;";
                        btnDisplay = "";
                        qtyShow = DRT["EXISTS_ORDER_QTY"].ToString();
                    }

                    string reloadicon = "<svg version=\"1.1\" id=\"Capa_1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" height=\"20\"  width=\"20\" x=\"0px\" y=\"0px\"" +
                  "viewBox=\"0 0 341.333 341.333\" style=\"enable-background:new 0 0 341.333 341.333;\" xml:space=\"preserve\">" +
                  "<g><g><path d=\"M341.227,149.333V0l-50.133,50.133C260.267,19.2,217.707,0,170.56,0C76.267,0,0.107,76.373,0.107,170.667" +
                  "s76.16,170.667,170.453,170.667c79.467,0,146.027-54.4,164.907-128h-44.373c-17.6,49.707-64.747,85.333-120.533,85.333" +
                  "c-70.72,0-128-57.28-128-128s57.28-128,128-128c35.307,0,66.987,14.72,90.133,37.867l-68.8,68.8H341.227z\" fill=\"\"/>" +
                  "</g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>";

                    Menu_Item_List = Menu_Item_List +

                    "<div class=\"itemcard select-items unselected\" mcid='" + DRT["MCID"].ToString() + "' veg_non ='" + DRT["VEG_NONVEG"].ToString() + "'>" +
                "<div class=\"row\">" +
                 "<div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
                        "<div class=\"row\"><div style = \"width: 100%;\">" +
                        "<div class=\"img_btn_box\">" +
                        image_url + "</div></div></div></div>" +
                "<div class=\"detailsection\" style=\"width: 70%;\">" +
                 "<span class=\"itm-amt\" amount=" + DRT["PRICE"].ToString() + ">" +
                        "<i class=\"fa fa-inr\" aria-hidden=\"true\"></i> " + DRT["PRICE"].ToString() + "</span>" +
                        "<div style=\"width: 90%;\">" +
                        "<a href=\"\"  class=\"itm-name text-dark\" MID='" + DRT["MID"].ToString() + "'>" + DRT["NAME"].ToString() + "</a>" +
                        "<p style = \"font-size: 10px;margin-bottom:0px;\" > " + description + " </p>" +
                        "</div>" +
                        "<div class=\"row\">" +
                        "<div style = \"width: 60%;\"><div style=\"padding-top:20px; text-align:right;padding-right:10px;\"><a class=\"md-trigger relodbtncss\" MID='" + DRT["MID"].ToString() + "'>" + reloadicon + "</a></div>" +
                        "</div>" +
                        "<div style = \"width: 40%;\" ><span class=\"additem\">" +
                        "<a class=\"addbtn2 btn \" style=" + btnDisplay + margin_top + ">" +
                        "<div class=\"qtySelector text-center\">" +
                        "<i class=\"fa fa-minus decreaseQty btnstyle\"></i>" +
                        "<input readonly=\"\" type=\"text\" class=\"qtyValue\" value=" + qtyShow + ">" +
                        "<i class=\"fa fa-plus increaseQty btnstyle\"></i>" +
                        "</div></a></span>" +
                        "<span class=\"additem\">" +
                        "<a class=\"addbtn btn btnstyle \" style=\"" + btnDisplay1 + margin_top + "color:white;\">Add +</a>" +
                        "</span>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div></div>";
                }
                if (Menu_Item_List != "")
                {
                    Menu_Category = "<div class=\"row\"><div class=\"col-sm-12 p-0 m-0\">" +
                        "<div id=\"sub_category\" style=\"display: flex; overflow-x: auto; overflow-y: hidden; background: white;\">" + Menu_category_name
                        + "</div></div></div><br/>"; ;
                }

                HttpContext.Current.Session["mid"] = Convert.ToString(Convert.ToInt32(HttpContext.Current.Request.Cookies["MID"].Value.ToString()) + 1);

                HttpCookie Cookie = new HttpCookie("mcidcount");
                Cookie.Value = Convert.ToString(Convert.ToInt32(HttpContext.Current.Request.Cookies["mcidcount"].Value.ToString()) + 1);
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);


            }
            else
            {

                HttpCookie Cookie = new HttpCookie("mcidcount");
                Cookie.Value = "-1";
                Cookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(Cookie);

                HttpCookie aCookie = new HttpCookie("onlytagname");
                aCookie.Value = "-1";
                aCookie.Expires = DateTime.Now.AddDays(365);
                HttpContext.Current.Response.Cookies.Add(aCookie);



                HttpContext.Current.Session["mid"] = "-1";
            }
        }
        return Menu_Item_List;
    }

    //[WebMethod]

    //public static string getMCIDNames(string CGID, string MCID)
    //{
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    cr.CGID = CGID;
    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();

    //    cr.Type = 74;
    //    ds = cr.fngetParticularItemList();
    //    string Menu_category = "";
    //    string menu_selected = "";
    //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
    //    {
    //        foreach (DataRow DR in ds.Tables[0].Rows)
    //        {

    //            if (DR["MCID"].ToString() == MCID)
    //            {
    //                menu_selected = "<div class=\"subcategories subactive\" mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</div>";
    //            }
    //            else
    //            {
    //                Menu_category = Menu_category + "<div class=\"subcategories  \" mcid='" + DR["MCID"].ToString() + "'>" + DR["CATEGORY_NAME"].ToString() + "</div>";
    //            }

    //        }
    //    }
    //    //return "<div class=\"subcategories \" mcid=\"0\">All</div>" + menu_selected + Menu_category;
    //    return menu_selected + Menu_category;
    //}

    [WebMethod]

    public static string getTag_Name()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.Type = 81;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        ds = cr.fnInsertData();
        string cgid_with_mcid = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                cgid_with_mcid = cgid_with_mcid + "<option>" + DR["TAG_NAME"].ToString() + "</option>";
            }

        }
        return cgid_with_mcid;
    }
    //[WebMethod]
    //public static string getAllCategories()
    //{
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.Type = 78;
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
    //    ds = cr.fnInsertData();
    //    string cgid_with_mcid = "";
    //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
    //    {
    //        foreach (DataRow DR in ds.Tables[0].Rows)
    //        {
    //            cgid_with_mcid = cgid_with_mcid + "<option cgid='" + DR["CGID"].ToString() + "' mcid='" + DR["MCID"].ToString() + "'>" + DR["CG_NAME"].ToString() + "</option>";
    //        }

    //    }
    //    return cgid_with_mcid;
    //}


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
                IMAGE_URL = (i.Field<string>(6))
            }).ToList();
        }

        return result;
    }

    ///---------------------------------------------------------------localstorage------------------------------------------------//
    ///---------------------------------------------------------------localstorage------------------------------------------------//
    [WebMethod]
    public static string getItemsByCGID(string CGID, string MCID, string Item_Name)
    {
        string result = "", result1 = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CGID = (CGID);
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.MCID = MCID;
        cr.Name = Item_Name;
        cr.Type = 72;
        ds = cr.fngetParticularItemList();
        if (ds != null)
        {
            result = LowercaseJsonSerializer.SerializeObject(ds);
            //result =   ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
            //result1 = ds.Tables[1].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[1]) : "";
        }

        return result;// +"!!"+ result1;
    }


    [WebMethod]

    public static string getMCIDNames(string CGID, string MCID)
    {
        string result = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CGID = CGID;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();

        cr.Type = 74;
        ds = cr.fngetParticularItemList();
        if (ds != null)
        {
            // result=ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
            result = LowercaseJsonSerializer.SerializeObject(ds);
        }
        return result;
    }

    [WebMethod]
    public static string getAllCategories()
    {
        string cgid_with_mcid = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.Type = 78;
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        ds = cr.fnInsertData();
        if (ds != null)
        {
            cgid_with_mcid = LowercaseJsonSerializer.SerializeObject(ds);
            //cgid_with_mcid = ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
        }
        return cgid_with_mcid;
    }


    [WebMethod]
    public static string getMenuByOffers(string Offer_ID)
    {
        string result = "";
        string result1 = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CGID = Offer_ID;
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 43;
        ds = cr.fngetParticularItemList();
        if (ds != null)
        {
            result = LowercaseJsonSerializer.SerializeObject(ds);
            //result = ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
            //result1 = ds.Tables[1].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[1]) : "";
        }


        return result; //+"!"+ result1;

    }



    [WebMethod]
    public static string getAllTagData(string Tag_Name)
    {
        string result = "";
        string result1 = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Name = Tag_Name;
        cr.Type = 79;
        ds = cr.fngetParticularItemList();
        if (ds != null)
        {
            result = LowercaseJsonSerializer.SerializeObject(ds);
            //result = ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
            //result1 = ds.Tables[1].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[1]) : "";
        }

        return result; //+"!"+ result1;
    }


    [WebMethod]
    public static string getMCIDdetailsforridvidipuja(string MCID)
    {
        string result = "";
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 136;
        cr.MCID = MCID;
        ds = cr.fngetParticularItemList();
        if (ds != null)
        {
            result = LowercaseJsonSerializer.SerializeObject(ds);

        }

        return result; //+"!"+ result1;

    }

}