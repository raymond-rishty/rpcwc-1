using System;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// Summary description for BlogEntry
/// </summary>
namespace rpcwc.vo.Blog
{
    public class BlogEntry : RPCVO
    {
        private String _title;

        public String Title
        {
            get { return _title; }
            set { _title = value; }
        }
        private DateTime _pubDate;

        public DateTime PubDate
        {
            get { return _pubDate; }
            set { _pubDate = value; }
        }

        private String _content;

        public String Content
        {
            get { return _content; }
            set { _content = value; }
        }

        private String _author;

        public String Author
        {
            get { return _author; }
            set { _author = value; }
        }

        private String _summary;

        public String Summary
        {
            get { return _summary; }
            set { _summary = value; }
        }

        private String _mediaUri;

        public String MediaUri
        {
            get { return _mediaUri; }
            set { _mediaUri = value; }
        }

        private IList<Link> _links;

        public IList<Link> Links
        {
            get { return _links; }
            set { _links = value; }
        }

        private String _permalink;

        public String Permalink
        {
            get { return _permalink; }
            set { _permalink = value; }
        }

        private IList<String> _categories;

        public IList<String> Categories
        {
            get { return _categories; }
            set { _categories = value; }
        }

        private IList<Comment> _comments;

        public IList<Comment> Comments
        {
            get { return _comments; }
            set { _comments = value; }
        }
    }
}