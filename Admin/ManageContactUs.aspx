<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ManageContactUs.aspx.cs" Inherits="Admin_ManageContactUs" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ connectionStrings:DatabaseConnectionString1 %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT ContactUs FROM CollectionTable "
        UpdateCommand="UPDATE CollectionTable SET ContactUs = @ContactUs ">
        <UpdateParameters>
            <asp:ControlParameter ControlID="FormView1" Name="txtAboutUs" PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" BackColor="WhiteSmoke"
        BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
        Width="800px" Height="95px" 
        HeaderText="متن تماس با ما را در قسمت زیر قرار دهید">
        <EditItemTemplate>
            اصلاح موضوع<FTB:FreeTextBox ID="editAbout" TextDirection="RightToLeft" Text='<%# Bind("ContactUs") %>' runat="server"
                ButtonSet="Office2003">
            </FTB:FreeTextBox>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="به روز رسانی"></asp:Button>
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="انصراف"></asp:Button>
        </EditItemTemplate>
        <InsertItemTemplate>
            txtAboutUs:
            <asp:TextBox ID="txtAboutUsTextBox"  runat="server" Text='<%# Bind("ContactUs") %>'>
            </asp:TextBox>
            <br />
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert"></asp:Button>
            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel"></asp:Button>
        </InsertItemTemplate>
        <ItemTemplate>
            <div style="direction: rtl; text-align: right">
                <asp:Label ID="lblContactUs" runat="server" Text='<%# Bind("ContactUs") %>'></asp:Label>
            </div>
            <br />
            <br />
            <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text=" ویرایش اطلاعات" Font-Names="tahoma" >
            </asp:Button>
        </ItemTemplate>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#A0BDCB" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
</asp:Content>

