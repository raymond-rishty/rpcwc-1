﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for EventControl
/// </summary>
namespace rpcwc.web
{
    public class EventControl : WebControl
    {
        public EventControl()
            : base(HtmlTextWriterTag.Div)
        {
        }
    }
}
