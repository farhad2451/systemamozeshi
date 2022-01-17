using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagePhotos : System.Web.UI.Page
{
 
    protected void Button1_Click(object sender, EventArgs e)
    {
        PhotoManager.AddPhoto(int.Parse( cboAlbumName.SelectedValue), txtComments.Text, FileUpload1.FileBytes);
        GridView2.DataBind();
    }
}
