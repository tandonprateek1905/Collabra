public with sharing class CBGroupFeedController {

public  List<SelectOption> lstGroupOption{get;set;}
public List<ConnectApi.FeedItem> lstGroupFeed{get;set;}
public CBChatterUtil objCBChatterUtil{get;set;}
public  String groupId { get; set; }

public CBGroupFeedController(){
	objCBChatterUtil=new CBChatterUtil(null,UserInfo.getUserId());
	
	lstGroupOption=objCBChatterUtil.getGroupOptions();
	if(lstGroupOption!=null && lstGroupOption.size()>1){
		groupId=lstGroupOption.get(1).getValue();
		getUserGroupFeed();
	}
	
}

 public pagereference getUserGroupFeed(){
	 lstGroupFeed=objCBChatterUtil.getFeedItems(groupId);
	 return null;
	
 }


}