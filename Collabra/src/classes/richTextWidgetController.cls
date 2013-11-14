public class richTextWidgetController {
	public String strTextContent{get;set;}
   public WidgetModel objWidgetModel{get;set;}
   
   public richTextWidgetController(){
     objWidgetModel=new WidgetModel();
     initilalizeUserWidget();
   	 strTextContent='';
   }	

  public pagereference saveUserTextDetail(){
  	new WidgetModelHelper().CreateUserWidget(objWidgetModel,UserInfo.getUserId());
  	return null;
  }
public void initilalizeUserWidget(){
	objWidgetModel.strDataCol='2';
	objWidgetModel.strDataRow='2';
	objWidgetModel.strDataSizeX='2';
	objWidgetModel.strDataSizeY='2';
	objWidgetModel.strWidgetType='User Based';
	objWidgetModel.strUserWidgetType='Text';
  }


}