using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        string conString = System.Configuration.ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString.ToString();
        string cmdSelect = "select AboutUs from CollectionTable";
        SqlConnection cnn = new SqlConnection(conString);
        SqlCommand cmd = new SqlCommand(cmdSelect, cnn);
        cnn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        string text;

        if (rd.HasRows)
        {
            rd.Read();
            text = (rd.IsDBNull(0) == true) ? "هیچ گونه مطلبی یادداشت نشده است ... بعدا مراجعه فرمائید." : rd.GetString(0).ToString(); //2 is database mean txtAeinName
        }
        else
        {

            text = "هیچ گونه مطلبی یادداشت نشده است ... بعدا مراجعه فرمائید.";
        }
        txtAboutUs.Text = text;
        cnn.Close();
    }
}
