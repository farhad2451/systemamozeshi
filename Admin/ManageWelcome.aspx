<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ManageWelcome.aspx.cs" Inherits="Admin_ManageWelcome" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="sdsMainText"
        HeaderText="متن صفحه اصلی" GridLines="None" Width="800px" BackColor="WhiteSmoke"
        BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CellPadding="5">
        <Fields>
            <asp:TemplateField SortExpression="MainPage">
                <EditItemTemplate>
                    <FTB:FreeTextBox runat="server" TextDirection="RightToLeft" ID="ftxt" Text='<%# Bind("WelcomeText") %>'>
                    </FTB:FreeTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                <div style="direction:rtl;text-align:right">
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WelcomeText") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Right" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش اطلاعات"
                ShowEditButton="True" UpdateText="ثبت تغییرات" >
            <ControlStyle Font-Names="Tahoma" />
            </asp:CommandField>
        </Fields>
        <HeaderStyle BackColor="#A0BDCB" ForeColor="White" Font-Bold="True" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsMainText" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT [WelcomeText] FROM [CollectionTable]" UpdateCommand="UPDATE CollectionTable SET WelcomeText = @WelcomeText">
        <UpdateParameters>
            <asp:Parameter Name="WelcomeText" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

