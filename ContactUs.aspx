<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Black" Text="نامه شما با موفقیت ارسال شد"
            Visible="False"></asp:Label><br />
        <table style="direction: rtl; background-color: #F4F8FD; border-bottom: 1px solid;
            border-top: 1px solid; border-left: 1px solid; border-right: 1px solid; border-color: #E5F0FB;">
            <tr align="right">
                <td align="left">
                    نام و نام خانوادگی :
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr align="right">
                <td align="left">
                    پست الکترونیک :
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="300px" ValidationGroup="1"></asp:TextBox>
                </td>
            </tr>
            <tr align="right">
                <td align="left">
                    موضوع :
                </td>
                <td>
                    <asp:TextBox ID="txtSubject" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr align="right">
                <td valign="top" align="left">
                    متن نامه :
                </td>
                <td>
                    <asp:TextBox ID="txtBody" runat="server" Height="120px" TextMode="MultiLine" Width="300px"
                        ValidationGroup="1"></asp:TextBox>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td style="text-align: right;">
                    <asp:Button ID="btnSend" runat="server" Text="  ارسال  " OnClick="btnSend_Click"
                        Font-Names="Tahoma" ValidationGroup="1" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: right">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="1" Display="Dynamic">لطفا نام و نام خانوادگی خود را وارد کنید</asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="1" Display="Dynamic">لطفا پست الکترونیکی خود را وارد کنید</asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtSubject"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="1" Display="Dynamic">لطفا موضوع خود را وارد کنید</asp:RequiredFieldValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBody"
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="1" Display="Dynamic">لطفا متنی را برای ارسال وارد کنید</asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
