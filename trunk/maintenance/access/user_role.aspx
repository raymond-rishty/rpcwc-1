<%@ Page Language="C#" MasterPageFile="~/maintenance/access/accessMaintenance.master" AutoEventWireup="true"
CodeFile="user_role.aspx.cs" Inherits="maintenance_access_userrole"
    Title="User Role Maintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/C#" runat="server">
    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListBox ID="UserList" AutoPostBack="true" SelectionMode="Single" OnSelectedIndexChanged="updateRoleLists"
        OnInit="initUserList" runat="server" />
    <asp:ListBox ID="RoleNotList" SelectionMode="Multiple" runat="server" />
    <asp:ListBox ID="RoleList" SelectionMode="Multiple" runat="server" />
</asp:Content>
