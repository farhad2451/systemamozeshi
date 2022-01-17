<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SchoolInfo.aspx.cs" Inherits="Admin_SchoolInfo" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style2
        {
            vertical-align: text-top;
        }
        .style1
        {
            color: #FFFFFF;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><span class="style1">در اینجا می توانید اطلاعات پایه موسسه را واردنمایید.
    <br /></span>
    <br />
    <br />
    <table cellpadding="0" cellspacing="0" style="width: 800px; text-align: center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="../img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" align="center" style="color: White; height: 5px; background-image: url(../img/AdminTitle_Center.gif)">
                            <asp:Label ID="lblStudentHeader0" runat="server" Text="مشخصات موسسه"></asp:Label>
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
                            <td align="left" class="style2">
                                نام موسسه :</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Width="374px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                                پست الکترونیکی موسسه :</td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Width="374px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    Display="Dynamic" ErrorMessage="صحیح نمی باشد" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                                آدرسی موسسه :</td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Width="374px" Height="56px" 
                                    TextMode="MultiLine" MaxLength="250"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="*" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnSave" runat="server" Text="ثبت اطلاعات" Font-Names="tahoma" 
                        onclick="btnSave_Click" />
                </center>
            </td>
        </tr>
    </table>
    
    
    <br />
    <br />
    <asp:Label ID="lblErrorEdit" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </asp:Content>

