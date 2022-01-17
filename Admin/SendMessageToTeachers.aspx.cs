using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;

public partial class Admin_SendMessageToTeachers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorEdit.Visible = false;
    }


    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtSubject.Text == "" || FreeTextBox1.Text == "" )
        {
            lblErrorEdit.Text = "لطفا اطلاعات را کامل وارد نمایید";
            lblErrorEdit.ForeColor = System.Drawing.Color.Red;
            lblErrorEdit.Visible = true;
            return;
        }
        else
        {

            SmtpClient obj = new SmtpClient();

            MailMessage Mailmsg = new MailMessage();
            Mailmsg.To.Clear();

            Mailmsg.To.Add(new MailAddress(GetEmailOfSchool()));
            Mailmsg.Subject = txtSubject.Text;
            Mailmsg.BodyEncoding = System.Text.Encoding.UTF8;
            Mailmsg.IsBodyHtml = true;
            obj.Host = "localhost";

            obj.UseDefaultCredentials = false;

            Mailmsg.Body = "<meta http-equiv='Content-Type' content='text/html;charset=utf-8'> <br /> <br />" +
                         FreeTextBox1.Text;
            Mailmsg.IsBodyHtml = true;



            try
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {

                    Mailmsg.From = new MailAddress(CheckBoxList1.Items[i].Value.ToString());
                    obj.Send(Mailmsg);

                }


                txtSubject.Text = "";
                FreeTextBox1.Text = "";
                lblErrorEdit.Visible = true;
                lblErrorEdit.Text = "ارسال نامه ها انجام گردید";
                lblErrorEdit.ForeColor = System.Drawing.Color.Green;

            }
            catch (Exception ex)
            {
                lblErrorEdit.Visible = true;
                lblErrorEdit.Text = "خطا در ارسال نامه: <br><span dir='ltr'>" + ex.Message.ToString() + "</span>";
                lblErrorEdit.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    private string GetEmailOfSchool()
    {
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = conn;

        cmd.CommandText = "SELECT SchoolEmail FROM SchoolInfo";



        conn.Open();

        string strEmail = cmd.ExecuteScalar().ToString();

        conn.Close();

        return strEmail;

    }




}
