
Partial Class Admin_MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.Item("UserType") Is Nothing Then
            Response.Redirect("Login.aspx")
        ElseIf Session.Item("UserType").Equals("Admin") = False Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class

