import 'dart:convert';

class DiseaseModel{
  String ?disease;
  String? vaccine ;
  String ?vaccineDate ;
  String? medicineperDay ;
  String?medicineDuraition ;
  String? type ;

  DiseaseModel({
    required this.disease,
    required this.vaccine,
    required this.vaccineDate,
    required this.medicineperDay,required this.medicineDuraition,required this.type});
  DiseaseModel.fromJson(Map<String,dynamic>?json){
    disease=json!['disease'];
    vaccine=json['vaccine'];
    vaccineDate=json['vaccineDate'];
    medicineperDay=json['medicineperDay'];
    medicineDuraition=json['medicineDuraition'];
    type=json['type'];

  }
  Map<String,dynamic> toMap(){
    return {'disease':disease,
      'vaccine':vaccine,
      'vaccineDate':vaccineDate,
      'medicineperDay':medicineperDay,
      'type':type,
      'medicineDuraition':medicineDuraition,

    };
  }
}
