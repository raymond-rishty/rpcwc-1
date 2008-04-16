using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Xml;
using System.Collections;


/// <summary>
/// Summary description for PodcastHttpHandler
/// </summary>
public class PrayerRSSHttpHandler : IHttpHandler
{
    private RSSManager rssManager;
    public PrayerRSSHttpHandler()
    {
        rssManager = new RSSManager();
        //
        // TODO: Add constructor logic here
        //
    }

    #region IHttpHandler Members

    public bool IsReusable
    {
        get { return true; }
    }

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/xml";

        context.Response.Write(rssManager.getFeed(6));
    }

    #endregion
}
