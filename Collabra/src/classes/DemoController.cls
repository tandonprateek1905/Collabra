global class DemoController {
 public Decimal counter{get;set;}
 public String feedItemText {get;set;}
 public Blob fileBlob {get;set;}
 public String title {get;set;}
 public String description {get;set;}
 public String filename {get;set;}
 public String linkName {get;set;}
 public String linkUrl {get;set;}
 
    // get first page of news feed
    global ConnectApi.FeedItemPage getNewsFeed() {
    	counter=0;
        return ConnectApi.ChatterFeeds.getFeedItemsFromFeed(null, ConnectApi.FeedType.News, 'me');
    }

    // build list of wrapped feed items for display in VisualForce
    global List<FeedItemInfo> getNewsFeedForDisplay() {
       //counter++;
        ConnectApi.FeedItemPage feed = getNewsFeed();      
        List<FeedItemInfo> result = new List<FeedItemInfo>();
        for (ConnectApi.FeedItem item : feed.items) {
            result.add(new FeedItemInfo(item));
        }
         //List<FeedItemInfo> result = new List<FeedItemInfo>();
        return result;
    }
    
    global void postItem(){
    	if(fileBlob!=null && !String.isEmpty(title) && !String.isEmpty(description) && !String.isEmpty(filename)){
    		postFileFeedItem(feedItemText, fileBlob, title, description, filename);
    	}else if(!String.isEmpty(linkName) && !String.isEmpty(linkUrl)){
    		postLinkFeedItem(feedItemText, linkName, linkUrl);
    	}else{
    		postTextFeedItem(feedItemText);
    	}
    }
    

	//posting only text
  global ConnectApi.FeedItem postTextFeedItem(String feedItemText) {
    ConnectApi.FeedItemInput feedItemInput = FeedBodyParser.convertToFeedItemInput(feedItemText);       
    return ConnectApi.ChatterFeeds.postFeedItem(null, ConnectApi.FeedType.News, 'me', feedItemInput, null);
  }
        
    //posting text plus attachment
  global ConnectApi.FeedItem postFileFeedItem(String feedItemText, Blob fileBlob, String title, String description, String filename) {
      ConnectApi.FeedItemInput feedItemInput = FeedBodyParser.convertToFeedItemInput(feedItemText);

      // file attachment
      ConnectApi.NewFileAttachmentInput fileIn = new ConnectApi.NewFileAttachmentInput();
      fileIn.title = title; // user-given "name" is set using the title
      fileIn.description = description;

      feedItemInput.attachment = fileIn;

      ConnectApi.BinaryInput feedBinary = new ConnectApi.BinaryInput(fileBlob, null, filename);

      return ConnectApi.ChatterFeeds.postFeedItem(null, ConnectApi.FeedType.News, 'me', feedItemInput, feedBinary);
  }

	//posting text plus link
  global ConnectApi.FeedItem postLinkFeedItem(String feedItemText, String linkName, String linkUrl) {
      ConnectApi.FeedItemInput feedItemInput = FeedBodyParser.convertToFeedItemInput(feedItemText);

      ConnectApi.LinkAttachmentInput linkIn = new ConnectApi.LinkAttachmentInput();
      linkIn.urlName = linkName;
      linkIn.url = linkUrl;

      feedItemInput.attachment = linkIn; 

      return ConnectApi.ChatterFeeds.postFeedItem(null, ConnectApi.FeedType.News, 'me', feedItemInput, null);
    }

   
}