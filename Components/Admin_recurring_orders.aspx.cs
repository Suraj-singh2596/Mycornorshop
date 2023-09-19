using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Admin_recurring_orders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["records"] = "2";
    }



    [WebMethod]
    public static string Fn_getSchedulardata()
    {
        string resultdata = "";

        cl_resturant objRest = new cl_resturant();
        objRest.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();

        objRest.Type = 97;
        DataSet ds = new DataSet();
        ds = objRest.fnInsertData();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string SUN = "";
                string MON = "";
                string TUE = "";
                string WED = "";
                string THU = "";
                string FRI = "";
                string SAT = "";
                string pausebtns = "";
                string imagepath = "<img src=\"../Menu_Pics/Defaultimage.png\" />";
                string frequency = "";
                if (DR["SUN"].ToString() != "N")
                {
                    SUN = " <span class=\"daycss\">Sun-" + DR["SUN_QTY"].ToString() + "</span>";
                }
                if (DR["MON"].ToString() != "N")
                {
                    MON = "<span class=\"daycss\">Mon-" + DR["MON_QTY"].ToString() + "</span>";
                }
                if (DR["TUE"].ToString() != "N")
                {
                    TUE = "<span class=\"daycss\">Tue-" + DR["TUE_QTY"].ToString() + "</span>";

                }
                if (DR["WED"].ToString() != "N")
                {
                    WED = "<span class=\"daycss\">Wed-" + DR["WED_QTY"].ToString() + "</span>";
                }
                if (DR["THU"].ToString() != "N")
                {
                    THU = "<span class=\"daycss\">Thu-" + DR["THU_QTY"].ToString() + "</span>";
                }
                if (DR["FRI"].ToString() != "N")
                {
                    FRI = "<span class=\"daycss\">Fri-" + DR["FRI_QTY"].ToString() + "</span>";
                }
                if (DR["SAT"].ToString() != "N")
                {
                    SAT = "<span class=\"daycss\">Sat-" + DR["SAT_QTY"].ToString() + "</span>";
                }


                if (DR["IMAGE_PATH"].ToString() != "")
                {
                    imagepath = "<img src=\"../Menu_Pics/" + DR["IMAGE_PATH"].ToString() + "\" />";
                }

                if (DR["FREQUENCY"].ToString().ToUpper() == "W")
                {
                    frequency = "Weekly";
                }
                else if (DR["FREQUENCY"].ToString().ToUpper() == "2W")
                {
                    frequency = "Once in 2 weeks";
                }
                else
                {
                    frequency = "Once in a month";
                }

                resultdata = resultdata + "<div class=\"recurring_box m-2\"><div class=\"subscription_detail border-bottom p-2\">" +
                                                 "<span class=\"title_subscription\">" + DR["CUST_NAME"].ToString() + " - " + DR["CUST_MOBILE"].ToString() + "</span>&nbsp;&nbsp;<span class=\"freq_subs pull-right\">" + frequency + "</span> " +
                                                 "</div><div class=\"stealdeal p-2\"><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\">" +
                                                 "" + imagepath + "</div></div><div class=\"col-8\"><div class=\"itemdetails\">" +
                                                 "<div class=\"itemprice\">₹ <strike>" + DR["ACTUAL_PRICE"].ToString() + "</strike><span style=\"font-weight: bold;\">&nbsp; " + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "</span></div>" +
                                                 "<div class=\"itemname\">" + DR["MNAME"].ToString() + "</div>" +
                                                 "<div class=\"itemqty text-justify row p-2\" style=\" \">" + SUN + "   " + MON + "   " + TUE + "   " + WED + "  " + THU + "   " + FRI + " " + SAT + "</div></div></div></div></div><div class=\"subscription_actions border-top p-2 text-center\">" +
                                                 "<div class=\"row\">" +
                                                 // "<div class=\"col-4 p-0\"><a class=\"d-none modify_subscription\" line_id=" + DR["LINE_ID"].ToString() + "><i class=\"fa fa-calendar\"></i>&nbsp;MODIFY</a></div>" +
                                                 "<div class=\"col-6 d-none p-0\"><a class=\" delete_subscription\" line_id=" + DR["LINE_ID"].ToString() + "><i class=\"fa fa-trash\" aria-hidden=\"true\"></i>&nbsp;DELETE</a></div>" +
                                                 "<div class=\"col-12 p-0\"><a class=\"d-none pause_subscription " + Convert.ToString(DR["IS_PAUSED"].ToString() != "Y" ? "" : "d-none") + "\" line_id=" + DR["LINE_ID"].ToString() + "><i class=\"fa fa-pause\"></i>&nbsp;PAUSE</a>" +
                                                 "<a class=\"\" title=\"Start date\" line_id=" + DR["LINE_ID"].ToString() + ">Start from : " + Convert.ToDateTime(DR["START_DATE"].ToString()).ToString("dd-MMM-yyy") + "</a></div></div></div></div>";

            }

        }
        return resultdata;
    }

    [WebMethod]
    public static string Fn_getSchedulardataNextItems()
    {
        string resultdata = "";
        if (HttpContext.Current.Session["records"].ToString() != "-1")
        {
            cl_resturant objRest = new cl_resturant();
            objRest.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            objRest.OID = HttpContext.Current.Session["records"].ToString();
            objRest.Type = 112;
            DataSet ds = new DataSet();
            ds = objRest.fnInsertData();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow DR in ds.Tables[0].Rows)
                {
                    string SUN = "";
                    string MON = "";
                    string TUE = "";
                    string WED = "";
                    string THU = "";
                    string FRI = "";
                    string SAT = "";
                    string pausebtns = "";
                    string imagepath = "<img src=\"../Menu_Pics/Defaultimage.png\" />";
                    string frequency = "";
                    if (DR["SUN"].ToString() != "N")
                    {
                        SUN = " <span class=\"daycss\">Sun-" + DR["SUN_QTY"].ToString() + "</span>";
                    }
                    if (DR["MON"].ToString() != "N")
                    {
                        MON = "<span class=\"daycss\">Mon-" + DR["MON_QTY"].ToString() + "</span>";
                    }
                    if (DR["TUE"].ToString() != "N")
                    {
                        TUE = "<span class=\"daycss\">Tue-" + DR["TUE_QTY"].ToString() + "</span>";

                    }
                    if (DR["WED"].ToString() != "N")
                    {
                        WED = "<span class=\"daycss\">Wed-" + DR["WED_QTY"].ToString() + "</span>";
                    }
                    if (DR["THU"].ToString() != "N")
                    {
                        THU = "<span class=\"daycss\">Thu-" + DR["THU_QTY"].ToString() + "</span>";
                    }
                    if (DR["FRI"].ToString() != "N")
                    {
                        FRI = "<span class=\"daycss\">Fri-" + DR["FRI_QTY"].ToString() + "</span>";
                    }
                    if (DR["SAT"].ToString() != "N")
                    {
                        SAT = "<span class=\"daycss\">Sat-" + DR["SAT_QTY"].ToString() + "</span>";
                    }


                    if (DR["IMAGE_PATH"].ToString() != "")
                    {
                        imagepath = "<img src=\"../Menu_Pics/" + DR["IMAGE_PATH"].ToString() + "\" />";
                    }

                    if (DR["FREQUENCY"].ToString().ToUpper() == "W")
                    {
                        frequency = "Weekly";
                    }
                    else if (DR["FREQUENCY"].ToString().ToUpper() == "2W")
                    {
                        frequency = "Once in 2 weeks";
                    }
                    else
                    {
                        frequency = "Once in a month";
                    }

                    resultdata = resultdata + "<div class=\"recurring_box m-2\"><div class=\"subscription_detail border-bottom p-2\">" +
                                                     "<span class=\"title_subscription\">" + DR["CUST_NAME"].ToString() + " - " + DR["CUST_MOBILE"].ToString() + "</span>&nbsp;&nbsp;<span class=\"freq_subs pull-right\">" + frequency + "</span> " +
                                                     "</div><div class=\"stealdeal p-2\"><div class=\"row\"><div class=\"col-4\"><div class=\"productpic\">" +
                                                     "" + imagepath + "</div></div><div class=\"col-8\"><div class=\"itemdetails\">" +
                                                     "<div class=\"itemprice\">₹ <strike>" + DR["ACTUAL_PRICE"].ToString() + "</strike><span style=\"font-weight: bold;\">&nbsp; " + Convert.ToString(Convert.ToDecimal(DR["PRICE"].ToString()) + Convert.ToDecimal(DR["GST_AMOUNT"].ToString())) + "</span></div>" +
                                                     "<div class=\"itemname\">" + DR["MNAME"].ToString() + "</div>" +
                                                     "<div class=\"itemqty text-justify row p-2\" style=\" \">" + SUN + "   " + MON + "   " + TUE + "   " + WED + "  " + THU + "   " + FRI + " " + SAT + "</div></div></div></div></div><div class=\"subscription_actions border-top p-2 text-center\">" +
                                                     "<div class=\"row\">" +
                                                     // "<div class=\"col-4 p-0\"><a class=\"d-none modify_subscription\" line_id=" + DR["LINE_ID"].ToString() + "><i class=\"fa fa-calendar\"></i>&nbsp;MODIFY</a></div>" +
                                                     "<div class=\"col-6 d-none p-0\"><a class=\" delete_subscription\" line_id=" + DR["LINE_ID"].ToString() + "><i class=\"fa fa-trash\" aria-hidden=\"true\"></i>&nbsp;DELETE</a></div>" +
                                                     "<div class=\"col-12 p-0\"><a class=\"d-none pause_subscription " + Convert.ToString(DR["IS_PAUSED"].ToString() != "Y" ? "" : "d-none") + "\" line_id=" + DR["LINE_ID"].ToString() + "><i class=\"fa fa-pause\"></i>&nbsp;PAUSE</a>" +
                                                     "<a class=\"\" title=\"Start date\" line_id=" + DR["LINE_ID"].ToString() + ">Start from : " + Convert.ToDateTime(DR["START_DATE"].ToString()).ToString("dd-MMM-yyy") + "</a></div></div></div></div>";

                }
                HttpContext.Current.Session["records"] = Convert.ToString(Convert.ToInt32(HttpContext.Current.Session["records"]) + 1);
            }
            else
            {
                HttpContext.Current.Session["records"] = "-1";
            }
        }
        return resultdata;
    }


    [WebMethod]

    public static string Fn_Deletesubscription(string Line_id, string Flag)
    {
        cl_resturant objRest = new cl_resturant();
        objRest.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();

        objRest.Type = 98;
        objRest.Flag = Flag;
        objRest.Header_ID = Line_id;
        DataSet ds = new DataSet();
        ds = objRest.fnInsertData();
        return "1";
    }
    [WebMethod]

    public static string EditItem(string Line_id)
    {
        cl_resturant objRest = new cl_resturant();
        objRest.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        objRest.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        objRest.Type = 94;
        objRest.Header_ID = Line_id;
        DataSet ds = new DataSet();
        ds = objRest.fnInsertData();
        string modal = "";
        string imagepath = "<img src=\"../Menu_Pics/Defaultimage.png\" />";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            if (ds.Tables[0].Rows[0]["IMAGE_PATH"].ToString() != "")
            {
                imagepath = "<img src=\"../Menu_Pics/" + ds.Tables[0].Rows[0]["IMAGE_PATH"].ToString() + "\" />";
            }

            modal = "<div class=\"md-content\"><div class=\"title w-100 text-center\"></div>" +
            "<div class=\"w-100 mt-5 ml-3\"><a class=\"md-close\" style=\"\"><i class=\"fa fa-times\"></i></a></div>" +
             "<div class=\"itmbox_details m-2\" style=\"padding-top: 30px;\">" +
            "<div class=\"itemcard select-items unselected\" style=\"box-shadow: none;\"><div class=\"row\"><div class=\"imagesection\" style=\"width: 30%; text-align: center;\">" +
            "<div class=\"row\"><div style=\"width: 100%;\"><div class=\"img_btn_box\"><div class=\"food_pic\">" +
            imagepath +
            "</div></div></div></div></div><div class=\"detailsection\" style=\"width: 70%; font-size: 12px;\">" +
            "<span class=\"itm-amt\" amount=\"100\"><i class=\"fa fa-inr\" aria-hidden=\"true\" style=\"font-weight: 100;\"></i><strike style=\"font-weight: 100;\">" + Convert.ToString(Convert.ToDecimal(ds.Tables[0].Rows[0]["PRICE"].ToString()) + Convert.ToDecimal(ds.Tables[0].Rows[0]["GST_AMOUNT"].ToString())) + "</strike>&nbsp;" +
            "<span style=\"font-weight: bold;\">" + ds.Tables[0].Rows[0]["ACTUAL_PRICE"].ToString() + "</span>" +
            "<div style=\"width: 90%;\"><a class=\"itm-name text-dark\">" + ds.Tables[0].Rows[0]["MNAME"].ToString() + "</a><p style=\"font-size: 10px; margin-bottom: 0px;\"></p>" +
            "</div></span></div></div></div></div><div class=\"container\"><div class=\"row\"><div class=\"col-4 pr-0\"><div style=\"font-size: 12px; font-weight: bold;\">" +
            "SET FREQUENCY</div></div><div class=\"col-8 pl-0\"><div style=\"border-bottom: 1px solid lightgrey; font-size: 12px;\"><span style=\"visibility: hidden\">SET FREQUENCY</span>" +
            "</div></div></div><div class=\"frequency__Box m-3\"><div class=\"row\"><div class=\"frequency__selected freq\" freq=\"w\">Weekly</div><div class=\"frequency freq d-none\" freq=\"2w\">Once in 2 weeks</div>" +
            "<div class=\"frequency freq d-none\" freq=\"1m\">Once in a month</div></div></div><div class=\"row\"><div class=\"col-4 pr-0\"><div style=\"font-size: 12px; font-weight: bold;\">" +
            "SET QUANTITY</div></div><div class=\"col-8 pl-0\"><div style=\"border-bottom: 1px solid lightgrey; font-size: 12px;\"><span style=\"visibility: hidden\">SET QUANTITY</span>" +
            "</div></div></div><div class=\"container quantity__Box\"><div class=\"row\" style=\"object-fit: contain; overflow: auto;\">" +
            "<div class=\"weeks__qty\"><div class=\"week_name\">MON</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues mon\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["MON_QTY"].ToString() + "\"/>" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">TUE</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues tue\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["TUE_QTY"].ToString() + "\" /></div>" +
            "<div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\"><div class=\"week_name\">WED</div>" +
            "<div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div><div>" +
            "<input type=\"number\" readonly class=\"qtyvalues wed\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["WED_QTY"].ToString() + "\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">THU</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues thu\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["THU_QTY"].ToString() + "\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">FRI</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues fri\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["FRI_QTY"].ToString() + "\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">SAT</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues sat\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["SAT_QTY"].ToString() + "\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div><div class=\"weeks__qty\">" +
            "<div class=\"week_name\">SUN</div><div class=\"Qty_selector text-center\"><div><span class=\"qty_minus\"><i class=\"fa fa-minus\"></i></span></div>" +
            "<div><input type=\"number\" readonly class=\"qtyvalues sun\" style=\"width: 23px; border: none; text-align: center;\" value=\"" + ds.Tables[0].Rows[0]["SUN_QTY"].ToString() + "\" />" +
            "</div><div><span class=\"qty_plus\"><i class=\"fa fa-plus\"></i></span></div></div></div></div></div><div class=\"row\">" +
            "<div class=\"col-5 pr-0\"><div style=\"font-size: 12px; font-weight: bold;\">SET STARTING DATE</div></div><div class=\"col-7 pl-0\">" +
            "<div style=\"border-bottom: 1px solid lightgrey; font-size: 12px;\"><span style=\"visibility: hidden\">SET QUANTITY</span>" +
            "</div></div></div><div class=\"select_dateBox\"><div class=\"row\"><div class=\"col-12\"><div  class=\"input-group date\" >" +
            "<input id=\"datepicker\" data-date-format=\"dd-M-yyyy\" value='" + Convert.ToDateTime(ds.Tables[0].Rows[0]["START_DATE"]).ToString("dd-M-yyyy") + "' class=\"form-control\" type=\"text\" readonly /><span class=\"input-group-addon\"><i class=\"glyphicon glyphicon-calendar\"></i></span>" +
            "</div></div></div></div><div class=\"submit_buttonBo5\"><div class=\"row\"><div class=\"col-12\">" +
            "<button type=\"button\" id=\"setRecurring\" class=\"btn btnstyle w-100 text-center mt-4\">Set Recurring order</button></div></div></div></div></div>";
        }
        return modal;
    }
}