using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        lblError.Visible = true;


        SmtpClient obj = new System.Net.Mail.SmtpClient();

        MailMessage Mailmsg = new MailMessage();
        Mailmsg.To.Clear();

        Mailmsg.To.Add(new MailAddress("Info@HighSchool.com"));
        Mailmsg.From = new MailAddress(txtEmail.Text);
        Mailmsg.Subject = txtSubject.Text;
        Mailmsg.BodyEncoding = System.Text.Encoding.UTF8;
        Mailmsg.IsBodyHtml = true;
        obj.Host = "localhost";

        obj.UseDefaultCredentials = false;

        Mailmsg.Body = "<meta http-equiv='Content-Type' content='text/html;charset=utf-8'> ایم پیام از قسمت تماس با ما در سایت مدرسه ارسال شده است<br><br>نام و نام خانوادگی: " +
                    txtName.Text + "<br>پست الکترونیک:" + txtEmail.Text + "<br><br><br>" + txtBody.Text;
        Mailmsg.IsBodyHtml = true;


        try
        {
            obj.Send(Mailmsg);

            txtBody.Text = "";
            txtEmail.Text = "";
            txtName.Text = "";
            txtSubject.Text = "";
           
        }
        catch (Exception ex)
        {
            lblError.Text = "خطا در ارسال نامه: <br><span dir='ltr'>" + ex.Message.ToString() + "</span>";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }
}
