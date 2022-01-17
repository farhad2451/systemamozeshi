<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" type="text/css" href="style.css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <table cellpadding="0" cellspacing="0" align="center" width="70%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <img src="../img/AdminTitle_Right.gif" /></td>
                        <td width="100%" background="../img/AdminTitle_Center.gif" align="center" style="color:White" >
                    ورود به سیستم مدیریت</td>
                        <td>
                            <img src="../img/AdminTitle_Left.gif" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="100%" style="border:solid 2px #004e8a; background-color:#EBF0F7; text-align:center; padding:10px">
            نام کاربری: 
                <asp:TextBox ID="txtUsername" runat="server" MaxLength="50"></asp:TextBox>
                <br />
                <br />کلمه عبور: 
                <asp:TextBox ID="txtPassword" runat="server" MaxLength="30" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="ورود" onclick="btnLogin_Click" />
            </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
