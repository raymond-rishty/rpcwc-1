<%@ Page Language="C#" MasterPageFile="~/maintenance/access/accessMaintenance.master"
    CodeFile="role.aspx.cs" Inherits="maintenance_access_role"
    AutoEventWireup="true" Title="Role Maintenance" %>

<asp:Content ContentPlaceHolderID="head" runat="server">

    <script type="text/C#" runat="server">
    
    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="newRole" runat="server" />
    <asp:ListBox ID="roleList" OnLoad="getAllRoles" runat="server" />
    <asp:LinkButton ID="linkButton" OnCommand="addRole" runat="server" Text="Create Role" />
</asp:Content>
