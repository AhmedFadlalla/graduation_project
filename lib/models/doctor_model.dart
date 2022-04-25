import 'dart:math';

class DoctorModel{
  late  String name;
  late  String email;
  late  String phone;
  late  String image;
  late  String ssn;



  DoctorModel.fromJson(Map<String,dynamic> json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    ssn=json['ssn'];

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'image':image,
        'ssn':ssn,


      };

  }
  DoctorModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.ssn,
    required this.image,

  });

}