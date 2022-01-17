using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (CheckExistStudent(txtStudentID.Text) == 0)
        {
            AddStudent(txtStudentID.Text, txtFirstName.Text, txtLastName.Text, txtIdNumber.Text, txtFatherName.Text, txtEducationYear.Text, txtEmail.Text, txtBirthDate.Text, cboClassesName.Text, txtPassword.Text);
            lblError.Text = "دانش آموز ثبت گردید";
            lblError.ForeColor = System.Drawing.Color.Green;
            txtEducationYear.Text = "";
            txtFatherName.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtIdNumber.Text = "";
            txtPassword.Text = "";
            txtStudentID.Text = "";
            txtEmail.Text = "";
            txtBirthDate.Text = "";

        }
        else
        {
            lblError.Text = "کد دانش آموز تکراری می باشد";
            lblError.ForeColor = System.Drawing.Color.Red;
        }


      
    }
    private int CheckExistStudent(string StudentID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT Count(StudentID) FROM Students WHERE StudentID=@StudentID  ";

        cmd.Parameters.Add(new SqlParameter("@StudentID", StudentID));


        conn.Open();
        int intResult = (int)cmd.ExecuteScalar();
        conn.Close();

        return intResult;
    }

    private void AddStudent(string StudentID, string FirstName, string LastName, string IdNumber, string FatherName, string EducationYear, string AddressEmail, string BirthDate, string ClassName, string Password)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "INSERT INTO Students  (StudentID, FirstName, LastName, FatherName, IdNumber, EducationYear, BirthDate, AddressEmail, ClassName, Password) " +
            " VALUES (@StudentID, @FirstName, @LastName, @FatherName, @IdNumber, @EducationYear, @BirthDate, @AddressEmail, @ClassName, @Password)";

        cmd.Parameters.Add(new SqlParameter("StudentID", StudentID));
        cmd.Parameters.Add(new SqlParameter("FirstName", FirstName));
        cmd.Parameters.Add(new SqlParameter("LastName", LastName));
        cmd.Parameters.Add(new SqlParameter("FatherName", FatherName));
        cmd.Parameters.Add(new SqlParameter("IdNumber", IdNumber));
        cmd.Parameters.Add(new SqlParameter("EducationYear", EducationYear));
        cmd.Parameters.Add(new SqlParameter("BirthDate", BirthDate));
        cmd.Parameters.Add(new SqlParameter("AddressEmail", AddressEmail));
        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("Password", Password));


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();
    }
}