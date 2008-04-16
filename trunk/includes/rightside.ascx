<%@ Control Language="C#" ClassName="rightside" %>

<h2>
    Church Resources</h2>
    <asp:DataList DataSourceID="SiteMapSource" runat="server" Width="100%">
        <ItemTemplate>
            <a href='<%# Eval("Url") %>'><%# Eval("Title") %></a>
        </ItemTemplate>
    </asp:DataList>
<asp:SiteMapDataSource ID="SiteMapSource" runat="server" StartingNodeUrl="~/resources.aspx" ShowStartingNode="false" />
<br />
<h2>
    Recommended Reading</h2>
<br />
<a href="http://www.wtsbooks.com/product-exec/product_id/5190/nm/Prayer_of_Jehoshaphat_Seeing_Beyond_Life_s_Storms_Paperback_">
    <img src="~/images/jehoshaphat.jpg" alt="" width="80" height="120" runat="server" /></a>
<br />
