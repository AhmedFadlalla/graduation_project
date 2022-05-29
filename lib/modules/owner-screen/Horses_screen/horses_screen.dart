import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/modules/owner-screen/Horses_screen/horses_section_screen.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../../../models/horse_model.dart';
import '../../../models/section_data_model.dart';
import 'HorseDetails.dart';
import 'add_horses_screen.dart';

class HorsesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var cubit=OwnerCubit.get(context);
          return Scaffold(//0xFF4DB6AC
            backgroundColor: Color(0xFF4DB6AC),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xFFE0F2F1),
              onPressed: (){
                navigateTo(context, AddHorseScreen());
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
                        itemBuilder: (context,index)=>buildSectionCard(
                            cubit.sectionData[index],
                            size,
                            index,
                            context),
                        separatorBuilder:(context,index)=> myDivider(),
                        itemCount: cubit.sectionData.length)

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
                      'No horses Yet !!!!',
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

          if(state is GetHorsesSecDataSuccessState)
                navigateTo(context, HorsesSectionSection());

        });
  }
  Widget buildSectionCard(SectionDataModel model,var size,index,context)=> InkWell(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                      image: NetworkImage('https://media.istockphoto.com/photos/veterinary-horses-on-the-farm-picture-id1212267638?s=612x612'),
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
                            'عنبر :',
                            style: TextStyle(color: Colors.black, fontSize: 28),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.name}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
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
      OwnerCubit.get(context).getHorses(secId: model.secId);

    },
  );
}
