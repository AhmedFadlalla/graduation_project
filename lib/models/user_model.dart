import 'dart:math';

class UserModel{
  late  String name;
  late  String email;
  late  String phone;
  late  String image;
  late  String cover;
  late  String bio;
  late  String uId;
  late  int status;
    String? oId;
  String? section;



  UserModel.fromJson(Map<String,dynamic>? json){
    name=json!['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    cover=json['cover'];
    bio=json['bio'];
    uId=json['uid'];
    status=json['status'];
    oId=json['oId'];
    section=json['section'];


  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'image':image,
        'cover':cover,
        'bio':bio,
        'uid':uId,
        'status':status,
        'oId':oId,
        'section':section,

    };

  }
  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.bio,
    required this.image,
    required this.cover,
    required this.status,
    this.oId,
    this.section

  });

}