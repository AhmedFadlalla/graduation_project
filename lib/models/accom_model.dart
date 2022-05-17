import 'dart:math';

class AccomModel {
  late String AccomImage;
  late String type;
  late String Price;
  late String info;
  late String address;
  late String phone;
   String? accomCreatorId;
  String? accomCreatorName;

  AccomModel.fromJson(Map<String, dynamic> json) {
    AccomImage = json['AccomImage'];
    type = json['type'];
    Price = json['Price'];
    info = json['info'];
    address = json['address'];

    phone = json['phone'];
    accomCreatorId = json['accomCreatorId'];
    accomCreatorName = json['accomCreatorName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'AccomImage': AccomImage,
      'type': type,
      'Price': Price,
      'info': info,
      'address': address,

      'phone': phone,
      'accomCreatorId': accomCreatorId,
      'accomCreatorName': accomCreatorName,
    };
  }

  AccomModel({
    required this.AccomImage,
    required this.type,
    required this.Price,
    required this.info,
    required this.address,
    required this.phone,
    this.accomCreatorId,
    this.accomCreatorName,
  });
}