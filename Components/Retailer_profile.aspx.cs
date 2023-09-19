using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Retailer_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [WebMethod]

    public static string GetBanners()
    {
        string banner = "";
        Cl_admin d = new Cl_admin();
        d.Type = 71;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        DataSet ds = d.fn_Updatedasboarddata();
        if (ds != null && ds.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in ds.Tables[0].Rows)
            {
                string img = "";
                if (DR["IMAGE_URL"].ToString()!="")
                {
                    img = DR["IMAGE_URL"].ToString();
                }
             
                banner = banner + "<div class=\"bannerpic\"><div class=\"deletebannerbtn\" bbid='"+ DR["BBID"].ToString() + "'><i class=\"fa fa-trash\"></i></div><img class=\"bannerimg\" src=\"https://mycornershop.in/Menu_Pics/" + img+ "\" />" +
                    "<div class=\"ddownloadbtn\" bbid='" + DR["BBID"].ToString() + "'><i class=\"fa fa-download\" img=\"https://mycornershop.in/Menu_Pics/" + img + "\"></i></div></div>";
            }
        }

            return banner;
    }


    [WebMethod]

    public static string InsertBanner(string ImgSource)
    {
        string uploadfile = string.Empty;

        if (ImgSource != "")
        {
            string DocPicFilePath = HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["Profile_images"].ToString());
            DirectoryInfo dInfo = new DirectoryInfo(DocPicFilePath);

            bool IsImageExists = true;
            uploadfile = GetMENUImageName();
            for (int i = 0; i < 1000; i++)
            {
                if (IsImageExists == true)
                {
                    uploadfile = GetMENUImageName();
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


        string banner = "";
        Cl_admin d = new Cl_admin();
        d.Type = 72;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        d.IMAGE_URL = uploadfile;
        DataSet ds = d.fn_Updatedchages();
        return "Y";
    }


    [WebMethod]
    public static string Deletbaner(string bbid)
    {
        Cl_admin d = new Cl_admin();
        d.Type = 73;
        d.RID = HttpContext.Current.Request.Cookies["rid"].Value.ToString();
        d.BBID = bbid;
        d.ACTIVE_FLAG = "N";
        DataSet ds = d.fn_Updatedchages();
        return "Y";
      
    }


    public static string GetMENUImageName()
    {

        Random random = new Random();
        int ran = random.Next(100, 999);

        string x = DateTime.Now.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        string ImageName = "";

        ImageName = "myCornershopUser_img-" + x + ran + ".png";

        return ImageName;
    }

}