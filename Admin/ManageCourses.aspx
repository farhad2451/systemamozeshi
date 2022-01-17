<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="ManageCourses.aspx.cs" Inherits="Admin_ManageCourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <span class="style1">در اینجا می توانید لیست دروس را مدیریت کنید.
        <br />
        برای مرتب سازی بر اساس هر ستون روی عنوان آن ستون کلیک کنید.<br />
        <br />
    </span>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
        DataKeyNames="CourseID" DataSourceID="SqlDataSource3" EmptyDataText="هیج درسی ثبت نشده است"
        ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" Width="800px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="کد درس" SortExpression="CourseID">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseID") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CourseID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="نام درس" SortExpression="Name">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="50" Text='<%# Bind("CourseName") %>'
                        Width="200px"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تعداد واحد" SortExpression="Unit">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Unit") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="1" Text='<%# Bind("Unit") %>'
                        Width="50px"></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle Width="80px" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                ShowDeleteButton="True" ShowEditButton="True" UpdateText="ثبت">
                <ControlStyle Font-Names="Tahoma" />
                <ItemStyle Width="100px" />
            </asp:CommandField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @CourseID" ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>"
        SelectCommand="SELECT CourseID, CourseName, Unit FROM Courses " UpdateCommand="UPDATE [Courses] SET [CourseName] = @CourseName, [Unit] = @Unit WHERE [CourseID] = @CourseID">
        <DeleteParameters>
            <asp:Parameter Name="CourseID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CourseName" Type="String" />
            <asp:Parameter Name="Unit" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
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
                            <td width="105px" align="left">
                                کد درس :
                            </td>
                            <td>
                                <asp:TextBox ID="txtCourseID" runat="server" Width="260px" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCourseID"
                                    ErrorMessage="*" ValidationGroup="AddStudent"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="105px" align="left">
                                نام درس :
                            </td>
                            <td>
                                <asp:TextBox ID="txtCourseName" runat="server" MaxLength="50" Width="260px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCourseName"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                تعداد واحد :
                            </td>
                            <td>
                                <asp:TextBox ID="txtUnit" runat="server" MaxLength="1" Width="43px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUnit"
                                    ErrorMessage="RequiredFieldValidator" Font-Bold="True" ValidationGroup="AddStudent">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnInsert" runat="server" Text="ثبت درس جدید" OnClick="btnInsert_Click"
                        ValidationGroup="AddStudent" Font-Names="tahoma" />
                </center>
            </td>
        </tr>
    </table>
    
    <br />
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
