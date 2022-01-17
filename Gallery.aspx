<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table style="direction: rtl; background-color: #F4F8FD; border-bottom: 1px solid;
        width: 90%; border-top: 1px solid; border-left: 1px solid; border-right: 1px solid;
        border-color: #E5F0FB;">
        <tr>
            <td align="left">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                    DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display."
                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="Photos.aspx?ID={0}"
                            DataTextField="Title" HeaderText="عنوان گالری">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:HyperLinkField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        DeleteCommand="DELETE FROM [Album] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Album] ([Title]) VALUES (@Title)"
        ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>"
        SelectCommand="SELECT [ID], [Title] FROM [Album]" UpdateCommand="UPDATE [Album] SET [Title] = @Title WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
