<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ManageAlbum.aspx.cs" Inherits="Admin_ManageAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:rtl">
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
            DefaultMode="Insert" ForeColor="#333333" GridLines="None" 
             Width="540px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <RowStyle BackColor="#EFF3FB" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                <asp:TemplateField HeaderText="نام آلبوم" SortExpression="Title" >
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>' 
                            Width="90%"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="400px" />
                </asp:TemplateField>
                <asp:CommandField CancelText="انصراف" InsertText="اضافه" 
                    ShowInsertButton="True" ButtonType="Button" />
            </Fields>
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:DetailsView>
        <br />
    <hr style="color: Silver" width="90%" />
        <br />
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display." CellPadding="4" 
            ForeColor="#333333" GridLines="None" Width="90%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="کد آلبوم" ReadOnly="True" 
                SortExpression="ID" >
            <ItemStyle Width="20%" />
            </asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="نام آلبوم" 
                SortExpression="Title" >
            <ControlStyle Width="90%" />
            </asp:BoundField>
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" 
                EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" 
                UpdateText="ثبت" >
            <ItemStyle HorizontalAlign="Left" Width="20%" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
        <br />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Album] WHERE [ID] = @ID" 
        InsertCommand="INSERT INTO [Album] ([Title]) VALUES (@Title)" 
        ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [ID], [Title] FROM [Album]" 
        UpdateCommand="UPDATE [Album] SET [Title] = @Title WHERE [ID] = @ID">
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

