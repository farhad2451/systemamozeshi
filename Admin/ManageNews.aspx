<%@ Page Language="VB" Debug="true" ValidateRequest="false" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="ManageNews.aspx.vb" Inherits="Admin_ManageNews" title="مدیریت اخبار" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="ID" DataSourceID="sdsNews" ForeColor="#333333" 
        GridLines="None" ShowHeader="False" Width="800px" 
        EmptyDataText="هیج اخباری ثبت نشده است">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <table bgcolor="#507CD1" width="100%" style="color:White">
                        <tr>
                            <td>عنوان خبر:<%# Eval("Subject") %></td>
                            <td align="left">تاریخ:<%# Eval("Date") %></td>
                            <td width="120px">
                                <a href='managenews.aspx?edit=<%#eval("ID") %>' style="color:#A0CFFF" >ویرایش</a>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                        CommandName="Delete" Text="حذف" Font-Names="tahoma" />
                            </td>
                        </tr>
                    </table>
                        <%# Eval("Text") %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Right" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="#EFF3FB" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsNews" runat="server" ConflictDetection="OverwriteChanges"
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        DeleteCommand="DELETE FROM [News] WHERE [ID] = @original_ID"
        InsertCommand="INSERT INTO [News] ([Subject], [Text], [Date]) VALUES (@Subject, @Text, @Date)"
        OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient"
        SelectCommand="SELECT * FROM [News]" UpdateCommand="UPDATE [News] SET [Subject] = @Subject, [Text] = @Text WHERE [ID] = @original_ID">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Text" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Text" Type="String" />
            <asp:Parameter Name="Date" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
        <table cellpadding="0" cellspacing="0" align="center" width="800">
        <tr><td>
            <table cellpadding="0" cellspacing="0" width="100%"><tr>
                <td><img src="../img/AdminTitle_Right.gif" /></td>
                <td width="100%" background="../img/AdminTitle_Center.gif" align="center" style="color:White" >
                    <asp:Label ID="lblNewsHeader" runat="server" Text="ثبت خبر جدید "></asp:Label></td>
                <td><img src="../img/AdminTitle_Left.gif" /></td>
            </tr></table>
        </td></tr>
        <tr><td width="100%" style="border:solid 2px #004e8a; background-color:#EBF0F7; text-align:center; padding:10px">
            عنوان خبر:<asp:TextBox ID="txtSubject" runat="server" Width="528px"></asp:TextBox><br /><br />
            <FTB:FreeTextBox ID="FreeTextBox1" runat="server" TextDirection="RightToLeft"></FTB:FreeTextBox>
            <asp:Button ID="btnInsertNews" runat="server" Text="ثبت خبر جدید" 
                Font-Names="Tahoma" />
            &nbsp;<asp:Button ID="btnUpdate" runat="server" Text="ثبت تغییرات" 
                Visible="False" Font-Names="Tahoma" />&nbsp;
            <asp:Button ID="btnCancel" runat="server" Text="انصراف" Visible="False" 
                Font-Names="Tahoma" /></td></tr>
    </table>
</asp:Content>