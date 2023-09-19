﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for cl_SMS
/// </summary>
public class cl_SMS
{
    public cl_SMS()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string SenderId { get; set; }

    public string ReciverId { get; set; }
    public string SenderType { get; set; }
    public string ReciverType { get; set; }
    public string msg { get; set; }
    public string Msg_Status { get; set; }
    public string PrescriptionId { get; set; }

    public string AppointmentId { get; set; }
    public string listofDCRID { get; set; }
    public int Type { get; set; }

    public string str;
    public string Created_By { set; get; }

    public int SMSID { get; set; }
    public string SMS_TEXT { get; set; }
    public int APPLICABLE_FOR { get; set; }
    public int APPLICABLE_ID { get; set; }
    public string USED_METHOD { get; set; }
    public string SMS_USED_MOBILENO { get; set; }
    public int DOCTOR_ID { get; set; }
    public int CLINIC_ID { get; set; }

    public string Patient_ID { get; set; }

    public string Sent_TO { get; set; }

    public string Mobile_No { get; set; }

    public string Category { get; set; }
    public string Appointment_ID { get; set; }


   

    public static bool Dyn_sms(string mob, string msg, string RID)
    {
        try
        {
            string baseurl = string.Empty;
            WebClient client = new WebClient();

            string autogenerated = "\nThis is system generated msg. Please do not reply.";
            // string baseurl = "http://bhashsms.com/api/sendmsg.php?user=Drplus&pass=drplus@123&sender=APPSMS&phone=" + mob + "&text=" + msg + " &priority=ndnd&stype=normal";
            //if (RID != "")
            //{
            //    cl_resturant cp = new cl_resturant();
            //    DataSet ds = new DataSet();
            //    cp.RID = RID;
            //    cp.Type = 16;
            //    ds = cp.fnAddAmount();

            //    if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            //    {
            //        string App_SMS_CODE = string.Empty;
            //        string Api_key = string.Empty;

            //        if (ds.Tables[0].Rows[0]["SMS_CODE"].ToString() != "APPSMS")
            //        {

            //            App_SMS_CODE = ds.Tables[0].Rows[0]["SMS_CODE"].ToString();
            //            Api_key = ds.Tables[0].Rows[0]["API_KEY"].ToString();
            //            baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=" + Api_key + "&senderid=" + App_SMS_CODE + "&channel=2&DCS=0&flashsms=0&number=" + mob + "&text=" + msg.Replace(autogenerated, "").Replace("&", "and") + "&route=13";


            //            baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=AAABEN&channel=2&DCS=0&flashsms=0&number=" + mob + "&text=" + msg.Replace(autogenerated, "").Replace("&", "and") + "&route=13";

            //        }
            //        else
            //        {
            //            baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=AAABEN&channel=2&DCS=0&flashsms=0&number=" + mob + "&text=" + msg.Replace(autogenerated, "").Replace("&", "and") + "&route=13";
            //        }

            //    }
            //    else
            //    {
            //        baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=AAABEN&channel=2&DCS=0&flashsms=0&number=" + mob + "&text=" + msg.Replace(autogenerated, "").Replace("&", "and") + "&route=13";

            //    }
            //}
            //else
            //{
                baseurl = "https://www.smsgatewayhub.com/api/mt/SendSMS?APIKey=L6i6XjhWFUyVjT5e2CrIyg&senderid=AAABEN&channel=2&DCS=0&flashsms=0&number=" + mob + "&text=" + msg.Replace(autogenerated, "").Replace("&", "and") + "&route=13";
            //}

            Stream data = client.OpenRead(baseurl);
            StreamReader reader = new StreamReader(data);

            if (reader.EndOfStream)
            {
                data.Close();
                reader.Close();
                return true;
            }
            else
            {
                data.Close();
                reader.Close();
                return false;
            }
        }
        catch (Exception e)
        {
            string Message = e.Message;
            return false;
        }
    }

