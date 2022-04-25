import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:youssef_example/board1/func.dart';
// import 'package:youssef_example/standardbloc/standardcubit.dart';
// import 'package:youssef_example/standardbloc/standardstates.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_states.dart';
import 'package:graduation_project/shared/component/components.dart';

class Rosheta extends StatelessWidget {
  var tashkhess = TextEditingController();
  var vaccineName = TextEditingController();
  var vaccineStartDate = TextEditingController();

  String? get collectionPath => null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => StandardCubit(),
      child: BlocConsumer<StandardCubit, StandardStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var firebaseFirestore = FirebaseFirestore;
          return SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                ),
                body: SingleChildScrollView(
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
                              prefixIconTapFunction: () {
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
                            StandardCubit.get(context)
                                .dropDownButtonTimesPerDay(newValue);
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
                          value:
                              StandardCubit.get(context).valueChooseTimesPerDay,
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
                                  StandardCubit.get(context)
                                      .dropDownButtonNumOfDayWeekMonth(
                                          newValue);
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
                                value: StandardCubit.get(context)
                                    .valueChooseNumOfDayWeekMonth,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: BuildDropBottom(
                                dropdownButtonTitle: '   يوم - اسبوع - شهر',
                                function: (newValue) {
                                  StandardCubit.get(context)
                                      .dropDownButtonDayWeekMonth(newValue);
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
                                value: StandardCubit.get(context)
                                    .valueChooseDayWeekMonth,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultButton2(
                            function: () {
                              String disease = tashkhess.text.toString();
                              String vaccine = vaccineName.text.toString();
                              String vaccineDate =
                                  vaccineStartDate.text.toString();
                              String? medicineperDay =
                                  StandardCubit.get(context)
                                      .valueChooseTimesPerDay;
                              String? medicineDuraition =
                                  StandardCubit.get(context)
                                      .valueChooseNumOfDayWeekMonth;
                              String? type = StandardCubit.get(context)
                                  .valueChooseDayWeekMonth;
                              FirebaseFirestore.instance
                                  .collection('doctor')
                                  .doc()
                                  .set({
                                'disease': disease,
                                'vaccine': vaccine,
                                'vaccineDate': vaccineDate,
                                'medicineperDay': medicineperDay,
                                'type': type,
                                'medicineDuraition': medicineDuraition
                              }).then((value) {
                                StandardCubit.get(context).getdata();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Added'),
                                  backgroundColor: Colors.green,
                                ));
                                Navigator.pushReplacement(
                                  context, //my place
                                  MaterialPageRoute(
                                    builder: (context) => MyApp(),
                                  ),
                                  /////اللي انا رايحله
                                );
                              });
                            },
                            text: 'أضف الدواء',
                            background: Colors.black,
                            height: 50.0,
                            width: 150.0),
                      ],
                    ),
                  ),
                ))),
          );
        },
      ),
    );
  }
}