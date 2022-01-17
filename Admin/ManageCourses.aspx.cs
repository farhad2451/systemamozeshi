using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_ManageCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (CheckExistCourse(txtCourseID.Text) == 0)
        {
            AddCourse(txtCourseID.Text, txtCourseName.Text, txtUnit.Text );
            lblError.Text = "درس جدید ثبت گردید";
            lblError.ForeColor = System.Drawing.Color.Green;

            txtCourseID.Text = "";
            txtCourseName.Text = "";
            txtUnit.Text = "";
        }
        else
        {
            lblError.Text = "کد درس تکراری می باشد";
            lblError.ForeColor = System.Drawing.Color.Red;
        }


        GridView1.DataBind();

    }

    private int CheckExistCourse(string CourseID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT Count(CourseID) FROM Courses WHERE CourseID=@CourseID  ";

        cmd.Parameters.Add(new SqlParameter("@CourseID", CourseID));


        conn.Open();
        int intResult = (int)cmd.ExecuteScalar();
        conn.Close();

        return intResult;
    }

    private void AddCourse(string CourseID, string CourseName, string Unit)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "INSERT INTO Courses (CourseID,CourseName,Unit) " +
            " VALUES (@CourseID,@CourseName,@Unit)";

        cmd.Parameters.Add(new SqlParameter("CourseID", CourseID));
        cmd.Parameters.Add(new SqlParameter("CourseName", CourseName));
        cmd.Parameters.Add(new SqlParameter("Unit", Unit));


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();
    }

}
