import 'dart:math';

class AccomModel {
  late String AccomImage;
  late String type;
  late String Price;
  late String info;
  late String address;
  late String phone;

  AccomModel.fromJson(Map<String, dynamic> json) {
    AccomImage = json['AccomImage'];
    type = json['type'];
    Price = json['Price'];
    info = json['info'];
    address = json['address'];

    phone = json['phone'];
  }

  Map<String, dynamic> toMap() {
    return {
      'AccomImage': AccomImage,
      'type': type,
      'Price': Price,
      'info': info,
      'address': address,

      'phone': phone,
    };
  }

  AccomModel({
    required this.AccomImage,
    required this.type,
    required this.Price,
    required this.info,
    required this.address,
    required this.phone,
  });
}