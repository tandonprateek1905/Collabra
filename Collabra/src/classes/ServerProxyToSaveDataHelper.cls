public class ServerProxyToSaveDataHelper {

public List<ProxyModel> getAllGroup(String strWidgetId,String strUserId){
	Map<String,String>  mapUserSelectedGroup=getUserSelectedGroup(strWidgetId,strUserId);
	List<ProxyModel> lstProxyModel=new List<ProxyModel>();
	
	for(Group__c objGroup:[Select id,Group_Name__c from Group__c]){
		 ProxyModel objProxyModel=new ProxyModel();
		 objProxyModel.strGroupID=objGroup.id;
		 objProxyModel.strGroupName=objGroup.Group_Name__c;
		 if(mapUserSelectedGroup.size()>0){
		 	 if(mapUserSelectedGroup.get(objGroup.id)!=null){
		 	 	objProxyModel.isSelectedGroup=true;
		 	 }
		 }else{
		 	objProxyModel.isSelectedGroup=true;
		 }
		 lstProxyModel.add(objProxyModel);
	}
  return  lstProxyModel;	
}

public Map<String,String> getUserSelectedGroup(String strWidgetId,String strUserId){
	Map<String,String>  mapUserSelectedGroup=new Map<String,String>();
	try{
		  User_Widget_Configuration__c objUserWidgetConfiguration=[Select id,Selected_Group__c from User_Widget_Configuration__c 
		                                                           where Widget__c=:strWidgetId and User__c=:strUserId];
	      for(String strGroupId:objUserWidgetConfiguration.Selected_Group__c.split(',')){
	     	mapUserSelectedGroup.put(strGroupId,strGroupId);
	      }
	   }catch(Exception ex){}
    return mapUserSelectedGroup;
}

public Boolean saveWidgetDetail(String strWidgetId,String strUserId,String strGroupId){
	  Widget__c objWidget=new WidgetModelHelper().getSingleWidgetDetail(strWidgetId,strUserId);
	  if(objWidget.User_Widget_Configurations__r.size()>0){
	  		User_Widget_Configuration__c objUserWidgetConfiguration=[Select id,Selected_Group__c from User_Widget_Configuration__c 
		                                                             where Widget__c=:strWidgetId and User__c=:strUserId];  
		    objUserWidgetConfiguration.Selected_Group__c=strGroupId;
		    update objUserWidgetConfiguration;                                                       	
	  	
	  }else{
	  	User_Widget_Configuration__c objUserConfig=new User_Widget_Configuration__c(); 
	  	
	    objUserConfig.Data_Col__c=objWidget.Data_Col__c;
		objUserConfig.Data_Row__c=objWidget.Data_Row__c;
		objUserConfig.Data_SizeX__c=objWidget.Data_SizeX__c;
		objUserConfig.Data_SizeY__c=objWidget.Data_SizeY__c;
		objUserConfig.User__c=strUserId;
	    objUserConfig.Widget__c=strWidgetId; 
	  	objUserConfig.Selected_Group__c=strGroupId;
	  	
	  	insert objUserConfig;
	  }
	return true;
}





}