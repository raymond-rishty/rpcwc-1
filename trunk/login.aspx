<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Reformed Presbyterian Church — Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <asp:Login ID="Login1" runat="server" VisibleWhenLoggedIn="False">
            </asp:Login>
        </AnonymousTemplate>
        <LoggedInTemplate>
            Logged in as
            <asp:LoginName ID="LoginName1" runat="server" />
            . Click to
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
