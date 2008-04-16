<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Collections;
using System.Web.UI.WebControls;
using System.Web.UI;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        IList directory = DirectoryDAO.getDirectory();
        WebControl table = new WebControl(HtmlTextWriterTag.Table);
        for (int i = 0; i < directory.Count; i += 2)
        {
            WebControl tr = new WebControl(HtmlTextWriterTag.Tr);
            tr.Controls.Add(makeCell((Directory)directory[i]));
            tr.Controls.Add(makeCell((Directory)directory[i + 1]));
            table.Controls.Add(tr);
        }
        
        
    }

    private WebControl makeCell(Directory directory)
    {
        WebControl td = new WebControl(HtmlTextWriterTag.Td);
        Label label = new Label();
        label.Text = directory.lastName;
        td.Controls.Add(label);
        return td;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}