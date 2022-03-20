import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../shared/component/components.dart';

class AddHorseScreen extends StatelessWidget {
  const AddHorseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit, OwnerState>(
        builder: (context, state) {
          var horsenameController = TextEditingController();
          var fathernameController = TextEditingController();
          var mothernameController = TextEditingController();
          var ownernameController = TextEditingController();
          var boxnumController = TextEditingController();
          var anbernumController = TextEditingController();
          var priceController = TextEditingController();
          var farmController = TextEditingController();
          var microController = TextEditingController();
          var dateController = TextEditingController();
          DateTime dateTime;

          var cubit = OwnerCubit.get(context);
          farmController.text = cubit.ownerModel.ownerName;
          // List<String> uniquelist =
          // cubit.gender_items.where((item) => seen.add(item)).toList();
          String dropdown_color = 'احمر';
          List<String> colors_items = [
            'ابيض',
            'احمر',
          ];
          var seenc = Set<String>();
          List<String> uniquelistc =
              colors_items.where((item) => seenc.add(item)).toList();

          String dropdown_breed = 'صقلاوي';
          List<String> breed_items = [
            'صقلاوي',
            'عبيان',
          ];
          var seenb = Set<String>();
          List<String> uniquelistb =
              colors_items.where((item) => seenb.add(item)).toList();

          return Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 65.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: cubit.horseImage == null
                                ? NetworkImage(
                                    'https://store-images.s-microsoft.com/image/apps.62288.13620585470013536.11ea7ace-068b-4450-a62e-2233e0b32064.39ccf900-bfd0-48d2-8259-e9bbfa50f4c2?mode=scale&q=90&h=300&w=300')
                                : FileImage(cubit.horseImage!) as ImageProvider,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              cubit.getHorseImage();
                            },
                            icon: CircleAvatar(
                              radius: 20.0,
                              child: Icon(
                                Icons.camera_alt,
                                size: 16.0,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: microController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال المايكروشيب ';
                          }
                        },
                        label: 'كود المايكروشيب',
                        prefixIcon: Icons.code),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: horsenameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال الاسم ';
                          }
                        },
                        label: 'اسم الحصان',
                        prefixIcon: Icons.drive_file_rename_outline),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: fathernameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return ' يجب ادخال اسم الاب';
                          }
                        },
                        label: 'اسم الاب ',
                        prefixIcon: Icons.ad_units),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: mothernameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال اسم الام';
                          }
                        },
                        label: 'اسم الام',
                        prefixIcon: Icons.ad_units),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: ownernameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال اسم المربي ';
                          }
                        },
                        label: 'اسم المربي',
                        prefixIcon: Icons.add),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: farmController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال اسم المزرعة ';
                          }
                        },
                        label: 'اسم المزرعة',
                        prefixIcon: Icons.add),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: anbernumController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال رقم العنبر';
                          }
                        },
                        label: 'رقم العنبر',
                        prefixIcon: Icons.ad_units),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: boxnumController,
                        type: TextInputType.text,
                        label: 'رقم الصندوق',
                        prefixIcon: Icons.ad_units,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'هذا الفيلد مطلوب';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: priceController,
                        type: TextInputType.text,
                        label: 'السعر',
                        prefixIcon: Icons.ad_units,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'هذا الفيلد مطلوب';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                  Row(
                    children: [
                      cubit.dateTime != null
                          ? Text(
                              '${cubit.dateTime}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'choose date',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                      TextButton(
                          child: Text('اختار تاريخ ميلاد الحصان'),
                          onPressed: () {
                            showDatePicker(
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime.now(),
                                    context: context)
                                .then((date) {
                              cubit.pickHorseBirthDate(date);
                              print(cubit.dateTime);
                            });
                          }),
                    ],
                  ),

                  BuildDropBottom(
                    dropdownButtonTitle: ' اختر الرسن',
                    function: (newValue) {
                      cubit.onChangeRasanDropDownButton(newValue);
                    },
                    items: [
                      ' كحيلان',
                      ' صقلاوي',
                      ' دهمان',
                      ' عبيان',
                      ' هدبان',
                    ].map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    value: cubit.rasanValueChoose,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BuildDropBottom(
                    dropdownButtonTitle: ' اختر النوع',
                    function: (newValue) {
                      cubit.onChangeGanderItem(newValue);
                    },
                    items: [
                      ' ذكر',
                      ' انثي',
                    ].map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    value: cubit.ganderValueChoose,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BuildDropBottom(
                    dropdownButtonTitle: ' اختر  اللون',
                    function: (newValue) {
                      cubit.onChangeColorItem(newValue);
                    },
                    items: [
                      'ابيض',
                      'اسود',
                      'بني'
                    ].map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                    value: cubit.colorValueChoose,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //     Container(
                  //       padding: EdgeInsets.only(left: 16.0,right: 16.0),
                  //       decoration: BoxDecoration(
                  //           border:Border.all(color: Colors.grey),
                  //           borderRadius:BorderRadius.circular(5.0)
                  //       ),
                  //
                  //       child: DropdownButton(
                  //         //elevation: 0,
                  //         hint: Text(' اختر رسن الحصان  ',
                  //           style: TextStyle(
                  //             fontSize: 18.0,
                  //             //fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //
                  //         dropdownColor: Colors.black.withOpacity(0.2),
                  //         icon: Icon(Icons.arrow_drop_down),
                  //         iconSize: 36,
                  //         isExpanded: true,
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           //textDirection: TextDirection.rtl, عايز اعمل ده
                  //
                  //         ),
                  //         value: cubit.rasanValueChoose,
                  //         onChanged: (newValue) {
                  //           cubit.onChangeRasanDropDownButton(newValue);
                  //
                  //         },
                  //         items: cubit.listItem.map((valueItem) {
                  //           return DropdownMenuItem(
                  //             value: valueItem,
                  //             child: Text(valueItem),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //     Container(
                  //       padding: EdgeInsets.only(left: 16.0,right: 16.0),
                  //       decoration: BoxDecoration(
                  //           border:Border.all(color: Colors.grey),
                  //           borderRadius:BorderRadius.circular(5.0)
                  //       ),
                  //
                  //       child: DropdownButton(
                  //         //elevation: 0,
                  //         hint: Text(' اختر رسن الحصان  ',
                  //           style: TextStyle(
                  //             fontSize: 18.0,
                  //             //fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //
                  //         dropdownColor: Colors.black.withOpacity(0.2),
                  //         icon: Icon(Icons.arrow_drop_down),
                  //         iconSize: 36,
                  //         isExpanded: true,
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           //textDirection: TextDirection.rtl, عايز اعمل ده
                  //
                  //         ),
                  //         value: cubit.rasanValueChoose,
                  //         onChanged: (newValue) {
                  //           cubit.onChangeRasanDropDownButton(newValue);
                  //
                  //         },
                  //         items: cubit.listItem.map((valueItem) {
                  //           return DropdownMenuItem(
                  //             value: valueItem,
                  //             child: Text(valueItem),
                  //           );
                  //         }).toList(),
                  //       ),
                  //     ),
                  //     Container(
                  //   padding: EdgeInsets.only(left: 16.0,right: 16.0),
                  //   decoration: BoxDecoration(
                  //       border:Border.all(color: Colors.grey),
                  //       borderRadius:BorderRadius.circular(5.0)
                  //   ),
                  //
                  //   child: DropdownButton(
                  //     //elevation: 0,
                  //     hint: Text(' اختر رسن الحصان  ',
                  //       style: TextStyle(
                  //         fontSize: 18.0,
                  //         //fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //
                  //     dropdownColor: Colors.black.withOpacity(0.2),
                  //     icon: Icon(Icons.arrow_drop_down),
                  //     iconSize: 36,
                  //     isExpanded: true,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20,
                  //       //textDirection: TextDirection.rtl, عايز اعمل ده
                  //
                  //     ),
                  //     value: cubit.rasanValueChoose,
                  //     onChanged: (newValue) {
                  //      cubit.onChangeRasanDropDownButton(newValue);
                  //
                  //     },
                  //     items: cubit.listItem.map((valueItem) {
                  //       return DropdownMenuItem(
                  //         value: valueItem,
                  //         child: Text(valueItem),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),

                  // Row(
                  //   children: [
                  //     Directionality(
                  //       textDirection: TextDirection.rtl,
                  //       child: Text("الرسن",
                  //           style: TextStyle(
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.bold,
                  //             height: 1.4,
                  //           )),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     DropdownButton(
                  //       dropdownColor: Color.fromARGB(255, 171, 199, 212),
                  //       isExpanded: true,
                  //       value: uniquelistb[0],
                  //       items: uniquelistb.map((item) {
                  //         return DropdownMenuItem(
                  //           child: Text(item),
                  //           value: item,
                  //         );
                  //       }).toList(),
                  //       icon: const Icon(Icons.keyboard_arrow_down),
                  //       onChanged: (newval) {},
                  //     ),
                  //   ],
                  // ),
                  ConditionalBuilder(
                      condition: state is! CreateHorseLoadingState,
                      builder: (context) => defaultButton(
                          text: 'Submit',
                          function: () {
                            cubit.uploadHorseImage(
                                horseName: horsenameController.text,
                                fatherName: fathernameController.text,
                                motherName: mothernameController.text,
                                sectionNum: anbernumController.text,
                                boxNum: boxnumController.text,
                                owner: ownernameController.text,
                                dateTime: cubit.dateTime !  ,
                                initPrice: priceController.text,
                                microshipCode: microController.text,
                                type: cubit.rasanValueChoose as String,
                                color: cubit.colorValueChoose as String,
                                gander: cubit.ganderValueChoose as String);
                          }),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()))
                ],
              ),
            ),
          )));
        },
        listener: (context, state) {});
  }
}
