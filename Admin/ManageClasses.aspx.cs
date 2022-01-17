using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageClasses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        lblErrorEdit.Text = "";
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {

        if (ExistClass(txtClassName.Text) == false)
        {
            for (int i = 0; i < cblCoursesNameInsert.Items.Count; i++)
                if (cblCoursesNameInsert.Items[i].Selected == true)
                {
                    AddClass(txtClassName.Text, cblCoursesNameInsert.Items[i].Value);
                    cblCoursesNameInsert.Items[i].Selected = false;
                }


            lblError.Text = "کلاس جدید ثبت گردید";
            lblError.ForeColor = System.Drawing.Color.Green;

            txtClassName.Text = "";

            sdcClassesName.DataBind();
            cboClassesName.DataBind();
        }
        else
        {
            lblError.Text = "نام کلاس تکراری می باشد";
            lblError.ForeColor = System.Drawing.Color.Red;
        }

        lblError.Visible = true;
        lblErrorEdit.Visible = false;


    }

    #region Class

    private void AddClass(string ClassName, string CourseID)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO Classes (ClassName,CourseID) VALUES (@ClassName,@CourseID)", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("CourseID", CourseID));

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();


    }

    private void DeleteClass(string ClassName)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("DELETE FROM Classes WHERE ClassName=@ClassName ", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();


    }

    private void DeleteClass(string ClassName, string CourseID)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("DELETE FROM Classes WHERE ClassName=@ClassName AND CourseID=@CourseID", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));
        cmd.Parameters.Add(new SqlParameter("CourseID", CourseID));

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();


    }

    private bool ExistClass(string ClassName)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(ClassName) FROM Classes WHERE ClassName=@ClassName ", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));


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

    private bool ClassHasStudents(string ClassName)
    {

        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT COUNT(StudentID) FROM Students WHERE ClassName=@ClassName ", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));


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

    private ArrayList GetCoursesClass(string ClassName)
    {

        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT CourseID FROM Classes WHERE ClassName=@ClassName ", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", ClassName));

        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();







        ArrayList ar = new ArrayList();

        while (reader.Read())
            ar.Add(reader[0].ToString());


        reader.Close();
        conn.Close();

        return ar;

    }


    #endregion


    #region EditSection

    protected void cboClassesName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM Classes WHERE ClassName=@ClassName", conn);

        cmd.Parameters.Add(new SqlParameter("ClassName", cboClassesName.Text));

        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();

        for (int i = 0; i < cblCoursesNameEdit.Items.Count; i++)
            cblCoursesNameEdit.Items[i].Selected = false;

        while (reader.Read())
        {

            for (int i = 0; i < cblCoursesNameEdit.Items.Count; i++)
                if (cblCoursesNameEdit.Items[i].Value == reader["CourseID"].ToString())
                    cblCoursesNameEdit.Items[i].Selected = true;

        }

        conn.Close();

    }

    protected void cblCoursesNameEdit_DataBound(object sender, EventArgs e)
    {
        cboClassesName_SelectedIndexChanged(null, null);
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {

        bool blHasCourse = false;
        string strClassName = cboClassesName.Text;


        for (int i = 0; i < cblCoursesNameEdit.Items.Count; i++)
            if (cblCoursesNameEdit.Items[i].Selected == true)
                blHasCourse = true;



        if (ClassHasStudents(strClassName) == false && blHasCourse == false) // 
        {
            DeleteClass(strClassName);

            //for (int i = 0; i < cblCoursesNameEdit.Items.Count; i++)
            //    if (cblCoursesNameEdit.Items[i].Selected == true)
            //        AddClass(strClassName, cblCoursesNameEdit.Items[i].Value);

            lblErrorEdit.Text = "کلاس حذف گردید";
            lblErrorEdit.ForeColor = System.Drawing.Color.Green;

        }
        else if (blHasCourse == false)
        {
            lblErrorEdit.Text = "برای حذف کامل کلاس :";
            lblErrorEdit.Text += "ابتدا باید دانش آموزان این کلاس را حذف نمایید یا به کلاس دیگر منتقل نمایید.";
            lblErrorEdit.Text += "<br />" + "برای اینکار به صفحه دانش آموزان مراجعه نمایید.";

            lblErrorEdit.ForeColor = System.Drawing.Color.Red;

        }
        else
        {

            ArrayList arr = new ArrayList();
            arr = GetCoursesClass(strClassName);

            bool b = false;

            for (int j = 0; j < cblCoursesNameEdit.Items.Count; j++)
            {
                for (int i = 0; i < arr.Count; i++)
                    if (cblCoursesNameEdit.Items[j].Value == arr[i].ToString())
                    {
                        if (cblCoursesNameEdit.Items[j].Selected == false)
                            DeleteClass(strClassName, cblCoursesNameEdit.Items[j].Value);
                        b = true;
                    }

                if (b == false && cblCoursesNameEdit.Items[j].Selected == true)
                    AddClass(strClassName, cblCoursesNameEdit.Items[j].Value);

                b = false;

            }


            lblErrorEdit.Text = "ویرایش کلاس ثبت گردید";
            lblErrorEdit.ForeColor = System.Drawing.Color.Green;

        }










      

        sdcClassesName.DataBind();
        cboClassesName.DataBind();

        lblErrorEdit.Visible = true;
        lblError.Visible = false;


    }

    protected void cboClassesName_DataBound(object sender, EventArgs e)
    {
        cboClassesName_SelectedIndexChanged(null, null);
    }

    #endregion
}
