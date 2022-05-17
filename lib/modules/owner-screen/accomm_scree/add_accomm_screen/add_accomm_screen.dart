import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';

import '../../../../shared/component/components.dart';

class AddAccommindationScreen extends StatelessWidget {
  const AddAccommindationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var productionFarmController = TextEditingController();
          var addressController       = TextEditingController();
          var locationController       = TextEditingController();
            var phoneController       = TextEditingController();
          var priceController       = TextEditingController();
          var cubit=OwnerCubit.get(context);
          addressController.text=cubit.ownerModel!.address;
          phoneController.text=cubit.ownerModel!.phone;

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                              InkWell(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Image(
                                      image:
                                      cubit.AccomImage ==null?
                                      NetworkImage(
                                        'https://thumbs.dreamstime.com/b/add-photo-line-icon-image-thumbnail-sign-picture-placeholder-symbol-quality-design-element-linear-style-editable-stroke-vector-219079541.jpg',
                                      ):
                                          FileImage(cubit.AccomImage!) as ImageProvider
                                      ,
                                      width: double.infinity,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
                                    cubit.AccomImage==null?
                                    Text(
                                      'أضف صورة للايواء',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ):Text('')

                                  ],
                                ),
                                onTap: (){
                                  cubit.getAccomImage();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        BuildDropBottom(
                          dropdownButtonTitle: 'اختر',
                          function: (newValue)
                          {
                            cubit.dropDownButtonType(newValue);
                          },
                          items: ['بوكس فاضي', 'البوكس +الرعايه الطبيه', 'البوكس + الرعاية +الاكل', 'الحوافر و قص الشعر',].map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          value: cubit.valueChooseType,
                        ),
                        SizedBox(height: 20.0,),
                        defaultFormField(
                            controller: priceController,
                            type: TextInputType.number,
                            validator: (value){
                              if(value.isEmpty){
                                return 'السعر مطلوب';
                              }
                              return null;
                            },
                            label: 'من فضلك ادخل السعر',
                            prefixIcon: Icons.price_check),
                        SizedBox(height: 20.0,),
                        defaultFormField(
                            controller: productionFarmController,
                            type: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'يرجي ادخال البيانات  ';
                              }
                              return null;
                            },
                            label: 'معلومات عامة عن المزرعة و خدمات الايواء ',
                            prefixIcon: Icons.info),


                        SizedBox(height: 20.0,),

                        defaultFormField(
                            controller: addressController,
                            type: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'يرجي ادخال البيانات  ';
                              }
                              return null;
                            },
                            label: 'العنوان ',
                            prefixIcon: Icons.location_on),

                        SizedBox(height: 20.0,),



                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'يرجي ادخال البيانات  ';
                              }
                              return null;
                            },
                            label: ' رقم الهاتف ',
                            prefixIcon: Icons.phone),

                        SizedBox(height: 20.0,),

                        ConditionalBuilder(
                            condition: state is! CreateAccomLoadingState,
                            builder: (context) =>  defaultButton(
                                function: (){
                                  cubit.uploadAccomImage(
                                      type: cubit.valueChooseType as String,
                                      Price: priceController.text,
                                      info: productionFarmController.text,
                                      address: addressController.text,
                                      phone: phoneController.text);
                                },
                                text: 'Add'),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()))





                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context,state){});
  }
}
