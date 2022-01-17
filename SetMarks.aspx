<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SetMarks.aspx.cs" Inherits="SetMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style4
        {
            width: 587px;
            text-align: left;
            vertical-align: top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellpadding="0" cellspacing="0" style="width: 100%; text-align: center; direction: rtl">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" align="center" style="color: White; height: 5px; background-image: url('img/AdminTitle_Center.gif')">
                            <asp:Label ID="lblStudentHeader0" runat="server" Text="ثبت نمرات دانش آموزان"></asp:Label>
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
                                    ControlToValidate="cboClasses" ValidationGroup="AddMark"></asp:RequiredFieldValidator>
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
                                    ControlToValidate="cboCourses" ValidationGroup="AddMark"></asp:RequiredFieldValidator>
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
                                    ControlToValidate="cboStudents" ValidationGroup="AddMark"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style4">
                                نمره :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMark" runat="server" Width="52px" MaxLength="5"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="عدد صحیح نمی باشد"
                                    ValidationExpression="\d(\d)?(.\d(\d)?)?" ControlToValidate="txtMark" ValidationGroup="AddMark"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style4">
                                تاریخ امتحان :
                            </td>
                            <td>
                                <asp:TextBox ID="txtExamDate" runat="server" Width="109px" MaxLength="10"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="تاریخ صحیح نمی باشد"
                                    ValidationExpression="(\d{4})/(\d{2})/(\d{2})" ControlToValidate="txtExamDate"
                                    ValidationGroup="AddMark"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtExamDate" ValidationGroup="AddMark"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style4">
                                توضیحات :
                            </td>
                            <td>
                                <asp:TextBox ID="txtComment" runat="server" Width="300px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnAdd" runat="server" Text="اضافه شود" ValidationGroup="AddMark"
                        Font-Names="tahoma" OnClick="btnAdd_Click" />
                </center>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
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
        لیست نمرات کلاس &nbsp;
        <asp:Label ID="lblClassName" runat="server"></asp:Label>
        &nbsp;درس&nbsp;
        <asp:Label ID="lblCourseName" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="MarkID" DataSourceID="sdsMarks" ForeColor="#333333"
        GridLines="None" Width="100%" EmptyDataText="&lt;b&gt;هیچ نمرهای ثبت نگردیده است&lt;/b&gt;"
        OnDataBound="GridView1_DataBound">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                ShowDeleteButton="True" ShowEditButton="True" UpdateText="ثبت">
                <ControlStyle Font-Names="Tahoma" />
            </asp:CommandField>
            <asp:BoundField DataField="Comment" HeaderText="توضیحات" SortExpression="Comment" />
            <asp:BoundField DataField="ExamDate" HeaderText="تاریخ امتحان" SortExpression="ExamDate" />
            <asp:BoundField DataField="Mark" HeaderText="نمره" SortExpression="Mark" />
            <asp:BoundField DataField="StudentID" HeaderText="شماره دانش آموز" SortExpression="StudentID"
                ReadOnly="True" />
            <asp:BoundField DataField="MarkID" HeaderText="کد" InsertVisible="False" ReadOnly="True"
                SortExpression="MarkID" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <br />
    <asp:SqlDataSource ID="sdsMarks" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [Marks] WHERE [MarkID] = @original_MarkID AND (([StudentID] = @original_StudentID) OR ([StudentID] IS NULL AND @original_StudentID IS NULL)) AND (([Mark] = @original_Mark) OR ([Mark] IS NULL AND @original_Mark IS NULL)) AND (([ExamDate] = @original_ExamDate) OR ([ExamDate] IS NULL AND @original_ExamDate IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL))"
        InsertCommand="INSERT INTO [Marks] ([StudentID], [Mark], [ExamDate], [Comment]) VALUES (@StudentID, @Mark, @ExamDate, @Comment)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [MarkID], [StudentID], [Mark], [ExamDate], [Comment] FROM [Marks] WHERE (([ClassName] = @ClassName) AND ([CourseID] = @CourseID)) ORDER BY [StudentID]"
        UpdateCommand="UPDATE [Marks] SET [StudentID] = @StudentID, [Mark] = @Mark, [ExamDate] = @ExamDate, [Comment] = @Comment WHERE [MarkID] = @original_MarkID AND (([StudentID] = @original_StudentID) OR ([StudentID] IS NULL AND @original_StudentID IS NULL)) AND (([Mark] = @original_Mark) OR ([Mark] IS NULL AND @original_Mark IS NULL)) AND (([ExamDate] = @original_ExamDate) OR ([ExamDate] IS NULL AND @original_ExamDate IS NULL)) AND (([Comment] = @original_Comment) OR ([Comment] IS NULL AND @original_Comment IS NULL))">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboClasses" Name="ClassName" PropertyName="SelectedValue"
                Type="String" />
            <asp:ControlParameter ControlID="cboCourses" Name="CourseID" PropertyName="SelectedValue"
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_MarkID" Type="Int32" />
            <asp:Parameter Name="original_StudentID" Type="String" />
            <asp:Parameter Name="original_Mark" Type="Decimal" />
            <asp:Parameter Name="original_ExamDate" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="StudentID" Type="String" />
            <asp:Parameter Name="Mark" Type="Decimal" />
            <asp:Parameter Name="ExamDate" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
            <asp:Parameter Name="original_MarkID" Type="Int32" />
            <asp:Parameter Name="original_StudentID" Type="String" />
            <asp:Parameter Name="original_Mark" Type="Decimal" />
            <asp:Parameter Name="original_ExamDate" Type="String" />
            <asp:Parameter Name="original_Comment" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="StudentID" Type="String" />
            <asp:Parameter Name="Mark" Type="Decimal" />
            <asp:Parameter Name="ExamDate" Type="String" />
            <asp:Parameter Name="Comment" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
