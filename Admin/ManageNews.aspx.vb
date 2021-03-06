
Partial Class Admin_ManageNews
    Inherits System.Web.UI.Page

    Protected Sub btnInsertNews_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertNews.Click
        Dim PC As New System.Globalization.PersianCalendar
        sdsNews.InsertParameters("Date").DefaultValue = PC.GetDayOfMonth(Now) & "/" & PC.GetMonth(Now) & "/" & _
                 PC.GetYear(Now) & " - " & Now.Hour & ":" & Now.Minute
        sdsNews.InsertParameters("text").DefaultValue = FreeTextBox1.Text
        sdsNews.InsertParameters("Subject").DefaultValue = txtSubject.Text
        sdsNews.Insert()
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        If Request("edit") <> "" Then
            btnCancel.Visible = True
            btnUpdate.Visible = True
            btnInsertNews.Visible = False
            Dim Adapter As New Data.SqlClient.SqlDataAdapter("SELECT Subject,Text FROM News WHERE ID=" & _
                    Request("edit"), ConfigurationManager.ConnectionStrings("DatabaseConnectionString1").ConnectionString)
            Adapter.SelectCommand.Connection.Open()
            Dim reader As Data.SqlClient.SqlDataReader = Adapter.SelectCommand.ExecuteReader
            reader.Read()
            FreeTextBox1.Text = reader("Text")
            txtSubject.Text = reader("Subject")
            reader.Close()
            Adapter.SelectCommand.Connection.Close()
            lblNewsHeader.Text = "ویرایش خبر"
            GridView1.Visible = False
        End If
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("ManageNews.aspx")
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        sdsNews.UpdateParameters("Subject").DefaultValue = txtSubject.Text
        sdsNews.UpdateParameters("Text").DefaultValue = FreeTextBox1.Text
        sdsNews.UpdateParameters("original_ID").DefaultValue = Request("edit")
        sdsNews.Update()
        Response.Redirect("ManageNews.aspx")
    End Sub
End Class
