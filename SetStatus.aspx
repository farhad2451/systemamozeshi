<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SetStatus.aspx.cs" Inherits="SetStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style4
        {
            width: 587px;
            text-align: left;
            vertical-align: top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%; text-align: center; direction: rtl">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" align="center" style="color: White; height: 5px; background-image: url('img/AdminTitle_Center.gif')">
                            <asp:Label ID="lblStudentHeader0" runat="server" 
                                Text="ثبت وضعیت درسی دانش آموزان"></asp:Label>
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
                            <td align="left" class="style4">
                                &nbsp;انتخاب نام کلاس :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboClasses" runat="server" AutoPostBack="True" DataSourceID="sdcClassesName"
                                    DataTextField="ClassName" DataValueField="ClassName" Width="300px" Font-Names="Tahoma">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="cboClasses" ValidationGroup="AddStatus"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style4">
                                انتخاب دروس کلاس :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboCourses" runat="server" DataSourceID="sdsCourses" DataTextField="CourseName"
                                    DataValueField="CourseID" Width="300px" AutoPostBack="True" Font-Names="Tahoma">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                    ControlToValidate="cboCourses" ValidationGroup="AddStatus"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style4">
                                انتخاب دانش آموز :
                            </td>
                            <td>
                                <asp:DropDownList ID="cboStudents" runat="server" DataSourceID="sdsStudents" DataTextField="StudentName"
                                    DataValueField="StudentID" Width="300px" AutoPostBack="True" Font-Names="Tahoma">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                    ControlToValidate="cboStudents" ValidationGroup="AddStatus"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style4">
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtComment" runat="server" Width="300px" MaxLength="500" 
                                    Height="104px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td style="vertical-align: top">
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="txtComment" ErrorMessage="*" ValidationGroup="AddStatus"></asp:RequiredFieldValidator>
&nbsp;</td>
                        </tr>
                    </table>
                    <asp:Button ID="btnAdd" runat="server" Text="اضافه شود" ValidationGroup="AddStatus"
                        Font-Names="tahoma" OnClick="btnAdd_Click" />
                </center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <asp:SqlDataSource ID="sdcClassesName" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT DISTINCT ClassName FROM Classes WHERE (TeacherID = @TeacherID) ORDER BY ClassName">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="TeacherID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsCourses" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT [CourseName], [CourseID] FROM [Courses] WHERE ([CourseID] IN (SELECT CourseID FROM Classes WHERE TeacherID=@TeacherID)) ORDER BY [CourseName]">
        <SelectParameters>
            <asp:SessionParameter Name="TeacherID" SessionField="TeacherID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT LastName + ' ' + FirstName AS StudentName, StudentID FROM Students WHERE (ClassName = @ClassName) ORDER BY StudentName">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboClasses" Name="ClassName" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="direction: rtl">
        لیست وضعیت درسی کلاس &nbsp;         <asp:Label ID="lblClassName" runat="server"></asp:Label>
        &nbsp;درس&nbsp;
        <asp:Label ID="lblCourseName" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="StatusID" DataSourceID="sdsStatus" ForeColor="#333333"
        GridLines="None" Width="100%" EmptyDataText="&lt;b&gt;هیچ نمرهای ثبت نگردیده است&lt;/b&gt;"
        OnDataBound="GridView1_DataBound">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" 
                EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" 
                UpdateText="ثبت">
            <ControlStyle Font-Names="Tahoma" />
            <HeaderStyle Width="100px" />
            </asp:CommandField>
            <asp:BoundField DataField="Comment" HeaderText="توضیحات" SortExpression="Comment" />
            <asp:BoundField DataField="StudentName" HeaderText="نام دانش آموز" 
                SortExpression="StudentName" ReadOnly="True" >
            <HeaderStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="StatusID" HeaderText="کد" SortExpression="StatusID" 
                ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsStatus" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        DeleteCommand="DELETE FROM [Status] WHERE [StatusID] = @original_StatusID " 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT Status.StatusID, Students.LastName + ' ' + Students.FirstName AS StudentName, Status.Comment FROM Status INNER JOIN Students ON Status.StudentID = Students.StudentID WHERE (Status.ClassName = @ClassName) AND (Status.CourseID = @CourseID) ORDER BY StudentName" 
        UpdateCommand="UPDATE [Status] SET  [Comment] = @Comment WHERE [StatusID] = @original_StatusID">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboClasses" Name="ClassName" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="cboCourses" Name="CourseID" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_StatusID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="original_StatusID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
</asp:Content>

