<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="SearchStudent.aspx.cs" Inherits="Admin_SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <span class="style1">در اینجا می توانید دانش آموزان مورد نظر را جستجو نمایید.
        <br />
        برای مرتب سازی بر اساس هر ستون روی عنوان آن ستون کلیک کنید.<br />
        <br />
    </span>
    <table cellpadding="0" cellspacing="0" align="center" style="width: 800px">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" style="height: 14px">
                    <tr>
                        <td style="height: 5px">
                            <img src="../img/AdminTitle_Right.gif" />
                        </td>
                        <td width="100%" background="../img/AdminTitle_Center.gif" align="center" style="color: White;
                            height: 5px;">
                            <asp:Label ID="lblStudentHeader" runat="server" Text="جستجوی دانش آموز"></asp:Label>
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
                                کد دانش آموزی :
                            </td>
                            <td>
                                <asp:TextBox ID="txtStudentID" MaxLength="25" Width="260px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td width="105px" align="left">
                                نام :
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25" Width="260px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                نام خانوادگی :
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="25" Width="260px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnSearch" runat="server" Text="جستجو" ValidationGroup="AddStudent"
                        Font-Names="Tahoma" OnClick="btnSearch_Click" />
                    &nbsp;&nbsp;
                </center>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="StudentID" DataSourceID="SqlDataSource1"
        EmptyDataText="هیچ دانش آموزی ثبت نشده است" ForeColor="#333333" GridLines="None"
        Width="100%">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="StudentID" HeaderText="شماره دانش آموز" ReadOnly="True"
                SortExpression="StudentID"></asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="نام" SortExpression="FirstName">
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="نام خانوادگی" SortExpression="LastName" />
            <asp:BoundField DataField="FatherName" HeaderText="نام پدر" SortExpression="FatherName">
            </asp:BoundField>
            <asp:BoundField DataField="IdNumber" HeaderText="شماره شناسنامه" SortExpression="IdNumber" />
            <asp:BoundField DataField="EducationYear" HeaderText="سال تحصیلی" SortExpression="EducationYear" />
            <asp:BoundField DataField="BirthDate" HeaderText="تاریخ تولد" SortExpression="BirthDate" />
            <asp:BoundField DataField="AddressEmail" HeaderText="آدرس الکترونیکی" SortExpression="AddressEmail" />
            <asp:TemplateField HeaderText="نام کلاس" SortExpression="ClassName">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="cboClassesName" runat="server" DataSourceID="sdcClassesName"
                        DataTextField="ClassName" DataValueField="ClassName" SelectedValue='<%# Bind("ClassName") %>'
                        Width="260px">
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Password" HeaderText="رمز عبور" SortExpression="Password" />
            <asp:CheckBoxField DataField="Active" HeaderText="فعال" SortExpression="Active" />
            <asp:CommandField />
            <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش"
                ShowEditButton="True" UpdateText="ثبت">
                <ControlStyle Font-Names="Tahoma" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True">
                <ControlStyle Font-Names="Tahoma" />
            </asp:CommandField>
        </Columns>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdcClassesName" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT DISTINCT ClassName FROM Classes"></asp:SqlDataSource>
    <asp:SqlDataSource EnableCaching="false" ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        DeleteCommand="DELETE FROM [Students] WHERE [StudentID] = @original_StudentID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND (([FatherName] = @original_FatherName) OR ([FatherName] IS NULL AND @original_FatherName IS NULL)) AND (([IdNumber] = @original_IdNumber) OR ([IdNumber] IS NULL AND @original_IdNumber IS NULL)) AND (([EducationYear] = @original_EducationYear) OR ([EducationYear] IS NULL AND @original_EducationYear IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([AddressEmail] = @original_AddressEmail) OR ([AddressEmail] IS NULL AND @original_AddressEmail IS NULL)) AND [ClassName] = @original_ClassName AND [Password] = @original_Password AND [Active] = @original_Active"
        ProviderName="<%$ ConnectionStrings:DatabaseConnectionString1.ProviderName %>"
        SelectCommand=""
        UpdateCommand="UPDATE [Students] SET [FirstName] = @FirstName, [LastName] = @LastName, [FatherName] = @FatherName, [IdNumber] = @IdNumber, [EducationYear] = @EducationYear, [BirthDate] = @BirthDate, [AddressEmail] = @AddressEmail, [ClassName] = @ClassName, [Password] = @Password, [Active] = @Active WHERE [StudentID] = @original_StudentID AND [FirstName] = @original_FirstName AND [LastName] = @original_LastName AND (([FatherName] = @original_FatherName) OR ([FatherName] IS NULL AND @original_FatherName IS NULL)) AND (([IdNumber] = @original_IdNumber) OR ([IdNumber] IS NULL AND @original_IdNumber IS NULL)) AND (([EducationYear] = @original_EducationYear) OR ([EducationYear] IS NULL AND @original_EducationYear IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([AddressEmail] = @original_AddressEmail) OR ([AddressEmail] IS NULL AND @original_AddressEmail IS NULL)) AND [ClassName] = @original_ClassName AND [Password] = @original_Password AND [Active] = @original_Active"
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original_{0}">
<%--        <SelectParameters>
        
            <asp:ControlParameter ControlID="txtStudentID" Name="StudentID" DefaultValue="" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtFirstName" Name="FirstName" DefaultValue="" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtLastName" Name="LastName" DefaultValue="" PropertyName="Text"
                Type="String" />
        </SelectParameters>--%>
<%--        <FilterParameters>
            <asp:ControlParameter ControlID="txtStudentID" Name="StudentID" DefaultValue="" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtFirstName" Name="FirstName" DefaultValue="" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="txtLastName" Name="LastName" DefaultValue="" PropertyName="Text"
                Type="String" />
        </FilterParameters>--%>
        <DeleteParameters>
            <asp:Parameter Name="original_StudentID" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FatherName" Type="String" />
            <asp:Parameter Name="original_IdNumber" Type="String" />
            <asp:Parameter Name="original_EducationYear" Type="String" />
            <asp:Parameter Name="original_BirthDate" Type="String" />
            <asp:Parameter Name="original_AddressEmail" Type="String" />
            <asp:Parameter Name="original_ClassName" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FatherName" Type="String" />
            <asp:Parameter Name="IdNumber" Type="String" />
            <asp:Parameter Name="EducationYear" Type="String" />
            <asp:Parameter Name="BirthDate" Type="String" />
            <asp:Parameter Name="AddressEmail" Type="String" />
            <asp:Parameter Name="ClassName" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="original_StudentID" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FatherName" Type="String" />
            <asp:Parameter Name="original_IdNumber" Type="String" />
            <asp:Parameter Name="original_EducationYear" Type="String" />
            <asp:Parameter Name="original_BirthDate" Type="String" />
            <asp:Parameter Name="original_AddressEmail" Type="String" />
            <asp:Parameter Name="original_ClassName" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
