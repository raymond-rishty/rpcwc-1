<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Reformed Presbyterian Church" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4>
        <p>
            Photo Gallery</p>
    </h4>
    <p>
        Select a photo gallery from the drop-down menu, then click a thumbnail for a larger
        image.</p>
    <table>
        <td width="18%">
            <div align="center">
                <a href="~/photogallery.aspx" onclick="return clickreturnvalue()" onmouseover="dropdownmenu(this, event, menu_gallery, '150px')"
                    onmouseout="delayhidemenu()">Select Photo Gallery</a></div>
        </td>
    </table>
</asp:Content>