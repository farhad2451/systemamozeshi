using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }
    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (txtPasswordNew.Text != txtPasswordNewRepeat.Text)
        {
            lblError.Text = "کلمه های رمز جدید یکسان نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
            return;
        }




        if (Session["StudentID"] != null)
            StudentPassowrdChange();
        else if (Session["TeacherID"] != null)
            TeacherPasswordChange();




        lblError.Text = "اطلاعات ثبت گردید";
        lblError.ForeColor = System.Drawing.Color.Green;
        lblError.Visible = true;

        txtPasswordNew.Text = "";
        txtPasswordNewRepeat.Text = "";
        txtPasswordOLD.Text = "";
    }

    private void StudentPassowrdChange()
    {

        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;
        cmd.CommandText = "SELECT Password FROM Students WHERE StudentID=StudentID ";
        cmd.Parameters.Add(new SqlParameter("@StudentID", Session["StudentID"]));
        conn.Open();
        string strPassword = cmd.ExecuteScalar().ToString();

        if (strPassword == txtPasswordOLD.Text)
        {
            cmd.CommandText = "UPDATE Students SET Password=@Password";
            cmd.Parameters.Add(new SqlParameter("@Password", txtPasswordNew.Text));
            cmd.ExecuteNonQuery();
        }
        else
        {
            lblError.Text = "کلمه رمز قدیم صحیح نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;

        }
        conn.Close();
    }

    private void TeacherPasswordChange()
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;
        cmd.CommandText = "SELECT Password FROM Teachers WHERE TeacherID=@TeacherID ";
        cmd.Parameters.Add(new SqlParameter("@TeacherID", Session["TeacherID"]));
        conn.Open();
        string strPassword = cmd.ExecuteScalar().ToString();

        if (strPassword == txtPasswordOLD.Text)
        {
            cmd.CommandText = "UPDATE Teachers SET Password=@Password";
            cmd.Parameters.Add(new SqlParameter("@Password", txtPasswordNew.Text));
            cmd.ExecuteNonQuery();
        }
        else
        {
            lblError.Text = "کلمه رمز قدیم صحیح نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;

        }
        conn.Close();
    }
}
