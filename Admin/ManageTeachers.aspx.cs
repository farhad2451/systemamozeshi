using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_ManageTeachers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (CheckExistTeacher(txtTeacherID.Text) == 0)
        {
            AddTeacher(txtTeacherID.Text , txtFirstName.Text, txtLastName.Text, txtIdNumber.Text, txtFatherName.Text, txtEmail.Text , txtEducationYear.Text, txtPassword.Text);
            lblError.Text = "مدرس جدید ثبت گردید";
            lblError.ForeColor = System.Drawing.Color.Green;
            txtFatherName.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtIdNumber.Text = "";
            txtPassword.Text = "";
            txtTeacherID.Text = "";
            txtEducationYear.Text = "";
            txtEmail.Text = "";
        }
        else
        {
            lblError.Text = "کد مدرس تکراری می باشد";
            lblError.ForeColor = System.Drawing.Color.Red;
        }


        GridView1.DataBind();

    }

    private int CheckExistTeacher(string TeacherID)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT Count(TeacherID) FROM Teachers WHERE TeacherID=@TeacherID  ";

        cmd.Parameters.Add(new SqlParameter("@TeacherID", TeacherID));


        conn.Open();
        int intResult = (int)cmd.ExecuteScalar();
        conn.Close();

        return intResult;
    }

    private void AddTeacher(string TeacherID, string FirstName, string LastName, string IdNumber, string FatherName, string AddressEmail , string EducationYear, string Password)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "INSERT INTO Teachers (TeacherID, FirstName, LastName, IdNumber, FatherName, EducationYear, AddressEmail, Password) " +
            " VALUES (@TeacherID, @FirstName, @LastName, @IdNumber, @FatherName, @EducationYear, @AddressEmail, @Password)";

        cmd.Parameters.Add(new SqlParameter("TeacherID", TeacherID));
        cmd.Parameters.Add(new SqlParameter("FirstName", FirstName));
        cmd.Parameters.Add(new SqlParameter("LastName", LastName));
        cmd.Parameters.Add(new SqlParameter("IdNumber", IdNumber));
        cmd.Parameters.Add(new SqlParameter("FatherName", FatherName));
        cmd.Parameters.Add(new SqlParameter("EducationYear", EducationYear));
        cmd.Parameters.Add(new SqlParameter("AddressEmail", AddressEmail));
        cmd.Parameters.Add(new SqlParameter("Password", Password));


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();
    }

}
