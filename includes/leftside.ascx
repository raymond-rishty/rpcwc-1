<%@ Control Language="C#" ClassName="leftside" %>
<asp:SiteMapDataSource ID="SiteMapSourceWelcome" runat="server" StartingNodeUrl="~/welcome.aspx"
    ShowStartingNode="false" />
<asp:SiteMapDataSource ID="SiteMapSourceAboutUs" runat="server" StartingNodeUrl="~/aboutussection.aspx"
    ShowStartingNode="false" />
<h2>
    Welcome</h2>
<asp:DataList ID="DataList1" DataSourceID="SiteMapSourceWelcome" runat="server" Width="100%">
    <ItemTemplate>
        <a href='<%# Eval("Url") %>' runat="server">
            <%# Eval("Title") %></a>
    </ItemTemplate>
</asp:DataList>
<br />
<h2>
    About Us</h2>
<asp:DataList ID="DataList2" DataSourceID="SiteMapSourceAboutUs" runat="server" Width="100%">
    <ItemTemplate>
        <a href='<%# Eval("Url") %>' runat="server">
            <%# Eval("Title") %></a>
    </ItemTemplate>
</asp:DataList>
<br />
<p>
    <strong><a href="../314house.aspx" runat="server">314 Ministry House</a></strong></p>
<p>
    <a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">
        <img src="../images/reader_icon.gif" alt="Click here to download Adobe Reader" width="34"
            height="40" border="0" longdesc="http://www.adobe.com/products/acrobat/readstep2.html" runat="server" /></a>
</p>
