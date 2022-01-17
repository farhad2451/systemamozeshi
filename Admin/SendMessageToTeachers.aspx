<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="SendMessageToTeachers.aspx.cs" Inherits="Admin_SendMessageToTeachers" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            vertical-align: text-top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><span class="style1">در اینجا می توانید به معلمان نامه ارسال نمایید.
    <br /></span>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        SelectCommand="SELECT LastName + ' ' + FirstName AS TeacherName, AddressEmail FROM Teachers ORDER BY teachername">
    </asp:SqlDataSource>
    <table cellpadding="0" cellspacing="0" style="width: 800px; text-align: center">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="../img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" align="center" style="color: White; height: 5px; background-image: url(../img/AdminTitle_Center.gif)">
                            <asp:Label ID="lblStudentHeader0" runat="server" Text="تنظیم نامه"></asp:Label>
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
                                &nbsp;انتخاب نام کلاس :
                            </td>
                            <td>
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                    DataSourceID="SqlDataSource1" DataTextField="TeacherName" 
                                    DataValueField="AddressEmail">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                            موضوع نامه :</td>
                            <td>
                                <asp:TextBox ID="txtSubject" runat="server" Width="530px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                            متن نامه :</td>
                            <td>
                                <FTB:FreeTextBox ID="FreeTextBox1" runat="server" TextDirection="RightToLeft" Width="530px">
                                </FTB:FreeTextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnSend" runat="server" Text="ارسال نامه" 
                        ValidationGroup="AddStudent" Font-Names="tahoma" 
                    onclick="btnSend_Click" />
                </center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblErrorEdit" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

