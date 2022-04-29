import 'dart:convert';

class DiseaseData{
  String ?disease;
  String? doctor ;
  String ?diseaseCase ;
  String? date ;
  DiseaseData({required this.disease,required this.doctor,required this.diseaseCase,required this.date});
  DiseaseData.fromJson(Map<String,dynamic>?json){
    disease=json!['disease'];
    doctor=json['doctor'];
    diseaseCase=json['diseaseCase'];
    date=json['date'];
  }
  Map<String,dynamic> toMap(){
    return{
      'disease':disease,
      'doctor':doctor,
      'diseaseCase':diseaseCase,
      'date':date
    };
  }

}
