<%@ Page Language="VB" %>
<%
    If Session.Item("UserType") Is Nothing Then
        Response.Redirect("Login.aspx")
    ElseIf Session.Item("UserType").Equals("Admin") Then
        Response.Redirect("ManageNews.aspx")
    Else
        Response.Redirect("Login.aspx")
    End If
    
%>