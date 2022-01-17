<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SecuritySettings.aspx.cs" Inherits="Admin_SecuritySettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <br />
    <span class="style1">در اینجا می توانید رمز عبور خود را تغییر دهید.
        <br />
        <br />
    </span>
    <table cellpadding="0" cellspacing="0" style="width: 800px; text-align: center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="../img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" align="center" style="color: White; height: 5px; background-image: url(../img/AdminTitle_Center.gif)">
                            <asp:Label ID="lblStudentHeader" runat="server" Text="تغییر رمز عبور"></asp:Label>
                        </td>
                        <td style="height: 5px">
                            <img src="../img/AdminTitle_Left.gif" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="100%" style="border: solid 2px #004e8a; background-color: #EBF0F7; text-align: center;
                padding: 10px">
                <center>
                    <table style="text-align: right">
                        <tr>
                            <td width="105px" align="left">
                                نام کاربری&nbsp; قدیم:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsernameOLD" runat="server" Width="260px" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUsernameOLD"
                                    ErrorMessage="*" ValidationGroup="ChangeUsername"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="105px" align="left">
                                نام کاربری&nbsp; جدید:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsernameNEW" runat="server" Width="260px" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUsernameNEW"
                                    ErrorMessage="*" ValidationGroup="ChangeUsername"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="105px" align="left">
                                &nbsp;</td>
                            <td>
                    <asp:Button ID="btnChangeUsername" runat="server" Text="تغییر نام کاربری" OnClick="btnChangeUsername_Click"
                        ValidationGroup="ChangeUsername" Font-Names="tahoma" />
                            </td>
                        </tr>
                        <tr>
                            <td width="105px" align="left">
                                رمز عبور قدیم :                             </td>
                            <td>
                                <asp:TextBox ID="txtPasswordOLD" runat="server" MaxLength="25" Width="260px" 
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPasswordNew"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" 
                                    ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                رمز عبور جدید :                             </td>
                            <td>
                                <asp:TextBox ID="txtPasswordNew" runat="server" MaxLength="25" Width="260px" 
                                    TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPasswordNew"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" 
                                    ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                تکرار رمز عبور جدید :</td>
                            <td>
                                <asp:TextBox ID="txtPasswordNewRepeat" runat="server" MaxLength="25" 
                                    Width="260px" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPasswordNewRepeat"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" 
                                    ValidationGroup="ChangePassword">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                    <asp:Button ID="btnChangePassword" runat="server" Text="تغییر رمز عبور" OnClick="btnChangePassword_Click"
                        ValidationGroup="ChangePassword" Font-Names="tahoma" />
                            </td>
                        </tr>
                    </table>
                </center>
            </td>
        </tr>
    </table>
        <br />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
</asp:Content>

