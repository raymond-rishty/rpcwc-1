<%@ Control Language="C#" ClassName="mainmenu"  %>
    <asp:Menu
            ID="mainMenuControl"
            runat="server"
            DataSourceID="MainMenuSiteMapDataSource"
            Orientation="Horizontal"
            StaticEnableDefaultPopOutImage="False"
            Width="100%"
            CssClass="mainMenuTable">
        <DynamicMenuStyle
            BorderColor="Black"
            BorderWidth="1px" />
        <DynamicMenuItemStyle
            CssClass="mainMenuDynamicItem" />
    </asp:Menu>
<div id="Div1">
</div>
<asp:SiteMapDataSource ID="MainMenuSiteMapDataSource" runat="server" ShowStartingNode="False"
    StartingNodeUrl="~/mainmenu.aspx" />
