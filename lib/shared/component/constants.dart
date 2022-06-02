


import 'package:flutter/cupertino.dart';

List<Map> tasks=[];


void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) =>print(match.group(0)));

}
String token='';

 String? uId;
String? oId;
String? dId;
dynamic dDone;

//baseUrl: http://newsapi.org/
// methode: v2/top-headlines?
// quires: country=eg&category=business&apiKey=6548987cacc64a19a4e82084fce1b2fe


//https://newsapi.org/
// v2/everything?
// q=tesla&apiKey=6548987cacc64a19a4e82084fce1b2fe