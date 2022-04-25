import 'package:flutter/cupertino.dart';
// import 'package:youssef_example/board1/func.dart';
// import 'package:youssef_example/standardbloc/standardcubit.dart';
// import 'package:youssef_example/standardbloc/standardstates.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/DiseaseModel.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_states.dart';
import 'package:graduation_project/shared/component/components.dart';

class HealthRecord extends StatelessWidget {
  var diseaseDate = TextEditingController();
  var disease = TextEditingController();
  var doctor = TextEditingController();
  var diseaseState = TextEditingController();


  List<DiseaseModel> mydata;
  HealthRecord(this.mydata);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StandardCubit(),
      child: BlocConsumer<StandardCubit, StandardStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Padding(
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
                          'أضف البيانات',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      actions: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: diseaseDate,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'تاريخ المرض',
                              prefixIcon: Icons.calendar_today),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: disease,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'المرض',
                              prefixIcon: Icons.coronavirus),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: doctor,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'الدكتور المعالج',
                              prefixIcon: Icons.person),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: defaultFormField(
                              controller: diseaseState,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'يجب ادخال البيانات ';
                                }
                              },
                              label: 'حالة المرض - بيانات اضافية ',
                              prefixIcon: Icons.medical_services),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultButton2(
                          text: '         حفظ ',
                          function: () {


                          },
                          background: Colors.red.withOpacity(0.8),
                        ),
                      ],
                      backgroundColor: Colors.white,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.red,
            ),
            ///////////////////////////////////////////////////
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),

            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: defaultRecordItem(txt: 'الدكتور المعالج')),
                        SizedBox(
                          width: 3.0,
                        ),
                        Expanded(child: defaultRecordItem(txt: 'الحالة')),
                        SizedBox(
                          width: 3.0,
                        ),
                        Expanded(child: defaultRecordItem(txt: 'المرض')),
                        SizedBox(
                          width: 3.0,
                        ),
                        Expanded(child: defaultRecordItem(txt: 'التاريخ')),
                        SizedBox(
                          width: 3.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //////////////////scroll list view //////////////////////////////////////////////////
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => defaultRecord(
                            drName: 'ali',
                            horseState: 'bad',
                            horseDisease: '${mydata[index].disease}',
                            DiseaseDate: '${mydata[index].vaccineDate}',

                            // drName: '${doctor}',
                            // horseState: '${diseaseState}',
                            // horseDisease: '${disease}',
                            // DiseaseDate: '${diseaseDate}',
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 5,
                          ),
                          itemCount: mydata.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
