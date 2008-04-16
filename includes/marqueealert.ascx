<%@ Control Language="C#" ClassName="marqueealert" %>

<script runat="server">
    private String setColor(object isAlert)
    { 
        MarqueeSpan.Style.Add(HtmlTextWriterStyle.Color, (bool)isAlert ? "red" : "black");
        return "";
    }
</script>

<asp:SqlDataSource ID="AlertSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RPC %>"
    SelectCommand="getMarquee" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="channelId" DefaultValue="5" />
    </SelectParameters>
</asp:SqlDataSource>

<marquee scrolldelay="200">
<span id="MarqueeSpan" runat="server">
<asp:Repeater id="myRepeaterPlain" DataSourceID="AlertSqlDataSource" runat="server">
<ItemTemplate>
<%# setColor(DataBinder.Eval(Container.DataItem, "alert")) %>
<%# DataBinder.Eval(Container.DataItem, "description") %>
</ItemTemplate></asp:Repeater>
</span>
</marquee>
