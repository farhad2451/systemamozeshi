<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Photos.aspx.cs" Inherits="Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript" src="lytebox.js"></script>

    <link rel="stylesheet" href="lytebox.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<br />
    <table style="background-color: #F4F8FD; border-bottom: 1px solid; width:90%;
        border-top: 1px solid; border-left: 1px solid; border-right: 1px solid; border-color: #E5F0FB;">
        <tr >
            <td align="left">
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4">
                    <ItemTemplate>
                        <a href='<%# Eval("ID", "Handler.ashx?ID={0}") %>' rel="lyteshow[vacation]"   >
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ID", "Handler.ashx?ID={0}") %>'
                                Width="120px" Height="120px" />
                        </a>
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT [ID] FROM [Photos] WHERE ([AlbumID] = @AlbumID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="AlbumID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
