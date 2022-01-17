<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="ManageClasses.aspx.cs" Inherits="Admin_ManageClasses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
        .style2
        {
            width: 121px;
            vertical-align: text-top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <span class="style1">در اینجا می توانید لیست کلاس ها را مدیریت کنید.
        <br />
        برای مرتب سازی بر اساس هر ستون روی عنوان آن ستون کلیک کنید.<br />
        <br />
    </span>
    <br />
    <asp:SqlDataSource ID="sdcClassesName" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT DISTINCT ClassName FROM Classes"></asp:SqlDataSource>
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
                            <asp:Label ID="lblStudentHeader0" runat="server" Text="ویرایش کردن درس ها"></asp:Label>
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
                                <asp:DropDownList ID="cboClassesName" runat="server" AutoPostBack="True" DataSourceID="sdcClassesName"
                                    DataTextField="ClassName" DataValueField="ClassName" Width="300px" OnDataBound="cboClassesName_DataBound"
                                    OnSelectedIndexChanged="cboClassesName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                                انتخاب دروس کلاس :
                            </td>
                            <td>
                                <asp:CheckBoxList ID="cblCoursesNameEdit" runat="server" DataSourceID="sdsCourses"
                                    DataTextField="CourseName" DataValueField="CourseID" OnDataBound="cblCoursesNameEdit_DataBound">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnEdit" runat="server" Text="ویرایش اطلاعات" OnClick="btnEdit_Click"
                        ValidationGroup="AddStudent" Font-Names="tahoma" />
                </center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblErrorEdit" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:SqlDataSource ID="sdsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT [CourseName], [CourseID] FROM [Courses]"></asp:SqlDataSource>
    <br />
    <br />
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
                            <asp:Label ID="lblStudentHeader" runat="server" Text="اضافه کردن درس جدید"></asp:Label>
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
                                نام کلاس :
                            </td>
                            <td>
                                <asp:TextBox ID="txtClassName" runat="server" MaxLength="50" Width="260px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtClassName"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddClass">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                                انتخاب دروس کلاس :
                            </td>
                            <td>
                                <asp:CheckBoxList ID="cblCoursesNameInsert" runat="server" DataSourceID="sdsCourses"
                                    DataTextField="CourseName" DataValueField="CourseID">
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnInsert" runat="server" Text="ثبت کلاس جدید" OnClick="btnInsert_Click"
                        ValidationGroup="AddClass" Font-Names="tahoma" />
                </center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
</asp:Content>
