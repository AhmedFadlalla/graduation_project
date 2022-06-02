import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'package:youssef_example/board1/func.dart';
// import 'package:youssef_example/standardbloc/DoctorCubit.dart';
// import 'package:youssef_example/standardbloc/DoctorStates.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/doc_home_layout.dart';

import '../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../main.dart';
import '../../models/roshetamodel.dart';
import '../../shared/component/components.dart';
import '../../shared/styles/colors.dart';

class Rosheta extends StatelessWidget {
  var tashkhess = TextEditingController();
  var vaccineName = TextEditingController();
  var vaccineStartDate = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  String? get collectionPath => null;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
       
        return SafeArea(
          child: Scaffold(

              body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                          Card(
                            elevation: 22.0,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        'https://previews.123rf.com/images/chalabala/chalabala1708/chalabala170800033/83875705-medicina-veterinaria-en-la-finca-veterinario-durante-el-examen-m%C3%A9dico-de-los-caballos-en-el-establo-.jpg',
                                      ),
                                      width: double.infinity,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),


                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: defaultFormField(
                                controller: tashkhess,
                                type: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'يجب ادخال البيانات ';
                                  }
                                },
                                label: '   تشخيص المرض',
                                prefixIcon: Icons.medical_services),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: defaultFormField(
                                controller: vaccineName,
                                type: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'يجب ادخال البيانات ';
                                  }
                                },
                                label: '    اسم الدواء أو اللقاح',
                                prefixIcon: Icons.vaccines),
                          ),


                          SizedBox(
                            height: 15,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: defaultFormField(
                                controller: vaccineStartDate,
                                type: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'يجب ادخال البيانات ';
                                  }
                                },
                                label: '    تاريخ بداية العلاج',
                                prefixIconTapFunction: (){
                                  // onPressed: () {
                                  //   showDatePicker(
                                  //       initialDate: DateTime.now(),
                                  //       firstDate: DateTime(1970),
                                  //       lastDate: DateTime.now(),
                                  //       context: context)
                                  //       .then((date) {
                                  //     cubit.pickHorseBirthDate(date);
                                  //     print(cubit.dateTime);
                                  //   });
                                  // }
                                },
                                prefixIcon: Icons.calendar_today),

                          ),


                          SizedBox(
                            height: 15,
                          ),


                          BuildDropBottom(
                            dropdownButtonTitle: ' عدد مرات الدواء باليوم',
                            function: (newValue) {
                              DoctorCubit.get(context).dropDownButtonTimesPerDay(newValue);
                            },
                            items: [
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
                            ].map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            value: DoctorCubit.get(context).valueChooseTimesPerDay,
                          ),

                          SizedBox(
                            height: 15,
                          ),



                          Row(
                            children: [
                              Expanded(
                                child: BuildDropBottom(
                                  dropdownButtonTitle: '   مدة الدواء ',

                                  function: (newValue) {
                                    DoctorCubit.get(context).dropDownButtonNumOfDayWeekMonth(newValue);
                                  },
                                  items: [
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                    '6',
                                  ].map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                  value: DoctorCubit.get(context).valueChooseNumOfDayWeekMonth,
                                ),
                              ),

                              SizedBox(
                                width: 15,
                              ),

                              Expanded(
                                child: BuildDropBottom(
                                  dropdownButtonTitle: '   يوم - اسبوع - شهر',
                                  function: (newValue) {
                                    DoctorCubit.get(context).dropDownButtonDayWeekMonth(newValue);
                                  },
                                  items: [
                                    'يوم',
                                    'اسبوع',
                                    'شهر',
                                  ].map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                  value: DoctorCubit.get(context).valueChooseDayWeekMonth,
                                ),
                              ),
                            ],
                          ),




                          SizedBox(
                            height: 15,
                          ),

                          defaultButton2(
                              function: () {
                                if(formKey.currentState!.validate()){
                                    String disease =tashkhess.text.toString();
                                String vaccine =vaccineName.text.toString();
                                String vaccineDate =vaccineStartDate.text.toString();
                                String? medicineperDay =DoctorCubit.get(context).valueChooseTimesPerDay;
                                String?medicineDuraition =DoctorCubit.get(context).valueChooseNumOfDayWeekMonth;
                                String? type = DoctorCubit.get(context).valueChooseDayWeekMonth;
                                DoctorCubit.get(context).sendRosheta(
                                    DiseaseModel(
                                        disease: disease,
                                        vaccine: vaccine,
                                        vaccineDate: vaccineDate,
                                        medicineperDay: medicineperDay,
                                        medicineDuraition: medicineDuraition,
                                        type: type,

                                    )
                                ,DoctorCubit.get(context).horseId).then((value) {
                                  DoctorCubit.get(context).getdata(hId: DoctorCubit.get(context).horseId);
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added'),backgroundColor: Colors.green,));
                                   Navigator.pushReplacement(
                                    context, //my place
                                    MaterialPageRoute(
                                      builder: (context) => DocHomeScreenLayout(),
                                    ),
                                    /////اللي انا رايحله
                                  );
                                });
                              
                                }
                              },
                              text: 'أضف الدواء',
                              background: defColorApp,
                              height: 60.0,
                              width: 200.0
                          ),
                        ],
                      ),
                    ),
                  ))),)
        );
      },
    );
  }
}
