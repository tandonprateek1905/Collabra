global class ServerProxyToSaveData {

public List<String> lstSelectedGroup{get;set;}
public List<ProxyModel> lstGroup{get;set;}
public String strWidgetId{get;set;}

public ServerProxyToSaveData(){
	lstGroup=new List<ProxyModel>();
	strWidgetId=ApexPages.currentPage().getParameters().get('id');
	lstGroup=new ServerProxyToSaveDataHelper().getAllGroup(strWidgetId,UserInfo.getUserId());
}

 @RemoteAction
global static String saveUserGroupDetail(String strWidgetId,String strGroupId ){ 
	String strUserId=UserInfo.getUserId();
	new ServerProxyToSaveDataHelper().saveWidgetDetail(strWidgetId,strUserId,strGroupId);
	
	return 'true';
}

}