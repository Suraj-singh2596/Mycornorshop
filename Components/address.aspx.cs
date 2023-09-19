using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_address : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //getCustomerDetails();
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
                Address = Address + "<div class=\"col-xl-3 col-md-6 mt-4 \"><div class=\"card border-left-primary shadow h-100 py-2\">" +
                     "<div class=\"card-body\">" +
                     "<div class=\"row pt-2 pb-2\">" +
                     "<div class=\"col-12\"><i add_id='" + DR["CUST_ADD_ID"].ToString() + "' style=\"float: right; margin-top: -30px; margin-right: -15px;font-size: 25px;\" class=\"fa fa-pencil editaddress_btn\"></i></div>" +
                    "<div class=\"col-12\"><i class=\"fa fa-user\"></i> <span style=\"font-size: 20px;color: #7c7c7c;font-weight:bold;\">" + DR["CUST_NAME"].ToString() + " </span></div>" +
                    "<div class=\"col-12\"><i class=\"fa fa-phone\"></i> <span>" + DR["CUST_MOBILE"].ToString() + "</span></div>" +
                    "</div><hr/>" +
                                   "<div class=\"row no-gutters align-items-center\"><div class=\"col mr-2\">" +
                                   "<i class=\"defaultaddress fa " + fa_Heart + "\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' aria-hidden=\"true\" style=\"float: right; margin-top: -78px; margin-right: -15px;font-size: 25px;\"></i>" +
                                   "<div>" + DR["ADDRESS"].ToString() + "," + DR["LOCATION"].ToString() + "," + DR["ADDRESS_1"].ToString() + " , " +
                                   DR["CITY"].ToString() + "," + DR["LANDMARK"].ToString() + " , " + DR["STATE"].ToString() + " , " + DR["PINCODE"].ToString() + "<hr/> <div class=\"addressoptions\" style=\"margin-top: 5px;\">" +
                                   "<form>" +
                                   "<label class=\"radio-inline\"><input type=\"radio\" flag=\"1\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' name=\"optradio\" " + checked_radio1 + "> Home</label>&nbsp;&nbsp;" +
                                   "<label class=\"radio-inline\"><input type=\"radio\" flag=\"2\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' name=\"optradio\" " + checked_radio2 + "> Office</label>&nbsp;&nbsp;" +
                                   "<label class=\"radio-inline\"><input type=\"radio\" flag=\"3\" add_id='" + DR["CUST_ADD_ID"].ToString() + "' name=\"optradio\" " + checked_radio3 + "> Other</label>" +
                                   "</form></div></div></div></div></div></div></div>";
            }

        }



        return Address;
    }

    [WebMethod]
    public static string updateDefaultAddress(string Address_ID)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 5;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.ADDRESS_ID = Address_ID;
        cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ds = cc.fnGetAddress();
        return "1";
    }

    [WebMethod]
    public static string updateAddressType(string Address_ID, string Flag)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 6;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.ADDRESS_ID = Address_ID;
        cc.Flag = Flag;
        ds = cc.fnGetAddress();
        return "1";
    }

    [WebMethod]

    public static string fnInsertAddress(string Name, string Mobile, string Address, string Location, string Area, string City, string State, string Pincode, string Landmark)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 3;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.Address = Address;
        cc.Location = Location + "<br/>" + Area;
        cc.City = City;
        cc.State = State;
        cc.Pincode = Pincode;
        cc.Landmark = Landmark;
        cc.NAME = Name;
        cc.MOBILE = Mobile;
        ds = cc.fnInsertAddress();
        return "1";
    }




    //public void getCustomerDetails()
    //{
    //    Cl_Customer cc = new Cl_Customer();
    //    DataSet ds = new DataSet();
    //    cc.Type = 7;
    //    cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
    //    cc.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
    //    ds = cc.fnGetAddress();
    //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
    //    {
    //        //string changeStoreOption = "<a id=\"storechange\" class=\"_ChangeStore_btn\" href=\"../Components/store\">Change Store</a>";
    //        //if (ds.Tables[1].Rows[0]["CHANGE_STORE_FLAG"].ToString() == "N")
    //        //{
    //        //    StoreName.Visible =false;
    //        //}

    //        //StoreName.InnerHtml = ds.Tables[1].Rows[0]["NAME"].ToString() + "<p style=\"font-size:14px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
    //        //    ds.Tables[1].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[1].Rows[0]["CITY"].ToString() +
    //        //    "</p>";
    //        //active_bal.InnerHtml = "<span>Your Balance</span><br> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();
    //        //UserName_n_Pic.InnerHtml = ds.Tables[0].Rows[0]["TITLE"].ToString() + " " + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " " + ds.Tables[0].Rows[0]["LAST_NAME"].ToString() + "&nbsp;<i class=\"fa fa-user-circle-o fa-2x\"></i> ";
    //        //active_balance.InnerHtml = "<span style=\"font-size: 18px; font-weight: 100;\">Active Balance: <strong>&#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString() + "</strong></span>";
    //        active_bal.InnerHtml = "<span>WALLET BALANCE</span><span style=\"font-size:10px;\"> with </span><p style=\"font-size:11px;margin-bottom:0px;\">" + ds.Tables[1].Rows[0]["NAME"].ToString() + "</p> &#8377 " + ds.Tables[0].Rows[0]["PREPAID_PAID_BALANCE"].ToString();

    //    }
    //}


    [WebMethod]

    public static string fnUpdateaddress(string custaddid)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.Type = 8;
        cc.ADDRESS_ID = custaddid;
        string modalbody = "";
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        ds = cc.fnGetAddress();
        string Address = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            modalbody = "<div class=\"modal-dialog\" role=\"document\"><div class=\"modal-content\"><div class=\"modal-header\"><h5 class=\"modal-title\" id=\"\">Update Address</h5><button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>" +
            "<div class=\"modal-body\"><div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
            "<label for=\"username\" class=\"control-label\"> Name </label>" +
            "<input type=\"text\" id=\"usernames\" value='" + ds.Tables[0].Rows[0]["CUST_NAME"].ToString() + "'  class=\"form-control\" /></div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    " <label for=\"usermobile\" class=\"control-label\">Mobile</label>" +
                    "<input type=\"text\" id=\"usermobiles\"  value='" + ds.Tables[0].Rows[0]["CUST_MOBILE"].ToString() + "' class=\"form-control\" /></div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    "<label for=\"regular1\" class=\"control-label\"> Address / Flat no.</label>" +
                    "<input type=\"text\" id=\"Addresss\" value='" + ds.Tables[0].Rows[0]["ADDRESS"].ToString().Replace("<br/>", " ") + "' class=\"form-control\" /></div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    "<label for=\"regular1\" class=\"control-label\"> Tower no / Location </label>" +
                    "<input type=\"text\" value='" + ds.Tables[0].Rows[0]["LOCATION"].ToString().Replace("<br/>", " ") + "' id=\"etowerno\" class=\"form-control\"> </div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\"> " +
                    "<label for=\"regular1\" class=\"control-label\"> Building Name / Sector  </label>" +
                    "<input type=\"text\" id=\"buildingnames\" value='" + ds.Tables[0].Rows[0]["LANDMARK"].ToString().Replace("<br/>", " ") + "' class=\"form-control\"> </div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    "<label for=\"regular1\" class=\"control-label\"> City </label> " +
                    "<input id=\"Citys\" class=\"form-control\" value='" + ds.Tables[0].Rows[0]["CITY"].ToString() + "' type=\"text\" /> </div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    " <label for=\"regular1\" class=\"control-label\">   State </label>" +
                    "<input id=\"states\" type=\"text\" value='" + ds.Tables[0].Rows[0]["STATE"].ToString() + "' class=\"form-control\" /> </div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    " <label for=\"regular1\" class=\"control-label\"> Pincode </label>" +
                    "<input type=\"number\" id=\"pincodes\" value='" + ds.Tables[0].Rows[0]["PINCODE"].ToString() + "' class=\"form-control\"></div>" +
                    "<div class=\"form-group pmd-textfield pmd-textfield-floating-label pmd-textfield-floating-label-completed\">" +
                    "<label for=\"regular1\" class=\"control-label\"> Near By Landmark </label>" +
                    "<input id=\"Landmarks\" value='" + ds.Tables[0].Rows[0]["ADDRESS_1"].ToString() + "' class=\"form-control\" type=\"text\" /> </div>" +
                    "<div class=\"row\"> <div class=\"col-6\"> <button class=\"btn btn-secondary w-100 btnstyle\" type=\"button\" data-dismiss=\"modal\">Cancel</button>" +
                    "</div> <div class=\"col-6\"><a class=\"btn btn-primary w-100 btnstyle\" address_id='" + ds.Tables[0].Rows[0]["CUST_ADD_ID"].ToString() + "' id=\"UpdateAddress\" href=\"javascript:void(0);\">Update</a></div> </div> </div>" +

                    " </div>" +
                    "</div>";
            Address = modalbody;

        }
        return Address;
    }


    [WebMethod]

    public static string fnUpdatedaddress(string add_id, string Name, string mobile, string addressflat,
        string buildingname, string city, string state, string pincode, string nearby, string tower)
    {
        Cl_Customer cc = new Cl_Customer();
        DataSet ds = new DataSet();
        cc.NAME = Name;
        cc.MOBILE = mobile;
        cc.Type = 9;
        cc.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
        cc.ADDRESS_ID = add_id;
        cc.Address = addressflat;
        cc.Location = tower;
        cc.ADDRESS_1 = nearby;
        cc.City = city;
        cc.State = state;
        cc.Pincode = pincode;
        cc.Landmark = buildingname;
        ds = cc.fnInsertAddress();
        return "1";
    }
}

