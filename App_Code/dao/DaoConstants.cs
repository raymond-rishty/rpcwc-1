using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for DaoConstants
/// </summary>
namespace rpcwc.dao
{
    public static class DaoConstants
    {
        public const String SERMON = "sermon";
        public const int CHANNEL_RECOMMENDED_READINGS = 9;
        public class GuestTags
        {
            public const String InitialReportGenerated = "IP";
        }
    }
}