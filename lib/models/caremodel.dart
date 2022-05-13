import 'package:flutter/material.dart';

class CarModl{
  String Titlle;
  String price;

  CarModl(this.Titlle,this.price);
}
List<CarModl>cardata=[
  CarModl("البرسيم", "سعر الكيلو 10 جنيه"),
  CarModl("القمح","سعر الكيلو 8 جنيه"),
  CarModl("الذرة","سعر الكيلو 9 جنيه")
];