using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchedulerForLowBalance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SendWalletLowBalanceNotification();
    }
    public void SendWalletLowBalanceNotification()
    {
        Cl_Scheduler cs = new Cl_Scheduler();
        DataSet ds = new DataSet();
        cs.Type = 2;
        ds = cs.fnCreateOrder();
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string Title = "Your wallet is low on balance";
                string Message = "Wallet balance is low by Rs " + DR["AMOUNT_REQUIRED"].ToString() + " for items" + DR["ITEMS"].ToString();
                insertNotification("-1", DR["USER_ID"].ToString(), Title, Message, "Customer", DR["RID"].ToString());
                Send_Notification.SendNotificationFromFirebaseCloud(DR["RID"].ToString(),
                    DR["DEVICE_ID"].ToString(), "https://mycornershop.in/Components/Notifications.aspx", Title, Message, 1);
            }
        }
    }

    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To,string RID)
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