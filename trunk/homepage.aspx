<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
 Title="Reformed Presbyterian Church" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<marquee style="color: red" scrolldelay="200">Emergency weather information will scroll across here. This marquee will only appear during emergency weather.</marquee>
<table width="390" border="0" style="text-align:center">
 <tr>
 <td width="190" valign="top"><p><a href="~/ministryplan.aspx"><img src="~/images/content_tl.gif" width="190" height="162" border="0" /></a></p>
 <p style="text-align:center;"><strong><a href="~/ministryplan.aspx">RPC Ministry Plan</a></strong></p></td>
 <td width="10">&nbsp;</td>
 <td width="190" valign="top"><p><a href="~/the_good_news.pdf"><img src="~/images/content_tr.gif" width="190" height="162" border="0" /></a></p>
 <p style="text-align:center;"><strong><a href="~/the_good_news.pdf">The Message of Life</a></strong></p></td>
 </tr>
 <tr>
 <td valign="top"><p>
 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="190" height="162">
 <param name="movie" value="~/flash/calendar.swf" />
 <param name="quality" value="high" />
 <embed src=~/"flash/calendar.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="190" height="162"></embed>
 </object><p style="text-align:center;"><strong>Church Calendar</strong></p>
 </td>
 <td>&nbsp;</td>
 <td valign="top"><p><img src="~/images/content_br.gif" width="190" height="162" /></p>
 <p style="text-align:center;"><strong><a href="~/upcomingevents.aspx">Upcoming Events</a></strong></p></td>
 </tr>
</table>
</asp:Content>
