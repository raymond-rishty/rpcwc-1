using System;
using System.ComponentModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Microsoft.Samples {
    /// <summary>
    /// A simple representation of a site map.
    /// </summary>
    public class SiteMapView : WebControl {
        [DefaultValue(6)]
        public int MaxDepth {
            get {
                object o = ViewState["MaxDepth"];
                return (o == null) ? 6 : (int)o;
            }
            set {
                ViewState["MaxDepth"] = value;
            }
        }

        protected override void RenderContents(HtmlTextWriter writer) {
            SiteMapNode root = SiteMap.RootNode;
            RenderNode(root, writer, 1);
        }

        private void RenderNode(SiteMapNode node, HtmlTextWriter writer, int depth) {
            if (depth > MaxDepth) return;

            if (depth <= 6) {
                writer.RenderBeginTag('h' + depth.ToString());
            }
            else {
                writer.RenderBeginTag(HtmlTextWriterTag.Div);
            }

            writer.AddAttribute(HtmlTextWriterAttribute.Href, node.Url, true);
            writer.AddAttribute(HtmlTextWriterAttribute.Title, node.Description, true);
            writer.RenderBeginTag(HtmlTextWriterTag.A);
            writer.Write(node.Title);
            writer.RenderEndTag(); // a
            writer.RenderEndTag(); // h1...h6 or div

            int subNodeDepth = depth + 1;
            foreach (SiteMapNode subNode in node.ChildNodes) {
                RenderNode(subNode, writer, subNodeDepth);
            }
        }
    }
}