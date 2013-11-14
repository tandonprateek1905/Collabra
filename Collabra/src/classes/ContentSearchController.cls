public class ContentSearchController{

public List<ContentDocument> lstDoc{get;set;}
public List<ContentVersion> content {get;set;}
public transient List<String> lstImage{get;set;}
public ContentSearchController(){

lstDoc=[Select id, PublishStatus from ContentDocument where title='feed'];
loadImageData();
}

public transient String imageData {get; set;}
public void loadImageData() {
 content = [select id, versiondata,pathonclient,FileType,
             ContentUrl,ContentDocumentId  from ContentVersion];
lstImage=new  List<String> ();
for(ContentVersion obj:content){
	if(obj.versiondata!=null && obj.FileType!='ZIP'){
	 lstImage.add(EncodingUtil.base64Encode(obj.versiondata));
	}
	if(obj.FileType=='ZIP'){
		imageData=EncodingUtil.base64Encode(obj.versiondata);
		
	}
}
//imageData = EncodingUtil.base64Encode(content[0].versiondata);
}
}