<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="TeacherCourses.aspx.cs" Inherits="Admin_TeacherCourses" %>

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
    <span class="style1">در اینجا می توانید دروس ندریسی معلم ها را مدیریت کنید.
        <br />
        برای مرتب سازی بر اساس هر ستون روی عنوان آن ستون کلیک کنید.<br />
        <br />
    </span>
    <br />
    <asp:SqlDataSource ID="sdcClassesName" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT DISTINCT ClassName FROM Classes"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT TeacherID, LastName + ' ' + FirstName AS TeacherName FROM Teachers ORDER BY teachername">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT [CourseName], [CourseID] FROM [Courses] WHERE ([CourseID] IN (SELECT CourseID FROM Classes WHERE ClassName=@ClassName)) ORDER BY [CourseName]">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboClasses" Name="ClassName" PropertyName="Text"
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
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
                            <asp:Label ID="lblStudentHeader0" runat="server" Text="انتساب درس به معلم"></asp:Label>
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
                                انتخاب نام معلم :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboTeachers" runat="server" DataSourceID="sdsTeachers" DataTextField="TeacherName"
                                    DataValueField="TeacherID" Width="300px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                                &nbsp;انتخاب نام کلاس :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboClasses" runat="server" AutoPostBack="True" DataSourceID="sdcClassesName"
                                    DataTextField="ClassName" DataValueField="ClassName" Width="300px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style2">
                                انتخاب دروس کلاس :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboCourses" runat="server" DataSourceID="sdsCourses" DataTextField="CourseName"
                                    DataValueField="CourseID" Width="300px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnAdd" runat="server" Text="اضافه شود" 
                        ValidationGroup="AddStudent" Font-Names="tahoma" onclick="btnAdd_Click" />
                </center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="ClassName,CourseID" DataSourceID="SqlDataSource1" 
        EmptyDataText="هیچ درسی برای این معلم ثبت نگردیده است" ForeColor="#333333" 
        GridLines="None" Width="800px">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ClassName" HeaderText="نام کلاس" ReadOnly="True" 
                SortExpression="ClassName" />
            <asp:BoundField DataField="CourseID" HeaderText="کد درس" ReadOnly="True" 
                SortExpression="CourseID" />
            <asp:BoundField DataField="CourseName" HeaderText="نام درس" 
                SortExpression="CourseName" />
            <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True">
            <ControlStyle Font-Names="Tahoma" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        DeleteCommand="UPDATE Classes SET TeacherID = NULL WHERE (ClassName = @original_ClassName) AND (CourseID = @original_CourseID)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT Classes.ClassName, Classes.CourseID, Courses.CourseName FROM Classes INNER JOIN Courses ON Classes.CourseID = Courses.CourseID WHERE (Classes.TeacherID = @TeacherID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboTeachers" Name="TeacherID" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ClassName" Type="String" />
            <asp:Parameter Name="original_CourseID" Type="String" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    </asp:Content>
