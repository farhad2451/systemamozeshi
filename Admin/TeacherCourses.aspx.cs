using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_TeacherCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

        //if (CheckExist(cboClasses.Text, cboCourses.SelectedValue, cboTeachers.SelectedValue) == false)
        //{

        AddCourseToTeacher(cboClasses.Text, cboCourses.SelectedValue, cboTeachers.SelectedValue);

        lblError.Text = "اطلاعات ثبت گردید";
        lblError.ForeColor = System.Drawing.Color.Green;
        lblError.Visible = true;

        GridView1.DataBind();

        //}
        //else
        //{
        //    lblError.Text = "این درس در اختیار معلم دیگری می باشد";
        //    lblError.ForeColor = System.Drawing.Color.Red;
        //}
    }

    //private bool CheckExist(string ClassName, string CourseID, string TeacherID)
    //{
    //    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandType = System.Data.CommandType.Text;
    //    cmd.Connection = conn;

    //    cmd.CommandText = "SELECT Count(TeacherID) FROM Classes WHERE (ClassName=@ClassName AND CourseID=@CourseID AND TeacherID=@TeacherID)  ";

    //    cmd.Parameters.Add(new SqlParameter("@ClassName", ClassName));
    //    cmd.Parameters.Add(new SqlParameter("@CourseID", CourseID));
    //    cmd.Parameters.Add(new SqlParameter("@TeacherID", TeacherID));



    //    conn.Open();
    //    int intResult = (int)cmd.ExecuteScalar();
    //    conn.Close();


    //    if (intResult > 0)
    //        return true;
    //    else
    //        return false;
    //}

    private void AddCourseToTeacher(string ClassName, string CourseID, string TeacherID)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "UPDATE Classes SET TeacherID=@TeacherID WHERE (ClassName=@ClassName AND CourseID=@CourseID)";

        cmd.Parameters.Add(new SqlParameter("@ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("@CourseID", CourseID));
        cmd.Parameters.Add(new SqlParameter("@TeacherID", TeacherID));


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();
    }

}
