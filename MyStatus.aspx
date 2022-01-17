<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyStatus.aspx.cs" Inherits="MyStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" 
        Width="100%">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="Comment" HeaderText="توضیحات" 
                SortExpression="Comment" />
            <asp:BoundField DataField="CourseName" HeaderText="نام درس" 
                SortExpression="CourseName">
            <HeaderStyle Width="30%" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" 
        SelectCommand="SELECT Courses.CourseName, Status.Comment FROM Status INNER JOIN Courses ON Status.CourseID = Courses.CourseID WHERE (Status.StudentID = @StudentID) ORDER BY Courses.CourseName">
        <SelectParameters>
            <asp:SessionParameter Name="StudentID" SessionField="StudentID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