    public static bool WhatsApp_Dyn_sms(string mob, string msg, string RID)
    {
        Dyn_sms(mob, msg, RID);
        try
        {
            string baseurl = string.Empty;
            WebClient client = new WebClient();

            //baseurl = "https://meo.co.in/whatsappAPINew/sendMessage.php?LoginId=7303255090&password=Meo@123&mobile_number=91" + mob + "&message=" + msg + "";
            baseurl = "https://messageapi.in/MessagingAPI/sendMessage.php?LoginId=7303255090&password=Meo@123&mobile_number=91" + mob + "&message=" + msg;

            Stream data = client.OpenRead(baseurl);
            StreamReader reader = new StreamReader(data);

            if (reader.EndOfStream)
            {
                data.Close();
                reader.Close();
                return true;
            }
            else
            {
                data.Close();
                reader.Close();
                return false;
            }

        }
        catch (Exception ex)
        {
            string Message = ex.Message;
            return false;
        }

    }

    public int fnInsMedicine()
    {
        str = "EXEC PRO_SMS_HANDLER_MASTER @SENDER_ID='" + SenderId + "',@RECIVER_ID='" + ReciverId + "',@SENDER_TYPE='" + SenderType + "',@RECIVER_TYPE='" + ReciverType
             + "',@MSG='" + msg + "',@MSG_STATUS='" + Msg_Status + "', @PRESCRIPTION_ID='" + PrescriptionId + "', @APPOINTMENT_ID='" + AppointmentId + "',  @TYPE='" + Type + "'";
        dal d = dal.GetInstance();
        int t = d.InsertData(str);
        if (t > 0)
        {
            return t;
        }
        else
        {
            return 0;
        }
    }


    public DataSet fnGetUserLoginDetailForSMS()
    {

        str = "EXEC PROC_SEND_LOGIN_DETAIL @DCR='" + listofDCRID + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fnGetTestimonials()
    {

        str = "EXEC SP_TESTIMONIALS @CreateBy='" + Created_By + "',@TYPE='" + Type + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fnSMSDetails()
    {
        str = "EXEC PROC_SMS_MASTER @APPLICABLE_FOR = '" + APPLICABLE_FOR + "', @APPLICABLE_ID = '" + APPLICABLE_ID + "', @USED_METHOD = '" + USED_METHOD + "', @TYPE = '" + Type + "', @CLINIC_ID = '" + CLINIC_ID + "', @DOCTOR_ID = '" + DOCTOR_ID + "', @MOBILE_NO ='" + SMS_USED_MOBILENO + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet fnGetMessage()
    {
        str = "EXEC PROC_SMS_MASTER  @USED_METHOD ='" + USED_METHOD + "',@TYPE = '" + Type + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public DataSet sendMessage()
    {
        str = "EXEC Proc_MSG_RECORD  @Doctor_ID ='" + DOCTOR_ID + "',@TYPE = '" + Type + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }
    public int SaveMessageRecord()
    {
        str = "EXEC Proc_MSG_RECORD  @Doctor_ID ='" + DOCTOR_ID + "',@Clinic_ID ='" + CLINIC_ID + "',@Patient_ID ='" + Patient_ID + "',@SendToType ='" + Sent_TO + "',@Mobile ='" + Mobile_No
            + "',@Category_Sms = '" + Category + "',@Message = '" + SMS_TEXT + "',@Appointment_ID = '" + Appointment_ID + "',@Prescription_ID = '" + PrescriptionId + "',@TYPE = '" + Type
            + "',@SMSType = '" + SenderType + "',@Created_By = '" + Created_By + "'";
        dal d = dal.GetInstance();
        int t = d.InsertData(str);
        if (t > 0)
        {
            return t;
        }
        else
        {
            return 0;
        }
    }

    public string OTP_VALUE { get; set; }

    public DataSet fnSaveOtp()
    {
        str = "EXEC PROC_SMS_MASTER  @OTP_VALUE ='" + OTP_VALUE + "',@OTP_ID ='" + otpID + "' ,@MOBILE_NO = '" + Mobile_No + "',@TYPE = '" + Type + "'";
        dal d = dal.GetInstance();
        DataSet ds = d.GetDataSet(str);
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            return ds;
        }
        else
        {
            return null;
        }
    }

    public string otpID { get; set; }
}