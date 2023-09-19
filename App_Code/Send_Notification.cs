using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Collections.Specialized;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;
using System.Net.Sockets;
using System.Security.Authentication;
using System.Configuration;
using PushSharp.Apple;
using Newtonsoft.Json.Linq;
/// <summary>
/// Summary description for Send_Notification
/// </summary>
public class Send_Notification
{
    public Send_Notification()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    private static Uri FireBasePushNotificationsURL = new Uri("https://fcm.googleapis.com/fcm/send");


    public static string SendNotificationFromFirebaseCloud(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "AAAAwCdgjoQ:APA91bFtc2IpM8ttX5srBvMyNNgTNQlltIcB9PDzWP2cHoU7z_M3vsk8EQbSTe77ZHEFWRSygO7Ksw3cwBBt-U5D5cbQtwKfyzta71eMdN23ZB-afcaoBUyFq7uBKvpmdAfEsAt4fmnz";

        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Method = "POST";

        int devicesCount = count;

        var tokens = new string[devicesCount];
        tokens[0] = Device_ID;

        StringBuilder sb = new StringBuilder();
        foreach (string token in tokens)
        {
            sb.Append("\"" + token + "\",");
        }

        var newdata = new
        {
            id = 1,
            url = URL,
            title = Title,
            content = MSG
        };

        var payload = new
        {
            registration_ids = tokens,
            data = newdata
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();
            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }
    public static string SendNotificationFromFirebaseCloudDelivery(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "AAAAwCdgjoQ:APA91bEqjqpc7t8z2F4Gk0sF2K1ALKS-7niVbbfsTN_C7aFWct6GogfsnJgEAA00D9XXpllxeQoDtiN2upg44zFxsiqoS8-YLaDiRQ0LNu-7bzaKCm-JggR9ONLuYsf4lG-51RHrhNCQ";

        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Method = "POST";

        int devicesCount = count;

        var tokens = new string[devicesCount];
        // tokens[0] = "cDHXnXJFhzo:APA91bE1KLijssV4vt14tP6knzxg8nB9knYnvR76FhUsi4jlU7zLHKQEpM54ECe6qQoqWBTJBvYkhESC9epiWL3ZnZNYM00N5N32TAYYwMRvVYU-fzdBOShV7uywvzN8yuvOjSBcQ9bH";
        tokens[0] = Device_ID;

        StringBuilder sb = new StringBuilder();
        foreach (string token in tokens)
        {
            sb.Append("\"" + token + "\",");
        }

        var newdata = new
        {
            //id = 1,
            //url = "https://mycornershop.in/Components/scheduler.aspx",
            //title = "xyz",
            //content = "Got something new for you"

            id = 1,
            url = URL,
            title = Title,
            content = MSG
        };

        var payload = new
        {
            registration_ids = tokens,
            data = newdata
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();

            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }
    public static string SendNotificationFromFirebaseCloudBusiness(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "AAAAwCdgjoQ:APA91bFlydTnNAxAp6yZ2gKf2Hyn7TP0BX77mTtcI_-bzuf-dxqSjR8WodfVXcFbnJ8mR5u9V02R1YT7B2xWSUD88hIa6A-EDiLHF3zCD52-Bi1F1mgbAG33XJNL6eCpSRsrC8NsETHe";

        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Method = "POST";

        int devicesCount = count;

        var tokens = new string[devicesCount];
        // tokens[0] = "cDHXnXJFhzo:APA91bE1KLijssV4vt14tP6knzxg8nB9knYnvR76FhUsi4jlU7zLHKQEpM54ECe6qQoqWBTJBvYkhESC9epiWL3ZnZNYM00N5N32TAYYwMRvVYU-fzdBOShV7uywvzN8yuvOjSBcQ9bH";
        tokens[0] = Device_ID;

        StringBuilder sb = new StringBuilder();
        foreach (string token in tokens)
        {
            sb.Append("\"" + token + "\",");
        }

        var newdata = new
        {
            //id = 1,
            //url = "https://mycornershop.in/Components/scheduler.aspx",
            //title = "xyz",
            //content = "Got something new for you"

            id = 1,
            url = URL,
            title = Title,
            content = MSG
        };

        var payload = new
        {
            registration_ids = tokens,
            data = newdata
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();

            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }

    public static string SendNotificationFromFirebaseCloudIOS(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "AAAAwCdgjoQ:APA91bH_44K8sEuZ441zV6GaeRa7SJyue9bG22jPS0BwQmxvzllzEyFqGNjNitYp1qYF_1gdznC2_9mvVjspINkzQjmIzoqoIk2Ig9xBTrMmbY_bCi_E16kbLQjhU-SdpE_UcJTMB0yu";
        string SENDER_ID = "825294360196";
        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
        httpWebRequest.Method = "POST";

  
        var newdata = new
        {

            title = Title,
            body = MSG,
            url = URL
        };

        var payload = new
        {

            notification = newdata,
            content_available = true,
            priority = "high",
            to = Device_ID
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();

            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }

    public static string SendNotificationFromFirebaseecodent(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "";
        string SENDER_ID = "";

        if (RID == "51")
        {
            ServerKey = "AAAArw8_R7c:APA91bFWondQbNdEZdHc6mbrS5xJj_Y_NnfpAeGOj14A9B_1ddinGLivkMsiVd2cFZqtBiTwAA72rbgz8z6f2HWoihdHyRYZ5eLMIZci9QB2NAFrchwaEtbCohDT-yY1HQVk9Nlc503E";
            SENDER_ID = "751875082167";
        }
        else
        {
            ServerKey = "AAAABU3a0Ok:APA91bE01CVT7U8YaUFIaRltVXq4xezWDs1BJDY2UmPHy81e5aCqbqBTlBd5a8dAL85Fx1MNOnnZVToLaz6EV5jDD2R--4cgwU8BTnqpSzwQZfh7vZpdFsn2Ty08qHZdmL9hsKbrthOp";
            SENDER_ID = "22781022441";
        }


        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
        httpWebRequest.Method = "POST";

        int devicesCount = count;

        var tokens = new string[devicesCount];
        tokens[0] = Device_ID;

        StringBuilder sb = new StringBuilder();
        foreach (string token in tokens)
        {
            sb.Append("\"" + token + "\",");
        }

        var newdata = new
        {
            id = 1,
            url = URL,
            title = Title,
            content = MSG
        };

        var payload = new
        {
            registration_ids = tokens,
            data = newdata
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();
            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }

    public static string SendNotificationFromFirebaseecodentbusiness(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "";
        string SENDER_ID = "";
        if (RID == "51")
        {
            ServerKey = "AAAA_oVAOm0:APA91bFVAXd_6N7Xq83ZP4Be918-tICfnHlF3DKueCCninbzfWaJmkXoQf993VuNn0og_-uHJvOaEi5wVBhbdg5T2_u1SyIUdsuI0fpYdXZH0ttqNAIc_gXldm7CgUugXJV2kx-jsarK";
            SENDER_ID = "1093157272173";
        }
        else
        {
            ServerKey = "AAAAm1fgc0M:APA91bH7n7nG2YOix81KmJOaF5x8B46JWWPHC3BwrQWWRbDg7e_O4MnB9_pBYtzRr5HdS_NoxBg2KX_DsctSzw1c6a_AJlKiVnBQu6nDo8ofPv8qvJS7cO-Y1NplmoMBLFRi06UbGIKb";
            SENDER_ID = "667194258243";
        }


        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
        httpWebRequest.Method = "POST";

        int devicesCount = count;

        var tokens = new string[devicesCount];
        tokens[0] = Device_ID;

        StringBuilder sb = new StringBuilder();
        foreach (string token in tokens)
        {
            sb.Append("\"" + token + "\",");
        }

        var newdata = new
        {
            id = 1,
            url = URL,
            title = Title,
            content = MSG
        };

        var payload = new
        {
            registration_ids = tokens,
            data = newdata
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();
            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }

    public static string SendNotificationFromFirebaseecodentdelivery(string RID, string Device_ID, string URL, string Title, string MSG, int count)
    {
        string ServerKey = "";
        string SENDER_ID = "";
        if (RID == "51")
        {
            ServerKey = "AAAAJYTcIv4:APA91bFDgpNVT4qkg5EMCy2Vydb1BlY0EF-6X6GHfu3S7ccTs_kdjTHxXjjQvTgLAPUCPIEOnxIy4hb062XSLTQWKqGtMVLv4zgkYf8eM492avjOp_ivQXI6vPSiKgdQmGBOc7P5N821";
            SENDER_ID = "161142809342";
        }
        else
        {
            ServerKey = "";
            SENDER_ID = "";
        }


        var result = "-1";
        var webAddr = "https://fcm.googleapis.com/fcm/send";
        var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
        httpWebRequest.ContentType = "application/json";
        httpWebRequest.Headers.Add(HttpRequestHeader.Authorization, "key=" + ServerKey);
        httpWebRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
        httpWebRequest.Method = "POST";

        int devicesCount = count;

        var tokens = new string[devicesCount];
        tokens[0] = Device_ID;

        StringBuilder sb = new StringBuilder();
        foreach (string token in tokens)
        {
            sb.Append("\"" + token + "\",");
        }

        var newdata = new
        {
            id = 1,
            url = URL,
            title = Title,
            content = MSG
        };

        var payload = new
        {
            registration_ids = tokens,
            data = newdata
        };


        using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
        {
            string postbody = JsonConvert.SerializeObject(payload).ToString().Trim();
            streamWriter.Write(postbody);
            streamWriter.Flush();
        }

        var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            result = streamReader.ReadToEnd();
        }
        return result;
    }

}


public class FCMMessageModel
{
    public FCMMessageModel()
    {
    }


}