<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Reformed Presbyterian Church — Sermon Audio" %>
    
<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
	<link rel="alternate" type="application/rss+xml" title="RPC Sermon Audio" href="podcast.xml" runat="server" />
</asp:Content>    

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4 style="text-align: center">
        Sermon Archive
    </h4>
    <p style="text-align: center;">
        <img src="~/images/stangale.gif" width="300" height="150" alt="Pastor Stanley D. Gale"
            runat="server" /></p>
    <asp:SqlDataSource ID="SermonSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RPC %>"
        SelectCommand="getSermonAudioList" SelectCommandType="StoredProcedure" InsertCommand="insertSermonAudio"
        InsertCommandType="StoredProcedure" DeleteCommand="deleteSermonAudio" DeleteCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter ControlID="DatePicker" Name="date" />
            <asp:Parameter Name="author" DefaultValue="Dr. Stanley D. Gale" />
            <asp:ControlParameter ControlID="SermonTitle" Name="title" />
            <asp:ControlParameter ControlID="ScriptureReference" Name="reference" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="SermonGridView" DataSourceID="SermonSqlDataSource" runat="server"
        AllowPaging="True" Width="100%" AutoGenerateColumns="False" DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                SortExpression="id" Visible="False" />
            <asp:HyperLinkField DataTextField="title" HeaderText="Title" SortExpression="title"
                DataNavigateUrlFields="url" />
            <asp:BoundField DataField="author" HeaderText="Preacher" SortExpression="author" />
            <asp:BoundField DataField="pubDate" HeaderText="Date Preached" SortExpression="pubDate"
                DataFormatString="{0:MM/dd/yyyy}" />
            <asp:BoundField DataField="sermonTextReference" HeaderText="Scripture" SortExpression="sermonTextReference" />
        </Columns>
    </asp:GridView>
    
    <h3 style="text-align: center">
        Send The Sermon Notes By Email</h3>
    <p style="text-align: center;">
        Use the form below to type in notes from the sermon as you listen. When the sermon
        is over, enter an email address, press Submit, and the recipient will receive the
        notes along with a link to listen.</p>
    <form id="form1" name="form1" method="post" action="sendnotes.aspx">
    <label>
        <div align="center">
            Sermon Date<br />
            <input name="date" type="text" id="date" size="50" />
        </div>
    </label>
    <label>
        <div align="center">
            <br />
            <br />
            Sermon Title<br />
            <input name="title" type="text" id="title" size="50" />
        </div>
    </label>
    <label>
        <div align="center">
            <br />
            <br />
            Scripture Reference<br />
            <input name="scripture" type="text" id="scripture" size="50" />
        </div>
    </label>
    <label>
        <div align="center">
            <br />
            <br />
            Speaker<br />
            <input name="speaker" type="text" id="speaker" size="50" />
        </div>
    </label>
    <label>
        <div align="center">
            <br />
            <br />
            Sermon Notes
            <br />
            <textarea name="notes" cols="50" rows="20"></textarea>
        </div>
    </label>
    <p style="text-align: center;">
        Email<br />
        <label>
            <input name="email" type="text" size="50" />
        </label>
    </p>
    <p style="text-align: center;">
        <label>
            <input type="submit" name="Submit" value="Submit" />
        </label>
    </p>
    </form>
</asp:Content>
