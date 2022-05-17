import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/states.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../layouts/home_layout/cubit/cubit.dart';

class AccomindationDetailsScreen extends StatelessWidget {
  const AccomindationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<HorseCubit, HorseStates>(
        builder: (context, state) {
          var cubit = HorseCubit.get(context);

          return Scaffold(
            body: Directionality(
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
                                  '${cubit.accomList[cubit.currentIndex].AccomImage}'))),
                      SizedBox(height: 20.0,),
                      Row(
                        children: [
                          Text(
                            'نوع البوكس',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${cubit.accomList[cubit.currentIndex].type}',
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
                            '${cubit.accomList[cubit.currentIndex].info}',
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
                            '${cubit.accomList[cubit.currentIndex].Price}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
