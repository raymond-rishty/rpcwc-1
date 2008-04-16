using System;
using System.Net;
using System.Xml;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;

/// <summary>
/// Summary description for ESVServiceDAO
/// </summary>
public class ESVServiceDAO
{
    public bool includeContentType = false;
    //public static int lineLength { get; set; }
    public bool includePassageReferences = true;
    public bool includeFirstverseNumbers = false;
    public bool includeVerseNumbers = false;
    public bool includeFootnotes = false;
    public bool includeFootnoteLinks = false;
    public bool includeHeadings = false;
    public bool includeSubheadings = false;
    public bool includePassageHorizontalLines = false;
    public bool includeHeadingHorizontalLines = false;
    public String outputFormat = "plain-text";

    public String fetchSermonText(String reference)
    {
        XmlDocument xmlDocument = new XmlDocument();
        xmlDocument.LoadXml(getQueryInfo(reference));
        if (xmlDocument.SelectNodes("//warnings").Count > 0)
            return reference;
        else
            return getText(reference);
    }


    public String getText(String passage)
    {
        StringBuilder sUrl = new StringBuilder();
        sUrl.Append("http://www.esvapi.org/v2/rest/passageQuery");
        sUrl.Append("?key=IP");
        sUrl.Append("&passage=" + passage);
        sUrl.Append("&include-passage-references=" + includePassageReferences.ToString().ToLower());
        sUrl.Append("&include-first-verse-numbers=" + includeFirstverseNumbers.ToString().ToLower());
        sUrl.Append("&include-verse-numbers=" + includeVerseNumbers.ToString().ToLower());
        sUrl.Append("&include-footnotes=" + includeFootnotes.ToString().ToLower());
        sUrl.Append("&include-footnote-links=" + includeFootnoteLinks.ToString().ToLower());
        sUrl.Append("&include-headings=" + includeHeadings.ToString().ToLower());
        sUrl.Append("&include-subheadings=" + includeSubheadings.ToString().ToLower());
        sUrl.Append("&include-passage-horizontal-lines=" + includePassageHorizontalLines.ToString().ToLower());
        sUrl.Append("&include-heading-horizontal-lines=" + includeHeadingHorizontalLines.ToString().ToLower());
        //  sUrl.Append("&include-content-type=" + includeContentType.ToString().ToLower());
        //  sUrl.Append("&line-length=" + lineLength.ToString().ToLower());
        sUrl.Append("&output-format=" + outputFormat);

        Console.Out.WriteLine(sUrl.ToString());

        WebRequest oReq = WebRequest.Create(sUrl.ToString());
        StreamReader sStream = new StreamReader(oReq.GetResponse().GetResponseStream());

        StringBuilder sOut = new StringBuilder();
        sOut.Append(sStream.ReadToEnd());
        sStream.Close();

        Regex regex = new Regex("\n([^ ])");
        return regex.Replace(sOut.ToString(), "$1");
    }

    public String getQueryInfo(String passage)
    {
        StringBuilder sUrl = new StringBuilder();
        sUrl.Append("http://www.esvapi.org/v2/rest/queryInfo");
        sUrl.Append("?key=IP");
        sUrl.Append("&q=" + passage);

        Console.Out.WriteLine(sUrl.ToString());

        WebRequest oReq = WebRequest.Create(sUrl.ToString());
        StreamReader sStream = new StreamReader(oReq.GetResponse().GetResponseStream());

        StringBuilder sOut = new StringBuilder();
        sOut.Append(sStream.ReadToEnd());
        sStream.Close();

        return sOut.ToString();
    }
}
