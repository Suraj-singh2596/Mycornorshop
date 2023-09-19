using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_admin_dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count >= 1 && !string.IsNullOrEmpty(Request.Params["rid"]) && !string.IsNullOrEmpty(Request.Params["ulid"]))
        {
            string User_ID = Cl_admin.Decrypt(Request.QueryString["ulid"].ToString());
            string RetailerID = Cl_admin.Decrypt(Request.QueryString["rid"].ToString());

            HttpCookie Cookie = new HttpCookie("admin_user_id");
            Cookie.Value = User_ID;
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            HttpCookie aCookie = new HttpCookie("rid");
            aCookie.Value = RetailerID;
            aCookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(aCookie);

        }
        HttpCookie user_type = new HttpCookie("user_type");
        user_type.Value = "retailer";
        user_type.Expires = DateTime.Now.AddDays(365);
        HttpContext.Current.Response.Cookies.Add(user_type);

        if (HttpContext.Current.Request.Cookies["admin_user_id"] != null)
        {
            GetNotification_count();
        }

        getAdminDetails();
    }

    public void getAdminDetails()
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.Type = 25;
        ds = ca.fn_admin_Data();
        if (ds != null && ds.Tables.Count > 0)
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = ds.Tables[0].Rows[0]["BUSINESS_CATEGORY"].ToString();
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);

            addsalesbtn.Attributes.Add("onclick", ds.Tables[0].Rows[0]["SALES_TEMPLATE"].ToString().Trim() == "1" ? "window.location.href='../Components/Add_Sales_New.aspx';" : "window.location.href='../Components/Purchase.aspx';");

            StoreName.InnerHtml = ds.Tables[0].Rows[0]["NAME"].ToString() + "<p style=\"font-size:12px;color:#e6e6e6;text-align: left;margin-bottom: 0px;font-weight: 400;\">" +
              ds.Tables[0].Rows[0]["LOCATION"].ToString() + " " + ds.Tables[0].Rows[0]["CITY"].ToString() +
              "</p>";


            if (ds.Tables[2].Rows.Count > 0)
            {
                if (ds.Tables[2].Rows[0]["ORDERS"].ToString().ToLower() == "n")
                {
                    TotalOrders.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["DELIVERED_ORDERS"].ToString().ToLower() == "n")
                {
                    RunningOrders.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["PENDING_DELIVERIES"].ToString().ToLower() == "n")
                {
                    DeliveredOrder.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["COLLECTION_VS_SALES"].ToString().ToLower() == "n")
                {
                    salesCollection.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["ADD_MONEY_INTO_WALLET"].ToString().ToLower() == "n")
                {
                    addwallet.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["ADD_SALES"].ToString().ToLower() == "n")
                {
                    Add_Sales.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["REPORTS"].ToString().ToLower() == "n")
                {
                    Reports.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["RECEIVE_PAYMENTS"].ToString().ToLower() == "n")
                {
                    Receive_Payments.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["CUSTOMER_LEDGER"].ToString().ToLower() == "n")
                {
                    Customer_Ledger.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["ACCOUNT_RECEIVABLE"].ToString().ToLower() == "n")
                {
                    Account_Receivable.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["STOCK_INVENTORY"].ToString().ToLower() == "n")
                {
                    Stock_Inventory.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["TRIGGER_NOTIFICATION"].ToString().ToLower() == "n")
                {
                    Trigger_Notification.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["SEARCH_FOR_CUSTOMER"].ToString().ToLower() == "n")
                {
                    SearchCustomer.Visible = false;
                }
                if (ds.Tables[2].Rows[0]["AddCatalogue"].ToString().ToLower() == "n")
                {
                    AddCatalouge.Visible = false;
                }
                else
                {
                    AddCatalouge.Visible = true;
                }
            }

            if (ds.Tables[1].Rows.Count > 0)
            {
                if (ds.Tables[1].Rows[0]["RetailerAddSales"].ToString().ToLower() == "y")
                {
                    Add_Sales.Visible = true;
                }
                if (ds.Tables[1].Rows[0]["RetailerAddCatalouge"].ToString().ToLower() == "y")
                {
                    AddCatalouge.Visible = true;
                }
                else
                {
                    AddCatalouge.Visible = false;
                }
            }


        }
        else
        {
            HttpCookie Cookie = new HttpCookie("business");
            Cookie.Value = "";
            Cookie.Expires = DateTime.Now.AddDays(365);
            HttpContext.Current.Response.Cookies.Add(Cookie);
        }



    }

    [WebMethod]

    public static string getCustomerDetails(string Mobile)
    {
        string Data = "";
        Cl_admin ca = new Cl_admin();
        ca.Type = 22;
        ca.MOBILE = Mobile;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_Customer_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Data = "<div class=\"customer__details text-center p-3\" style=\"color: lightgrey;\"><div class=\"container\">" +
                   "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"cust__name__num\">" +
                   "<label style=\"text-decoration: underline; font-weight: bold; font-size: 18px;\">" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + "</label><br/><span>" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "</span>" +
                   "</div><div class=\"cust__address\" style=\"font-size: 13px;\"><span>" + ds.Tables[0].Rows[0]["ADDRESS1"].ToString() + ", " + ds.Tables[0].Rows[0]["LOCATION1"].ToString() + ", " + ds.Tables[0].Rows[0]["CITY1"].ToString() + "</span>" +
                   "</div></div></div></div></div>" +

                    "<div class=\"mt-4 mb-4\"><h6 class=\"d-none\" style=\"color: lightgrey;\">Current Outstanding Balance <span><i class=\"fa fa-inr\"></i>200</span></h6>" +
                    "<div class=\"walletbox_2\" style=\"background: #ffffff29; padding: 5px; border-radius: 5px;\"><div class=\"container\">" +
                    "<div class=\"row p-0\"><div class=\"col-4 p-0\"><div style=\"padding-top: 6px;\"><span id=\"addSalesAmount\" style=\"color: lightgrey;\">Amount</span>" +
                    "</div></div><div class=\"col-8 p-0\"><div class=\"inputbox\">" +
                    "<input id=\"Amount2\" type=\"number\" class=\"form-control labelclor\" style=\"width: 100%; color: lightgrey; border: none; background: #fff0;\" />" +
                    "</div></div></div></div></div></div>" +

            "<div class=\"modal-footer\"><div class=\"container\"><div class=\"row\"><div class=\"col-sm-12 mb-2\">" +
            "<a class=\"btn Add__Sales btnstyle border-0 w-100\" flag=\"N\"  cid='" + ds.Tables[0].Rows[0]["CUST_ID"].ToString() + "' href=\"javascript:void(0);\">Add Sales</a></div><div class=\"col-sm-12\">" +
            "<a class=\"btn Add__Sales btnstyle border-0 w-100\" flag=\"Y\"  cid='" + ds.Tables[0].Rows[0]["CUST_ID"].ToString() + "' href=\"javascript:void(0);\">Add Sales & Send Payment link" +
            "</a></div></div></div></div>";
        }
        return Data;
    }

    [WebMethod]
    public static string getReceivePaymentModal(string Mobile)
    {
        string Data = "";
        Cl_admin ca = new Cl_admin();
        ca.Type = 22;
        ca.MOBILE = Mobile;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_Customer_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Data = "<div class=\"customer__details text-center p-3\" style=\"color: lightgrey;\"><div class=\"container\">" +
                   "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"cust__name__num\">" +
                   "<label style=\"text-decoration: underline; font-weight: bold; font-size: 18px;\">" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + "</label><br/><span>" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "</span>" +
                   "</div><div class=\"cust__address\" style=\"font-size: 13px;\"><span>" + ds.Tables[0].Rows[0]["ADDRESS1"].ToString() + ", " + ds.Tables[0].Rows[0]["LOCATION1"].ToString() + ", " + ds.Tables[0].Rows[0]["CITY1"].ToString() + "</span>" +
                   "</div></div></div></div></div>" +

                    "<div class=\"mt-4 mb-4\"><h6 class=\"d-none\" style=\"color: lightgrey;\">Current Outstanding Balance <span><i class=\"fa fa-inr\"></i>200</span></h6>" +
                    "<div class=\"walletbox_2\" style=\"background: #ffffff29; padding: 5px; border-radius: 5px;\"><div class=\"container\">" +
                    "<div class=\"row p-0\"><div class=\"col-4 p-0\"><div style=\"padding-top: 6px;\"><span id=\"addSalesAmount\" style=\"color: lightgrey;\">Amount</span>" +
                    "</div></div><div class=\"col-8 p-0\"><div class=\"inputbox\">" +
                    "<input id=\"Amount3\" type=\"number\" class=\"form-control labelclor\" style=\"width: 100%; color: lightgrey; border: none; background: #fff0;\" />" +
                    "</div></div></div></div></div></div>" +

            "<div class=\"modal-footer\"><div class=\"container\"><div class=\"row\"><div class=\"col-sm-12 mb-2\">" +
            "<a class=\"btn receive_payment btnstyle border-0 w-100\" flag=\"N\"  cid='" + ds.Tables[0].Rows[0]["CUST_ID"].ToString() + "' href=\"javascript:void(0);\">Receive Payment</a></div><div class=\"col-sm-12\">" +
            "<a class=\"btn receive_payment btnstyle border-0 w-100\" flag=\"Y\"  cid='" + ds.Tables[0].Rows[0]["CUST_ID"].ToString() + "' href=\"javascript:void(0);\">Recharge Wallet" +
            "</a></div></div></div></div>";
        }
        return Data;
    }

    [WebMethod]
    public static string getAddMoneyToWallet(string Mobile)
    {
        string Data = "";
        Cl_admin ca = new Cl_admin();
        ca.Type = 22;
        ca.MOBILE = Mobile;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_Customer_Data();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            Data = "<div class=\"customer__details text-center p-3\" style=\"color: lightgrey;\"><div class=\"container\">" +
                   "<div class=\"row\"><div class=\"col-sm-12\"><div class=\"cust__name__num\">" +
                   "<label style=\"text-decoration: underline; font-weight: bold; font-size: 18px;\">" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + "</label><br/><span>" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "</span>" +
                   "</div><div class=\"cust__address\" style=\"font-size: 13px;\"><span>" + ds.Tables[0].Rows[0]["ADDRESS1"].ToString() + ", " + ds.Tables[0].Rows[0]["LOCATION1"].ToString() + ", " + ds.Tables[0].Rows[0]["CITY1"].ToString() + "</span>" +
                   "</div></div></div></div></div>" +

                    "<div class=\"mt-4 mb-4\"><h6 class=\"d-none\" style=\"color: lightgrey;\">Current Outstanding Balance <span><i class=\"fa fa-inr\"></i>200</span></h6>" +
                    "<div class=\"walletbox_2\" style=\"background: #ffffff29; padding: 5px; border-radius: 5px;\"><div class=\"container\">" +
                    "<div class=\"row p-0\"><div class=\"col-4 p-0\"><div style=\"padding-top: 6px;\"><span id=\"addSalesAmount\" style=\"color: lightgrey;\">Amount</span>" +
                    "</div></div><div class=\"col-8 p-0\"><div class=\"inputbox\">" +
                    "<input id=\"Amount4\" type=\"number\" class=\"form-control labelclor\" style=\"width: 100%; color: lightgrey; border: none; background: #fff0;\" />" +
                    "</div></div></div></div></div></div>" +

            "<div class=\"modal-footer\"><div class=\"container\"><div class=\"row\"><div class=\"col-sm-12 mb-2\">" +
            "<a class=\"btn btnstyle border-0 w-100\" flag=\"N\" data-dismiss=\"modal\" href=\"javascript:void(0);\">Cancel</a></div><div class=\"col-sm-12\">" +
            "<a class=\"btn add_money btnstyle border-0 w-100\" flag=\"Y\"  cid='" + ds.Tables[0].Rows[0]["CUST_ID"].ToString() + "' href=\"javascript:void(0);\">Add Money to Wallet" +
            "</a></div></div></div></div>";
        }
        return Data;
    }

    [WebMethod]

    public static string fnAddSales(string Mobile, string Amount, string Flag, string CID)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 23;
        ca.MOBILE = Mobile;
        ca.Amount = Amount;
        ca.Flag = Flag;
        ca.CID = CID;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fnAddSales();
        string Trx_ID = "";
        if (Flag == "Y")
        {
            Trx_ID = ds.Tables[0].Rows[0]["TRX_ID"].ToString();
            string SMS = "Please use below linl to pay Rs " + Amount + " to " + ds.Tables[1].Rows[0]["NAME"].ToString() + " for order no " + ds.Tables[2].Rows[0]["ORDER_NO"].ToString();

            string link = "https://mycornershop.in/Payments/payment_details_web/" + Trx_ID;
            cl_SMS.Dyn_sms(Mobile, SMS + "\n" + link, "");
        }
        return "1";
    }

    [WebMethod]

    public static string fnReceivePayment(string Mobile, string Amount, string Flag, string CID)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 24;
        ca.MOBILE = Mobile;
        ca.Amount = Amount;
        ca.Flag = Flag;
        ca.CID = CID;
        ca.USER_ID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fnAddSales();

        return "1";
    }

    [WebMethod]

    public static string getOverAllData(string start, string end)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 26;
        ca.START_DATE = start;
        ca.END_DATE = end;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_insert_stealdeaal();
        string data = "0|0|0|0|0";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            data = ds.Tables[0].Rows[0]["TOTAL_ORDERS"].ToString() + "|" + ds.Tables[0].Rows[0]["DELIVERED"].ToString() + "|" + ds.Tables[0].Rows[0]["PENDING"].ToString()
                + "|" + ds.Tables[0].Rows[0]["COLLECTION"].ToString() + "|" + ds.Tables[0].Rows[0]["SALES"].ToString();
        }

        return data;
    }

    [WebMethod]

    public static string getTotalOrders(string start, string end)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 27;
        ca.START_DATE = start;
        ca.END_DATE = end;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_insert_stealdeaal();
        string data = "";
        string dataTable = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string custname = DR["C_NAME"].ToString() == "" ? DR["cust_name"].ToString() : DR["C_NAME"].ToString();

                dataTable = dataTable + "<tr>" +
                "<td>" + Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyyy") + "</td>"
                + "<td>" + custname + "<div><a href='tel:=91" + DR["C_NUMBER"].ToString() + "'>" + DR["C_NUMBER"].ToString() + "</a></div></td>" +
                "<td>" + DR["CUSTOMER_ADDRESS"].ToString() + "</td>" +
                "<td><i onclick='fnseeitemsdetails($(this))' class='fa fa-info-circle fa-2x'></i><div class='tooltips'>" + System.Net.WebUtility.HtmlDecode(DR["ITEMS"].ToString()).Replace(",", "</br>") + "</div></td>"
                + "<td>" + DR["TOTAL_AMOUNT"].ToString() + "</td>" +
                "<td>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</td>" +
                "<td>" + textInfo.ToTitleCase(DR["PAYMENT_STATUS"].ToString().ToLower()) + "</td>"
                + "<td>" + DR["RECEIVED_AMOUNT"].ToString() + "</td>"
                + "<td>" + textInfo.ToTitleCase(DR["MOP"].ToString().ToLower()) + "</td>" +
                "</tr>";
            }
        }
        data = "<tbody>" + dataTable + "</tbody>";
        string Header = "<thead>" +
            "<tr>" +
            "<th>Date</th>" +
            "<th>Customer Name</th>" +
            "<th>Address</th>" +

            "<th>Ordered Items</th>" +
            "<th>Order Amount</th>" +
            "<th>Status</th>" +

            "<th>Payment Status</th>" +
            "<th>Payment Amount</th>" +
            "<th>MOP</th>" +
            "</tr></thead>";

        string Footer = "<tfoot><tr><th>Date</th><th>Customer Name</th><th>Address</th><th>Mobile</th><th style=\"width:200px!important;\">Ordered Items</th><th>Order Amount</th>" +
            "<th>Status</th><th>Delivered by</th><th>Payment Status</th><th>Payment Amount</th><th>MOP</th></tr></tfoot>";
        return Header + data + Header;
    }
    [WebMethod]

    public static string getDeliveredOrders(string start, string end)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 28;
        ca.START_DATE = start;
        ca.END_DATE = end;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_insert_stealdeaal();
        string data = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        string dataTable = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string custname = DR["C_NAME"].ToString() == "" ? DR["PersonName"].ToString() : DR["C_NAME"].ToString();
                dataTable = dataTable + "<tr>" +
                 "<td>" + Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyyy") + "</td>"
                 + "<td>" + custname + "<div><a href='tel:=91" + DR["C_NUMBER"].ToString() + "'>" + DR["C_NUMBER"].ToString() + "</a></div></td>" +
                 "<td>" + DR["CUSTOMER_ADDRESS"].ToString() + "</td>" +
                 "<td><i onclick='fnseeitemsdetails($(this))' class='fa fa-info-circle fa-2x'></i><div class='tooltips'>" + System.Net.WebUtility.HtmlDecode(DR["ITEMS"].ToString()).Replace(",", "</br>") + "</div></td>"
                 + "<td>" + DR["TOTAL_AMOUNT"].ToString() + "</td>" +
                 "<td>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</td>" +
                 "<td>" + textInfo.ToTitleCase(DR["PAYMENT_STATUS"].ToString().ToLower()) + "</td>"
                 + "<td>" + DR["RECEIVED_AMOUNT"].ToString() + "</td>"
                 + "<td>" + textInfo.ToTitleCase(DR["MOP"].ToString().ToLower()) + "</td>" +
                 "</tr>";
            }
        }
        data = "<tbody>" + dataTable + "</tbody>";
        string Header = "<thead>" +
            "<tr>" +
            "<th>Date</th>" +
            "<th>Customer Name</th>" +
            "<th>Address</th>" +

            "<th>Ordered Items</th>" +
            "<th>Order Amount</th>" +
            "<th>Status</th>" +

            "<th>Payment Status</th>" +
            "<th>Payment Amount</th>" +
            "<th>MOP</th>" +
            "</tr></thead>";

        string Footer = "<tfoot><tr><th>Date</th><th>Customer Name</th><th>Address</th><th>Mobile</th><th style=\"width:200px!important;\">Ordered Items</th><th>Order Amount</th>" +
            "<th>Status</th><th>Delivered by</th><th>Payment Status</th><th>Payment Amount</th><th>MOP</th></tr></tfoot>";
        return Header + data + Header;
    }
    [WebMethod]

    public static string getPendingOrders(string start, string end)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 29;
        ca.START_DATE = start;
        ca.END_DATE = end;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_insert_stealdeaal();
        string data = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        string dataTable = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string custname = DR["C_NAME"].ToString() == "" ? DR["PersonName"].ToString() : DR["C_NAME"].ToString();

                dataTable = dataTable + "<tr>" +
                "<td>" + Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyyy") + "</td>"
                + "<td>" + custname + "<div><a href='tel:=91" + DR["C_NUMBER"].ToString() + "'>" + DR["C_NUMBER"].ToString() + "</a></div></td>" +
                "<td>" + DR["CUSTOMER_ADDRESS"].ToString() + "</td>" +
                "<td><i onclick='fnseeitemsdetails($(this))' class='fa fa-info-circle fa-2x'></i><div class='tooltips'>" + System.Net.WebUtility.HtmlDecode(DR["ITEMS"].ToString()).Replace(",", "</br>") + "</div></td>"
                + "<td>" + DR["TOTAL_AMOUNT"].ToString() + "</td>" +
                "<td>" + textInfo.ToTitleCase(DR["STATUS"].ToString().ToLower()) + "</td>" +
                "<td>" + textInfo.ToTitleCase(DR["PAYMENT_STATUS"].ToString().ToLower()) + "</td>"
                + "<td>" + DR["RECEIVED_AMOUNT"].ToString() + "</td>"
                + "<td>" + textInfo.ToTitleCase(DR["MOP"].ToString().ToLower()) + "</td>" +
                "</tr>";
            }
        }
        data = "<tbody>" + dataTable + "</tbody>";
        string Header = "<thead>" +
            "<tr>" +
            "<th>Date</th>" +
            "<th>Customer Name</th>" +
            "<th>Address</th>" +

            "<th>Ordered Items</th>" +
            "<th>Order Amount</th>" +
            "<th>Status</th>" +

            "<th>Payment Status</th>" +
            "<th>Payment Amount</th>" +
            "<th>MOP</th>" +
            "</tr></thead>";
        string Footer = "<tfoot><tr><th>Date</th><th>Customer Name</th><th>Address</th><th>Mobile</th><th style=\"width:200px!important;\">Ordered Items</th><th>Order Amount</th>" +
            "<th>Status</th><th>Delivered by</th><th>Payment Status</th><th>Payment Amount</th><th>MOP</th></tr></tfoot>";
        return Header + data + Header;
    }

    [WebMethod]

    public static string getSalesAndCollection(string start, string end)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 37;
        ca.START_DATE = start;
        ca.END_DATE = end;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_insert_stealdeaal();
        string data = "";
        TextInfo textInfo = new CultureInfo("en-US", false).TextInfo;
        string dataTable = "";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                dataTable = dataTable + "<tr>" + "<td>" + DR["C_Name"].ToString() + " - " + DR["C_NUMBER"].ToString() + "</td>"
                    + "<td>" + Convert.ToDateTime(DR["ORDER_DATE"]).ToString("dd-MMM-yyyy") + "</td>"
                    + "<td>" + DR["Amount"].ToString()
                    + "</td>" + "<td>" + DR["MOP"].ToString() + "</td>" + "<td>" + DR["HEADER_ID"].ToString() + "</td>" +
                    "<td>" + DR["ReceivedAmount"].ToString() + "</td>" +
                 "</tr>";
            }
        }
        data = "<tbody>" + dataTable + "</tbody>";
        string Header = "<thead><tr><th>Name - Mobile</th><th>Transaction Date</th><th>Order Amount</th><th>MOP</th><th>Received Amount</th><th>Order No</th>" +
            "</tr></thead>";

        return Header + data + Header;
    }
    [WebMethod]

    public static string getCustomerLedger(string start, string end, string Mob)
    {
        Cl_admin ca = new Cl_admin();
        ca.Type = 38;
        ca.START_DATE = start;
        ca.END_DATE = end;
        ca.PORTION = Mob;
        ca.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = ca.fn_insert_stealdeaal();
        string data = "";
        string dataTable = "";
        string Personal_Details = "No Data Found";
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[1].Rows)
            {

                dataTable = dataTable + "<tr>" + "<td>" + Convert.ToDateTime(DR["TRX_DATE"]).ToString("dd-MMM-yyyy") + "</td>" +
                    "<td>" + DR["DESCRIPTION"].ToString() + "</td>" + "<td>" + DR["WALLET_TRANSACTION"].ToString() + "</td>" +
                    "<td>" + DR["CR"].ToString() + "</td><td>" + DR["DR"].ToString() + "</td></tr>";
            }
        }
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {

            Personal_Details = "<div class=\"container\" style=\"font-size:12px;\">" +
                                 "<div class=\"row\"><div class=\"col-4\">Name:</div><div class=\"col-8 custmb\" mob='" + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "'>" + ds.Tables[0].Rows[0]["FIRST_NAME"].ToString() + " - " + ds.Tables[0].Rows[0]["MOBILE"].ToString() + "</div></div>" +
                                "<div class=\"row\"><div class=\"col-4\">Address:</div><div class=\"col-8\">" + ds.Tables[0].Rows[0]["CUST_ADDRESS"].ToString() + "</div></div>" +
                                "<div class=\"row\"><div class=\"col-4\">Ledger Period:</div><div class=\"col-8\">" + start + " - " + end + "</div></div>" +
                                 "<div class=\"row\"><div class=\"col-4\">Current standing Amount:</div><div class=\"col-8\">" + ds.Tables[0].Rows[0]["OUTSTANDING_AMOUNT"].ToString() + "</div></div>" +
                                  "<div class=\"row\"><div class=\"col-4\">Wallet Balance:</div><div class=\"col-8\">" + ds.Tables[0].Rows[0]["PREPAID_BALANCE"].ToString() + "</div></div>" +
                                 "</div>";


        }
        data = "<tbody>" + dataTable + "</tbody>";
        string Header = "<thead><tr><th>Trx Date</th><th>Description</th><th>Wallet Transactions</th><th>Amount (Cr)</th><th>Amount (Dr)</th></tr></thead>";
        string Footer = "<tfoot><tr><th>Trx Date</th><th>Description</th><th>Wallet Transactions</th><th>Amount (Cr)</th><th>Amount (Dr)</th></tr></tfoot>";
        return Header + data + Footer + "|" + Personal_Details;
    }





    public void GetNotification_count()
    {
        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        cr.CID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
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
        cr.CID = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
        cr.Type = 16;
        ds = cr.fnGetAddress();
        return result;
    }



    [WebMethod]

    public static string getMenulist()
    {
        string result = "";
        Cl_admin ad = new Cl_admin();
        ad.USER_TYPE = HttpContext.Current.Request.Cookies["user_type"].Value.ToString();
        ad.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ad.Type = 13;
        DataSet ds = ad.fn_admin();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                result = result + " <a href=" + DR["REDIRECT_URL"].ToString() + ">" + DR["MENU_NAME"].ToString() + "</a>";
            }
        }


        return result;

    }

    [WebMethod]

    public static string SendNotificationToCustomer(string Title, string Comment, string Mobile, string Flag)
    {
        string result = "";
        Cl_admin ad = new Cl_admin();
        ad.USER_TYPE = HttpContext.Current.Request.Cookies["user_type"].Value.ToString();
        ad.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        ad.MOBILE = Mobile;
        ad.Flag = Flag;
        ad.Type = 84;
        DataSet ds = ad.fnAddSales();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                Send_Notification.SendNotificationFromFirebaseCloudIOS(ad.RID, DR["DEVICE_ID"].ToString(),
            "https://mycornershop.in/Home.aspx?rid=" + Cl_admin.Encrypt(ad.RID) + "&ulid=" + Cl_admin.Encrypt(DR["USER_ID"].ToString()), Title, Comment, 1);

                Send_Notification.SendNotificationFromFirebaseCloud(ad.RID, DR["DEVICE_ID"].ToString(),
            "https://mycornershop.in/Home.aspx?rid=" + Cl_admin.Encrypt(ad.RID) + "&ulid=" + Cl_admin.Encrypt(DR["USER_ID"].ToString()), Title, Comment, 1);
                insertNotification(HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString(), DR["USER_ID"].ToString(), Title, Comment, "Customer", ad.RID);
            }
        }


        return result;
    }
    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To, string RID)
    {

        DataSet ds = new DataSet();
        cl_resturant cr = new cl_resturant();
        cr.RID = RID;
        cr.Receiver_User_ID = Receiver_User_ID;
        cr.Sender_User_ID = Sender_User_ID;
        cr.Sent_To = Sent_To;
        cr.Type = 103;
        cr.Title = Title;
        cr.Comment = Message;
        ds = cr.fnInsertNotification();

        return "1";
    }
}