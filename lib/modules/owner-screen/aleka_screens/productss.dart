import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layouts/owner_home_layout/cubit/owner_cubit.dart';
import '../../../layouts/owner_home_layout/cubit/owner_state.dart';
import '../../../models/productmodel.dart';
import '../../../shared/component/components.dart';
class Product extends StatelessWidget {
              
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(builder: (context,state){

      return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return addDialog(context: context);
            }
        );
      },
      child: const Icon(Icons.add),
      backgroundColor: Color(0xFF68E7D2),
    ),
    body:  StreamBuilder(
      stream: OwnerCubit.get(context).getProducts(),
      builder: (context, snapshot) {

      if(snapshot.hasData){
        List<ProductData> products=snapshot.data as List<ProductData>;
        return  Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: ListView.separated(itemBuilder: ((context, index) => productItem(
        context: context,
         data: products[index])),
       separatorBuilder: (context,index)=>SizedBox(height: 1,),
        itemCount: products.length)
    );
      }
      else{
        return Text('error');
      }
    },)
    );
    }, listener: (context,state){});
  }
  Widget productItem({
    required context,
    required ProductData data
  })=>InkWell(
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
                        Center(
                          child: Column(
                            children: [
                              Text( "${data.productName}",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productPrice} جنيه",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productPower}% طاقة ",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productProtein}% بروتين",style: TextStyle(color: Colors.black,fontSize: 22.0),),
                              SizedBox(height: 5.0,),
                              Text("${data.productMetal}% حديد",style: TextStyle(color: Colors.black,fontSize: 22.0),),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },


              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                width: double.infinity,
                height: 70.0,

                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text("سعر الكيلو: ${data.productPrice} جنيه",
                        style: TextStyle(color: Colors.white,
                            fontSize: 28.0),textDirection: TextDirection.ltr,),
                    )),
                    Padding(padding:  const EdgeInsets.only(right: 40.0),child: Text("${data.productName}",style: TextStyle(color: Colors.white,
                       fontSize: 28.0),textDirection: TextDirection.rtl,),
                  )
                    ],
                ),
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                    color: Color(0xFF4DB6AC),
                  )
              ),
            );
  AlertDialog addDialog({required context}){
      TextEditingController? nameController=TextEditingController();
    TextEditingController? priceController=TextEditingController();
    TextEditingController? metalController=TextEditingController();
    TextEditingController? powerController=TextEditingController();
    TextEditingController? proteinController=TextEditingController();
    GlobalKey<FormState> formKey=GlobalKey<FormState>();
    return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Center(
                  child: Text(
                    'المكونات',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                content:SingleChildScrollView(
                  child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'اسم المكون',
                        prefixIcon: Icons.production_quantity_limits_sharp),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: priceController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'سعر الكيلو',
                        prefixIcon: Icons.price_change),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: powerController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: 'الطاقة',
                        prefixIcon: Icons.power_input),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: proteinController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: ' البروتين ',
                        prefixIcon: Icons.create_new_folder_outlined),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormField(
                        controller: metalController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'يجب ادخال البيانات ';
                          }
                        },
                        label: ' الحديد ',
                        prefixIcon: Icons.medical_services),
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  
                ]),
                ),
                actions: [
                  BlocProvider(create: (context) =>OwnerCubit() ,
                  child: BlocConsumer<OwnerCubit,OwnerState>(
                    listener: (context, state) {
                      
                    },
                    builder: (context,state){
                      return Form(
                    key: formKey,
                    child:defaultButton(
                    text: 'حفظ ',
                    function: () {
                     OwnerCubit.get(context).saveProduct(
                      ProductData(
                        nameController.text.toString(),
                      priceController.text.toString(),
                      metalController.text.toString(),
                      powerController.text.toString(),
                      proteinController.text.toString()
                      )
                    ).then((value){
                    Navigator.pop(context);
                    });

                    },

                  )
                    );
                
                    },
                  ),)
                ],
                backgroundColor: Colors.white,
          );
  }
  }
