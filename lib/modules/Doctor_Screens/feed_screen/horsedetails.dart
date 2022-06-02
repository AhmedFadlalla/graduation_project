//horsedetails.dart
////////////////////////////////
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import '../../../layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';
import '../../../models/alekaamodel.dart';
import '../../../models/horsemodel.dart';
import '../../../shared/component/components.dart';
import '../../../shared/styles/colors.dart';


class DetailsScren extends StatelessWidget {
  List<dynamic> countries = [];
  String? counterid;
  List<dynamic> types = [];
  String? typeid;
  List<dynamic> hoies = [];
  String? horid;
  int index=0;
  @override
  void initState() {
    initState();
    this.countries.add({"id": 1, "label": "حصان1 "});
    this.countries.add({"id": 2, "label": "حصان2"});
    this.countries.add({"id": 3, "label": "حصان3"});
    this.types.add({"id": 1, "label": "بالغ"});
    this.types.add({"id": 2, "label": "مفطوم"});
    this.types.add({"id": 3, "label": "حامل"});
    this.types.add({"id": 4, "label": "بعد الولادة"});
    this.types.add({"id": 5, "label": "قبل الولادة"});
    this.types.add({"id": 6, "label": "طلوق"});
    this.hoies.add({"id": 1, "label": "عليقة 1"});
    this.hoies.add({"id": 2, "label": "عليقة 2"});
    this.hoies.add({"id": 3, "label": "عليقة 3"});
  }
  TextEditingController ageController=TextEditingController();
  TextEditingController weightController=TextEditingController();
  TextEditingController alaafQuantityController=TextEditingController();
  TextEditingController broteinController=TextEditingController();
  TextEditingController metalController=TextEditingController();
  TextEditingController powerController=TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: BuildDropBottom(
                              dropdownButtonTitle: 'المايكروشيب',
                              function: (newValue) {
                                cubit.onChangeNameItem(newValue);
                              },
                              items:cubit.horses
                                  .map((valueItem) {
                                return DropdownMenuItem(
                                  value: cubit.horses[index].microshipCode,
                                  child: Text(cubit.horses[cubit.currentIndex].microshipCode),
                                );
                              }).toList(),
                              value: cubit.HorseNameChoose,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: defaultFormField(
                                controller: ageController,
                                  type: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'يجب ادخال العمر ';
                                    }
                                  },
                                  label: 'عمر الحصان',
                                  prefixIcon: Icons.format_list_numbered),
                            ),
                          ),
                          BuildDropBottom(
                            dropdownButtonTitle: 'حالة الحصان',
                            function: (newValue) {
                              cubit.onChangeHalaItem(newValue);
                            },
                            items: [
                              'حامل',
                              'بعد الولادة',
                              'قبل الولادة',
                              'طلوق',
                              ' مفطوم',
                              'بالغ'
                            ].map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            value: cubit.HorseHalaChoose,
                          )
                        ],
                      )),
                   
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: Text(
                                        "كجم",
                                        style: TextStyle(fontSize: 22),
                                      )),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    width: 80.0,
                                    height: 40.0,
                                    child: TextFormField(
                                      controller: weightController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.brown, width: 2),
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      "وزن الحصان:",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Text(
                                              "كجم",
                                              style: TextStyle(fontSize: 22),
                                            )),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Container(
                                          width: 80.0,
                                          height: 40.0,
                                          child: TextFormField(
                                            controller: alaafQuantityController,
                                            keyboardType:
                                            TextInputType.number,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.brown,
                                                  width: 2)),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(8.0),
                                            child: Text(
                                              "كمية العلف الازمة للحصان هي:",
                                              style: TextStyle(fontSize: 20),
                                              textDirection:
                                              TextDirection.rtl,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 120.0, top: 10),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.0,
                                    height: 40.0,
                                    child: TextFormField(
                                      controller: broteinController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.brown, width: 2)),
                                  ),
                                  SizedBox(width: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      "البروتينات الازمة:",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 120.0, top: 10),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.0,
                                    height: 40.0,
                                    child: TextFormField(
                                      controller: powerController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.brown, width: 2)),
                                  ),
                                  SizedBox(width: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      "الطاقة الازمة:",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 120.0, top: 10.0),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 80.0,
                                    height: 40.0,
                                    child: TextFormField(
                                      controller: metalController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                        border: Border.all(
                                            color: Colors.brown, width: 2)),
                                  ),
                                  SizedBox(width: 20.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Text(
                                      "الحديد الازم : ",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                   Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.brown[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.brown, width: 1)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          StreamBuilder(
                            stream: DoctorCubit.get(context).getelAlaaik(),
                            builder: (context, snapshot) {
                            if(snapshot.hasData){
                              List<AlekaModel> alaaek=snapshot.data as List<AlekaModel> ;
                              List<String>alaaekNames=[];
                              alaaek.forEach((element) {
                                alaaekNames.add(element.alekaName??'');
                              },);
                              return Padding(
                                        padding:
                                        const EdgeInsets.only(left: 35.0, top: 10),
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 180.0,
                                                  height: 50.0,
                                                  child:  BuildDropBottom(
                                                    dropdownButtonTitle: 'حدد أسم ',
                                                    function: (newValue) {
                                                      cubit.onChangeAliqaItem(newValue);
                                                    },
                                                    items:alaaekNames
                                                        .map((valueItem) {
                                                      return DropdownMenuItem(
                                                        value: valueItem,
                                                        child: Text(valueItem),
                                                      );
                                                    }).toList(),
                                                    value: cubit.AliqaValueChoose,
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      border: Border.all(
                                                          color: Colors.brown, width: 1)),
                                                ),
                                                SizedBox(width: 20.0),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 0.0),
                                                  child: Text(
                                                    "اسم العليقة:",
                                                    textDirection: TextDirection.rtl,
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ); 
                          }
                            else{
                              print(snapshot.data);
                              print(snapshot.error);
                              return Center(
                                child: Text('error'),
                              );
                            }
                          },),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 30.0, top: 10),
                            child: Container(
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 180.0,
                                      height: 50.0,
                                      child:  BuildDropBottom(
                                        dropdownButtonTitle:  'حدد الوقت ',
                                        function: (newValue) {
                                          cubit.onChangedataItem(newValue);
                                        },
                                        items:  ['مساءآ','بعد الظهر','صباحآ']
                                            .map((valueItem) {
                                          return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem),
                                          );
                                        }).toList(),
                                        value: cubit.datanamechoose,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.brown, width: 1)),
                                    ),
                                    SizedBox(width: 20.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Text(
                                        "التوقيت :",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  InkWell(
                    onTap: (){
                      print(DoctorCubit.get(context).HorseNameChoose);
                      showDialog(
                        context: context,
                        builder: (_) =>Padding(
                          padding: const EdgeInsets.only(
                            right: 50,
                            left: 50,
                          ),
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            actions: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.brown[50],
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.brown, width: 1)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          "اختيارك يتضمن : ",
                                          style: TextStyle(fontSize: 24.0),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 30.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(" بروتين" + "%",style: TextStyle(color:Colors.black,fontSize: 18),),
                                                    SizedBox(width: 5.0,),
                                                    Text("${broteinController.text}",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 37.0),
                                                child:  Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(" حديد " + "%",style: TextStyle(color:Colors.black,fontSize: 18),),
                                                    SizedBox(width: 5.0,),
                                                    Text("${metalController.text}",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20.0),
                                                child:Row(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(" ماغنسيوم" + "%",style: TextStyle(color:Colors.black,fontSize: 18),),
                                                    SizedBox(width: 5.0,),
                                                    Text("40",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(" : التكلفة",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 55.0),
                                                child: Row(
                                                  children: [
                                                    Text("جنيه",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                                    Text("100",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ),
                                              InkWell( child:                          Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      width: 200,
                      height: 60.0,
                      child: defaultbutton(
                          width: double.infinity,
                          background: Colors.grey,
                          function: () {
                            print("hello flutter");
                          },
                          text: 'حفظ',
                          size: 30.0),
                    ),
                    onTap: (){
                      DoctorCubit.get(context).saveHorseFeed(
                        HorseData(
                          ageController.text.toString(),
                         cubit.HorseHalaChoose,
                          weightController.text.toString(), 
                          alaafQuantityController.text.toString(),
                           broteinController.text.toString(), 
                           powerController.text.toString(),
                          metalController.text.toString(),
                           cubit.AliqaValueChoose,
                            cubit.datanamechoose),DoctorCubit.get(context).HorseNameChoose)
                          .then((value){

                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الحفظ')));
                              Navigator.pop(context);
                              Navigator.pop(context);
                            });
                    },
                    )
                     
                                              //السعر ده انت الي هتححدو هتجيبه من عندك من ال database
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                      
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      width: 200,
                      height: 60.0,
                      child: defaultbutton(
                          width: double.infinity,
                          background: defColorApp,
                          function: () {
                            
                            print("hello flutter");

                          },
                          text: 'حفظ',
                          size: 30.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

/*Widget buildDropDownWidget(BuildContext context) {
    AppCubit cubitt=AppCubit.get(context);
    return FormHelper.dropDownWidget(
      context,
      "اسم الحصان",
      cubitt.counterid,
      cubitt.countries,
          (onChangevalu) {
        cubitt.counterid = onChangevalu;
        print("selected country: $onChangevalu");
      },
          (onValidate) {
        if (onValidate == null) {
          return 'please select country';
        }
        return null;
      },
      borderColor: Colors.brown,
      borderFocusColor: Theme.of(context).primaryColor,
      borderRadius: 15,
      optionValue: "id",
      optionLabel: "label",
    );
  }

  Widget buildDropDownWidget1(BuildContext context) {
    AppCubit cubitt=AppCubit.get(context);
    return FormHelper.dropDownWidget(
      context,
      "حالة الحصان",
      cubitt.typeid,
      this.types,
          (onChangevalu) {
        cubitt.typeid= onChangevalu;
        print("selected country: $onChangevalu");
      },
          (onValidate) {
        if (onValidate == null) {
          return 'please select country';
        }
        return null;
      },
      borderColor: Colors.brown,
      borderFocusColor: Theme.of(context).primaryColor,
      borderRadius: 15,
      optionValue: "id",
      optionLabel: "label",
    );
  }

  Widget buildDropDownWidget2(BuildContext context) {
    AppCubit cubitt=AppCubit.get(context);
    return FormHelper.dropDownWidget(
      context,
      "اسم العليقة",
      cubitt.horid,
      cubitt.hoies,
          (onChangevalu) {
        this.typeid = onChangevalu;
        print("selected country: $onChangevalu");
      },
          (onValidate) {
        if (onValidate == null) {
          return 'please select country';
        }
        return null;
      },
      borderColor: Colors.brown,
      borderFocusColor: Theme.of(context).primaryColor,
      borderRadius: 15,
      optionValue: "id",
      optionLabel: "label",
    );
  }*/
}
///////////////////////////////////////////////
