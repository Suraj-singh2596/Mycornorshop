using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchedulerForRetailersOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      sendOrderMsgtoRetailerAtTenPM();
    }

    public void sendOrderMsgtoRetailerAtTenPM()
    {
        Cl_Scheduler cs = new Cl_Scheduler();
        DataSet ds = new DataSet();
        cs.Type = 3;
        ds = cs.fnCreateOrder();
        if (ds != null && ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                string orders = "";

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    orders = orders + "Order No - " + dr["HEADER_ID"].ToString() + ", By " + dr["C_Name"].ToString()
                        + ", Order Amount - " + dr["OrderAmount"].ToString() + "\n";
                }
                string WhatsappMessage = "For EcoDent Total Orders - " + ds.Tables[0].Rows.Count + " as on " + DateTime.Now.ToString("dd MMM yyyy") +
                    ".\nDetails of orders are as below:\n\n" + orders;

                foreach (DataRow dr in ds.Tables[1].Rows)
                {
                    cl_SMS.WhatsApp_Dyn_sms(dr["USER_NAME"].ToString(), WhatsappMessage, dr["RID"].ToString());
                    Send_Notification.SendNotificationFromFirebaseecodentbusiness(dr["RID"].ToString()
                            , dr["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Admin_Delivery.aspx", "Delivery Alert", WhatsappMessage, 1);
                    insertNotification("-1", dr["USER_ID"].ToString(), "Order Whatsapp and Notification", WhatsappMessage, "Retailer");
                }

            }
        }
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
}