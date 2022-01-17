using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_SchoolInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "UPDATE SchoolInfo SET SchoolName=@SchoolName , SchoolEmail=@SchoolEmail , SchoolAddress=@SchoolAddress WHERE (ID=N'a')";

        cmd.Parameters.Add(new SqlParameter("@SchoolName", txtName.Text));
        cmd.Parameters.Add(new SqlParameter("@SchoolEmail", txtEmail.Text));
        cmd.Parameters.Add(new SqlParameter("@SchoolAddress", txtAddress.Text));


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        lblErrorEdit.Text = "ثبت اطلاعات انجام گردید";
        lblErrorEdit.ForeColor = System.Drawing.Color.Green;
    }
}
