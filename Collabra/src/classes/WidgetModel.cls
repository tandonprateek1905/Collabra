public class WidgetModel {

public Boolean bActiveWidget{get;set;}
public String strDataCol{get;set;}
public String strDataRow{get;set;}
public String strDataSizeX{get;set;}
public String strDataSizeY{get;set;}
public String strWidgetName{get;set;}
public String strWidgetType{get;set;}
public String strWidgetId{get;set;}
public String strUserWidgetType{get;set;}
public String strUserWidgetLinkUrl{get;set;}
public String strWidgetTitle{get;set;}
public String strUserDefinedText{get;set;}

public WidgetModel(){
	
}
public WidgetModel(Boolean bActiveWidget,String strDataCol,String strDataRow,String strDataSizeX,String strDataSizeY,String strWidgetName,
                   String strWidgetType,String strWidgetId,String strWidgetTitle){
	this.bActiveWidget=bActiveWidget;
	this.strDataCol=strDataCol;
	this.strDataRow=strDataRow;
	this.strDataSizeX=strDataSizeX;
	this.strDataSizeY=strDataSizeY;
	this.strWidgetName=strWidgetName;
	this.strWidgetType=strWidgetType;
	this.strWidgetId=strWidgetId;
	this.strWidgetTitle=strWidgetTitle;
	
}
/*public WidgetModel(Boolean bActiveWidget,String strDataCol,String strDataRow,String strDataSizeX,String strDataSizeY,String strWidgetName,
                   String strWidgetType,String strWidgetId,String strUserWidgetType,String strUserWidgetLinkUrl){
	this.bActiveWidget=bActiveWidget;
	this.strDataCol=strDataCol;
	this.strDataRow=strDataRow;
	this.strDataSizeX=strDataSizeX;
	this.strDataSizeY=strDataSizeY;
	this.strWidgetName=strWidgetName;
	this.strWidgetType=strWidgetType;
	this.strWidgetId=strWidgetId;
	this.strUserWidgetType=strUserWidgetType;
	this.strUserWidgetLinkUrl=strUserWidgetLinkUrl;
}*/

public WidgetModel(Boolean bActiveWidget,String strDataCol,String strDataRow,String strDataSizeX,String strDataSizeY,String strWidgetName,
                   String strWidgetType,String strWidgetId,String strUserWidgetType,String strUserWidgetLinkUrl,String strWidgetTitle,
                   String strUserDefinedText){
	this.bActiveWidget=bActiveWidget;
	this.strDataCol=strDataCol;
	this.strDataRow=strDataRow;
	this.strDataSizeX=strDataSizeX;
	this.strDataSizeY=strDataSizeY;
	this.strWidgetName=strWidgetName;
	this.strWidgetType=strWidgetType;
	this.strWidgetId=strWidgetId;
	this.strUserWidgetType=strUserWidgetType;
	this.strUserWidgetLinkUrl=strUserWidgetLinkUrl;
	this.strWidgetTitle=strWidgetTitle;
	this.strUserDefinedText=strUserDefinedText;
}  
}