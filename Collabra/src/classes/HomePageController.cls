public class HomePageController {

public List<WidgetModel> lstWidget{get;set;}
public List<WidgetModel> lstUserDefinedWidget{get;set;}
public String strWidgetId{get;set;}

public String strUserConfigDetail{get;set;}

public HomePageController(){
	lstWidget=new List<WidgetModel>();
	lstUserDefinedWidget=new List<WidgetModel>();
	strWidgetId='';
	strUserConfigDetail='';
	lstWidget=new WidgetModelHelper().getWidgetDetail(userInfo.getUserId());
	lstUserDefinedWidget=new WidgetModelHelper().getUserDefinedWidgetDetail(userInfo.getUserId());
}

public pagereference saveUserConfiguration(){
	Map<String,User_Widget_Configuration__c> mapUserConfig=new WidgetModelHelper().getUserDefinedConfigruation(UserInfo.getUserId());
	
	List<String> lstUserAllConfig=new List<String>();
	lstUserAllConfig=strUserConfigDetail.split('@');
	List<User_Widget_Configuration__c> lstUserConfig=new List<User_Widget_Configuration__c>();
	
	for(String str:lstUserAllConfig){
	     List<String> lstUserWidgetConfig=str.split('#');
	     String strWidgetId=lstUserWidgetConfig.get(0);
	     String datarows=lstUserWidgetConfig.get(1);
	     String datacol=lstUserWidgetConfig.get(2);
	     String datasizeX=lstUserWidgetConfig.get(3);
	     String datasizeY=lstUserWidgetConfig.get(4);
	     
	     User_Widget_Configuration__c objUserConfig=new User_Widget_Configuration__c();
	     if(mapUserConfig.get(strWidgetId)!=null){
	     	objUserConfig=mapUserConfig.get(strWidgetId);
	     }
	    
	    
	    lstUserConfig.add(new WidgetModelHelper().setUserConfigDetail(true,UserInfo.getUserId(),objUserConfig,strWidgetId,datarows,datacol,datasizeX,datasizeY));
	   
	        
	}
	 if(lstUserConfig.size()>0){
	    	upsert lstUserConfig;
	    }
	    lstWidget=new WidgetModelHelper().getWidgetDetail(userInfo.getUserId());
	    lstUserDefinedWidget=new WidgetModelHelper().getUserDefinedWidgetDetail(userInfo.getUserId());
	return null;
}
public pagereference inActiveOrActiveWidget(){
	Map<String,User_Widget_Configuration__c> mapUserConfig=new WidgetModelHelper().getUserDefinedConfigruation(UserInfo.getUserId());
	
	if(mapUserConfig.get(strWidgetId)==null){
	List<String> lstUserAllConfig=new List<String>();
	lstUserAllConfig=strUserConfigDetail.split('@');
	List<User_Widget_Configuration__c> lstUserConfig=new List<User_Widget_Configuration__c>();
	
	for(String str:lstUserAllConfig){
	     List<String> lstUserWidgetConfig=str.split('#');
	     String strWidgetId=lstUserWidgetConfig.get(0);
	     String datarows=lstUserWidgetConfig.get(1);
	     String datacol=lstUserWidgetConfig.get(2);
	     String datasizeX=lstUserWidgetConfig.get(3);
	     String datasizeY=lstUserWidgetConfig.get(4);
	     
	     User_Widget_Configuration__c objUserConfig=new User_Widget_Configuration__c();
	     if(mapUserConfig.get(strWidgetId)!=null){
	     	objUserConfig=mapUserConfig.get(strWidgetId);
	     }
	    
	    
	    lstUserConfig.add(new WidgetModelHelper().setUserConfigDetail(false,UserInfo.getUserId(),objUserConfig,strWidgetId,datarows,datacol,datasizeX,datasizeY));
	   }
	   if(lstUserConfig.size()>0){
	   	 upsert lstUserConfig;
	   }
	}else{
		new WidgetModelHelper().inActiveOrActiveWidget(strWidgetId,false);
	}
	
	lstWidget=new WidgetModelHelper().getWidgetDetail(userInfo.getUserId());
	lstUserDefinedWidget=new WidgetModelHelper().getUserDefinedWidgetDetail(userInfo.getUserId());
	
	return null;
}


}