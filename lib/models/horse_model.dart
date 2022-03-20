import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class HorseModel{
  late  String horseName;
  late  String horseImage;
  late  String fatherName;
  late  String motherName;
  late  String sectionNum;
  late  String boxNum;
  late String owner;
  late  Timestamp birthDate;
  late  String initPrice;
  late  String microshipCode;
  late  String type;
  late String color;
  late String gander;




  HorseModel.fromJson(Map<String,dynamic> json){
    horseName=json['horseName'];
    horseImage=json['horseImage'];
    fatherName=json['fatherName'];
    motherName=json['motherName'];
    sectionNum=json['sectionNum'];
    boxNum=json['boxNum'];
    owner=json['owner'];
    birthDate=json['birthDate'];
    initPrice=json['initPrice'];
    microshipCode=json['microshipCode'];
    type=json['type'];
    color=json['color'];
    gander=json['gander'];

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'horseName':horseName,
        'horseImage':horseImage,
        'fatherName':fatherName,
        'motherName':motherName,
        'sectionNum':sectionNum,
        'boxNum':boxNum,
        'owner':owner,
        'birthDate':birthDate,
        'initPrice':initPrice,
        'microshipCode':microshipCode,
        'type':type,
        'color':color,
        'gander':gander,

      };

  }
  HorseModel({
    required this.horseName,
    required this.horseImage,
    required this.fatherName,
    required this.motherName,
    required this.sectionNum,
    required this.boxNum,
    required this.owner,
    required this.birthDate,
    required this.initPrice,
    required this.microshipCode,
    required this.type,
    required this.color,
    required this.gander,
  });

}