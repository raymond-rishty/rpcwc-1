﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Event Calendar Maintenance Page"
    ValidateRequest="false" %>

<script type="text/C#" runat="server">
 /*   public void Updating(Object source, SqlDataSourceCommandEventArgs eventArgs)
    {
        eventArgs.Command.Parameters["@channelId"].Value = ((DropDownList)FormView1.FindControl("ChannelDropDownBox")).SelectedValue;
    }
  * */
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
Please visit <a href="http://www.google.com/calendar/hosted/rpcwc.org">Google Calendar</a> for calendar administration.
Regular events may be posted in the "Reformed Presbyterian Church of West Chester" calendar; Special events may be posted on the "Reformed Presbyterian Church of West Chester Special Events" calendar.

   <%-- <asp:SqlDataSource ID="CalendarSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RPC %>"
        SelectCommand="SELECT i.item_id, i.pubDate startDate, i.endDate endDate, i.title, id.description, i.author, i.channel_id channelId, i.all_day_event allDayEvent FROM item AS i INNER JOIN item_description AS id ON i.item_id = id.item_id WHERE     (i.channel_id = @channelIdSpecial) OR (i.channel_id = @channelIdRegular) AND (i.pubDate >= GETDATE()) ORDER BY startDate"
        SelectCommandType="Text"
        DeleteCommand="deleteEvent" DeleteCommandType="StoredProcedure"
        UpdateCommand="UPDATE ITEM SET TITLE = @title, pubDate = @startDate, channel_id = @channelId, all_day_event = @allDayEvent, endDate = @endDate WHERE ITEM_ID = @item_id; UPDATE ITEM_DESCRIPTION SET DESCRIPTION = @description WHERE ITEM_ID = @item_id" UpdateCommandType="Text"
        InsertCommand="INSERT INTO ITEM (CHANNEL_ID, TITLE, AUTHOR, PUBDATE, ALL_DAY_EVENT, ENDDATE) VALUES (@channelId, @title, '', @startDate, @allDayEvent, @endDate); DECLARE @itemid smallint; SELECT @itemid = MAX(ITEM_ID) FROM ITEM WHERE CHANNEL_ID = @channelId; INSERT INTO ITEM_DESCRIPTION (ITEM_ID, DESCRIPTION) VALUES (@itemid, @description)" InsertCommandType="Text">
        <SelectParameters>
            <asp:Parameter Name="channelIdSpecial" DefaultValue="3" />
            <asp:Parameter Name="channelIdRegular" DefaultValue="8" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="item_id" />
            <asp:Parameter Name="title" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="endDate" Type="DateTime" />
            <asp:Parameter Name="channelId" />
            <asp:Parameter Name="description" />
            <asp:Parameter Name="allDayEvent" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="channelId" DefaultValue="3" />
            <asp:Parameter Name="title" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="endDate" Type="DateTime" />
            <asp:Parameter Name="description" />
            <asp:Parameter Name="allDayEvent" />
        </InsertParameters>
    </asp:SqlDataSource>
    <table>
        <asp:DetailsView ID="FormView1" DataSourceID="CalendarSqlDataSource" runat="server"
            AutoGenerateRows="False" AutoGenerateInsertButton="True" AutoGenerateDeleteButton="True"
            AutoGenerateEditButton="True" DataKeyNames="item_id" AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
            <PagerSettings Mode="NumericFirstLast"></PagerSettings>
            <Fields>
                <asp:BoundField DataField="item_id" HeaderText="ID" SortExpression="item_id" Visible="false" />
                <asp:BoundField DataField="startDate" HeaderText="Start Date/Time" SortExpression="startDate" />
                <asp:BoundField DataField="endDate" HeaderText="End Date/Time" SortExpression="endDate" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:TemplateField HeaderText="Description" SortExpression="description">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Columns="50" Rows="10" Text='<%# Bind("description") %>'
                            TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Columns="50" Rows="10" Text='<%# Bind("description") %>'
                            TextMode="MultiLine"></asp:TextBox>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Event Type">
                    <ItemTemplate>
                        <asp:Label runat="server"><%# (Byte)Eval("channelId") == 3 ? "Special Event" : "Regular Event" %></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList SelectedValue='<%# Bind("channelId") %>' ID="ChannelDropDownBox"
                            runat="server">
                            <asp:ListItem Value="8">Regular Event</asp:ListItem>
                            <asp:ListItem Value="3">Special Event</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList SelectedValue='<%# Bind("channelId") %>' ID="ChannelDropDownBox"
                            runat="server">
                            <asp:ListItem Value="8">Regular Event</asp:ListItem>
                            <asp:ListItem Value="3">Special Event</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="allDayEvent" HeaderText="All Day Event" />
            </Fields>
        </asp:DetailsView>
    </table>
    <div style="height: 20em">
    </div>--%>
 
</asp:Content>