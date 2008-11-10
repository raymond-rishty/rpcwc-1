﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Weekly Prayer List Maintenance Page" %>
    
<script type="text/C#" runat="server">
    public void SetTimeParam(object source, SqlDataSourceCommandEventArgs eventArgs)
    {
        eventArgs.Command.Parameters["@pubDate"].Value = DateTime.Now;
    }
    
    protected void setBold(Object source, GridViewRowEventArgs eventArgs)
    {
        if (eventArgs.Row.RowType == DataControlRowType.DataRow)
        {
            Object x = ((System.Data.DataRowView)eventArgs.Row.DataItem).Row.ItemArray[5];

            if (x.GetType() == typeof(DBNull))
                return;
            if (x.GetType() == typeof(Boolean) && (Boolean)x)
                eventArgs.Row.Font.Bold = true;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:SqlDataSource ID="PrayerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RPC %>"
        SelectCommand="getPrayerListActive" SelectCommandType="StoredProcedure"
        UpdateCommand="updatePrayerRequest" UpdateCommandType="StoredProcedure" OnUpdating="SetTimeParam"
        InsertCommand="createPrayerRequest" InsertCommandType="StoredProcedure" OnInserting="SetTimeParam">
        <SelectParameters>
            <asp:Parameter Name="channelId" DefaultValue="6" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="item_id" />
            <asp:Parameter Name="author" />
            <asp:Parameter Name="pubDate" Type="DateTime" />
            <asp:Parameter Name="description" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="channelId" DefaultValue="6" />
            <asp:Parameter Name="author" />
            <asp:Parameter Name="pubDate" Type="DateTime" />
            <asp:Parameter Name="description" />
        </InsertParameters>
    </asp:SqlDataSource>
    <table>
        <asp:DetailsView ID="PrayerDetails" DataSourceID="PrayerDataSource" runat="server"
            AutoGenerateRows="False" AutoGenerateInsertButton="True" AutoGenerateDeleteButton="True"
            AutoGenerateEditButton="True" DataKeyNames="item_id" AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
            <PagerSettings Mode="NumericFirstLast"></PagerSettings>
            <Fields>
                <asp:BoundField DataField="item_id" HeaderText="ID" SortExpression="item_id" ReadOnly="true" InsertVisible="false" Visible="true" />
                <asp:BoundField DataField="author" HeaderText="Author" SortExpression="author" />
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
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" Visible="false" />
                <asp:CheckBoxField DataField="active" HeaderText="Active" SortExpression="active" />
                <asp:CheckBoxField DataField="new" HeaderText="New"  SortExpression="new" />
            </Fields>
        </asp:DetailsView>
    </table>
    <div style="height: 20em">
    </div>
</asp:Content>