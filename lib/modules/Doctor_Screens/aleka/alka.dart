import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';
import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_states.dart';


import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../models/alekaamodel.dart';
import '../../../models/productmodel.dart';
import '../../../shared/component/components.dart';

class AlCar extends StatelessWidget {
  List<dynamic> countries = [];
  String? counterid;
  List<dynamic> types = [];
  String? typeid;
  List<dynamic> hoies = [];
  String? horid;

  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: defaultFormField(
                        controller: nameController,
                          type: TextInputType.text,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'يجب ادخال البيانات ';
                            }
                          },
                          label: 'اسم العليقة',
                          prefixIcon: Icons.production_quantity_limits_sharp),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StreamBuilder(
                    stream: cubit.getProducts(),
                    builder: ((context, snapshot) {
                    if(snapshot.hasData){
                      List<ProductData> data=snapshot.data as  List<ProductData>;
                      List<String> items=[];
                      data.forEach((element){
                        items.add(element.productName??'');
                      },);
                      return Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                              width: 260,
                              child: BuildDropBottom(
                                dropdownButtonTitle: ' حدد مكون',
                                function: (newValue1) {
                                  cubit.onChangeAliqaIngredientItem(newValue1,0);
                                },
                                items:  items.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                                value: cubit.AliqaValueChoose1,
                              )),
                          Text(
                            " : مكون 1  ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );}
                  else{
                    return Text('error');
                  }})),
                  SizedBox(
                    height: 10,
                  ),
                  StreamBuilder(
                    stream: cubit.getProducts(),
                    builder: ((context, snapshot) {
                    if(snapshot.hasData){
                      List<ProductData> data=snapshot.data as  List<ProductData>;
                      List<String> items=[];
                      data.forEach((element){
                        items.add(element.productName??'');
                      },);
                      return Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                              width: 260,
                              child: BuildDropBottom(
                                dropdownButtonTitle:'حدد مكون',
                                function: (newValue2) {
                                  cubit.onChangeAliqaIngredientItem(newValue2,1);
                                },
                                items: items.map((valueItem2) {
                                  return DropdownMenuItem(
                                    value: valueItem2,
                                    child: Text(valueItem2),
                                  );
                                }).toList(),
                                value: cubit.AliqaValueChoose2,
                              )),
                          const Text(
                            " : مكون 2 ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );

                      }
                    else{
                      return const Text('error');
                    }
                    }
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  StreamBuilder(
                    stream: cubit.getProducts(),
                    builder: ((context, snapshot) {
                    if(snapshot.hasData){
                      List<ProductData> data=snapshot.data as  List<ProductData>;
                      List<String> items=[];
                      data.forEach((element){
                        items.add(element.productName??'');
                      },);
                      return  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                              width: 260,
                              child: BuildDropBottom(
                                dropdownButtonTitle: 'حدد مكون',
                                function: (newValue3) {
                                  cubit.onChangeAliqaIngredientItem(newValue3,2);
                                },
                                items: items.map((valueItem3) {
                                  return DropdownMenuItem(
                                    value: valueItem3,
                                    child: Text(valueItem3),
                                  );
                                }).toList(),
                                value: cubit.AliqaValueChoose3,
                              )),
                          const Text(
                            " : مكون 3  ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                     }
                    else{
                      return const Text('error');
                    }
                    }
                  )),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Row(
                      children: [
                        Container(
                          width: 140.0,
                          height: 40.0,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: priceController,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'يرجي ادخال البيانات';
                              }
                              return null;
                            },
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
                            "سعر العليقة",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  InkWell(
                    onTap: (){
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
                                  height: 200,
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
                                                    Text("33",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

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
                                                    Text("50",style: TextStyle(color:Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

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
                                              Text(" : السعر",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 55.0),
                                                child: Row(
                                                  children: [
                                                    Text("جنيه",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                                    Text("100",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ),
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

                      if(formKey.currentState!.validate()){
                        cubit.saveala2kData
                        (
                          AlekaModel(
                            nameController.text.toString(),
                            [cubit.AliqaValueChoose1,cubit.AliqaValueChoose2,cubit.AliqaValueChoose3],
                            priceController.text.toString(),
                      )).then((value) {
                        Navigator.pop(context);
                      });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      width: 200,
                      height: 60.0,
                      child: defaultbutton(
                          width: double.infinity,
                          background: Colors.grey,
                          function: () {

                          },
                          text:' كون عليقة ',
                          size: 30.0),
                    ),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}