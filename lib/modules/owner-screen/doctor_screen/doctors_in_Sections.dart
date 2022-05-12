 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/doctor_model.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../shared/component/components.dart';

class DoctorSection extends StatelessWidget {
  const DoctorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var cubit=OwnerCubit.get(context);
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: Colors.green,
            floatingActionButton: FloatingActionButton(
              onPressed: (){

              },
              child: Icon(
                  Icons.add
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.sectionData.length>0,
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
                        itemBuilder: (context,index)=>buildDoctorCard(
                            cubit.docData[index],
                            size,
                            index,
                            context
                        ),
                        separatorBuilder:(context,index)=> myDivider(),
                        itemCount: cubit.docData.length)

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
                    'No Doctor Yet!!!!!!!!!',
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


        });
  }
  Widget buildDoctorCard(DoctorModel model,var size,index,context)=> InkWell(
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
                            'الاسم :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.name}',
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

    },
  );
}
