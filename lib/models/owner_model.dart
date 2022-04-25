import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

class OwnerModel{
  late  String studName;
  late  String ownerName;
  late  String phone;
  late  String image;
  late  String cover;
  late  String oId;
  late  String address;
  late  String bio;




  OwnerModel.fromJson(Map<String,dynamic> json){
    studName=json['studName'];
    ownerName=json['ownerName'];
    phone=json['phone'];
    image=json['image'];
    cover=json['cover'];
    address=json['address'];
    oId=json['oId'];
    bio=json['bio'];

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'studName':studName,
        'ownerName':ownerName,
        'phone':phone,
        'image':image,
        'cover':cover,
        'address':address,
        'oId':oId,
        'bio':bio,

      };

  }
  OwnerModel({
    required this.studName,
    required this.ownerName,
    required this.oId,
    required this.phone,
    required this.address,
    required this.image,
    required this.cover,
    required this.bio, email,
  });




}