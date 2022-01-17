using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SetMarks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        AddMark(cboStudents.SelectedValue, cboClasses.Text, cboCourses.SelectedValue, txtMark.Text, txtExamDate.Text, txtComment.Text);

        txtComment.Text = "";
        txtExamDate.Text = "";
        txtMark.Text = "";
        lblError.Text = "اطلاعات ثبت گردید";
        lblError.ForeColor = System.Drawing.Color.Green;
        lblError.Visible = true;

        GridView1.DataBind();

    }

    private void AddMark(string StudentID, string ClassName, string CourseID, string Mark, string ExamDate, string Comment)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "INSERT INTO Marks (StudentID, ClassName, CourseID, Mark, ExamDate, Comment) VALUES (@StudentID, @ClassName, @CourseID, @Mark, @ExamDate, @Comment) ";

        cmd.Parameters.Add(new SqlParameter("@StudentID", StudentID));
        cmd.Parameters.Add(new SqlParameter("@ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("@CourseID", CourseID));
        cmd.Parameters.Add(new SqlParameter("@Mark", Mark));
        cmd.Parameters.Add(new SqlParameter("@ExamDate", ExamDate));
        cmd.Parameters.Add(new SqlParameter("@Comment", Comment));


        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

    }


    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        try
        {
            lblClassName.Text = cboClasses.Text;
            lblCourseName.Text = cboCourses.SelectedItem.Text;
        }
        catch { }
    }
}
