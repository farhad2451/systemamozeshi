<%@ Page Language="VB" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="false" CodeFile="ManageLinks.aspx.vb" Inherits="Admin_ManageLinks" title="لینک دوستان" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
        CellPadding="4" DataSourceID="sdsDownloads" ForeColor="#333333" GridLines="None"
        Width="100%" EmptyDataText="هیچ لینکی ثبت نشده است">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ردیف" InsertVisible="False" ReadOnly="True"
                SortExpression="ID" />
            <asp:BoundField DataField="Subject" HeaderText="عنوان" SortExpression="Subject" />
            <asp:BoundField DataField="Address" HeaderText="آدرس سایت" SortExpression="Address" />
            <asp:ImageField DataImageUrlField="Banner" HeaderText="تصویر بنر">
                <ControlStyle Height="31px" Width="88px" />
            </asp:ImageField>
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                ShowDeleteButton="True" ShowEditButton="True" UpdateText="ثبت تغییرات" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsDownloads" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Links] WHERE [ID] = @original_ID"
        InsertCommand="INSERT INTO [Links] ([Subject], [Address], [Banner]) VALUES (@Subject, @Address, @Banner)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Links] ORDER BY [ID] DESC"
        UpdateCommand="UPDATE [Links] SET [Subject] = @Subject, [Address] = @Address, [Banner] = @Banner WHERE [ID] = @original_ID">
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Banner" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Banner" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
    <table cellpadding="0" cellspacing="0" align="center" width="70%">
        <tr><td>
            <table cellpadding="0" cellspacing="0" width="100%"><tr>
                <td><img src="../img/AdminTitle_Right.gif" /></td>
                <td width="100%" background="../img/AdminTitle_Center.gif" align="center" style="color:White" >
                    ثبت لینک جدید</td>
                <td><img src="../img/AdminTitle_Left.gif" /></td>
            </tr></table>
        </td></tr>
        <tr><td width="100%" style="border:solid 2px #004e8a; background-color:#EBF0F7; text-align:center; padding:10px">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4"
                DataKeyNames="ID" DataSourceID="sdsDownloads" DefaultMode="Insert" ForeColor="#333333"
                GridLines="None" Height="50px">
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <CommandRowStyle Font-Bold="True" />
                <EditRowStyle HorizontalAlign="Left" />
                <RowStyle ForeColor="#333333" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ردیف:" InsertVisible="False" ReadOnly="True"
                        SortExpression="ID" />
                    <asp:BoundField DataField="Subject" HeaderText="عنوان:" SortExpression="Subject" >
                        <ControlStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="آدرس سایت:" SortExpression="Address" >
                        <ControlStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Banner" HeaderText="آدرس تصویر بنر:" SortExpression="Banner" >
                        <ControlStyle Width="200px" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" CancelText="انصراف" InsertText=" ثبت " ShowCancelButton="False"
                        ShowInsertButton="True" />
                </Fields>
                <FieldHeaderStyle Font-Bold="False" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            </asp:DetailsView>
        </td></tr>
    </table>
</asp:Content>

