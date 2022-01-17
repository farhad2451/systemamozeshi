<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table cellpadding="0" cellspacing="0" align="center" 
        style="width: 500px; direction: rtl;">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" background="img/AdminTitle_Center.gif" align="center" style="color: White;
                            height: 5px;">
                            <asp:Label ID="lblStudentHeader" runat="server" Text="ثبت نام "></asp:Label>
                        </td>
                        <td style="height: 5px">
                            <img src="img/AdminTitle_Left.gif" />
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
                                کد دانش آموزی :
                            </td>
                            <td>
                                <asp:TextBox ID="txtStudentID" MaxLength="25" Width="260px" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtStudentID"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="105px" align="left">
                                نام :
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25" Width="260px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFirstName"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                نام خانوادگی :
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="25" Width="260px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" 
                                    ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                شماره شناسنامه :
                            </td>
                            <td>
                                <asp:TextBox ID="txtIdNumber" runat="server" MaxLength="25" Width="260px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtIdNumber"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                نام پدر :
                            </td>
                            <td>
                                <asp:TextBox ID="txtFatherName" runat="server" Width="260px" MaxLength="25"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFatherName"
                                    ErrorMessage="*" ValidationGroup="AddStudent"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                پست الکترونیکی :
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Width="260px" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtEmail" ValidationGroup="AddStudent"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                تاریخ تولد :
                            </td>
                            <td>
                                <asp:TextBox ID="txtBirthDate" runat="server" MaxLength="10" Width="120px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBirthDate"
                                    ErrorMessage="*" ValidationGroup="AddStudent"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                سال تحصیلی :
                            </td>
                            <td style="margin-right: 80px">
                                <asp:TextBox ID="txtEducationYear" runat="server" Width="120px" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEducationYear"
                                    ErrorMessage="*" ValidationGroup="AddStudent"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                نام کلاس :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboClassesName" runat="server" DataSourceID="sdcClassesName"
                                    DataTextField="ClassName" DataValueField="ClassName" Width="260px">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="cboClassesName"
                                    ErrorMessage="*" ValidationGroup="AddStudent"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                کلمه عبور :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" MaxLength="25" Width="260px">123</asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                                دانش آموز باید کلمه عبور را بداند تا بتواند وارد سیستم شود.
                            </td>
                        </tr>
                    </table>
    <asp:SqlDataSource ID="sdcClassesName" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT DISTINCT ClassName FROM Classes"></asp:SqlDataSource>
                    <asp:Button ID="btnInsert" runat="server" Text="ثبت دانش آموز جدید"
                        ValidationGroup="AddStudent" Font-Names="Tahoma" 
                        onclick="btnInsert_Click" />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    &nbsp;&nbsp;
                </center>
                
            </td>
        </tr>
    </table>
</asp:Content>

