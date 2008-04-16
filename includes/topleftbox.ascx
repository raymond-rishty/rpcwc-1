<%@ Control Language="C#" ClassName="topleftbox" %>
<h2>Welcome</h2>
<br />
<p>Sunday Worship 11:00 am</p>
<br />
<br />
<input type="text" id="query" size="15" />
<span onclick='javascript:searchControl.execute(document.getElementById("query").value);'
    style="cursor: pointer">Search</span>
