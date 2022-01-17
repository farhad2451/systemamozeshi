<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="ManagePhotos.aspx.cs" Inherits="Admin_ManagePhotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <table style="background-color: #f5f5f5; border: solid 1px silver; width: 50%" cellpadding="5">
        <tr>
            <td colspan="2" align="center" style="background-color: #A0BDCB; color: White">
                ثبت تصویر جدید
            </td>
        </tr>
        <tr>
            <td valign="top" align="left" dir="rtl">
                انتخاب آلبوم:
            </td>
            <td align="right" dir="rtl">
                <asp:DropDownList ID="cboAlbumName" runat="server" DataSourceID="sdsDormirories"
                    DataTextField="Title" DataValueField="ID" Width="98%" Font-Names="Tahoma"
                    Font-Size="Small">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsDormirories" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
                    SelectCommand="SELECT [ID], [Title] FROM [Album]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td valign="top" align="left">
                توضیحات:&nbsp;
            </td>
            <td align="right" dir="rtl">
                <asp:TextBox ID="txtComments" runat="server" Height="80px" TextMode="MultiLine" Width="98%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                تصویر:
            </td>
            <td align="right" dir="rtl">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="98%" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="right" dir="rtl">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ثبت تصویر" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <hr style="color: Silver" width="90%" />
    <br />
    <br />
    تصاویر مربوط به آلبوم :
    <asp:DropDownList ID="cboAlbumName2" runat="server" DataSourceID="sdsDormirories"
        DataTextField="Title" DataValueField="ID" AutoPostBack="True" Font-Names="Tahoma"
        Font-Size="Small" Width="200px">
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource1" DataKeyNames="ID" ShowHeader="False" Width="50%"
        GridLines="None" Caption="&lt;div style='background-color:#A0BDCB; color:White' &gt; &lt;b&gt;'گالری تصاویر&lt;/b&gt; &lt;/div&gt;"
        BackColor="WhiteSmoke" BorderColor="Silver" BorderWidth="1px" PageSize="5" 
        AllowSorting="True" EmptyDataText="هیچ گونه عکسی ثبت نشده است">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                مرتبه :
                            </td>
                            <td style="text-align: right; font-family: tahoma; font-size: small">
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PlacePhoto") %>' Width="53px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                توضیحات :
                            </td>
                            <td style="text-align: right; font-family: tahoma; font-size: small">
                                <asp:TextBox ID="TextBox3" runat="server" Height="117px" Text='<%# Bind("Comments") %>'
                                    TextMode="MultiLine" Width="203px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="انصراف"></asp:Button>
                            </td>
                            <td style="text-align: right; font-family: tahoma; font-size: small">
                                <asp:Button ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="به روز رسانی"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;<br />
                </EditItemTemplate>
                <ItemTemplate>
                    <table class="style1" style="text-align: left">
                        <tr>
                            <td>
                                مرتبه :
                            </td>
                            <td align="right">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PlacePhoto") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                توضیحات :
                            </td>
                            <td align="right">
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                    Text="حذف"></asp:Button>
                            </td>
                            <td align="right">
                                <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="ویرایش"></asp:Button>
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
                <ItemStyle VerticalAlign="Top" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ID", "../Handler.ashx?ID={0}") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ID", "../Handler.ashx?ID={0}") %>' />
                </ItemTemplate>
                <ControlStyle Width="200px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>"
        SelectCommand="SELECT [ID], [PlacePhoto], [Comments], [AlbumID] FROM [Photos] WHERE ([AlbumID] = @AlbumID) ORDER BY [PlacePhoto]"
        ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Photos] WHERE [ID] = @original_ID "
        OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Photos] SET [PlacePhoto] = @PlacePhoto, [Comments] = @Comments  WHERE [ID] = @original_ID ">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboAlbumName2" Name="AlbumID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_PlacePhoto" Type="Int16" />
            <asp:Parameter Name="original_Comments" Type="String" />
            <asp:Parameter Name="original_AlbumID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="PlacePhoto" Type="Int16" />
            <asp:Parameter Name="Comments" Type="String" />
            <asp:Parameter Name="AlbumID" Type="Int32" />
            <asp:Parameter Name="original_ID" Type="Int32" />
            <asp:Parameter Name="original_PlacePhoto" Type="Int16" />
            <asp:Parameter Name="original_Comments" Type="String" />
            <asp:Parameter Name="original_AlbumID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
