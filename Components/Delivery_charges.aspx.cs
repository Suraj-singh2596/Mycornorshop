using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Delivery_charges : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]

    public static string GetDeliveryDetails(string flag)
    {
        string HD = "Unavailable";
        string DA = "No";
        string dataTable = "";
        Cl_admin d = new Cl_admin();
        d.Type = 68;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = d.fn_Updatedasboarddata();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            if (flag=="L")
            {
                if (ds.Tables[0].Rows[0]["HOME_DELIVERY"].ToString()=="Y")
                {
                    HD = "Available";
                }
                if (ds.Tables[0].Rows[0]["DELIVERY_CHARGES_ALWAYS"].ToString()=="Y")
                {
                    DA = "Yes";

                }
                
                                         
                                         
                                          


               dataTable = "<div class=\"container\"><div class=\"daysnames row\">" +
                                        "<div class=\"dayname\" style=\"padding-left: 25px;width:60%; \">Home delivery</div><div style=\"width:40%;\"><strong>" + HD + "</strong></div>" +
                                           "</div>" +
                                           "<div class=\"daysnames row\">" +
                                        "<div class=\"dayname\" style=\"padding-left: 25px;width:60%; \">Delivery radius </div><div style=\"width:40%;\"><strong>" + ds.Tables[0].Rows[0]["DELIVERY_RADIUS"].ToString() + " m </strong></div>" +
                                           "</div>" +
                                           "<div class=\"daysnames row\">" +
                                        "<div class=\"dayname\" style=\"padding-left: 25px;width:60%; \">Min delivery amt. </div><div style=\"width:40%;\"><strong>Rs. " + ds.Tables[0].Rows[0]["MINIMUM_AMOUNT"].ToString() + " </strong></div>" +
                                           "</div>" +
                                           "<div class=\"daysnames row\">" +
                                        "<div class=\"dayname\" style=\"padding-left: 25px;width:60%; \">Delivery charge </div><div style=\"width:40%;\"><strong>Rs. " + ds.Tables[0].Rows[0]["DELIVERY_CHARGES"].ToString() + " </strong></div>" +
                                           "</div>" +
                                        //   "<div class=\"daysnames row\">" +
                                        //"<div class=\"dayname\" style=\"padding-left: 25px; width:60%; \">Always delivery charge</div><div style=\"width:40%;\"><strong>" + DA + "</strong></div>" +
                                        //   "</div>" +
                                           "</div>";
            }
            else
            {
                string option = "";
                string option2 = "";
                if (ds.Tables[0].Rows[0]["HOME_DELIVERY"].ToString() == "Y")
                {
                    option = "<option value=\"Y\">Available</option><option value=\"N\">Unavailable</option>";
                }
                else
                {
                    option = "<option value=\"N\">Unavailable</option><option value=\"Y\">Available</option>";
                }

                if (ds.Tables[0].Rows[0]["HOME_DELIVERY"].ToString() == "Y")
                {
                    option2 = " <option value=\"Y\">Yes</option><option value=\"N\">No</option>";
                }
                else
                {
                    option2 = " <option value=\"N\">No</option><option value=\"Y\">Yes</option>";
                }

                dataTable = "<div class=\"modal-dialog\"><div class=\"modal-content\"><div class=\"modal-header\"><h4 class=\"modal-title\" id=\"myModalLabel\"> Delivery Charges</h4>"+
                                "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button></div><div class=\"modal-body\">" +
                                "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"Name\" class=\"control-label\">Delivery Available <sup></sup>"+
                                "</label><Select id=\"DelievryYes\" class=\"form-control\">"+option+"</Select>"+
                                "  </div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"Name\" class=\"control-label\">Delivery Radius <sup>in meters</sup>"+
                                "</label><input type=\"text\" required id=\"Radius\" value='" + ds.Tables[0].Rows[0]["DELIVERY_RADIUS"].ToString() + "' class=\"form-control\" /></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                                "<label for=\"Name\" class=\"control-label\">Minimum amount for delivery</label><input type=\"text\" value='"+ ds.Tables[0].Rows[0]["MINIMUM_AMOUNT"].ToString() + "' required id=\"Minimumamt\" class=\"form-control\" />"+
                                "</div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\"><label for=\"Name\" class=\"control-label\">Delivery Charge  "+
                                "</label><input type=\"text\" value='"+ ds.Tables[0].Rows[0]["DELIVERY_CHARGES"].ToString() + "' required id=\"Charge\" class=\"form-control\" /></div><div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                "<label for=\"Name\" class=\"control-label\">Delivery Charge always</label><Select id=\"Delievryalways\" class=\"form-control\">"+ option2 + "</Select>"+
                                "</div></div><div class=\"modal-footer\"><button type=\"button\" class=\"btn  \" data-dismiss=\"modal\" style=\"background: #787878; color: white;\">Cancel</button>"+
                                "<button id=\"finalsubmit\" type=\"button\" class=\"btn  btn-primary\">Submit</button></div></div></div>";
            }
             
        }
            return dataTable;
    }


    [WebMethod]

    public static string updatedeliverycharge(string deliveryA, string deliveryradius, 
        string amount, string charge, string Delievryalways)
    {
        Cl_admin d = new Cl_admin();
        d.Type = 67;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        d.HOME_DELIVERY = deliveryA;
        d.DELIVERY_RADIUS = deliveryradius;
        d.MINIMUM_AMOUNT = amount;
        d.DELIVERY_CHARGES = charge;
        d.DELIVERY_CHARGES_ALWAYS = Delievryalways;
        DataSet ds = d.fn_Updatedchages();
        return "Y";
    }
}