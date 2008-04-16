<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Title="Reformed Presbyterian Church" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4>
        How Can We Pray For You?</h4>
    <form id="form1" name="form1" method="post" action="~/sendprayer.aspx">
    <label>
        Name<br />
        <input name="name" type="text" id="name" size="50" />
    </label>
    <label>
        <br />
        <br />
        Date<br />
        <input name="date" type="text" id="date" size="50" />
    </label>
    <label>
        <br />
        <br />
        Email<br />
        <input name="email" type="text" id="email" size="50" />
    </label>
    <label>
        <br />
        <br />
        Subject<br />
        <input name="subject" type="text" id="subject" size="50" />
    </label>
    <label>
        <br />
        <br />
        Phone<br />
        <input name="phone2" type="text" id="phone2" size="50" />
    </label>
    <label>
    </label>
    <label>
        <br />
        <br />
        <input type="radio" name="status" value="new_request">New Request<br />
        <input type="radio" name="status" value="updated" checked>Updated Request<br />
        <br />
        Prayer<br />
        <textarea name="prayer" cols="50" rows="20" id="prayer"></textarea>
    </label>
    <p>
        <label>
            <input type="submit" name="Submit" value="Submit" />
        </label>
    </p>
    </form>
</asp:Content>
