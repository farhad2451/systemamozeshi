<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table style="direction: rtl; background-color: #F4F8FD; border-bottom: 1px solid;
        width: 90%; border-top: 1px solid; border-left: 1px solid; border-right: 1px solid;
        border-color: #E5F0FB;">
        <tr>
            <td align="left">
                <asp:Literal ID="txtAboutUs" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
