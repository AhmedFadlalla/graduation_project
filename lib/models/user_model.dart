import 'dart:math';

class UserModel{
  late  String name;
  late  String email;
  late  String phone;
  late  String image;
  late  String bio;
  late  String uId;
  late  bool isEmailVerified;


  UserModel.fromJson(Map<String,dynamic>? json){
    name=json!['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    bio=json['bio'];
    uId=json['uid'];
    isEmailVerified=json['isEmailVerified'];

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'image':image,
        'bio':bio,
        'uid':uId,
        'isEmailVerified':isEmailVerified,

    };

  }
  UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.phone,
    required this.bio,
    required this.image,
    required this.isEmailVerified,
  });

}