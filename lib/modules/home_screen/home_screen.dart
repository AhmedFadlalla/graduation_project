import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/layouts/home_layout/home_layout.dart';
import 'package:graduation_project/modules/manage_stud_screens/info_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/component/constants.dart';
import 'package:graduation_project/shared/network/local/cach_helper.dart';

import '../../layouts/owner_home_layout/owner_home_Layout.dart';
import '../user_accom_screens/user_accom_screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: buildImageInteractionCard(
                          title: 'Manage my stud',
                          image: 'https://apis.xogrp.com/media-api/images/cd833cb0-6160-11e5-9816-22000aa61a3e',
                        ),
                        onTap: (){
                            navigateTo(context,InfoScreen());}

                        ,
                      ),
                    ),
                    SizedBox(width: 50.0,),
                    Expanded(
                      child: InkWell(
                        child: buildImageInteractionCard(
                          title: 'الايواء',
                          image: 'https://www.alkonouz.com/wp-content/uploads/2020/07/%D8%A7%D8%B3%D8%B7%D8%A8%D9%84-%D8%BA%D9%84%D8%A7%D9%81.jpg',
                        ),
                        onTap: (){
                          navigateTo(context, UserAccomindationHomeScreen());
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),

            /////////////////الصف  التاني ///////////////////////////////
            // EdgeInsets.symmetric(horizontal: 20.0),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [


                    Expanded(
                      child: buildImageInteractionCard(
                        title: 'المزادات ',
                        image: 'https://media.istockphoto.com/photos/justice-gavel-on-laptop-computer-keyboard-picture-id931025190?k=20&m=931025190&s=612x612&w=0&h=MK7l3HOK1XmgCPKwx6WVxMX_yM_NtQqCuV1QsBys8dM=',
                      ),
                    ),
                    Expanded(
                      child: buildImageInteractionCard(
                        title: 'مستلزمات الخيل ',
                        image: 'https://m.media-amazon.com/images/I/61XBNNddj4L.jpg',
                      ),
                    ),



                  ],
                ),
              ),
            ),
            /////////////////////////////////////////////////////

            //////////////////////

            ///////////////////////////////
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: buildImageInteractionCard(
                        title: 'السنةالنبوية',
                        image: 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/8b45cb19272075.562d79509ff86.jpg',
                      ),
                    ),
                    SizedBox(width: 50.0,),


                  ],
                ),
              ),
            ),
            ////////////////////////////////

          ],
        ),
      ),

    );
  }
}
Widget buildImageInteractionCard({
  String? title,
  String image = 'https://scontent.faly1-2.fna.fbcdn.net/v/t1.6435-9/148577639_'
      '262626785223454_7510717016690158095_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_'
      'nc_eui2=AeHs-r6YwFdWFo2Edr8RIS-EPVM5h__RUno9UzmH_9FSer_7C-3PiaHYA9IJJyUQj7o_'
      'AG9_botUuyukAMRS8ACA&_nc_ohc=i0lUiHsEkr4AX8CGYbt&_nc_ht=scontent.faly1-2.fna&oh=00_AT_'
      'lqFj3jky-nIqgKCOSW-qjf9UeZNzbbdRDSu3Bb3hY9A&oe=6248696A',
}) =>
    Card(
      elevation: 22.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                image: NetworkImage(
                  image,
                ),
                width: double.infinity,
                height: 180.0,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.4),
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                width: double.infinity,
                child: Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

