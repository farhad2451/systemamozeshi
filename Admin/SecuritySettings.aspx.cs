using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;

public partial class Admin_SecuritySettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;

        if (count > 4)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }


    static int count = 0;

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {

        if (txtPasswordNew.Text != txtPasswordNewRepeat.Text)
        {
            lblError.Text = "کلمه های رمز جدید یکسان نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
            return;
        }


        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT Password FROM Admin ";


        conn.Open();
        string strPassword = cmd.ExecuteScalar().ToString();

        if (strPassword == getMd5Hash(txtPasswordOLD.Text))
        {
            cmd.CommandText = "UPDATE Admin SET Password=@Password";
            cmd.Parameters.Add(new SqlParameter("@Password", getMd5Hash(txtPasswordNew.Text)));
            cmd.ExecuteNonQuery();
        }
        else
        {
            lblError.Text = "کلمه رمز قدیم صحیح نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
            count++;
            return;

        }

        conn.Close();


        lblError.Text = "اطلاعات ثبت گردید";
        lblError.ForeColor = System.Drawing.Color.Green;
        lblError.Visible = true;

        txtPasswordNew.Text = "";
        txtPasswordNewRepeat.Text = "";
        txtPasswordOLD.Text = "";
    }

    protected void btnChangeUsername_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT Username FROM Admin ";



        conn.Open();
        string strUsername = cmd.ExecuteScalar().ToString();


        if (strUsername == txtUsernameOLD.Text)
        {
            cmd.CommandText = "UPDATE Admin SET Username=@Username";
            cmd.Parameters.Add(new SqlParameter("@UserName", txtUsernameNEW.Text));
            cmd.ExecuteNonQuery();
        }
        else
        {
            lblError.Text = "نام کاربری قدیم صحیح نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
            count++;
            return;
        }

        conn.Close();


        lblError.Text = "اطلاعات ثبت گردید";
        lblError.ForeColor = System.Drawing.Color.Green;
        lblError.Visible = true;



        txtUsernameNEW.Text = "";
        txtUsernameOLD.Text = "";
    }

    static string getMd5Hash(string input)
    {
        MD5 md5Hasher = MD5.Create();
        byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        return sBuilder.ToString();
    }
}
