google.load("search", "1");
var searchControl;

function initialize() {
    // Create a search control
    searchControl = new google.search.SearchControl();
    searchControl.setLinkTarget(google.search.Search.LINK_TARGET_SELF);
    searchControl.setSearchCompleteCallback(null,
    function() {
      document.getElementById("searchResults").style.display = "inline";
      document.getElementById("main_content").style.display = "none";
        //callbackFunction(point);
    }); 

    // site restricted web search with custom label
    // and class suffix
    var siteSearch = new google.search.WebSearch();
    siteSearch.setUserDefinedLabel("RPCWC.org");
    siteSearch.setUserDefinedClassSuffix("siteSearch");
    siteSearch.setSiteRestriction("rpcwc.org");
    siteSearch.setResultSetSize(google.search.Search.LARGE_RESULTSET);

    options = new google.search.SearcherOptions();
    options.setExpandMode(google.search.SearchControl.EXPAND_MODE_OPEN);
    options.setRoot(document.getElementById("searchResults"));
    searchControl.addSearcher(siteSearch, options);

    // tell the searcher to draw itself and tell it where to attach
    searchControl.draw(document.getElementById("searchbox"));
}

google.setOnLoadCallback(initialize);  