public class WidgetModelHelper {

public List<WidgetModel> getWidgetDetail(String strUserId){
	
	List<WidgetModel> lstWidget=new List<WidgetModel>();
	
	for(Widget__c obj:[SELECT Widget_Title__c,id,Data_Col__c, Data_Row__c, Data_SizeX__c,Data_SizeY__c, Active_Widget__c, Widget_Name__c, Widget_Type__c, 
	                  (SELECT Data_Col__c,Data_Row__c,Data_SizeX__c,Data_SizeY__c,User__c,Name,Widget__c,Active_Widget__c 
	                   FROM User_Widget_Configurations__r where User__c=:strUserId) 
	                   FROM Widget__c where User__c=null and Widget_Type__c='Product Based']){
	  if(obj.User_Widget_Configurations__r.size()>0){
	  	 User_Widget_Configuration__c objWidget=obj.User_Widget_Configurations__r.get(0);
	  	 lstWidget.add(new WidgetModel(objWidget.Active_Widget__c,objWidget.Data_Col__c,(objWidget.Data_Row__c),(objWidget.Data_SizeX__c),objWidget.Data_SizeY__c,
	  	                               obj.Widget_Name__c,obj.Widget_Type__c,obj.id,obj.Widget_Title__c)); 
	  }else{
	  	lstWidget.add(new WidgetModel(obj.Active_Widget__c,(obj.Data_Col__c),(obj.Data_Row__c),(obj.Data_SizeX__c),obj.Data_SizeY__c,
	  	                               (obj.Widget_Name__c),(obj.Widget_Type__c),(obj.id),obj.Widget_Title__c));
	  }
		
	}

return lstWidget;	 
}

public Widget__c getSingleWidgetDetail(String strWidgetId,String strUserId){
	return [SELECT Widget_Title__c,id,Data_Col__c, Data_Row__c, Data_SizeX__c,Data_SizeY__c, Active_Widget__c, Widget_Name__c, Widget_Type__c, 
          (SELECT Data_Col__c,Data_Row__c,Data_SizeX__c,Data_SizeY__c,User__c,Name,Widget__c,Active_Widget__c 
           FROM User_Widget_Configurations__r where User__c=:strUserId) 
           FROM Widget__c where id=:strWidgetId];
	
}


public List<WidgetModel> getUserDefinedWidgetDetail(String strUserId){
   List<WidgetModel> lstWidget=new List<WidgetModel>();
	
	for(Widget__c obj:[SELECT Widget_Title__c,User_Defined_Text__c,id,Data_Col__c, Data_Row__c, Data_SizeX__c,Data_SizeY__c, Active_Widget__c, Widget_Name__c, Widget_Type__c,User_Defined_Type__c,
	                   Link_URL__c, 
	                  (SELECT Data_Col__c,Data_Row__c,Data_SizeX__c,Data_SizeY__c,User__c,Name,Widget__c,Active_Widget__c 
	                   FROM User_Widget_Configurations__r where User__c=:strUserId) 
	                  FROM Widget__c where User__c=:strUserId ]){
	  if(obj.User_Widget_Configurations__r.size()>0){
	  	 User_Widget_Configuration__c objWidget=obj.User_Widget_Configurations__r.get(0);
	  	 if(objWidget.Active_Widget__c){
	  	 lstWidget.add(new WidgetModel(objWidget.Active_Widget__c,objWidget.Data_Col__c,(objWidget.Data_Row__c),(objWidget.Data_SizeX__c),objWidget.Data_SizeY__c,
	  	                               obj.Widget_Name__c,obj.Widget_Type__c,obj.id,obj.User_Defined_Type__c,obj.Link_URL__c,obj.Widget_Title__c,obj.User_Defined_Text__c));
	  	 }                               
	  }else{
	  	if(obj.Active_Widget__c){
	  	  lstWidget.add(new WidgetModel(obj.Active_Widget__c,(obj.Data_Col__c),(obj.Data_Row__c),(obj.Data_SizeX__c),obj.Data_SizeY__c,
	  	                               (obj.Widget_Name__c),obj.Widget_Type__c,obj.id,obj.User_Defined_Type__c,obj.Link_URL__c,obj.Widget_Title__c,obj.User_Defined_Text__c));
	  	   }
	     }
		
	}

return lstWidget;	
	
}



public Map<String,User_Widget_Configuration__c> getUserDefinedConfigruation(String strUserId){
	Map<String,User_Widget_Configuration__c> mapUserConfig=new Map<String,User_Widget_Configuration__c>();
	
	for(User_Widget_Configuration__c obj:[SELECT Data_Col__c,Data_Row__c,Data_SizeX__c,Data_SizeY__c,User__c,Name,Widget__c,Active_Widget__c
	       FROM User_Widget_Configuration__c where User__c=:strUserId]){
	    mapUserConfig.put(obj.Widget__c,obj);	
	}
	
return mapUserConfig;	
}



public User_Widget_Configuration__c setUserConfigDetail(Boolean widgetActive,String strUserId,User_Widget_Configuration__c objUserWidgetConfiguration,String strWidgetId,
                                                         String strdataRow,String strDataCol,String strSizeX,String strSizY){
	objUserWidgetConfiguration.Data_Col__c=strDataCol;
	objUserWidgetConfiguration.Data_Row__c=strdataRow;
	objUserWidgetConfiguration.Data_SizeX__c=strSizeX;
	objUserWidgetConfiguration.Data_SizeY__c=strSizY;
	objUserWidgetConfiguration.Widget__c=strWidgetId;
	objUserWidgetConfiguration.User__c=strUserId;
	objUserWidgetConfiguration.Active_Widget__c=widgetActive;
	return objUserWidgetConfiguration;
}

public Boolean inActiveOrActiveWidget(String strWidgetId,Boolean bActiveOrInactive){
	User_Widget_Configuration__c objUserConfig=[Select id,Active_Widget__c from User_Widget_Configuration__c where Widget__c=:strWidgetId];
	objUserConfig.Active_Widget__c=bActiveOrInactive;
	update objUserConfig;
	
	return true;
}

public List<WidgetModel> getAllInactiveWidgetDetail(String strUserId){
	List<WidgetModel> lstWidget=new List<WidgetModel>();
	for(Widget__c obj:[SELECT Widget_Title__c,id,Data_Col__c, Data_Row__c, Data_SizeX__c,Data_SizeY__c, Active_Widget__c, Widget_Name__c, Widget_Type__c, 
	                  (SELECT Data_Col__c,Data_Row__c,Data_SizeX__c,Data_SizeY__c,User__c,Name,Widget__c,Active_Widget__c 
	                   FROM User_Widget_Configurations__r where User__c=:strUserId and Active_Widget__c=:false) 
	                  FROM Widget__c]){
	            if(obj.User_Widget_Configurations__r.size()>0){
	            	User_Widget_Configuration__c objWidget=obj.User_Widget_Configurations__r.get(0);
	                lstWidget.add(new WidgetModel(objWidget.Active_Widget__c,(objWidget.Data_Col__c),(objWidget.Data_Row__c),(objWidget.Data_SizeX__c),objWidget.Data_SizeY__c,
	  	                          (obj.Widget_Name__c),(obj.Widget_Type__c),(objWidget.id),obj.Widget_Title__c));  
	        
	            }                 	
        	 }
	return lstWidget;
}

public Boolean CreateUserWidget(WidgetModel objWidgetModel,String strUserId){
	 Widget__c objWidget=convertToWidgetObject(objWidgetModel,strUserId);
	 insert objWidget;
	 
	 User_Widget_Configuration__c objConfig=convertToUserConfigtObject(objWidgetModel,objWidget.id,strUserId);
	 insert objConfig;
	
	return true;
}

public Widget__c convertToWidgetObject(WidgetModel objWidgetModel,String strUserId){
	Widget__c objWidget=new Widget__c();
	objWidget.Widget_Name__c=objWidgetModel.strWidgetTitle;
	objWidget.Widget_Title__c=objWidgetModel.strWidgetName;
	
	objWidget.Data_Col__c=objWidgetModel.strDataCol;
	objWidget.Data_Row__c=objWidgetModel.strDataRow;
	objWidget.Data_SizeX__c=objWidgetModel.strDataSizeX;
	objWidget.Data_SizeY__c=objWidgetModel.strDataSizeY;
	
	objWidget.Widget_Type__c=objWidgetModel.strWidgetType;
	objWidget.User_Defined_Type__c=objWidgetModel.strUserWidgetType;
	objWidget.User_Defined_Text__c=objWidgetModel.strUserDefinedText;
	objWidget.User__c=strUserId;
	return objWidget;
}
public User_Widget_Configuration__c convertToUserConfigtObject(WidgetModel objWidgetModel,String strWidgetId,String strUserId){
	User_Widget_Configuration__c objWidget=new User_Widget_Configuration__c();
	objWidget.Data_Col__c=objWidgetModel.strDataCol;
	objWidget.Data_Row__c=objWidgetModel.strDataRow;
	objWidget.Data_SizeX__c=objWidgetModel.strDataSizeX;
	objWidget.Data_SizeY__c=objWidgetModel.strDataSizeY;
	objWidget.User__c=strUserId;
    objWidget.Widget__c=strWidgetId; 
	
	return objWidget;
}

public String convertToString(Decimal objData){
	return String.valueOf(objData);
}

}