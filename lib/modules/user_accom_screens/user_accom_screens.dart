import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:custom_check_box/custom_check_box.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/layouts/home_layout/cubit/states.dart';
import 'package:graduation_project/models/accom_model.dart';
import 'package:graduation_project/modules/user_accom_screens/accomindation_details_screen.dart';

import '../../layouts/home_layout/cubit/cubit.dart';
import '../../shared/component/components.dart';
import '../home_screen/home_screen.dart';



class UserAccomindationHomeScreen extends StatelessWidget {
  ////////////////////////////////

  ////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HorseCubit, HorseStates> //1
      (
      listener: (BuildContext context, state) {}, //1
      builder: (BuildContext context, state) //rebuilder//1
      {
        Size size = MediaQuery.of(context).size;
        var cubit=HorseCubit.get(context);
        return Scaffold(
          body: ConditionalBuilder(
            condition: cubit.accomList.length>0,
            builder:(context)=>SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   height: 170.0,
                  //   child: Card(
                  //     clipBehavior: Clip.antiAliasWithSaveLayer,
                  //     elevation: 20.0,
                  //     child: Image(
                  //       image: NetworkImage(
                  //           'https://image.freepik.com/free-vector/food-menu-banner-social-media-post_166746-86.jpg?w=1060'),
                  //       fit: BoxFit.cover,
                  //       height: 150.0,
                  //     ),
                  //   ),
                  // ),
                  ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>buildAccomCard(
                          cubit.accomList[index],
                          size,
                          index,
                          context
                      ),
                      separatorBuilder:(context,index)=> myDivider(),
                      itemCount: cubit.accomList.length)

                ],
              ),
            ) ,
            fallback:(context)=>Center(child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: NetworkImage('https://www.europeanequinelawyers.com/wp-content/uploads/2018/03/brexit-1024x682.jpg'),
                ),
                Text(
                  'No Accommindation yet',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                )
              ],
            ))  ,
          ),
        );
      },
    );
  }

  Widget buildAccomCard(AccomModel model,var size,index,context)=> InkWell(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      height: 190.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 25),
                      blurRadius: 25,
                      color: Colors.black26),
                ]),
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 140,
                width: 200,
                child: Container(
                  height:80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(70),
                    image: DecorationImage(
                      image: NetworkImage('https://rcmi.fiu.edu/wp-content/uploads/sites/30/2018/02/no_user.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 130.0,
                width: size.width - 200,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'اسم المزرعه :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.accomCreatorName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ))
        ],
      ),

    ),
    onTap: (){

      navigateTo(context, AccomindationDetailsScreen());


    },
  );
}
