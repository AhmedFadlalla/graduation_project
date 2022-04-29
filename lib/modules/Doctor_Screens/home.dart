
import 'package:custom_check_box/custom_check_box.dart';


import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/Doctor_Screens/rosheta.dart';

import '../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../shared/component/components.dart';
import 'followmedicine.dart';
import 'healthrecord.dart';


class StandardBoard extends StatelessWidget {
  // var productionFarm = TextEditingController();
  // var address = TextEditingController();
  // var location = TextEditingController();
  // var phonenumber = TextEditingController();
  ////////////////////////////////dr
  var tashkhess = TextEditingController();
  var vaccineName = TextEditingController();
  var vaccineStartDate = TextEditingController();
  ////////////////////////////////dr

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<DoctorCubit, DoctorStates> //1
        (
        listener: (BuildContext context, state) {}, //1
        builder: (BuildContext context, state) //rebuilder//1
        {
          var data=DoctorCubit.get(context).data;
          var diseases=DoctorCubit.get(context).diseaseData;
          return Scaffold(
            body: Center(
              child: Column(
                children: [


                  /////xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
                  SizedBox(
                    height: 33,
                  ),
                  defaultButton(
                      function: () {
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
                              content: BlocProvider(
                                create: (context) => DoctorCubit(),
                                child: BlocConsumer<DoctorCubit, DoctorStates>(
                                  listener: (context, state) {
                                    
                                  },
                                  builder: (context,state){
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
                                ),
                              backgroundColor: Colors.white,
                            ),

                          ),
                        );
                      },
                      text: 'الخدمات',
                      background: Colors.black,
                      width: 200.0),

                  SizedBox(
                    height: 15,
                  ),



                ],
              ),
            ),
          );
        },
      );

  }
}

