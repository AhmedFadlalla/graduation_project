class SectionDataModel{

  late String name;
  late String secId;

  SectionDataModel.fromJson(Map<String,dynamic> json){
    name=json['name'];
    secId=json['secId'];


  }
  Map<String,dynamic> toMap(){
    return {
      'name':name,
      'secId':secId
    };



  }


  SectionDataModel({
 required this.name,
    required this.secId
});






}