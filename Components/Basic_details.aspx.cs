using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Basic_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]

    public static string basicdetails()
    {
        string data = "";
        string name = "";
        Cl_admin d = new Cl_admin();
        d.Type = 69;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = d.fn_Updatedasboarddata();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
             {

            if (ds.Tables[0].Rows[0]["CONTACT_PERSON"].ToString()=="")
            {
                name = "MyCornerShop User";

            }
            else
            {
                name = ds.Tables[0].Rows[0]["CONTACT_PERSON"].ToString();
            }

                             data = "<form action=\"#\">"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                    "<label for=\"Name\" class=\"control-label\">"+
                                    "Name<sup>*</sup>"+
                                    "</label>"+
                                    "<input type = \"text\" required id = \"Name\" value='"+ name + "' class=\"form-control\" />"+
                                    "</div>"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                    "<label for=\"Name\" class=\"control-label\">"+
                                    "Business Name<sup>*</sup>"+
                                    "</label>"+
                                    "<input type = \"text\" required id = \"Business\" value='" + ds.Tables[0].Rows[0]["NAME"].ToString() + "' class=\"form-control\" />" +
                                    "</div>"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                    "<label for=\"business_category\" class=\"control-label\">"+
                                    "Business Category"+
                                    "</label>"+
                                    "<input type = \"text\" required id = \"category\" value='" + ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString() + "' class=\"form-control\" />" +
                                    "</div>"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                    "<label for=\"Mobile\" class=\"control-label\">"+
                                    "Mobile<sup>*</sup>"+
                                    "</label>"+
                                    "<input type = \"text\" required id = \"Mobile\" value='" + ds.Tables[0].Rows[0]["RESTAURANT_NUMBER"].ToString() + "' class=\"form-control\" />" +
                                    "</div>"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                    "<label for=\"City\" class=\"control-label\">"+
                                    "City<sup>*</sup>"+
                                    "</label>"+
                                    "<input type = \"text\" required id = \"City\" value='" + ds.Tables[0].Rows[0]["CITY"].ToString() + "' class=\"form-control\" />" +
                                    "</div>"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">"+
                                    "<label for=\"Pincode\" class=\"control-label\">"+
                                    " Pincode<sup>*</sup>"+
                                    "</label>"+
                                    "<input type = \"text\" required id = \"Pincode\" value='" + ds.Tables[0].Rows[0]["PINCODE"].ToString() + "' class=\"form-control\" />" +
                                    "</div>"+
                                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label\">" +
                                    "<label for=\"Address\" class=\"control-label\">" +
                                    "Address<sup>*</sup>" +
                                    "</label>" +
                                    "<textarea type = \"text\" required id = \"Address\"   class=\"form-control\">" + ds.Tables[0].Rows[0]["ADDRESS"].ToString() + "</textarea>" +
                                    "</div>" +
                                    "<div class=\"text-xs-left\">" +
                                    " <button id = \"Submitdetails\" type=\"button\" class=\"btn btnstyle w-100 m-0\">Submit</button></div></form>";

        }
        return data;
    }

    [WebMethod]

    public static string UpdatebasicDetails(string name, string businessname, string category, string mobile,
        string city, string pincode, string address)
    {
        Cl_admin d = new Cl_admin();
        d.Type = 70;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        d.CONTACT_PERSON = name;
        d.NAME = businessname;
        d.BUSINESS_CATEGORY = category;
        d.RESTAURANT_NUMBER = mobile;
        d.CITY = city;
        d.PINCODE = pincode;
        d.ADDRESS = address;
        DataSet ds = d.fn_Updatedchages();
        return "Y";

    }


}