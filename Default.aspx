<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 5px;direction:rtl">
        <table cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 3px">
            <tr>
                <td>
                    <img src="Img/ContentTitle_Right.gif" />
                </td>
                <td align="center" background="img/ContentTitle_center.gif" width="100%">
                    اخبار
                </td>
                <td>
                    <img src="Img/ContentTitle_Left.gif" />
                </td>
            </tr>
        </table>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ID" DataSourceID="sdsNews"
            Width="100%" BackColor="#E0E7F0" BorderColor="White" BorderStyle="Solid" BorderWidth="1px"
            CellPadding="5">
            <ItemTemplate>
                <table width="100%" cellpadding="0" cellspacing="0" style="color: White; margin-bottom: 3px;">
                    <tr>
                        <td width="3px">
                            <img src="Img/NewsSubject_Right.gif" />
                        </td>
                        <td width="500px" background="Img/NewsCenter_Orange.gif">
                            <%#Eval("Subject")%>
                        </td>
                        <td  background="Img/NewsCenter_Blue.gif" width="120px" align="center">
                            <%#Eval("Date")%>
                        </td>
                        <td>
                            <img src="Img/NewsSubject_Left.gif" />
                        </td>
                    </tr>
                </table>
                <div style="border: solid 2px #E5F0FB; background-color:#F4F8FD; padding: 10px">
                    <%#Eval("Text") %></div>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Right" />
        </asp:DataList><asp:SqlDataSource ID="sdsNews" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
            SelectCommand="SELECT * FROM [News] ORDER BY [ID] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
