using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SetStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

        if (!CheckExist(cboStudents.SelectedValue, cboClasses.Text, cboCourses.SelectedValue))
        {
            AddStatus(cboStudents.SelectedValue, cboClasses.Text, cboCourses.SelectedValue, txtComment.Text);

            txtComment.Text = "";
            lblError.Text = "اطلاعات ثبت گردید";
            lblError.ForeColor = System.Drawing.Color.Green;
            lblError.Visible = true;

            GridView1.DataBind();
        }
        else
        {
            txtComment.Text = "";
            lblError.Text = "قبلا برای این دانش آموز در این درس وضعیت درسی نوشته شده است.";
            lblError.Text += "<br/>";
            lblError.Text += "برای ویرایش آن از لیست زیر نام آن را پیدا نمایید.";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
        }
    }

    private bool CheckExist(string StudentID, string ClassName, string CourseID)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT COUNT(StudentID) FROM Status WHERE StudentID=@StudentID AND ClassName=@ClassName AND CourseID=@CourseID";

        cmd.Parameters.Add(new SqlParameter("@StudentID", StudentID));
        cmd.Parameters.Add(new SqlParameter("@ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("@CourseID", CourseID));


        conn.Open();

        if ((int)cmd.ExecuteScalar() > 0)
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }






    }

    private void AddStatus(string StudentID, string ClassName, string CourseID, string Comment)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "INSERT INTO Status (StudentID, ClassName, CourseID, Comment) VALUES (@StudentID, @ClassName, @CourseID, @Comment) ";

        cmd.Parameters.Add(new SqlParameter("@StudentID", StudentID));
        cmd.Parameters.Add(new SqlParameter("@ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("@CourseID", CourseID));
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
