import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/models/horse_model.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../models/doctor_model.dart';
import '../../../shared/component/components.dart';
import 'HorseDetails.dart';

class HorsesSectionSection extends StatelessWidget {
  const HorsesSectionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var cubit=OwnerCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: Color(0xFF4DB6AC),

            body: ConditionalBuilder(
              condition: cubit.horseData.length>0,
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
                        itemBuilder: (context,index)=>buildHorseCard(
                            cubit.horseData[index],
                            size,
                            index,
                            context
                        ),
                        separatorBuilder:(context,index)=> myDivider(),
                        itemCount: cubit.horseData.length)

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
                    'No Horses Yet!!!!!!!!!',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                ],
              ))  ,
            ),
          );
        },
        listener: (context,state){

          if(state is GetHorsesDetailsSuccessfulState)
            navigateTo(context, HorseDetailsScreen());

        });
  }
  Widget buildHorseCard(HorseModel model,var size,index,context)=> InkWell(
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
                height: 130,
                width: 190,
                child: Container(
                  height:80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(70),
                    image: DecorationImage(
                      image: NetworkImage('${model.horseImage}'),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'الاسم :',
                              style: TextStyle(color: Colors.black, fontSize: 28,
                                ),

                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${model.horseName}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,

                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                'المايكروشيب :',
                                style: TextStyle(color: Colors.black, fontSize: 28,

                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${model.microshipCode}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          children: [
                            Text(
                              'رقم الصندوق :',
                              style: TextStyle(color: Colors.black, fontSize: 28,

                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${model.boxNum}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,

                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ))
        ],
      ),

    ),
    onTap: (){
      print(model.microshipCode);
      OwnerCubit.get(context).getHorseDetailsData(horseId:model.microshipCode,secId: model.sectionName );

    },
  );
}