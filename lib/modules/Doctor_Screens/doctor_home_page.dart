import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_states.dart';
import 'package:graduation_project/modules/Doctor_Screens/followmedicine.dart';
import 'package:graduation_project/modules/Doctor_Screens/healthrecord.dart';
import 'package:graduation_project/modules/Doctor_Screens/rosheta.dart';
import 'package:graduation_project/shared/component/components.dart';

class DocHomeScreen extends StatelessWidget {
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
    return BlocConsumer<StandardCubit, StandardStates> //1
        (
      listener: (BuildContext context, state) {}, //1
      builder: (BuildContext context, state) //rebuilder//1
          {
        var data = StandardCubit.get(context).data;
        print(StandardCubit.get(context).data.length);
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
                            right: 50,
                            left: 50,
                          ),
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            title: Center(
                              child: Text(
                                'خدمات الدكتور',
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                            actions: [
                              defaultButton(
                                text: 'التاريخ المرضي',
                                background: Colors.black,
                                function: () {
                                  Navigator.push(
                                    context, //my place

                                    MaterialPageRoute(
                                      builder: (context) => HealthRecord(data),
                                    ),
                                    /////اللي انا رايحله
                                  );
                                },
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              ///////////////////////////////////////////////////////////////////////////////
                              defaultButton(
                                text: 'اضافة دواء أو لقاح',
                                background: Colors.black.withOpacity(0.9),
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

                              defaultButton(
                                text: 'متابعة مواعيد الدواء',
                                function: () {
                                  Navigator.push(
                                    context, //my place
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FollowMedicine(data),
                                    ),
                                  );
                                  /////اللي انا رايحله
                                },
                                background: Colors.black.withOpacity(0.8),
                              ),

                              ////////////////////////////////
                              SizedBox(
                                height: 15,
                              ),
                              //////////////////////////////////
                            ],
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
