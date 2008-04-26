﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Alert / News Maintenance" %>

<script runat="server">
    public void SetParams(object source, SqlDataSourceCommandEventArgs eventArgs)
    {
        eventArgs.Command.Parameters["@pubDate"].Value = DateTime.Now;
        eventArgs.Command.Parameters["@author"].Value = User.Identity.Name;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h4>Alert / News Maintenance</h4>
    <asp:SqlDataSource ID="AlertDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:RPC %>"
        SelectCommand="findAlerts" SelectCommandType="StoredProcedure"
        UpdateCommand="updateAlert" UpdateCommandType="StoredProcedure"
        InsertCommand="createAlert" InsertCommandType="StoredProcedure"
        OnUpdating="SetParams" OnInserting="SetParams">
        <SelectParameters>
            <asp:Parameter Name="channelId" DefaultValue="5" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="item_id" />
            <asp:Parameter Name="author" />
            <asp:Parameter Name="pubDate" Type="DateTime" />
            <asp:Parameter Name="description" />
            <asp:Parameter Name="alert" />
            <asp:Parameter Name="active" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="channelId" DefaultValue="5" />
            <asp:Parameter Name="author" />
            <asp:Parameter Name="pubDate" Type="DateTime" />
            <asp:Parameter Name="description" />
            <asp:Parameter Name="alert" />
        </InsertParameters>
    </asp:SqlDataSource>
    
    <asp:DetailsView ID="AlertDetails" DataSourceID="AlertDataSource" runat="server"
        AutoGenerateRows="False" AutoGenerateInsertButton="True" AutoGenerateDeleteButton="True"
        AutoGenerateEditButton="True" DataKeyNames="item_id" AllowPaging="True" PagerSettings-Mode="NumericFirstLast">
        <PagerSettings Mode="NumericFirstLast"></PagerSettings>
        <Fields>
            <asp:BoundField DataField="item_id" HeaderText="ID" SortExpression="item_id" Visible="false" />
            <asp:TemplateField HeaderText="Date" SortExpression="pubDate" InsertVisible="false">
                <ItemTemplate>
                    <asp:Label id="pubDate" runat="server" Text='<%# ((DateTime)Eval("pubDate")).ToString("M/d/yyyy") %>' Enabled="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label id="pubDate" runat="server" Text='<%# DateTime.Now.ToString("M/d/yyyy") %>' Enabled="false" />                
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Updated User" SortExpression="author" InsertVisible="false">
                <ItemTemplate>
                    <asp:Label id="author" runat="server" Text='<%# Bind("author") %>' Enabled="false" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label id="author" runat="server" Text='<%# User.Identity.Name %>' Enabled="false" />                
                </EditItemTemplate>
            </asp:TemplateField>
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
            <asp:TemplateField HeaderText="Active" SortExpression="active">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("active") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("active") %>' Enabled="false" />
                </ItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("active") %>' Enabled="true" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="alert" HeaderText="Alert (Red)" SortExpression="alert" />
        </Fields>
    </asp:DetailsView>
</asp:Content>

