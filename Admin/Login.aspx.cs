using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(getMd5Hash("123"));

        try
        {
            if (Request.QueryString["login"].ToString() == "out")
                Session.Clear();
        }
        catch { }


    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT COUNT(Username) FROM Admin WHERE UserName=@UserName AND Password=@Password ";

        cmd.Parameters.Add(new SqlParameter("@UserName", txtUsername.Text));
        cmd.Parameters.Add(new SqlParameter("@Password", txtPassword.Text));


        conn.Open();
        int intResult = (int)cmd.ExecuteScalar();
        conn.Close();



        if (intResult == 0)
            lblError.Text = "نام کاربری و یا کلمه عبور نادرست است.<br><br>";
        else
        {
            Session.Add("UserType", "Admin");
            Session.Timeout = 30;
            Response.Redirect("ManageNews.aspx");
        }
    }


    static string getMd5Hash(string input)
    {
        // Create a new instance of the MD5CryptoServiceProvider object.
        MD5 md5Hasher = MD5.Create();

        // Convert the input string to a byte array and compute the hash.
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data 
        // and format each one as a hexadecimal string.
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string.
        return sBuilder.ToString();
    }
}
