using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Add_items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


   

    [WebMethod]

    public static List<cl_resturantorder> fnGetAllProducts(string search)
    {
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Search_Item = search;
        cr.Type = 17;
        ds = cr.fngetallProductsList();
        List<cl_resturantorder> result = new List<cl_resturantorder>();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].AsEnumerable().Select(i => new cl_resturantorder()
            {
                MID = Convert.ToString(Convert.ToInt32(i.Field<Int64>(0))),
                Item_Name = i.Field<string>(5),
                IMAGE_URL = i.Field<string>(20),
                Qty = i.Field<string>(12),
                Price = Convert.ToString(Convert.ToInt32(i.Field<Int64>(11))),


            }).ToList();
        }

        return result;
    }


    [WebMethod]

    public static string fnGetPerticularProducts(string mid)
    {
        string result = string.Empty;
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.MID = mid;
        cr.Type = 34;
        ds = cr.fn_Insertitemsadmin();
        if (ds != null)
        {
            string pic = "";
            if (ds.Tables[0].Rows[0]["IMAGE_URL"].ToString() != "")
            {
                pic = ds.Tables[0].Rows[0]["IMAGE_URL"].ToString();
            }
            else
            {

                pic = "Defaultimage.png";
            }
            result = "<div class=\"container\"><div class=\"row\"><div class=\"col-sm-2\"></div><div class=\"col-sm-8\">" +
            "<div class=\"item__Details\"><div class=\"row\"><div class=\"col-3\">" +
            "<div class=\"imagepart\"><img width=\"80\" class=\"image_block\" src=\"../Menu_Pics/" + pic + "\" />" +
            "</div></div><div class=\"col-9\"><div class=\"details\">" +
            "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"product_name\"> " + ds.Tables[0].Rows[0]["NAME"].ToString() + "</div> </div></div>" +
            "<div class=\"row m-2\"><div class=\"col-6\"><div class=\"product_price\"><label>Price in ( <i class=\"fa fa-inr\"></i> ) </label><input class=\"input__box price__ w-100\" value=\"" + ds.Tables[0].Rows[0]["PRICE"].ToString() + "\"/></div></div><div class=\"col-6\"><div class=\"product_QTY\"><label>QTY</label><input class=\"input__box qty__ w-100\" value=\"1\"/></div></div></div>" +
             "</div></div></div></div><div class=\"row mt-2\"><div class=\"col-sm-12\"><div class=\"submitbtn__box\"><button id=\"submititemsbtn\" class=\"btnstyle btn w-100\">Add</button></div></div></div></div><div class=\"col-sm-2\"></div></div></div>";

        }
        return result;

    }




    [WebMethod]

    public static string fnGetCustomerDetails(string number, string type)
    {
        string result = "";
        string location = "";
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.MOBILE = number;
        cr.Type = 22;
        ds = cr.fn_Customer_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["LOCATION1"].ToString() != "")
            {
                location = ds.Tables[0].Rows[0]["LOCATION1"].ToString();
            }

            if (type == "0")
            {
                result = "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"card p-3\">" +
                   "<div class=\"row\"><div class=\"col-sm-4\"><div class=\"user__img text-center\">" +
                  "<img src=\"../Menu_Pics/" + ds.Tables[0].Rows[0]["CUST_IMG_URL"].ToString() + "\" /></div></div><div class=\"col-sm-8\">" +
                  "<div class=\"user__details text-center\">" +
                  "<h5>" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + "</h5> " +
                  "<div>" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "</div> " +
                  "<div>" + location.Replace("<br/>", " , ") + "</div>" +
                  "</div></div></div>" +
                  "<div class=\"row mt-2\">" +
                  "<div class=\"col-5\">" +
                  "<button id=\"cancelordercreate_Btn\" class=\"btn btnstyle w-100\">Cancel</button>" +
                   "</div>" +
                   "<div class=\"col-7\">" +
                  "<button number=\"" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "\" id=\"createorderbtn\" class=\"btn btnstyle w-100 \">Create Order</button>" +
                  "</div>" +
                  "</div>" +
                  "</div>" +

                  "</div></div>";
            }
            else
            {
                result = "<a href=\"javascript:void(0);\" id=\"StoreName\"  runat=\"server\" class=\"navbar-brand\" style=\"margin-left: 40px;margin-top:-20px;\">" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() +
                         " - " + ds.Tables[0].Rows[0]["MOBILE"].ToString() +
                         "<p style=\"font-size: 12px; color: #e6e6e6; text-align: left; margin-bottom: 0px; font-weight: 400;\">" + location.Replace("<br/>", " , ") + "</p></a>";
            }

        }
        else
        {
            result = "No record found";
        }
        return result;
    }
    [WebMethod]
    public static Cl_admin Update_Offer_Data(string MID, string Flag, Cl_admin OfferData, string Qty, string Price, string Item) //, cl_subscription objSubscription
    {

        if (OfferData == null)
            OfferData = new Cl_admin();

        if (OfferData.OfferDetails == null)
            OfferData.OfferDetails = new List<cl_CreateOffer>();


        if (Flag == "ADD")
        {
            OfferData.OfferDetails.Add(new cl_CreateOffer
            {

                Price = Price,
                Qty = Qty,
                RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                MID = MID,
                Item_Name = Item

            });

        }
        else if (Flag == "SUB")
        {
            OfferData.OfferDetails.RemoveAll(r => r.MID == MID && r.RID == HttpContext.Current.Request.Cookies["rid"].Value.ToString());
            OfferData.OfferDetails.Add(new cl_CreateOffer
            {
                Price = Price,
                Qty = Qty,
                RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                MID = MID,
                Item_Name = Item
            });
        }
        else
        {
            OfferData.OfferDetails.RemoveAll(r => r.MID == MID && r.RID == HttpContext.Current.Request.Cookies["rid"].Value.ToString());
        }

        return OfferData;
    }


    [WebMethod]
    public static string CreateOrder(string Flag, Cl_admin OfferData, string Header_id)
    {

        string RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        string Created_By = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        OfferData.fnSaveEditeditem(OfferData, RID, Created_By, Flag, Header_id);

        return "1";
    }

    [WebMethod]

    public static string fnGenerateNewItemInList(string MID, string Price,string Item_Name)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 56;
        ca.PRICE = Price;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.MID = MID;
        ca.NAME = Item_Name;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        DataSet ds = ca.fn_Insertitemsadmin();
        string Item_ID = ds.Tables[0].Rows[0]["MID"].ToString();
        return Item_ID;
    }



    [WebMethod]
    public static string getItemsByHeader(string header_id)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Header_ID = header_id;
        cr.Type = 106;
        ds = cr.fnGenerateInvoice();
        string items = "";
        string Userdetails = "";
        string result = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow DR in ds.Tables[1].Rows)
            {

                string checkedItem = "";
                string product_imgage = "";
                if (DR["IS_AVAILABLE"].ToString() == "Y")
                {
                    checkedItem = "checked";
                }
                string NA = "";


                if (DR["SERVED"].ToString() == "N" && DR["SERVED"].ToString() != "")
                {
                    NA = "<div class=\"itemoverlay\" style=\"background:#ffbbbb80;position:absolute;height:100%;width:100%;text-align:end;\"><div style=\"position:absolute;bottom:8px;align-items:unset;width:50%;border:1px solid;text-align:center;border-radius:15px;right:0;background:white;color:#8c8c8c;\">Not delivered</div></div>";
                }
                else
                {
                    NA = "";
                }
                if (DR["IMAGE_PATH"].ToString() != "")
                {
                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/" + DR["IMAGE_PATH"].ToString() + "\"/>";
                }
                else
                {

                    product_imgage = "<img style=\"width:100%;height:100%\" src=\"../Menu_Pics/Defaultimage.png\"/>";
                }
                items = items + "<div class=\"card mt-2\"><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\" style=\"height: 80px;width: 100%; padding:10px;margin:auto;\"> " +
                                               "" + product_imgage + "</div></div><div class=\"col-8\"> " +
                                               "<div class=\"itemdetails\"><div class=\"itemprice\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "" +
                                               "<span class=\"slider round\"></span></label></div><div class=\"itemname\">" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "  " + DR["SIZE"].ToString() + "</div> " +
                                               "<div class=\"itemqty\" style=\"display: none;\">" + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "    x " + DR["QTY"].ToString() + "</div></div></div></div>" + NA + "</div>";
            }


            Userdetails = "<div class=\"card\"><div class=\"container\"><div class=\"row\" style=\"border-radius: 5px;color: white;\">" +
               "<div class=\"col-8 col-md-8  pr-0\"><div class=\"retailrdetails\">" +
               "<div class=\"rtname\">" + ds.Tables[0].Rows[0]["C_Name"].ToString() + "  - <a style=\"color:white\" href=\"tel:" + ds.Tables[0].Rows[0]["C_NUMBER"].ToString() + " \"> " + ds.Tables[0].Rows[0]["C_NUMBER"].ToString() + " </a>" +
               " </div><div style=\"font-size: 11px;color: #989898; font-weight: 500;\">" + ds.Tables[0].Rows[0]["CUSTOMER_ADDRESS"].ToString() + " </div>" +
                "</div></div><div class=\"col-4 col-md-4  p-0\"><div class=\"orderdate__number text-center\">" +
               "<div class=\"order__date\">" + Convert.ToString(Convert.ToDateTime(ds.Tables[0].Rows[0]["ORDER_DATE"]).ToString("dd-MMM-yyy")) + "  </div><div class=\"order__number\">Order No: # " + ds.Tables[0].Rows[0]["ORDER_NO"].ToString() + "  </div></div></div></div></div></div>";


            result = "<div class=\"box_design\">" + Userdetails + "<div class=\"mt-2\">Order item(s)</div>" + items + "</div>";

        }
        return result;
    }

    [WebMethod]

    public static List<cl_resturantorder> fnGetAllSuggestedProducts(string search)
    {
        DataSet ds = new DataSet();
        Cl_admin cr = new Cl_admin();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Search_Item = search;
        cr.Type = 55;
        ds = cr.fngetallProductsList();
        List<cl_resturantorder> result = new List<cl_resturantorder>();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].AsEnumerable().Select(i => new cl_resturantorder()
            {
                MID = Convert.ToString(Convert.ToInt32(i.Field<Int64>(0))),
                Item_Name = i.Field<string>(5),
                IMAGE_URL = i.Field<string>(20),
                Qty = i.Field<string>(12),
                Price = Convert.ToString(Convert.ToInt32(i.Field<Int64>(11))),


            }).ToList();
        }

        return result;
    }
}