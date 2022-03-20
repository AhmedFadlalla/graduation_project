import 'dart:math';

class OwnerModel{
  late  String studName;
  late  String ownerName;
  late  String phone;
  late  String image;
  late  String oId;
  late  String address;




  OwnerModel.fromJson(Map<String,dynamic> json){
    studName=json['studName'];
    ownerName=json['ownerName'];
    phone=json['phone'];
    image=json['image'];
    address=json['address'];
    oId=json['oId'];

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'studName':studName,
        'ownerName':ownerName,
        'phone':phone,
        'image':image,
        'address':address,
        'oId':oId,


      };

  }
  OwnerModel({
    required this.studName,
    required this.ownerName,
    required this.oId,
    required this.phone,
    required this.address,
    required this.image,
  });

}