using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //getMenuLists();
        getCustomerDetails();

        if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() != "48" ||
            HttpContext.Current.Request.Cookies["rid"].Value.ToString() != "51")
        {
            contactus.Visible = false;
        }
        else
        {
            contactus.Visible = true;
        }
    }

    [WebMethod]
    // public static string getMenuLists()
    public static string getMenuListdatatable()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 41;
        ds = cr.fnInsertData();
        string Items = "";
        string ShowDiv = "";
        string datepickerbox = "";
        decimal total = 0;
        string DeliveryCharges = "";
        string DeliverAmount = "";
        string DeliverySection = "";
        string AddressSection = "";
        string scheduleorder = "";
        int i = 0;
        int qty = 0;
        string dnon = "";
        string check = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {

            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string Img_Url = "images/Defaultimage.png";
                if (DR["IMAGE_URL"].ToString() != "")
                {
                    Img_Url = "../Menu_Pics/" + DR["IMAGE_URL"].ToString();
                }
                string Line = "";



                if (Convert.ToDecimal(DR["ACTUAL_PRICE"].ToString()) != Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString()))
                {
                    Line = "<div class=\"itemprice\">Rs. <s style=\"font-size:12px;color:gray;\">" + Convert.ToString(Convert.ToDecimal(DR["ACTUAL_PRICE"].ToString())) + " </s> " + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "<span style=\"color:red;float:right;\">" + DR["DISCOUNT_PERCENTAGE"].ToString() + "%</span></div>";
                }
                else
                {
                    Line = "<div class=\"itemprice\">Rs. <span style=\"font-size:12px;color:gray;\">" + Convert.ToString(Convert.ToDecimal(DR["ACTUAL_PRICE"].ToString())) + " </span></div>";
                }

                string notavailablebox = "", hidebtn = "";
                if (DR["ITEM_AVAILABILITY"].ToString() != "Y")
                {
                    notavailablebox = "<span class=\"notavailable qtySelector\" style=\"background:antiquewhite;padding:9px;font-size:11px;border-radius:5px;height: 32px !important;\">out of stock</span >";
                    hidebtn = "d-none";
                }

                Items = Items + "<div class=\"card mt-3\" cgid='" + DR["CGID"].ToString() + "' rid='" + DR["RID"].ToString() + "' mid='" + DR["MID"].ToString() + "' offer_id='" + DR["OFFER_ID"].ToString() + "' deal_id='" + DR["DEAL_ID"].ToString() + "' sdid='" + DR["SD_ID"].ToString() + "'>" +
                    "<div class=\"row\"><div class=\"col-3\"><div class=\"productpic\">" +
                               "<img style=\"\" src =" + Img_Url + " /></div></div><div class=\"col-9\"><i style=\"margin-top: 12px;\" class=\"remove fa fa-trash deleteItem\"></i>" +
                               "<div class=\"itemdetails\">" + Line +
                               "<div class=\"itemname\">" + DR["MNAME"].ToString().Replace("~", "<br/>").Replace(",", "") + "</div>" +
                               "<div class=\"itemqty\" style=\"display:none;\">" + DR["QTY"].ToString() + " Unit</div></div><br/><div class=\"qtySelector " + hidebtn + " text-center\"><i class=\"fa fa-minus btnstyle decreaseQty\"></i>" +
                               "<input type =\"text\" class=\"qtyValue\" value=" + DR["QTY"].ToString() + " readonly/><i class=\"fa fa-plus btnstyle increaseQty\"></i></div>" +
                               notavailablebox + "</div></div></div>";

                total = total + (Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) * Convert.ToDecimal(DR["QTY"].ToString());
                qty = qty + Convert.ToInt32(DR["QTY"].ToString());
                i++;
            }

            if (ds != null && ds.Tables.Count > 0 && ds.Tables[3].Rows.Count > 0)
            {

                if (ds.Tables[3].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString() != "Y")
                {
                    if (ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString() != "0")
                    {
                        if (ds.Tables[2].Rows[0]["TOTAL"].ToString() != "0")
                        {
                            if (Convert.ToDecimal(ds.Tables[2].Rows[0]["TOTAL"].ToString()) - Convert.ToDecimal(ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString()) >= 0)
                            {
                                DeliveryCharges = "Yey! you will get free delivery";
                                DeliverAmount = "0";
                            }
                            else
                            {
                                DeliveryCharges = "Add Rs " + Convert.ToString(Convert.ToDecimal(ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString()) - Convert.ToDecimal(ds.Tables[2].Rows[0]["TOTAL"].ToString())) + " to get the free delivery";
                                DeliverAmount = ds.Tables[3].Rows[0]["DELIVERY_CHARGES"].ToString();
                            }
                        }
                        else
                        {
                            DeliveryCharges = "Shop above Rs " + ds.Tables[3].Rows[0]["MINIMUM_AMOUNT"].ToString() + " for free delivery";
                            DeliverAmount = ds.Tables[3].Rows[0]["DELIVERY_CHARGES"].ToString();
                        }
                    }
                }
                else
                {
                    DeliveryCharges = "You will be charged Rs " + ds.Tables[3].Rows[0]["DELIVERY_CHARGES"].ToString() + " extra for delivering the order";
                    DeliverAmount = ds.Tables[3].Rows[0]["DELIVERY_CHARGES"].ToString();
                }


                DeliverySection = "<div class=\"row \"> <div class=\"col-sm-12\">" +
                                                          "<div class=\"deliver mt-4 d-none\">" +
                                                             "<h6 style=\"margin-top: 15px;\">Delivery charges</h6>" +
                                                              "<div class=\"card p-1 mb-1 deliveryText \" style=\"font-size:.9rem;\">" +
                                                         DeliveryCharges + "</div> " +
                                                         "</div> ";


            }
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[4].Rows.Count > 0)
            {
                if (ds.Tables[4].Rows[0]["ADDRESS"].ToString() != "")
                {
                    string CustName = ds.Tables[4].Rows[0]["NAME"].ToString();
                    string CustMobile = ds.Tables[4].Rows[0]["MOBILE"].ToString();
                    if (string.IsNullOrEmpty(CustName))
                    {
                        CustName = ds.Tables[1].Rows[0]["C_NAME"].ToString();
                    }
                    if (string.IsNullOrEmpty(CustMobile))
                    {
                        CustMobile = ds.Tables[1].Rows[0]["C_NUMBER"].ToString();
                    }

                    AddressSection = "<div class=\"address mt-4\"><h6 style=\"margin-top: 15px;\">Delivery Address</h6>" +
                                                                                  "<div class=\"card p-1 mb-1 address_cust\" address_id='" + ds.Tables[4].Rows[0]["CUST_ADD_ID"].ToString() + "' >" +
                                                                             "<div class=\"container\">" +
                                                                             "<div class=\"row\"><div class=\"col-6 text-center\"><h6 class=\"typeadrs\">" + ds.Tables[4].Rows[0]["ADDRESS_TYPE"].ToString() + "</h6></div>" +
                                                                             "<div class=\"col-6 text-center changeaddressbtn\"><a class=\" \" href=\"../Components/address.aspx\"> change </a></div></div>" +
                                                                             "</div><span>" + CustName + "- <a href=\"tel:" + CustMobile + "\">" + CustMobile + "</a><br/>" + ds.Tables[4].Rows[0]["ADDRESS"].ToString()
                                                                             + ", " + ds.Tables[4].Rows[0]["LOCATION"].ToString() + ", " + ds.Tables[4].Rows[0]["CITY"].ToString() + ", " + ds.Tables[4].Rows[0]["STATE"].ToString() + "</span></div> " +
                                                                             "</div> ";
                }
                else
                {
                    AddressSection = "<div class=\"address mt-4\"><h6 style=\"margin-top: 15px;\">Delivery Address</h6>" +
                                                                                  "<div class=\"card p-1 mb-1\">" +
                                                                            "<a href=\"../Components/address.aspx\" class=\"btn btn-primary add_address addaddressexists btnstyle border-0\" > Add New Address </a></div> " +
                                                                             "</div> ";

                }
            }
            else
            {
                AddressSection = "<div class=\"address mt-4\"><h6 style=\"font-size: .8rem;margin-top: 15px;\">Delivery Address</h6>" +
                                                                                    "<div class=\"card p-1 mb-1\">" +
                                                                              "<a href=\"../Components/address.aspx\" class=\"btn btn-primary add_address addaddressexists btnstyle border-0\">Add New Address </a></div> " +
                                                                               "</div> ";

            }

            if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "48" ||
                HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "51")
            {
                dnon = "d-none";
                check = "checked";
            }
            else
            {
                dnon = "";
                check = "";
            }

            string Email = "", emailClass = "";
            if (ds.Tables[9].Rows.Count > 0)
            {
                Email = ds.Tables[9].Rows[0]["Email"].ToString();
                if (Email != "")
                {
                    emailClass = "d-none";
                }
            }

            scheduleorder = "<div class=\"mt-1\"   ><div class=\" row\" ><div class=\" col-12\" ><div class=\" text-center\">" +
                         "<span style=\"font-size: .9rem;\">Choose delivery slot for this address</span></div></div><div class=\" col-12\">" +
                         "<div class=\" day_date\" >" +
                         "<div id=\"sub_category\"  style=\" display: flex;font-size: 15px;background:white;overflow:auto;\">" +

                         "</div>" +
                         "<div class=\" timeslots\">" +
                         "<div class=\" container\" ><div class=\" row\" ><div id=\"time_slot\" class=\"col-12 slots\">" +

                         " </div></div></div></div>" +
                         "</div></div></div></div>";

            datepickerbox = "<div class=\"form-group " + dnon + "\" style=\"margin-top: 25px;\">" +
              //" <label for=\"inputDate\">Date</label>" +
              " <h6 for=\"inputDate\">Delivery Date</h6>" +
             "<label class=\"form-control selectslots ml-0\" id=\"inputDate\"><div bdid='" + ds.Tables[6].Rows[0]["BDID"].ToString()
             + "' class=\"timing selectedTimeSlot\" >" + ds.Tables[6].Rows[0]["WEEK_DAYS"].ToString() + ", " + Convert.ToDateTime(ds.Tables[6].Rows[0]["DATE_TODAY"]).ToString("dd-MMM")
             + "  |  " + ds.Tables[6].Rows[0]["TIME_SLOT_START"].ToString() + " - " + ds.Tables[6].Rows[0]["TIME_SLOT_END"].ToString()
             + "<i class=\" fa fa-check-circle fa-2x\" style=\"margin-top: -5px;\"></i></div>" + scheduleorder + "</label>" +
             "</div>" +
             "<div class=\"row mb-3\"><div class=\"col-12\"><textarea class=\"form-control\" id=\"any_instructions\" placeholder=\"Any instructions\"></textarea></div>" +
             "<div class='col-12 " + emailClass + "'><label for='Email' class='control-label'>" +
             "Email</label><input pattern=\"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,63}$\"  type='text' value='" + Email + "' class='form-control' id='Email'></div></div>";



        }

        if (Items != "")
        {
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {

                decimal total_steal_amount = Convert.ToDecimal(ds.Tables[3].Rows[0]["MAX_ORDER_AMOUNT"].ToString()) - Convert.ToDecimal(ds.Tables[2].Rows[0]["TOTAL"].ToString());
                if (total_steal_amount <= 0)
                {
                    total_steal_amount = 0;
                }

                string stealClass = "";
                //string steal_deal_line = "Steal deal is applicable on a  minimum cart value of Rs " + ds.Tables[3].Rows[0]["MAX_ORDER_AMOUNT"].ToString() +
                //    "<br><br>Add items worth Rs " + Convert.ToString(total_steal_amount) + " to your cart to qualify for steal deal";

                string steal_deal_line = "Add items worth Rs " + Convert.ToString(total_steal_amount) + " to cart to qualify for steal deal";

                if (ds.Tables[3].Rows[0]["MAX_ORDER_AMOUNT"].ToString() == "0")
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
                Minimum_Amount_steal_Deal = "<span id=\"minAmountStealDeal\" style=\"font-size:11px;font-weight:500;font-size: 11px;font-weight:600;  color: #23b4ad;\">" + steal_deal_line + "</span>";

                string Msgbox = "";
                if (HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "48" ||
                    HttpContext.Current.Request.Cookies["rid"].Value.ToString() == "51")
                {
                    if (ds != null && ds.Tables.Count > 0 && ds.Tables[8].Rows.Count > 0)
                    {
                        string Images = "";

                        foreach (DataRow DR in ds.Tables[8].Rows)
                        {
                            string type_if = ""; string textshow = "";
                            if (Convert.ToInt32(DR["MAX_QTY"]) >= 1 && Convert.ToInt32(DR["MAX_QTY"]) <= 4)
                            {
                                type_if = "economical";
                                textshow = "<span style=\"position:absolute;text-align: center;top:12px;\">Add <strong style='font-size:17px;'>" + (Convert.ToInt32(DR["MAX_QTY"].ToString()) - Convert.ToInt32(DR["SQTY"].ToString())) + "</strong> " + DR["CG_NAME"].ToString() + " to get our " + type_if + " prices of <b>  <i class=\"fa fa-rupee\"></i> " + DR["DISCOUNT_AMOUNT"].ToString() + "</b></span>";


                            }
                            else if (Convert.ToInt32(DR["MAX_QTY"]) >= 5 && Convert.ToInt32(DR["MAX_QTY"]) <= 10)
                            {
                                type_if = "super value";
                                textshow = "<span style=\"position:absolute;text-align: center;top:12px;\">Add <strong style='font-size:17px;'>" + (Convert.ToInt32(DR["MAX_QTY"].ToString()) - Convert.ToInt32(DR["SQTY"].ToString())) + "</strong> " + DR["CG_NAME"].ToString() + " to get our " + type_if + " prices of <b> <i class=\"fa fa-rupee\"></i> " + DR["DISCOUNT_AMOUNT"].ToString() + "</b></span>";
                            }
                            else
                            {
                                type_if = "super value";
                                textshow = "<span style=\"position:absolute;text-align: center;top:12px;\">Congratulations ! you are geting this " + DR["CG_NAME"].ToString() + " to  our " + type_if + " prices of <b>  <i class=\"fa fa-rupee\"></i> " + DR["DISCOUNT_AMOUNT"].ToString() + "</b></span>";

                            }
                            Images = Images + "<div cgid='" + DR["CGID"].ToString() + "' class='swiper-slide posters'>" +
                                           "<div style=\"height:75px;\" class=\"items\"><img style=\"height:100%;\" src=\"/images/undraw_moving_forward_lhhd.svg\"/>" + textshow + "</div>" +
                                          "</div>";

                        }
                        string BannerSection = "<div style=\"background: #ddf0ff; margin-top:10px;border-radius:10px;\" class=\"container containers\"><div class=\"swiper-container\"><div class=\"swiper-wrapper\"><div class=\"swiper-slide\">" +
                                   "<div style=\"height:75px;\" class=\"items  \"> <img style=\"height:100%;\" src=\"/images/undraw_on_the_way_re_swjt.svg\"/><span style=\"position:absolute;text-align: center;top:12px;\">" + DeliveryCharges + "</span></div>" +
                                     "</div>" + Images +
                               "</div></div></div>";
                        Msgbox = BannerSection;
                    }

                }

                ShowDiv = "<div><span class=\"tag \">Your Cart</span> &nbsp;&nbsp;<span id = \"item_count\" item_count=" + qty + "> " + qty + " item(s)</span>" +
                      "<a href = \"../home.aspx\" ><span class=\"continue btnstyle \">Keep Shopping</span></a><br /><div class=\"row\">" +
                      "<div class=\"col-sm-8 col-md-8\"><div class=\"card p-2 mt-3\">" +
                      "<h6 class=\"ml-3\" style=\"font-size:.9rem\">Sub Total<span class=\"pull-right sub_total\">" + Convert.ToString(Convert.ToDecimal(ds.Tables[2].Rows[0]["TOTAL"].ToString()) + Convert.ToDecimal(ds.Tables[2].Rows[0]["TOTAL_DISCOUNT"].ToString())) + "</span></h6>" +
                      "<h6 class=\"ml-3\" style=\"font-size:.9rem\">Discount<span class=\"pull-right discount\">" + ds.Tables[2].Rows[0]["TOTAL_DISCOUNT"].ToString() + "</span></h6>" +
                      "<h6 class=\"ml-3\"style=\"font-size:.9rem\">Delivery Charges<span class=\"pull-right delvieryCharges\">" + DeliverAmount + "</span></h6>" +
                      "<h6 class=\"ml-3\"style=\"font-size:.9rem\">Total<span class=\"pull-right total_amount\">" + Convert.ToString((Convert.ToDecimal(total) + Convert.ToDecimal(DeliverAmount))) + "</span></h6>" +
                      "<hr class=\"m-0\" /><div class=\"row\"><div class=\"col-md-12 text-center\">" +
                      "<a href = \"javascript:void(0);\" header_id='" + ds.Tables[1].Rows[0]["Header_ID"].ToString() + "'  id=\"checkOut\" class=\"btn checkoutbtn btnstyle checkOut w-100\">Checkout now</a>" +
                      "</div></div><div class=\"card text-center p-2 stealclass " + stealClass + "\" style=\"background: #f7f7f7cc;border:none!important;\">" +
                       Minimum_Amount_steal_Deal +
                      " </div></div><div class=\"checkoutitems\" id=\"checkoutItems\" >" + Msgbox + Items +
                      "</div></div><div class=\"col-sm-4 col-md-4\">" +

                      "" + DeliverySection + AddressSection + datepickerbox + "<div class=\"row\"><div class=\"col-md-12 text-center\">" +
                      "<a href = \"javascript:void(0);\" header_id='" + ds.Tables[1].Rows[0]["Header_ID"].ToString() + "'  id=\"checkOut2\" class=\"btn checkoutbtn btnstyle checkOut w-100\">Checkout now</a>" +
                      "</div></div></div></div></div>";
            }
        }

        else
        {
            ShowDiv = "<div class=\"card mt-1\"><div class=\"row mb-2\"><div class=\"col-sm-8 col-md-8 text-center\">" +
                       "<label>  <img src=\"emptycart2.gif\" alt=\"cart empty\"/></label></div><div class=\"col-sm-4 col-md-4 text-center\">" +
                       "<a href = \"../home.aspx\" class=\"btn checkoutbtn btnstyle\">Continue Shopping</a></div></div></div>";
        }

        string Data = "<div class=\"container\">" + ShowDiv + "</div>";



        //categorysection.InnerHtml = "";
        //categorysection.InnerHtml = Data;
        return Data;
    }


    //[WebMethod]
    //public static string getMenuListdatatable()
    //{
    //    string result = string.Empty;
    //    DataSet ds = new DataSet();
    //    cl_resturant cr = new cl_resturant();
    //    cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
    //    cr.Type = 41;
    //    ds = cr.fnInsertData();
    //    string table = "";
    //    string table1 = "";
    //    string table2 = "";
    //    string table3 = "";
    //    string table4 = "";
    //    string table5 = "";
    //    string table6 = "";
    //    if (ds != null)
    //    {
    //        table = ds.Tables[0].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[0]) : "";
    //        table1 = ds.Tables[1].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[1]) : "";
    //        table2 = ds.Tables[2].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[2]) : "";
    //        table3 = ds.Tables[3].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[3]) : "";
    //        table4 = ds.Tables[4].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[4]) : "";
    //        table5 = ds.Tables[5].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[5]) : "";
    //        table6 = ds.Tables[6].Rows.Count > 0 ? cl_convertStringToJSON.DataTableToJSONWithStringBuilder(ds.Tables[6]) : "";
    //        result = table + "~" + table1 + "~" + table2 + "~" + table3
    //            + "~" + table4 + "~" + table5 + "~" + table6;
    //    }
    //    return result;
    //}

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
            //string changeStoreOption = "<a id=\"storechange\" class=\"_ChangeStore_btn text-center\" href=\"../Components/store\">Change Store</a>";
            //if (ds.Tables[1].Rows[0]["CHANGE_STORE_FLAG"].ToString() == "N")
            //{
            //    UserName_n_Pic.Visible = false;
            //}

            StoreName.InnerHtml = ds.Tables[1].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
                ds.Tables[1].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[1].Rows[0]["CITY"].ToString() +
                "</p>";

            active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\"> with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

        }
    }
    [WebMethod]
    public static string placeorderForCustomer(string Header_ID, string Address_ID, string Delivery_ID, string Prepaid_flag,
        string Other_Payment_flag, string OtherPaymentMethod, string Flag, string Instructions, string Email)
    {
        string DeliverBoyId = "";
        if (HttpContext.Current.Request.Cookies["deliveryparamid"] != null)
        {
            DeliverBoyId = HttpContext.Current.Request.Cookies["deliveryparamid"].Value.ToString();
        }
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Header_ID = Header_ID;
        cr.Type = 42;
        cr.Address_ID = Address_ID;
        cr.Delivery_ID = Delivery_ID;
        cr.PrePaid_Flag = Prepaid_flag;
        cr.Other_Payment_flag = Other_Payment_flag;
        cr.OtherPaymentMethod = OtherPaymentMethod;
        cr.Comment = Instructions;
        cr.Delivery_Boy_ID = DeliverBoyId;
        cr.Option_Name = Email;
        ds = cr.fnInsertData();
        string MSG = "N";
        string Order_No = "";
        string Trx_ID = "";
        if (ds != null)
        {

            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                MSG = "Y";
                Order_No = ds.Tables[0].Rows[0]["HeaderId"].ToString();
            }
            if (ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
            {

                Trx_ID = ds.Tables[1].Rows[0]["TRX_ID"].ToString();
            }
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[2].Rows.Count > 0)
            {
                if (OtherPaymentMethod == "COD")
                {
                    string Title = "Hey! you have got a new order (#" + Order_No + ")";
                    string Message = ds.Tables[3].Rows[0]["C_name"].ToString() + " - " + ds.Tables[3].Rows[0]["C_Number"].ToString() + " has placed an order of rs " + ds.Tables[3].Rows[0]["TOTAL"].ToString() + " for " + ds.Tables[3].Rows[0]["ITEM_COUNT"].ToString() + " items.";

                    if (Email != "")
                    {
                        using (MailMessage mm = new MailMessage(Email, Email))
                        {
                            string subj = "Notification for confirmation of order at " + ds.Tables[2].Rows[0]["NAME"].ToString();
                            mm.CC.Add(new MailAddress("puneet.naresh@gmail.com"));
                            mm.Subject = Title;
                            mm.Body = Message;
                            mm.IsBodyHtml = false;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Send(mm);
                        }
                    }
                    foreach (DataRow DR in ds.Tables[2].Rows)
                    {
                        insertNotification(HttpContext.Current.Request.Cookies["user_id"].Value.ToString(), DR["USER_ID"].ToString()
                        , Title, Message, "Retailer");

                        Send_Notification.SendNotificationFromFirebaseCloudBusiness(HttpContext.Current.Request.Cookies["rid"].Value.ToString(),
                            DR["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Admin_Delivery.aspx", Title, Message, 1);
                    }
                }
            }

        }
        return MSG + "|" + Order_No + "|" + "Done" + "|" + Trx_ID;
    }

    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.Receiver_User_ID = Receiver_User_ID;
        cr.Sender_User_ID = Sender_User_ID;
        cr.Sent_To = Sent_To;
        cr.Type = 103;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnInsertNotification();

        return "1";
    }

    [WebMethod]
    public static string PlaceOrder1(string Total)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 48;
        ds = cr.fnInsertData();
        string Payment_Box = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string Prepaid_Balance = "";
            if (ds.Tables[0].Rows[0]["CUST_PRE_BALANCE"].ToString() != "0" && Convert.ToDecimal(ds.Tables[0].Rows[0]["CUST_PRE_BALANCE"].ToString()) > 0)
            {
                decimal Remaning_Balance = Convert.ToDecimal(ds.Tables[0].Rows[0]["CUST_PRE_BALANCE"].ToString()) - Convert.ToDecimal(Total);
                if (Remaning_Balance >= 0)
                {

                }
                else
                {
                    Remaning_Balance = 0;
                }
                Prepaid_Balance = "<div class=\"col-sm-6\"><div class=\"custom-control custom-checkbox\" style=\"margin: 10px;\">" +
                                   "<input type = \"checkbox\" checked class=\"custom-control-input\" id=\"customCheck1\" />" +
                                   "<label class=\"custom-control-label m-0\" for=\"customCheck1\">Pay via " + ds.Tables[0].Rows[0]["NAME"].ToString() + " wallet balance<strong> Rs. " + ds.Tables[0].Rows[0]["CUST_PRE_BALANCE"].ToString() + "</strong></label></div></div>" +
                                   "<div class=\"col-sm-6 d-none\"><div class=\"float-right\" style = \"margin: 10px;\"> Remaining Balance<strong> Rs. " + Remaning_Balance + "</strong></div></div>";
            }
            string Payement_Option1 = "";
            if (ds.Tables[0].Rows[0]["PAYMENT_OPTION1"].ToString() != "")
            {
                Payement_Option1 = "<div class=\"col-sm-12\"><div class=\"custom-control custom-checkbox custom-control-inline\" style=\"margin: 10px;\">" +
                                   "<input type = \"checkbox\" id=\"customRadioInline1\" checked name=\"customRadioInline1\" class=\"custom-control-input\" />" +
                                   "<label class=\"custom-control-label m-0\" for=\"customRadioInline1\">" + ds.Tables[0].Rows[0]["PAYMENT_OPTION1"].ToString() + "</label></div></div>";
            }
            string Payement_Option2 = "";
            if (ds.Tables[0].Rows[0]["PAYMENT_OPTION2"].ToString() != "")
            {
                Payement_Option2 = "<div class=\"col-sm-12\"><div class=\"custom-control custom-checkbox custom-control-inline\" style=\"margin: 10px;\">" +
                                   "<input type = \"checkbox\" id=\"customRadioInline2\" name=\"customRadioInline1\" class=\"custom-control-input\" />" +
                                   "<label class=\"custom-control-label m-0\" for=\"customRadioInline2\">" + ds.Tables[0].Rows[0]["PAYMENT_OPTION2"].ToString() + "</label></div></div>";
            }
            string Payement_Option3 = "";
            if (ds.Tables[0].Rows[0]["PAYMENT_OPTION3"].ToString() != "")
            {
                Payement_Option3 = "<div class=\"col-sm-12\"><div class=\"custom-control custom-checkbox custom-control-inline\" style=\"margin: 10px;\">" +
                                   "<input type = \"checkbox\" id=\"customRadioInline3\" name=\"customRadioInline1\" class=\"custom-control-input\" />" +
                                   "<label class=\"custom-control-label m-0\" for=\"customRadioInline3\">" + ds.Tables[0].Rows[0]["PAYMENT_OPTION3"].ToString() + "</label></div></div>";
            }
            string Payement_Option4 = "";
            if (ds.Tables[0].Rows[0]["PAYMENT_OPTION4"].ToString() != "")
            {
                Payement_Option4 = "<div class=\"col-sm-12\"><div class=\"custom-control custom-checkbox custom-control-inline\" style=\"margin: 10px;\">" +
                                   "<input type = \"checkbox\" id=\"customRadioInline4\" name=\"customRadioInline1\" class=\"custom-control-input\" />" +
                                   "<label class=\"custom-control-label m-0\" for=\"customRadioInline4\">" + ds.Tables[0].Rows[0]["PAYMENT_OPTION4"].ToString() + "</label></div></div>";
            }

            Payment_Box = "<div class=\"container\"><div class=\"row\"><div class=\"col-sm-2 col-md-2\"><div class=\"checkoutitems\" id=\"paymentselection\"></div></div>" +
              "<div class=\"col-sm-8 col-md-8\"><div class=\"card p-2\"><h6 class=\"ml-3\">Pay for the order</h6><hr class=\"m-0\" /><br />" +
              "<div class=\"row\">" + Prepaid_Balance
                                    +
              "</div>" +
              "<div class=\"row\">" + Payement_Option1 + Payement_Option2 + Payement_Option3 + Payement_Option4
                                    +

              "</div>" +
                "<h6 class=\"ml-3 d-none\">Schedule order for</h6><div class=\"row d-none\"><div class=\"\" style=\"width:40%;padding-left: 15px;\">" +
                "<div class=\"custom-control custom-checkbox custom-control-inline\" style=\"margin: 10px;\">" +
                "<input type=\"checkbox\" id=\"customRadioInline3\" checked flag=\"1\" name=\"customRadioInline3\" class=\"custom-control-input\">" +
                "<label class=\"custom-control-label m-0\" for=\"customRadioInline3\">One time</label></div></div><div class=\"\"style=\"width:60%\">" +
                "<div class=\"custom-control custom-checkbox custom-control-inline\" style=\"margin: 10px;\">" +
                "<input type=\"checkbox\" id=\"customRadioInline4\" flag=\"2\" name=\"customRadioInline3\" class=\"custom-control-input\">" +
                "<label class=\"custom-control-label m-0\" for=\"customRadioInline4\">Daily</label></div></div></div>" +

            "<div class=\"row\"><div class=\"col-md-12 text-center\"><a href = \"javascript:void(0);\" class=\"btn checkoutbtn btnstyle w-100\" id=\"Final_Submit\">Proceed</a>" +
            "</div></div></div></div></div></div>";
        }
        return Payment_Box;
    }
    [WebMethod]
    public static string fngetDateSlots()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 61;
        ds = cr.fnInsertData();
        string Slots = "";
        string timeSlot = "";
        int i = 1;

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                if (i == 1)
                {
                    Slots = Slots + "<div class=\"day dayactive\"><span>" + DR["DAY_NAME"].ToString() + "</span><br/><span style=\"font-size: 10px;\">" + Convert.ToDateTime(DR["DATE"]).ToString("dd MMM") + "</span><div class=\" triangle triangle-4 indishow\" ></div></div>";
                }
                else
                {
                    Slots = Slots + "<div class=\" day\"><span>" + DR["DAY_NAME"].ToString() + "</span><br/><span style=\"font-size: 12px;\">" + Convert.ToDateTime(DR["DATE"]).ToString("dd MMM") + "</span><div class=\" triangle triangle-4\"></div></div>";
                }
                i++;
            }
        }
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
        {
            int j = 0;
            foreach (DataRow DR in ds.Tables[1].Rows)
            {
                if (j == 0)
                {
                    timeSlot = timeSlot + "<div bdid='" + DR["BDID"].ToString() + "' class=\"timing_checked timeslot timing\" ><span>" + DR["TIME_SLOT_START"].ToString() + " - " + DR["TIME_SLOT_END"].ToString() + "</span><a class=\"roundcircle\">" +
                        "<i style=\"margin-top:-5px;\" class=\" fa fa-check-circle fa-2x\"></i></a></div>";
                }
                else
                {
                    timeSlot = timeSlot + "<div bdid='" + DR["BDID"].ToString() + "' class=\" timeslot timing\" ><span>" + DR["TIME_SLOT_START"].ToString() + " - " + DR["TIME_SLOT_END"].ToString() + "</span><a class=\"roundcircle\">" +
                        "<i style=\"margin-top:-5px;\" class=\"d-none fa fa-check-circle fa-2x\"></i></a></div>";
                }
                j++;

            }

        }
        return Slots + "|" + timeSlot;
    }
    [WebMethod]
    public static string fngetTimeSlots(string dayName)
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 62;
        cr.Option_Name = dayName;
        ds = cr.fnInsertData();
        string timeSlot = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                timeSlot = timeSlot + "<div bdid='" + DR["BDID"].ToString() + "' class=\" timeslot timing\" ><span>" + DR["TIME_SLOT_START"].ToString() + " - " + DR["TIME_SLOT_END"].ToString() + "</span><a class=\"roundcircle\"><i style=\"margin-top:-5px;\" class=\"d-none fa fa-check-circle fa-2x\"></i></a></div>";
            }
        }
        return timeSlot;
    }

    [WebMethod]
    public static string CheckStatusForLogin()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cr.Type = 122;
        ds = cr.fngetTrxID();
        string Status = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Status = ds.Tables[0].Rows[0]["STATUS"].ToString();
        }
        return Status;
    }
}
