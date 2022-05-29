import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

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
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey,
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
                            padding: EdgeInsets.all(25),
                            child: Image(
                                image: NetworkImage(
                                    '${cubit.horseData[cubit.index].horseImage}'))),
                        SizedBox(height: 20.0,),
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
                              '${cubit.horseData[cubit.index].horseName}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              'العنبر :',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${cubit.horseData[cubit.index].sectionName}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
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
                              '${cubit.horseData[cubit.index].microshipCode}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              'السعر :',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${cubit.horseData[cubit.index].initPrice} جنية',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              'تاريخ الميلاد :',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${cubit.horseData[cubit.index].birthDate}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              'الرسن :',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${cubit.horseData[cubit.index].type}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              'النوع :',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${cubit.horseData[cubit.index].gander}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Text(
                              '${cubit.horseData[cubit.index].horseName}',
                              style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 25.0,),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${cubit.horseData[cubit.index].fatherName}',
                                      style: TextStyle(
                                          color: Colors.brown,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 25.0,),
                                    Column(
                                      children: [
                                        Text(
                                          '${cubit.horseData[cubit.index].fatherName1}',
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 25.0,),
                                        Text(
                                          '${cubit.horseData[cubit.index].motherName1}',
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
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
                                          color: Colors.brown,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 25.0,),
                                    Column(
                                      children: [
                                        Text(
                                          '${cubit.horseData[cubit.index].fatherName2}',
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 25.0,),
                                        Text(
                                          '${cubit.horseData[cubit.index].motherName2}',
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
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
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
