using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Security.Cryptography;

/// <summary>
/// Summary description for dal
/// </summary>
public class dal
{
    private SqlConnection con = null;
    private SqlCommand cmd = null;
    private SqlDataReader dr = null;
    private SqlDataAdapter adap = null;
    private string str = "";
    int temp = 0;
    private dal()
    {
        str = ConfigurationManager.ConnectionStrings["ConnDr"].ConnectionString;
    }

    private static dal objdal;

    public static dal GetInstance()
    {
        if (objdal == null)
        {
            objdal = new dal();
        }
        return objdal;
    }

    public int InsertData(string qry)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            cmd = new SqlCommand(qry, con);
            temp = cmd.ExecuteNonQuery();
            return temp;
        }
        catch (Exception ex)
        {
            Console.Write("Error info:" + ex.Message);
            return temp;
        }
        finally
        {
            con.Close();
        }
    }

    public string InsertDataWithOutParameter(string qry)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            cmd = new SqlCommand(qry, con);
            cmd.Parameters["@PRESCRIPTION_ID"].Direction = ParameterDirection.Output;
            temp = cmd.ExecuteNonQuery();
            str = cmd.Parameters["@PRESCRIPTION_ID"].Value.ToString();
            return str;
        }
        catch (Exception ex)
        {
            Console.Write("Error info:" + ex.Message);
            return "";
        }
        finally
        {
            con.Close();
        }
    }
    public string InsertDataWithResultStatus(string qry)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            cmd = new SqlCommand(qry, con);
            str1 = Convert.ToString(cmd.ExecuteScalar());
            return str1;
        }
        catch (Exception ex)
        {
            Console.Write("Error info:" + ex.Message);
            return "";
        }
        finally
        {
            con.Close();
        }
    }

    DataSet ds = new DataSet();


    public DataTable GetDataTable(string sSql)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            adap = new SqlDataAdapter(sSql, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            return ds.Tables[0];
        }
        catch (Exception e)
        {
            Console.Write("Error info:" + e.Message);
            return null;
        }
        finally
        {
            con.Close();
        }
    }
    public DataSet GetDataSet(string sSql)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            adap = new SqlDataAdapter(sSql, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            return ds;
        }
        catch (Exception e)
        {
            Console.Write("Error info:" + e.Message);
            return null;
        }
        finally
        {
            con.Close();
        }
    }
    public int ExecuteQueryIntXML(SqlCommand cmd)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            cmd.Connection = con;
            int temp = cmd.ExecuteNonQuery();
            return temp;
        }
        catch (Exception EX)
        {
            Console.Write("Error info:" + EX.Message);
            return -1;
        }
        finally
        {
            con.Close();
        }
    }

    public static bool ValidatePassword(string sPasswordEnter, string sPassword)
    {
        if (sPassword.Length < 128)
        {
            throw new ArgumentException("correctHash must be 128 hex characters!");
        }
        string salt = sPassword.Substring(0, 64);
        sPassword = sPassword.Substring(64, 64);
        sPasswordEnter = Sha256Hex(salt + sPasswordEnter);
        return string.Compare(sPassword, sPasswordEnter) == 0;
    }

    private static string BytesToHex(byte[] bToConvert)
    {
        StringBuilder s = new StringBuilder(bToConvert.Length * 2);
        foreach (byte b in bToConvert)
        {
            s.Append(b.ToString("x2"));
        }
        return s.ToString();
    }

    private static string GetRandomSalt()
    {
        RNGCryptoServiceProvider random = new RNGCryptoServiceProvider();
        byte[] salt = new byte[32]; //256 bits
        random.GetBytes(salt);
        return BytesToHex(salt);
    }

    public static string HashPassword(string sPassword)
    {
        string salt = GetRandomSalt();
        string hash = Sha256Hex(salt + sPassword);
        return salt + hash;
    }

    private static string Sha256Hex(string sToHash)
    {
        SHA256Managed hash = new SHA256Managed();
        byte[] utf8 = UTF8Encoding.UTF8.GetBytes(sToHash);
        return BytesToHex(hash.ComputeHash(utf8));
    }



    public string str1 { get; set; }

    public string InsertDataWithOutMessageParameter(string qry, string ResultMeaage, string ResultStatus)
    {
        try
        {
            con = new SqlConnection(str);
            con.Open();
            cmd = new SqlCommand(qry, con);
            cmd.Parameters.Add(ResultMeaage, SqlDbType.VarChar, 500);
            cmd.Parameters.Add(ResultStatus, SqlDbType.Int, 4);
            cmd.Parameters[ResultMeaage].Direction = ParameterDirection.Output;
            cmd.Parameters[ResultStatus].Direction = ParameterDirection.Output;
            temp = cmd.ExecuteNonQuery();
            string str1 = cmd.Parameters[ResultMeaage].Value.ToString();
            string str2 = Convert.ToString(cmd.Parameters[ResultStatus].Value);
            return str1 + "-1@1-" + str2;
        }
        catch (Exception ex)
        {
            Console.Write("Error info:" + ex.Message);
            return "";
        }
        finally
        {
            con.Close();
        }
    }
}