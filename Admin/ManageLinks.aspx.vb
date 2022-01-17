
Partial Class Admin_ManageLinks
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        If Left(e.Values.Item("Address"), 7).ToUpper <> "HTTP://" Then
            e.Values.Item("Address") = "http://" & e.Values.Item("Address")
        End If
        If Left(e.Values.Item("Banner"), 7).ToUpper <> "HTTP://" Then
            e.Values.Item("Banner") = "http://" & e.Values.Item("Banner")
        End If
    End Sub

End Class
