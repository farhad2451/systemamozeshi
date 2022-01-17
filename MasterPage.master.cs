using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["StudentID"] != null)
        {
            pnlStudent.Visible = true;
            pnlLogin.Visible = false;
        }
        else if (Session["TeacherID"] != null)
        {
            pnlTeacher.Visible = true;
            pnlLogin.Visible = false;
        }
        else
            pnlLogin.Visible = true;


        GetWellcome();

        WebCounter();

        GetMenuClassCss();

        lblError.Visible = false;
    }

    protected void GetWellcome()
    {
        /*string conString = System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString.ToString();
        string cmdSelect = "select WelcomeText from CollectionTable";
        SqlConnection cnn = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand(cmdSelect, cnn);
        cnn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        string text;

        if (rd.HasRows)
        {
            rd.Read();
            text = (rd.IsDBNull(0) == true) ? "هیچ گونه مطلبی یادداشت نشده است ..." : rd.GetString(0).ToString(); //2 is database mean txtAeinName
        }
        else
        {

            text = "هیچ گونه مطلبی یادداشت نشده است ...";
        }
        ///txtWelcome.Text = text;
        cnn.Close();*/
    }

    private void WebCounter()
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM Statictis", conn);
        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader(); ;
        reader.Read();

        lblTodayVisits.Text = reader["TodayVisits"].ToString();
        lblYesterdayVisits.Text = reader["YesterdayVisits"].ToString();
        lblMonthVisits.Text = reader["MonthVisits"].ToString();
        lblTotalVisits.Text = reader["TotalVisits"].ToString();
        if (DateTime.Now.Day != (int)reader["Day"])
        {
            lblYesterdayVisits.Text = lblTodayVisits.Text;
            lblTodayVisits.Text = "0";
        }
        if (DateTime.Now.Month != (int)reader["Month"])
            lblMonthVisits.Text = "0";

        reader.Close();
        if (Session["Visit"] == null)
        {
            lblTodayVisits.Text = (int.Parse(lblTodayVisits.Text) + 1).ToString();
            lblMonthVisits.Text = (int.Parse(lblMonthVisits.Text) + 1).ToString();
            lblTotalVisits.Text = (int.Parse(lblTotalVisits.Text) + 1).ToString();
            cmd.CommandText = "UPDATE Statictis SET TotalVisits = TotalVisits + 1, YesterdayVisits = " + lblYesterdayVisits.Text +
                    ", MonthVisits = " + lblMonthVisits.Text + ", TodayVisits = " + lblTodayVisits.Text + ", Day = " + DateTime.Now.Day +
                    ", Month = " + DateTime.Now.Month;
            cmd.ExecuteNonQuery();
            Session.Add("Visit", true);
            Session.Timeout = 60;
        }
        conn.Close();
    }

    protected void GetMenuClassCss()
    {
        string test = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1);

        switch (test.ToLower())
        {
            case "default.aspx":
                hlinkHome.CssClass = "current";
                break;
            case "gallery.aspx":
                hlinkGallery.CssClass = "current";
                break;
            case "contactus.aspx":
                hlinkContact.CssClass = "current";
                break;
            case "aboutus.aspx":
                hlinkAbout.CssClass = "current";
                break;
        }
    }

    protected void lbtnLogin_Click(object sender, EventArgs e)
    {

        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;


        conn.Open();
        int intResult = 0;

        if (RadioButtonList1.SelectedValue == "معلم")
        {
            cmd.CommandText = "SELECT COUNT(TeacherID) FROM Teachers WHERE TeacherID=@TeacherID AND Password=@Password";
            cmd.Parameters.Add(new SqlParameter("@Password", txtPassword.Text));
            cmd.Parameters.Add(new SqlParameter("@TeacherID", txtUsername.Text));

            intResult = (int)cmd.ExecuteScalar();
        }
        else
        {
            cmd.CommandText = "SELECT COUNT(StudentID) FROM Students WHERE StudentID=@StudentID AND Password=@Password";
            cmd.Parameters.Add(new SqlParameter("@Password", txtPassword.Text));
            cmd.Parameters.Add(new SqlParameter("@StudentID", txtUsername.Text));

            intResult = (int)cmd.ExecuteScalar();
        }


        if (intResult > 0)
        {
            if (RadioButtonList1.SelectedValue == "معلم")
            {
                Session.Add("TeacherID", txtUsername.Text);
                pnlTeacher.Visible = true;
                pnlLogin.Visible = false;
            }
            else
            {
                Session.Add("StudentID", txtUsername.Text);
                pnlStudent.Visible = true;
                pnlLogin.Visible = false;
            }
        }
        else
        {

            lblError.Text = "نام کاربری یا رمز عبور صحیح نمی باشند";
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Visible = true;
        }


    }


    protected string LinkAddress(string Banner, string Address, string Subject)
    {
        if (Banner.Length > 10)
            return "<a href='" + Address + "' target='_blank'><img border=0 width='210px' height='40px' alt='" + Subject + "' src='" + Banner + "'></a>";

        else if (Subject != "")
            return "<a href='" + Address + "' target='_blank'>" + Subject + "</a>";
        else
            return "<a href='" + Address + "' target='_blank'>" + Address + "</a>";
    }



    protected void lbtnExitStudent_Click(object sender, EventArgs e)
    {
        Session.Remove("StudentID");
        Response.Redirect("Default.aspx");
    }
    protected void lbtnExitTeacher_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherID");
        Response.Redirect("Default.aspx");
    }
}
