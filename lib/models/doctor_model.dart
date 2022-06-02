import 'dart:math';

class DoctorModel{
  late  String name;
  late  String email;
  late  String phone;
  late  String image;
  late  String ssn;
  late  String oId;
  late  String dId;
  late  String section;
  late String address;
  late String bio;
  late String cover;
   int? done;




  DoctorModel.fromJson(Map<String,dynamic> json){
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    ssn=json['ssn'];
    oId=json['oId'];
    dId=json['dId'];
    section=json['section'];
    address=json['address'];
    bio=json['bio'];
    cover=json['cover'];
    done=json['done'];



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
        'oId':oId,
        'dId':dId,
        'section':section,
        'address':address,
        'bio':bio,
        'cover':cover,
        'done':done,



      };

  }
  DoctorModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.ssn,
    required this.image,
    required this.oId,
    required this.dId,
    required this.section,
    required this.address,
    required this.bio,
    required this.cover,
     this.done,


  });

}