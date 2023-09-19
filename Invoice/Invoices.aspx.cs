using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Invoice_Invoices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Invoice_Body.InnerHtml = "";
        if (Request.QueryString.Count > 0 && !String.IsNullOrEmpty(Request.QueryString["invoice"]))
        {
            getInvoiceDetails(Request.QueryString["invoice"].ToString());
        }
    }
    public void getInvoiceDetails(string Invoice_No)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.Invoice_No = Invoice_No;
        ca.Type = 40;
        ds = ca.Invoice();
        string Invoice = "";
        string Retailer_Name = "";
        string Retailer_Address = "";
        string Customer_details = "";
        string Particulars = "";
        string Particulars_list = "";
        string Total_List = "";
        string Taxable_Value = "";
        string CGST = "";
        string SGST = "";
        decimal Taxable_Amount = 0;
        string Total = "";
        if (ds != null && ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
        {
            Retailer_Name = "<div class=\"row\"><div class=\"col-12 col-sm-12\"><h5>" + ds.Tables[0].Rows[0]["RESTAURANT_NAME"].ToString() + "</h5></div></div>";
            Retailer_Address = "<div class=\"row\" style=\"font-size: 13px;\"><div class=\"col-12 col-sm-12\">" +
                    ds.Tables[0].Rows[0]["RESTAURANT_ADDRESS"].ToString() + "</div></div>";
            Customer_details = "<div class=\"row text-right\" style=\"font - size: 13px; \"><div class=\"col-12 col-sm-12\">" +
                   "Invoice No: " + ds.Tables[0].Rows[0]["SHORT_INVOICE_CODE"].ToString() + "</div><div class=\"col-12 col-sm-12\">Date: " + Convert.ToDateTime(ds.Tables[0].Rows[0]["INVOICE_DATE"]).ToString("dd-MM-yy hh:mm tt") + "</div>" +
                   "<div class=\"col-12 col-sm-12\"><label style=\"font-weight: 700\" > Invoiced To:</label>" +
                   ds.Tables[0].Rows[0]["C_NAME"].ToString() + " - " + ds.Tables[0].Rows[0]["C_NUMBER"].ToString() + " </div></div>";
            Total = "<div class=\"row\" style=\"border-top: 1px solid gray;\"><div class=\"col-12 col-sm-12 text-right\">" +
                                  "<div class=\"row\"><div class=\"col-8 col-sm-8\"><span style =\"font-size: 14px;\">Total:</span></div>" +
                                  "<div class=\"col-4 col-sm-4\"><span style =\"font-size: 14px;\">&#8377;" + ds.Tables[0].Rows[0]["TOTAL_AMOUNT"].ToString() + "</span></div></div></div></div>";
            invoice_no.Value = ds.Tables[0].Rows[0]["SHORT_INVOICE_CODE"].ToString();
        }
        if (ds != null && ds.Tables[1].Rows.Count > 0 && ds.Tables.Count > 0)
        {
            int i = 1;
            foreach (DataRow DR in ds.Tables[1].Rows)
            {
                Particulars_list = Particulars_list + "<div class=\"row\"><div class=\"col-2 col-sm-2 pr-0\">" +
                               "<span style=\"font-size: 12px;\">" + i + "</span></div><div class=\"col-4 col-sm-4 pr-0 pl-0\">" +
                               "<span style=\"font-size: 12px;\">" + DR["MNAME"].ToString() + "</span></div><div class=\"col-2 col-sm-2 pr-0 pl-0\">" +
                               "<span style=\"font-size: 12px;\">&#8377;" + DR["PRICE"].ToString() + "</span></div><div class=\"col-2 col-sm-2 pr-0 pl-0\">" +
                               "<span style=\"font-size: 12px;\">" + DR["QTY"].ToString() + "</span></div><div class=\"col-2 col-sm-2 pr-0 pl-0\">" +
                               "<span style=\"font-size: 12px;\">&#8377;" + DR["QTYPRICE"].ToString() + "</span></div></div><hr class=\"mt-0 mb-0\" />";
                i++;
            }
        }
        if (ds != null && ds.Tables[2].Rows.Count > 0 && ds.Tables.Count > 0)
        {
            int i = 1;
            foreach (DataRow DR in ds.Tables[2].Rows)
            {

                Taxable_Amount = Taxable_Amount + Convert.ToDecimal(DR["TAXABLE_VALUE"].ToString());
                if (DR["CGST_AMOUNT"].ToString() != "0")
                {
                    Taxable_Value = Taxable_Value + "<div class=\"row\" style=\"border-top: 1px solid gray;\"><div class=\"col-12 col-sm-12 text-right\">" +
                  "<div class=\"row\"><div class=\"col-8 col-sm-8\"><span style =\"font-size: 14px;\">Taxable:</span></div>" +
                  "<div class=\"col-4 col-sm-4\"><span style =\"font-size: 14px;\">&#8377;" + DR["TAXABLE_VALUE"].ToString() + "</span></div></div></div></div>";
                    

                    CGST = CGST + "<div class=\"row\" style=\"border-top: 1px solid gray;\"><div class=\"col-12 col-sm-12 text-right\">" +
                        "<div class=\"row\"><div class=\"col-8 col-sm-8\"><span style =\"font-size: 14px;\">CGST " + DR["CGST_RATE"].ToString() + "%:</span></div>" +
                        "<div class=\"col-4 col-sm-4\"><span style =\"font-size: 14px;\">&#8377;" + DR["CGST_AMOUNT"].ToString() + "</span></div></div></div></div>";

                    SGST = SGST + "<div class=\"row\" style=\"border-top: 1px solid gray;\"><div class=\"col-12 col-sm-12 text-right\">" +
                       "<div class=\"row\"><div class=\"col-8 col-sm-8\"><span style =\"font-size: 14px;\">SGST " + DR["SGST_RATE"].ToString() + "%:</span></div>" +
                       "<div class=\"col-4 col-sm-4\"><span style =\"font-size: 14px;\">&#8377;" + DR["SGST_AMOUNT"].ToString() + "</span></div></div></div></div>";
                }

                i++;
            }
        }
        string Sub_Total = "<div class=\"row\" style=\"border-top: 1px solid gray;\"><div class=\"col-12 col-sm-12 text-right\">" +
                  "<div class=\"row\"><div class=\"col-8 col-sm-8\"><span style =\"font-size: 14px;\">Sub Total:</span></div>" +
                  "<div class=\"col-4 col-sm-4\"><span style =\"font-size: 14px;\">&#8377;" + Convert.ToString(Taxable_Amount) + "</span></div></div></div></div>";
        string Discount = "";

        if (ds != null && ds.Tables[3].Rows.Count > 0 && ds.Tables.Count > 0)
        {
            if (ds.Tables[3].Rows[0]["DISCOUNT"].ToString() != "0")
            {
                Discount = "<div class=\"row\" style=\"border-top: 1px solid gray;\"><div class=\"col-12 col-sm-12 text-right\">" +
                              "<div class=\"row\"><div class=\"col-8 col-sm-8\"><span style =\"font-size: 14px;\">Discount:</span></div>" +
                              "<div class=\"col-4 col-sm-4\"><span style =\"font-size: 14px;\">&#8377;" + ds.Tables[3].Rows[0]["DISCOUNT"].ToString() + "</span></div></div></div></div>";
            }
        }


        Particulars = "<div class=\"row\" style=\"border: 2px solid gray;\"><div class=\"col-12 col-sm-12\"><div class=\"row\">" +
                  "<div class=\"col-2 col-sm-2 pr-0\"><label style =\"font-weight: 600\">SNo.</label></div>" +
                  "<div class=\"col-4 col-sm-4 pr-0 pl-0\"><label style =\"font-weight: 600\">Particular</label></div>" +
                  "<div class=\"col-2 col-sm-2 pr-0 pl-0\"><label style =\"font-weight: 600\">Rate</label></div>" +
                  "<div class=\"col-2 col-sm-2 pr-0 pl-0\"><label style =\"font-weight: 600\">Qty</label></div>" +
                  "<div class=\"col-2 col-sm-2 pr-0 pl-0\"><label style =\"font-weight: 600\">Total</label></div></div></div>" +
                  "<div class=\"col-12 col-sm-12\">" + Particulars_list + "</div>" +
                  "<div class=\"col-12 col-sm-12\">" + Sub_Total + Taxable_Value + CGST + SGST + Discount + Total +

        //<div class=\"row\" style=\"border-top: 1px solid gray;\">
        //    <div class=\"col-12 col-sm-12 text-right\">
        //        <div class=\"row\">
        //            <div class=\"col-8 col-sm-8\">
        //                <span style =\"font-size: 14px;\">Taxable:</span>
        //            </div>
        //            <div class=\"col-4 col-sm-4\">
        //                <span style =\"font-size: 14px;\">&#8377;178.58</span>
        //            </div>
        //        </div>
        //    </div>
        //</div>
        //<div class=\"row\" style=\"border-top: 1px solid gray;\">
        //    <div class=\"col-12 col-sm-12 text-right\">
        //        <div class=\"row\">
        //            <div class=\"col-8 col-sm-8\">
        //                <span style =\"font-size: 14px;\">CGST 6%:</span>
        //            </div>
        //            <div class=\"col-4 col-sm-4\">
        //                <span style =\"font-size: 14px;\">&#8377;10.71</span>
        //            </div>
        //        </div>
        //    </div>
        //</div>
        //<div class=\"row\" style=\"border-top: 1px solid gray;\">
        //    <div class=\"col-12 col-sm-12 text-right\">
        //        <div class=\"row\">
        //            <div class=\"col-8 col-sm-8\">
        //                <span style =\"font-size: 14px;\">SGST 6%:</span>
        //            </div>
        //            <div class=\"col-4 col-sm-4\">
        //                <span style =\"font-size: 14px;\">&#8377;10.71</span>
        //            </div>
        //        </div>
        //    </div>
        //</div>
        //<div class=\"row\" style=\"border-top: 1px solid gray;\">
        //    <div class=\"col-12 col-sm-12 text-right\">
        //        <div class=\"row\">
        //            <div class=\"col-8 col-sm-8\">
        //                <span style =\"font-size: 14px;\">Round Off:</span>
        //            </div>
        //            <div class=\"col-4 col-sm-4\">
        //                <span style =\"font-size: 14px;\">&#8377;-0.01</span>
        //            </div>
        //        </div>
        //    </div>
        //</div>
        //<div class=\"row\" style=\"border-top: 1px solid gray;\">
        //    <div class=\"col-12 col-sm-12 text-right\">
        //        <div class=\"row\">
        //            <div class=\"col-8 col-sm-8\">
        //                <span style =\"font-size: 14px;\">Total:</span>
        //            </div>
        //            <div class=\"col-4 col-sm-4\">
        //                <span style =\"font-size: 14px;\">&#8377;200.00</span>
        //            </div>
        //        </div>
        //    </div>
        //</div>
        "</div></div>";

        Invoice = "<div class=\"row\"></div><div class=\"row\"><div class=\"col-sm-12 col-12\"><h2 class=\"text-center\">Invoice</h2>" +
                "</div></div>" + Retailer_Name + Retailer_Address + "<hr style=\"background-color: #fff; border-top: 2px dashed #8c8b8b;\" />" +
                Customer_details + "<hr style=\"background-color: #fff; border-top: 2px dashed #8c8b8b;\" />" + Particulars;

        Invoice_Body.InnerHtml = Invoice;
    }
}