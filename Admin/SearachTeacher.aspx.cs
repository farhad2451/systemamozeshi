using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SearachTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (strTemp != "")
            SqlDataSource1.SelectCommand = "SELECT * FROM Teachers WHERE " + strTemp;
    }

    static string strTemp = "";

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string strAnd = "";
        strTemp = "";

        if (txtTeacherID.Text != "")
        {
            strTemp = " TeacherID Like N'%" + txtTeacherID.Text + "%'";
            strAnd = " AND ";
        }

        if (txtFirstName.Text != "")
        {
            strTemp += strAnd + " FirstName Like N'%" + txtFirstName.Text + "%'";
            strAnd = " AND ";
        }

        if (txtLastName.Text != "")
        {
            strTemp += strAnd + " LastName Like N'%" + txtLastName.Text + "%'";
            strAnd = " AND ";
        }

        if (strTemp == "")
            return;


        SqlDataSource1.SelectCommand = "SELECT * FROM Teachers WHERE " + strTemp;

        SqlDataSource1.DataBind();

    }
}
