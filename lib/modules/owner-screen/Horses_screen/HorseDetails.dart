import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/layouts/owner_home_layout/owner_home_Layout.dart';
import 'package:graduation_project/shared/component/components.dart';

class HorseDetailsScreen extends StatelessWidget {
  const HorseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<OwnerCubit, OwnerState>(
        builder: (context, state) {
          var cubit = OwnerCubit.get(context);
          print(cubit.index);
          return Scaffold(
            body: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0,left: 15.0,right: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color:Color(0xFF4EACA3),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 20,
                          color: Color(0xFFB0CCE1).withOpacity(0.32),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,

                        ),
                        Container(
                            padding: EdgeInsets.only(top: 1),
                            margin: EdgeInsets.only(top: 1,),
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(20)
                            ) ,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image(
                                    image: NetworkImage(
                                        '${cubit.horseData[cubit.index].horseImage}')),
                              ),
                              decoration:BoxDecoration(
                                  borderRadius:BorderRadius.circular(22)

                              ),
                            )
                        ),
                        SizedBox(height: 20.0,),
                        Container(

                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'الاسم :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].horseName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      'العنبر :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].sectionName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      'المايكروشيب :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].microshipCode}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      'السعر :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].initPrice} جنية',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      'تاريخ الميلاد :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].birthDate}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      'الرسن :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].type}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      'النوع :',
                                      style: TextStyle(color: Colors.white, fontSize: 28),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${cubit.horseData[cubit.index].gander}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    Text(
                                      '${cubit.horseData[cubit.index].horseName}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                      ),
                                    ),
                                    SizedBox(width: 25.0,),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${cubit.horseData[cubit.index].fatherName}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                              ),
                                            ),
                                            SizedBox(width: 25.0,),
                                            Column(
                                              children: [
                                                Text(
                                                  '${cubit.horseData[cubit.index].fatherName1}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                ),
                                                SizedBox(height: 25.0,),
                                                Text(
                                                  '${cubit.horseData[cubit.index].motherName1}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 25.0,),
                                        Row(
                                          children: [
                                            Text(
                                              '${cubit.horseData[cubit.index].motherName}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                              ),
                                            ),
                                            SizedBox(width: 25.0,),
                                            Column(
                                              children: [
                                                Text(
                                                  '${cubit.horseData[cubit.index].fatherName2}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                ),
                                                SizedBox(height: 25.0,),
                                                Text(
                                                  '${cubit.horseData[cubit.index].motherName2}',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultButton(
                                  function: (){

                              },
                                  text: 'Edit'),
                            ),
                            Expanded(
                              child: defaultButton(
                                  function: (){

                                    cubit.deleteHorse(secId: cubit.horseModel!.sectionName, horseId:cubit.horseModel!.microshipCode );
                              },
                                  text: 'Delete'),
                            ),


                          ],
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is DeleteHorseSuccessfulState)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Deleted')
                    ,backgroundColor: Colors.green,));
              Navigator.pushReplacement(
                  context, //my place
                  MaterialPageRoute(
                  builder: (context) => OwnerHomeScreenLayout(),
          )
              );
            }
        });
  }
}
