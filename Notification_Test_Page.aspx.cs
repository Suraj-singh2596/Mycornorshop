using Newtonsoft.Json.Linq;
using PushSharp.Apple;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Net.Sockets;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Notification_Test_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Send_Notification.SendNotificationFromFirebaseCloudIOS("2", "d91to9H9Jk8nk3K12h6XP5:APA91bGDi0XhYuKUVscVV4DGM8-V8puTvOhPhScM0CkMd-0xVpTT2bpzqN2QUHaSJVVJWklrSiJMvr5JNo6Dv_s7HfH-Km6mYhDy7TnbqXuWRYJcKFWJNodxpJclZp-hiFB6CFTqT41l",
            "https://mycornershop.in/Components/store.aspx", "Test Jatin", "Testing", 1);

        Send_Notification.SendNotificationFromFirebaseCloud("2", "dBOfzChQS72OxkRcgQEbfo:APA91bGi2fQNGu_xJJfPbhQapaKMw7XNLfU3HB1MLYSuPscDf2YTZqfk00SpjY5L2p3FmNnNNBlfSbgBW8cKQH0EaTylDKiRt9s3N8nUFu2M9WmKYX6C74_8GzGp5fKiTKYaPXD-6arR",
            "https://mycornershop.in/Components/store.aspx", "Test Jatin", "Testing", 1);

    }
}