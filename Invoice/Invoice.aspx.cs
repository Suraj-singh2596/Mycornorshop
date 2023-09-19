using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Printing;
using System.Drawing;


public partial class Invoice_Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0 && !String.IsNullOrEmpty(Request.QueryString["invoice"]))
        {
            getInvoiceDetails(Request.QueryString["invoice"].ToString());
        }

    }

    protected void ButtonPrint_Click(object sender, EventArgs e)
    {
        print();
    }

    private void print()
    {
        try
        {
            PrintDocument pd = new PrintDocument();
            pd.PrintPage += new PrintPageEventHandler(pd_PrintPage);
            pd.Print();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            Response.End();
        }
    }

    void pd_PrintPage(object sender, PrintPageEventArgs e)
    {
        e.Graphics.DrawString("Test Print", new System.Drawing.Font("Arial", 12), new SolidBrush(Color.Blue), 60, 190);


    }
    public void getInvoiceDetails(string Invoice_No)
    {
        Cl_admin ca = new Cl_admin();
        DataSet ds = new DataSet();
        ca.Invoice_No = Invoice_No;
        ca.Type = 40;
        ds = ca.Invoice();
        string Invoice = "";
        if (ds != null && ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
        {
            int i = 1;
            string Particulars = "";
            string rupee = "";
            decimal sub_totl = 0;
            string round_off = "";
            decimal Taxable_value = 0;
            decimal Net_amount = 0;
            decimal Round_off_amount = 0;
            string Discount = "";
            string Service_charge = "";

            // added by suraj for currency show
            //if (ds.Tables[0].Rows[0]["CURRENCY_SYMBOL"].ToString() != "0")
            //{
            //    rupee = ds.Tables[0].Rows[0]["CURRENCY_SYMBOL"].ToString();
            //}
            //else
            //{
            //    rupee = "<i class=\"fa fa-inr\"></i>";
            //}
            rupee = "<i class=\"fa fa-inr\"></i>";
            foreach (DataRow DR in ds.Tables[1].Rows)
            {
                Particulars = Particulars + "<tr><td class=\"col-1 border-0\" style=\"width: 10%;\">" + i + "</td>" +  //Sno
                                  "<td class=\"col-5 text-1 border-0\" style=\"width: 50%;\">" + DR["MENU_NAME"].ToString() + "</td>" + // item name
                                  "<td class=\"col-2 text-center border-0\" style=\"width: 10%;\">" + rupee + " " + DR["PRICE"].ToString() + "</td>" + //price
                                  "<td class=\"col-2 text-center border-0\" style=\"width: 15%;\">" + DR["QTY"].ToString() + "</td>" + //qty
                                  "<td class=\"col-2 text-right border-0\" style=\"width: 15%;\">" + rupee + " " + DR["QTYPRICE"].ToString() + "</td></tr>";  // price*qty
                i++;
                sub_totl = sub_totl + Convert.ToDecimal(DR["QTYPRICE"].ToString());
            }




            string Sub_Total = "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Sub Total:</strong></td>" +
                               "<td class=\"bg-light-2 text-right\">" + rupee + " " + sub_totl + "</td></tr>";  // sub total

            string Taxable_Value = "";
            string CGST = "";
            string SGST = "";
            decimal Total_Amount = 0;

            foreach (DataRow DR in ds.Tables[2].Rows)
            {
                if (DR["CGST_RATE"].ToString() != "0")
                {
                    Taxable_Value = Taxable_Value + "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Taxable:</strong></td>" +
                                  "<td class=\"bg-light-2 text-right\">" + rupee + " " + Math.Round(Convert.ToDecimal(DR["TAXABLE_VALUE"].ToString()), 2) + "</td></tr>"; // taxable loop

                    CGST = CGST + "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>CGST " + DR["CGST_RATE"].ToString() + "%:</strong></td>" +
                                 "<td class=\"bg-light-2 text-right\">" + rupee + " " + Math.Round(Convert.ToDecimal(DR["CGST_AMOUNT"].ToString()), 2) + "</td></tr>";  // cgst loop

                    SGST = SGST + "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>SGST " + DR["SGST_RATE"].ToString() + "%:</strong></td>" +
                         "<td class=\"bg-light-2 text-right\">" + rupee + " " + Math.Round(Convert.ToDecimal(DR["SGST_AMOUNT"].ToString()), 2) + "</td></tr>";  // sgst loop

                    Net_amount = Net_amount + Math.Round((Convert.ToDecimal(DR["TAXABLE_VALUE"].ToString()) + Convert.ToDecimal(DR["CGST_AMOUNT"].ToString()) + Convert.ToDecimal(DR["SGST_AMOUNT"].ToString())), 2);
                }
                else
                {
                    Net_amount = Net_amount + Math.Round((Convert.ToDecimal(DR["TAXABLE_VALUE"].ToString())));
                }

            }




            if (ds.Tables[3].Rows[0]["DISCOUNT"].ToString() != "0")
            {
                Discount = "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Discount</strong></td>" +
                    "<td class=\"bg-light-2 text-right\">" + rupee + " " + ds.Tables[3].Rows[0]["DISCOUNT"].ToString() + "</td></tr>";
                Net_amount = Net_amount - Convert.ToDecimal(ds.Tables[3].Rows[0]["DISCOUNT"].ToString());
            }
            //if (ds.Tables[3].Rows[0]["SERVICE_PERCENTAGE"].ToString() != "0")
            //{

            //    CGST = CGST + "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Serive Charge CGST " + ds.Tables[3].Rows[0]["GST"].ToString() + "%:</strong></td>" +
            //                     "<td class=\"bg-light-2 text-right\">" + rupee + " " + Math.Round(Convert.ToDecimal(ds.Tables[3].Rows[0]["SERVICE_CHARGE_GST"].ToString()) / 2, 2) + "</td></tr>";  // cgst loop

            //    SGST = SGST + "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Serive Charge SGST " + ds.Tables[3].Rows[0]["GST"].ToString() + "%:</strong></td>" +
            //         "<td class=\"bg-light-2 text-right\">" + rupee + " " + Math.Round(Convert.ToDecimal(ds.Tables[3].Rows[0]["SERVICE_CHARGE_GST"].ToString()) / 2, 2) + "</td></tr>";

            //    Service_charge = "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Service Charge " + ds.Tables[3].Rows[0]["SERVICE_PERCENTAGE"].ToString() + "%</strong></td>" +
            //        "<td class=\"bg-light-2 text-right\">" + rupee + " " + ds.Tables[3].Rows[0]["SERVICE_CHARGE"].ToString() + "</td></tr>";
            //    Net_amount = Net_amount + Convert.ToDecimal(ds.Tables[3].Rows[0]["SERVICE_CHARGE"].ToString()) + Convert.ToDecimal(ds.Tables[3].Rows[0]["SERVICE_CHARGE_GST"].ToString());
            //}

            Round_off_amount = Math.Round(Net_amount, 0) - Net_amount;
            Net_amount = Net_amount + Round_off_amount;
            if (Round_off_amount != 0)
            {
                round_off = "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Round Off</strong></td>" +
                                "<td class=\"bg-light-2 text-right\">" + rupee + " " + Round_off_amount + "</td></tr>";
            }
            string Total = "<tr><td colspan = \"4\" class=\"bg-light-2 text-right\"><strong>Total:</strong></td>" +
                          "<td class=\"bg-light-2 text-right\">" + rupee + " " + Net_amount + "</td></tr>"; // total

            Invoice = "<div class=\"center\" style=\" background: white !important; padding: 20px;\" ><header><div class=\"row align-items-center\">" +
                    "<div class=\"col-6 text-center text-sm-left mb-3 mb-sm-0\"><h3>" + ds.Tables[0].Rows[0]["RESTAURANT_NAME"].ToString() + "</h3>" +
                    "<br/><address>" + ds.Tables[0].Rows[0]["RESTAURANT_ADDRESS"].ToString() + "</address></div>" +  //Restaurant Name
                    "<div class=\"col-6 text-center text-sm-right\"><h1>Invoice</h1><div class=\"row\"><div class=\"col-sm-2\"></div>" + //invoice date
                    "<div class=\"col-sm-10 text-sm-right\"><strong>Invoice No: </strong> " + ds.Tables[0].Rows[0]["SHORT_INVOICE_CODE"].ToString() + "<br/>" +
                    "<strong>Date: </strong>" + Convert.ToDateTime(ds.Tables[0].Rows[0]["INVOICE_DATE"]).ToString("dd-MM-yy hh:mm tt") + "</div></div></div></div><hr></header>" +
                    "<main>" + //invoice no
                    "<hr><div class=\"row mt-2\"><div class=\"col-sm-6 text-sm-right order-sm-1\"> " +
                    "</div><div class=\"col-sm-12 order-sm-0\">" + // Restaurant Address
                    "<div><span style=\"font-weight:bold;\">Invoiced To: </span><span style=\"font-weight:400;\">" + ds.Tables[0].Rows[0]["C_NAME"].ToString() + "-" + ds.Tables[0].Rows[0]["C_NUMBER"].ToString() + "</span></div></div></div><hr/>" +  // Customer Address
                    "<div class=\"card mt-3\"><div class=\"card-header px-2 py-0\"><table class=\"table mb-0\"><thead>" +
                    "<tr><td class=\"col-1 border-0\" style=\"width: 10%;\"><strong>Sno.</strong></td>" +
                    "<td class=\"col-5 border-0\" style=\"width: 50%;\"><strong>Particular</strong></td>" +
                    "<td class=\"col-2 border-0\" style=\"width: 10%;\"><strong>Rate</strong></td>" +
                    "<td class=\"col-2 text-center border-0\" style=\"width: 15%;\"><strong>Qty</strong></td>" +
                    "<td class=\"col-2 text-center border-0\" style=\"width: 15%;\"><strong>Total</strong></td></tr></thead></table></div>" +
                    "<div class=\"card-body px-2\"><div class=\"table-responsive\"><table class=\"table\"><tbody>" +
                            Particulars + Sub_Total + Taxable_Value + Discount + Service_charge + CGST + SGST + round_off + Total +
                    "</tbody></table></div></div></div>" +
                    "<p class=\"text-1\"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p></main>" +
                    //"<footer class=\"text-center mt-4\">" +
                    //"<p class=\"text-1\"><strong>NOTE :</strong> This is computer generated receipt and does not require physical signature.</p>" +
                    //"<div class=\"col-sm-12\">" +
                    //// "<a href = \"javascript:void(0);\" runat=\"server\" OnClick=\"ButtonPrint_Click\" class=\"btn btn-light border text-black-50 shadow-none\">" +
                    //"" +
                    ////"<i class=\"fa fa-print\"></i>Print" +
                    ////"</a>" +
                    //"</div></footer>" +
                    "</div>";

        }

        content.InnerHtml = Invoice;
    }
}