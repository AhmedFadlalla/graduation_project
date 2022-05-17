import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import 'package:graduation_project/modules/Doctor_Screens/rosheta.dart';
import 'package:graduation_project/modules/owner-screen/doctor_screen/add_doc_screen.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../../models/horse_model.dart';
import 'aleka/aleka_home_screen.dart';
import 'aleka/alka.dart';
import 'aleka/show.dart';
import 'feed_screen/carehorse.dart';
import 'followmedicine.dart';
import 'healthrecord.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    var cubit=DoctorCubit.get(context);
    return BlocConsumer<DoctorCubit,DoctorStates>
      (
        builder: (context,state){
        return SingleChildScrollView(
          child:ConditionalBuilder(
            condition: cubit.horses.length>0,
            builder:(context)=>SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text(
                        'Welcome ',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          width: double.infinity,
                          height: 100.0,
                          child: defaultButton(
                              width:double.infinity,
                              background:Colors.grey,
                              function:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>AlekaHomeScreen()));},
                              text:' العلائق',
                            fontSize: 30.0


                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CareHorse()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                            width: double.infinity,
                            height: 100.0,
                            child: defaultbutton(
                                width:double.infinity,
                                background:Colors.grey,
                                function:(){print("hello flutter");},
                                text:'التغذية',
                                size: 30.0
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                      padding: EdgeInsets.only(right: 8.0,left: 8.0),
                      height: 35.0,
                      color: Colors.blue,
                      child: Text(
                        'Your Horses',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>buildHorseCard(
                          cubit.horses[index],
                          size,
                          index,
                          context
                      ),
                      separatorBuilder:(context,index)=> myDivider(),
                      itemCount: cubit.horses.length)

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
          ) ,
        );
    },
        listener: (context,state){
          if (state is GetDocSuccessfulState)
            {
              cubit.getDocFullData();

              cubit.getHorses();
            }



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
                height: 140,
                width: 200,
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
                            '${model.horseName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'الاب :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.fatherName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'الام :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.motherName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'المايكروشيب :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.microshipCode}',
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

      print(DoctorCubit.get(context).horseId);
      DoctorCubit.get(context).getdDisease(hId: DoctorCubit.get(context).horseId);
      DoctorCubit.get(context).getdata(hId: DoctorCubit.get(context).horseId);
      showDialog(
          context: context,
          builder: (_) => Padding(
        padding: const EdgeInsets.only(
          right: 0,
          left: 0,
        ),
        child: AlertDialog(
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Center(
            child: Text(
              '               خدمات الدكتور',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
          content: BlocConsumer<DoctorCubit, DoctorStates>(
            listener: (context, state) {

            },
            builder: (context,state){
              var data=DoctorCubit.get(context).data;
              var diseases=DoctorCubit.get(context).diseaseData;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    defaultButton2(
                      text: 'التاريخ المرضي',
                      background: Colors.black,
                      function: () {
                        Navigator.push(
                          context, //my place

                          MaterialPageRoute(
                            builder: (context) => HealthRecord(diseases),
                          ),
                          /////اللي انا رايحله
                        );
                      },
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    ///////////////////////////////////////////////////////////////////////////////
                    defaultButton2(
                      text: 'اضافة دواء أو لقاح',
                      background: Colors.black,
                      function: () {
                        Navigator.push(
                          context, //my place
                          MaterialPageRoute(
                            builder: (context) => Rosheta(),
                          ),
                          /////اللي انا رايحله
                        );
                      },
                    ),
                    /////////////////////////////////////////////////////////////////////////////////////////////////////
                    SizedBox(
                      height: 15,
                    ),

                    defaultButton2(
                      text: 'متابعة مواعيد الدواء',

                      function: () {
                        Navigator.push(
                          context, //my place
                          MaterialPageRoute(
                            builder: (context) => FollowMedicine(data),
                          ),);
                        /////اللي انا رايحله
                      },
                      background: Colors.black,
                    ),

                    ////////////////////////////////
                    SizedBox(
                      height: 15,
                    ),
                    //////////////////////////////////


                  ],
                ),
              );
            },
          ),
          backgroundColor: Colors.white,
        ),

      )
      );

    },
  );
}
