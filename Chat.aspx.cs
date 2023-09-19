using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]

    public static string Method_GetOrderDetailsByHeaderId(string HeaderId)
    {
        string items = "";
        try
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.CID = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.Type = 126;
            ds = cr.fnInsertData();
            if (ds != null && ds.Tables.Count > 0)
            {
                string itemsrow = "";
                foreach (DataRow Dr in ds.Tables[1].Rows)
                {
                    itemsrow = itemsrow + "<div class=\"itemrow\"><div class=\"item-img\">" +
                                          "<img style=\"padding: 15px;  border-radius: 15px;\" src=\"https://mycornershop.in/Menu_Pics/" + Dr["IMAGE_PATH"].ToString() + "\" />" +
                                          "</div><div class=\"item-details\">" +
                                          "<p class=\"mb-0 itemtitle\">" + Dr["MNAME"].ToString() + "</p>" +
                                          "<div>Qty: " + Dr["QTY"].ToString() + " </div>" +
                                          "<div>Price: ₹ " + Dr["PRICE"].ToString() + "</div></div></div>";
                }

                string orderlist = "<div class=\"order-header p-2\"><h6 class=\"mb-0\">Order no #" + ds.Tables[0].Rows[0]["HEADER_ID"].ToString() + "</h6>" +
                                    "</div><div class=\"viewordersdetails\">View Order</div><div class=\"order-body\">" + itemsrow + "</div><div class=\"order-footer\">" +
                                    "<div class=\"ordertotalprice\"><div class=\"total-text\">" +
                                    "<div>Delivery Charge</div><div class=\"d-none\">Other Charge</div><h4>Total:</h4>" +
                                    "</div><div class=\"total-amount\"><div>₹ " + ds.Tables[0].Rows[0]["DELIVERY_CHARGES"].ToString() + "</div>" +
                                    "<div class=\"d-none\">" + ds.Tables[0].Rows[0]["HEADER_ID"].ToString() + "</div><h4>₹  " + ds.Tables[0].Rows[0]["TOTAL_AMOUNT"].ToString() + "</h4></div></div></div>";

                return items = orderlist;
            }

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return items;
    }

    [WebMethod]

    public static string Method_GetTicketidorgenerateticket(string HeaderId)
    {
        string result = "";
        try
        {
            DataSet ds = new DataSet();
            Cl_chats cr = new Cl_chats();
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.cid = HttpContext.Current.Request.Cookies["cid"].Value.ToString();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.userId = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
            cr.Type = 1;
            ds = cr.fnchatfunctions();
            string msgrowcust = "";
            string msgrowTeam = "";
            string ChatHeader = ""; string chatbody = ""; string chatfooter = "";
            if (ds != null && ds.Tables.Count > 0)
            {

                msgrowcust = "";
                msgrowTeam = "";
                foreach (DataRow Dr in ds.Tables[1].Rows)
                {

                    string img = "";
                    if (Dr["ImageUrl"].ToString() != "")
                    {

                        img = "<div style=\"width: 200px;height: 200px;border-radius: 15px;\"><img onclick='fnopenimage($(this))' style=\"width:100%; height:100%;border-radius: 15px;\" src=\"/DispatchOrderPicture/" + Dr["ImageUrl"].ToString() + "\"/></div>";
                    }
                    if (Dr["UserType"].ToString().ToLower() == "customer")
                    {
                        msgrowcust = msgrowcust + "<div chattrxid='" + Dr["ChattrxId"].ToString() + "' class=\"replayto chatmsg\"><div class=\"todiv\">" +
                    "<div class=\"replaytotime\"><strong>Customer</strong> &nbsp;&nbsp;" +
                    "<span class=\"float-right\" style=\"font-size: 12px;\">" + Dr["ResponseDate"].ToString() + " ," + Dr["ResponseTime"].ToString() + "</span></div><div>" + img + "</div>" +
                     Dr["Msg"].ToString() + "</div></div>";
                    }
                    else
                    {
                        msgrowcust = msgrowcust + "<div responseby='" + Dr["ResponseBy"].ToString() + "' chattrxid='" + Dr["ChattrxId"].ToString() + "' class=\"replayfrom chatmsg\"><div class=\"fromdiv\">" +
                    "<div class=\"replayfromtime\"><strong>Support Team</strong> &nbsp;&nbsp;" +
                    "<span class=\"float-right\" style=\"font-size: 12px;\">" + Dr["ResponseDate"].ToString() + " ," + Dr["ResponseTime"].ToString() + "</span></div><div>" + img + "</div>" +
                     Dr["Msg"].ToString() + "</div></div>";
                    }

                }

            }

            chatbody = "<div class=\"chatbody\"><div id=\"appendchatbody\" class=\"chatshow\">" +
                 "" + msgrowcust + "" +
                 "</div></div>";

            string dotcolor = "";
            if (ds.Tables[0].Rows[0]["Status"].ToString().ToLower() == "closed")
            {
                chatfooter = "<div class=\"chatfooter\"><div class=\"chatreplay p-3\" style=\"background: #ebebeb;\">" +
                                  "<div class=\"row w-100\"><div class=\"col-sm-12\" style=\"text-align:center;font-weight: bold;\">Ticket is Closed  <button onclick=\"fnopenticketagain($(this)," + ds.Tables[0].Rows[0]["ChatId"].ToString() + ")\"  class=\"btn btn-primary\">Active Again</button></div></div>" +
                              "</div></div>";
                dotcolor = "style=\"background: red;\"";
            }
            else
            {
                chatfooter = "<div class=\"chatfooter\"><div class=\"chatreplay\">" +
                               "<div class=\"replay__input\"><textarea id=\"replaytext\"" +
                               "class=\"form-control replayinput replaytext\" placeholder=\"Write here...\"></textarea>" +
                               "<div class=\"image-upload\"><label for=\"file-input\">" +
                               "<i class=\"fa fa-paperclip\" aria-hidden=\"true\"></i></label>" +
                               "<input id=\"file-input\" type=\"file\" /></div></div>" +
                               "<div class=\"send__btn\"><button id=\"sendbutton\" chatid='" + ds.Tables[0].Rows[0]["ChatId"].ToString()
                               + "' onclick=\"fnsendreplay($(this))\"" +
                               "class=\"btn btn-primary w-100\"><span class=\"sendtext\">Send</span>" +
                               "<i class=\"fa fa-paper-plane\" aria-hidden=\"true\"></i></button>" +
                               "</div></div></div>";
            }

            ChatHeader = "<div class=\"chatheader\"><div><h6>Ticket No: #" + ds.Tables[0].Rows[0]["ChatId"].ToString() + "</h6>" +
                                 "</div><div class=\"activedot\"><div " + dotcolor + " class=\"activelight\"></div>" +
                                 "" + ds.Tables[0].Rows[0]["Status"].ToString() + "</div></div></div</div>";


            return result = ChatHeader + chatbody + chatfooter;

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return result;
    }

    [WebMethod]
    public static string Method_RetailerGetOrderDetailsByHeaderId(string HeaderId)
    {
        string items = "";
        try
        {
            DataSet ds = new DataSet();
            cl_resturant cr = new cl_resturant();
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.Type = 126;
            ds = cr.fnInsertData();
            if (ds != null && ds.Tables.Count > 0)
            {
                string itemsrow = "";
                foreach (DataRow Dr in ds.Tables[1].Rows)
                {
                    itemsrow = itemsrow + "<div class=\"itemrow\"><div class=\"item-img\">" +
                                          "<img style=\"padding: 15px;  border-radius: 15px;\" src=\"https://mycornershop.in/Menu_Pics/" + Dr["IMAGE_PATH"].ToString() + "\" />" +
                                          "</div><div class=\"item-details\">" +
                                          "<p class=\"mb-0 itemtitle\">" + Dr["MNAME"].ToString() + "</p>" +
                                          "<div>Qty: " + Dr["QTY"].ToString() + " </div>" +
                                          "<div>Price: ₹ " + Dr["PRICE"].ToString() + "</div></div></div>";
                }

                string orderlist = "<div custid='" + ds.Tables[0].Rows[0]["CID"].ToString() + "' class=\"order-header p-2\"><div class=\"row\"><h6 class=\"mb-0 col-12\">Order no #" + ds.Tables[0].Rows[0]["HEADER_ID"].ToString() + "</h6>" +
                                    "<div class=\"col-12\"><strong>" + ds.Tables[0].Rows[0]["C_Name"].ToString() + "</strong>-<strong><a href=\"tel:" + ds.Tables[0].Rows[0]["C_NUMBER"].ToString() + " \">" + ds.Tables[0].Rows[0]["C_NUMBER"].ToString() + "</a></strong></div>" +
                                    "</div></div><div class=\"viewordersdetails\">View Order</div><div class=\"order-body\">" + itemsrow + "</div><div class=\"order-footer\">" +
                                    "<div class=\"ordertotalprice\"><div class=\"total-text\">" +
                                    "<div>Delivery Charge</div><div class=\"d-none\">Other Charge</div><h4>Total:</h4>" +
                                    "</div><div class=\"total-amount\"><div>₹ " + ds.Tables[0].Rows[0]["DELIVERY_CHARGES"].ToString() + "</div>" +
                                    "<div class=\"d-none\">" + ds.Tables[0].Rows[0]["HEADER_ID"].ToString() + "</div><h4>₹  " + ds.Tables[0].Rows[0]["TOTAL_AMOUNT"].ToString() + "</h4></div></div></div>";

                return items = orderlist;
            }

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return items;
    }

    [WebMethod]
    public static string Method_RetailerGetTicketidorgenerateticket(string HeaderId)
    {
        string result = "";
        try
        {
            DataSet ds = new DataSet();
            Cl_chats cr = new Cl_chats();
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.userId = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            cr.Type = 3;
            ds = cr.fnchatfunctions();
            string msgrowcust = "";
            string msgrowTeam = "";
            string ChatHeader = ""; string chatbody = ""; string chatfooter = "";
            if (ds != null && ds.Tables.Count > 0)
            {

                msgrowcust = "";
                msgrowTeam = "";
                foreach (DataRow Dr in ds.Tables[1].Rows)
                {

                    string img = "";
                    if (Dr["ImageUrl"].ToString() != "")
                    {

                        img = "<div style=\"width: 200px;height: 200px;border-radius: 15px;\"><img onclick='fnopenimage($(this))' style=\"width:100%; height:100%;border-radius: 15px;\" src=\"/DispatchOrderPicture/" + Dr["ImageUrl"].ToString() + "\"/></div>";
                    }
                    if (Dr["UserType"].ToString().ToLower() == "customer")
                    {
                        msgrowcust = msgrowcust + "<div responseby='" + Dr["ResponseBy"].ToString() + "' chattrxid='" + Dr["ChattrxId"].ToString() + "' class=\"replayfrom chatmsg\"><div class=\"fromdiv\">" +
                       "<div class=\"replayfromtime\"><strong>Customer</strong> &nbsp;&nbsp;" +
                       "<span class=\"float-right\" style=\"font-size: 12px;\">" + Dr["ResponseDate"].ToString() + " ," + Dr["ResponseTime"].ToString() + "</span></div><div>" + img + "</div>" +
                        Dr["Msg"].ToString() + "</div></div>";

                    }
                    else
                    {
                        msgrowcust = msgrowcust + "<div chattrxid='" + Dr["ChattrxId"].ToString() + "' class=\"replayto chatmsg\"><div class=\"todiv\">" +
                    "<div class=\"replaytotime\"><strong>Support Team</strong> &nbsp;&nbsp;" +
                    "<span class=\"float-right\" style=\"font-size: 12px;\">" + Dr["ResponseDate"].ToString() + " ," + Dr["ResponseTime"].ToString() + "</span></div><div>" + img + "</div>" +
                     Dr["Msg"].ToString() + "</div></div>";
                    }



                }

            }


            chatbody = "<div class=\"chatbody\"><div id=\"appendchatbody\" class=\"chatshow\">" +
                 "" + msgrowcust + "" +
                 "</div></div>";

            string checktoggle = "";
            string dotcolor = "";
            if (ds.Tables[0].Rows[0]["Status"].ToString().ToLower() == "closed")
            {
                chatfooter = "<div class=\"chatfooter\"><div class=\"chatreplay p-3\" style=\"background: #ebebeb;\">" +
                                  "<div class=\"row w-100\"><div class=\"col-sm-12\" style=\"text-align:center;font-weight: bold;\">Ticket is Closed  <button onclick=\"fnopenticketagain($(this)," + ds.Tables[0].Rows[0]["ChatId"].ToString() + ")\" class=\"btn btn-primary\">Active Again</button></div></div>" +
                              "</div></div>";
                checktoggle = "active";
                dotcolor = "style=\"background: red;\"";
            }
            else
            {
                chatfooter = "<div class=\"chatfooter\"><div class=\"chatreplay\">" +
                               "<div class=\"replay__input\"><textarea id=\"replaytext\"" +
                               "class=\"form-control replayinput replaytext\" placeholder=\"Write here...\"></textarea>" +
                               "<div class=\"image-upload\"><label for=\"file-input\">" +
                               "<i class=\"fa fa-paperclip\" aria-hidden=\"true\"></i></label>" +
                               "<input id=\"file-input\" type=\"file\" /></div></div>" +
                               "<div class=\"send__btn\"><button id=\"sendbutton\" chatid='" + ds.Tables[0].Rows[0]["ChatId"].ToString()
                               + "' onclick=\"fnsendreplay($(this))\"" +
                               "class=\"btn btn-primary w-100\"><span class=\"sendtext\">Send</span>" +
                               "<i class=\"fa fa-paper-plane\" aria-hidden=\"true\"></i></button>" +
                               "</div></div></div>";
            }



            string switchbtn = "<button onclick=\"fnclosechat($(this)," + ds.Tables[0].Rows[0]["ChatId"].ToString() + ")\" type=\"button\" class=\"btn btn-sm btn-secondary btn-toggle " + checktoggle + "\" data-toggle=\"button\" aria-pressed=\"false\" autocomplete=\"off\"><div class=\"handle\"></div></button>";
            //string refreshbtn = "<button class='btn btn-primary btnStyle'>Refresh</button>";

            ChatHeader = "<div class=\"chatheader\"><div>" +
                                "<div>" + switchbtn + "</div> " +
                                "</div></div></div</div>";

            //ChatHeader = "<div class=\"chatheader\"><div><h6>Ticket No: #" + ds.Tables[0].Rows[0]["ChatId"].ToString() + "</h6>" +
            //                    "<div style=\"float: right;margin-top: -35px;\"><div>Close Ticket</div>" +
            //                    "<label style=\"margin-left: 10px;\" class=\"switch\">" +
            //                    "<input onchange=\"fnclosechat($(this)," + ds.Tables[0].Rows[0]["ChatId"].ToString() + ")\" type=\"checkbox\" " + checktoggle + " />" +
            //                    "<span class=\"slider round\"></span></label></div> " +
            //                    "</div><div class=\"activedot\"><div " + dotcolor + " class=\"activelight\"></div>" +
            //                    "" + ds.Tables[0].Rows[0]["Status"].ToString() + "</div></div></div</div>";

            return result = ChatHeader + chatbody + chatfooter;

        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return result;
    }

    [WebMethod]
    public static string Method_InsertMsg(string Msg, string ImageUrl, string chatid,
        string mimetype, string ResponseTime, string header_id, string receiverid)
    {
        string status = "";
        try
        {
            string userid = "";
            if (HttpContext.Current.Request.Cookies["user_type"].Value.ToString().ToLower() == "customer")
            {
                userid = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
            }
            else
            {
                userid = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            }
            DataSet ds = new DataSet();
            Cl_chats cr = new Cl_chats();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.userId = userid;
            cr.Msg = Msg;
            cr.ImageUrl = savedocumentinfolder(ImageUrl, mimetype);
            cr.ChatID = chatid;
            cr.ResponseBy = userid;
            cr.Header_ID = cl_encrypt.Decrypt(header_id);
            cr.UserType = HttpContext.Current.Request.Cookies["user_type"].Value.ToString();
            cr.ResponseTime = ResponseTime;
            cr.Type = 2;
            ds = cr.fnchatfunctions();
            if (ds != null && ds.Tables.Count > 0)
            {
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (HttpContext.Current.Request.Cookies["user_type"].Value.ToString().ToLower() == "customer")
                    {
                        SendNotificationFromFirebaseecodentbusiness(HttpContext.Current.Request.Cookies["rid"].Value.ToString()
                      , dr["DEVICE_ID"].ToString(), "https://mycornershop.in/Chat.aspx?headerid=" + HttpUtility.UrlEncode(header_id) + "", "ecoDent Chat Alert", Msg, 1);

                        insertNotification(userid, dr["USER_ID"].ToString(), "Chat Alert", Msg, "Retailer", "https://mycornershop.in/Chat.aspx?headerid=" + HttpUtility.UrlEncode(header_id) + "");
                    }
                    else
                    {
                        SendNotificationFromFirebaseecodent(HttpContext.Current.Request.Cookies["rid"].Value.ToString()
                           , dr["DEVICE_ID"].ToString(), "https://mycornershop.in/Chat.aspx?headerid=" + HttpUtility.UrlEncode(header_id) + "", "ecoDent Chat Alert", Msg, 1);

                        insertNotification(userid, dr["USER_ID"].ToString(), "Chat Alert", Msg, "Customer", "https://mycornershop.in/Chat.aspx?headerid=" + HttpUtility.UrlEncode(header_id) + "");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }
        return status;
    }

    public static string savedocumentinfolder(string ImgSource, string docmime)
    {
        string uploadfile = string.Empty;
        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["DispatchOrderPicture"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName(docmime);
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName(docmime);
                    if (dInfo.GetFiles(uploadfile).Length <= 0)
                    {
                        IsImageExists = false;
                        break;
                    }
                }
            }


            using (FileStream fs = new FileStream(DocPicFilePath + uploadfile, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(ImgSource);
                    bw.Write(data);
                    bw.Close();
                }
            }

        }

        return uploadfile;
    }

    public static string GetMENUImageName(string docmime)
    {
        string ImageName = "";
        if (docmime == "pdf")
        {
            Random random = new Random();
            int ran = random.Next(100, 999);
            string x = DateTime.Now.ToString("yyyyMMdd-", CultureInfo.InvariantCulture);
            ImageName = "Chat-PDF-" + x + ran + ".pdf";
        }
        else
        {
            Random random = new Random();
            int ran = random.Next(100, 999);
            string x = DateTime.Now.ToString("yyyyMMdd-", CultureInfo.InvariantCulture);
            ImageName = "Chat-Image-" + x + ran + ".png";

        }


        return ImageName;
    }


    [WebMethod]
    public static string Method_fnclosechat(string HeaderId, string chatid)
    {
        string result = "";
        try
        {
            string userid = "";
            if (HttpContext.Current.Request.Cookies["user_type"].Value.ToString().ToLower() == "customer")
            {
                userid = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
            }
            else
            {
                userid = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            }
            DataSet ds = new DataSet();
            Cl_chats cr = new Cl_chats();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.userId = userid;
            cr.ChatID = chatid;
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.Type = 4;
            ds = cr.fnchatfunctions();
        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
        }
        return result;
    }


    [WebMethod]
    public static string Method_fnactivatechat(string HeaderId, string chatid)
    {
        string result = "";
        try
        {
            string userid = "";
            if (HttpContext.Current.Request.Cookies["user_type"].Value.ToString().ToLower() == "customer")
            {
                userid = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
            }
            else
            {
                userid = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            }
            DataSet ds = new DataSet();
            Cl_chats cr = new Cl_chats();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.userId = userid;
            cr.ChatID = chatid;
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.Type = 5;
            ds = cr.fnchatfunctions();
        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
        }
        return result;
    }

    [WebMethod]
    public static string checkMsg(string HeaderId, string chatid)
    {
        string result = "N";
        try
        {
            string userid = "";
            if (HttpContext.Current.Request.Cookies["user_type"].Value.ToString().ToLower() == "customer")
            {
                userid = HttpContext.Current.Request.Cookies["user_id"].Value.ToString();
            }
            else
            {
                userid = HttpContext.Current.Request.Cookies["admin_user_id"].Value.ToString();
            }
            DataSet ds = new DataSet();
            Cl_chats cr = new Cl_chats();
            cr.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
            cr.userId = userid;
            cr.ChatID = chatid;
            cr.Header_ID = cl_encrypt.Decrypt(HeaderId);
            cr.Type = 6;
            ds = cr.fnchatfunctions();
            if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                result = ds.Tables[0].Rows[0]["Msg"].ToString();
            }
        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
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
     
    public static string insertNotification(string Sender_User_ID, string Receiver_User_ID, string Title, string Message, string Sent_To, string LinkHref)
    {
        string RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        string str = "EXEC PROC_CRT_RESTURANT @TYPE='103',@RID = '" + RID + "',@Sender_User_ID = '" +
            Sender_User_ID + "',@TITLE = '" + Title + "',@COMMENT = '" + Message + "',@Receiver_User_ID = '" +
            Receiver_User_ID + "',@Sent_To = '" + Sent_To + "',@LinkHref = '" + LinkHref + "'";
        dal d = dal.GetInstance();
        DataSet ds = new DataSet();
        ds = d.GetDataSet(str);  
        
        return "1";
    }
}