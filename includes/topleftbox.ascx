<%@ Control Language="C#" ClassName="topleftbox" %>
<div>312 W Union St.<br />
West Chester, PA 19382<br />
<br />
(610) 696-3482</div>
<br />
<br />
<br />
<input type="text" id="query" size="15" onkeypress='if (window.event.keyCode == 13) {searchControl.execute(document.getElementById("query").value); return false;}; '/>
<span onclick='javascript:searchControl.execute(document.getElementById("query").value);'
    style="cursor: pointer;">Search</span>

