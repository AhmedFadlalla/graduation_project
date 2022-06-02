import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../../../shared/component/components.dart';
import '../../../shared/network/local/cach_helper.dart';

class AddDoctorScreen extends StatelessWidget {
  const AddDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          var doctornameController = TextEditingController();
          var docSnnController = TextEditingController();
          var contactNumController = TextEditingController();


          var emailController=TextEditingController();
          var passwordController=TextEditingController();
          var nameController=TextEditingController();
          var phoneController=TextEditingController();
          var cubit=OwnerCubit.get(context);
          var height=MediaQuery.of(context).size.height;
          return Scaffold(
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height*0.05,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            'Add Doctor',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4DB6AC)
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height*0.1,
                      ),
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              color: Color(0xFFB0CCE1).withOpacity(0.32),
                            ),
                          ],
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            children: [
                              // Container(
                              //   height: 190.0,
                              //   child: Stack(
                              //     alignment: AlignmentDirectional.bottomEnd,
                              //     children: [
                              //       CircleAvatar(
                              //         radius: 65.0,
                              //         backgroundColor:
                              //         Theme.of(context).scaffoldBackgroundColor,
                              //         child: CircleAvatar(
                              //           radius: 60.0,
                              //           backgroundImage: cubit.horseImage == null
                              //               ? NetworkImage(
                              //               'https://store-images.s-microsoft.com/image/apps.62288.13620585470013536.11ea7ace-068b-4450-a62e-2233e0b32064.39ccf900-bfd0-48d2-8259-e9bbfa50f4c2?mode=scale&q=90&h=300&w=300')
                              //               : FileImage(cubit.horseImage!) as ImageProvider,
                              //         ),
                              //       ),
                              //       IconButton(
                              //           onPressed: () {
                              //             cubit.getHorseImage();
                              //           },
                              //           icon: CircleAvatar(
                              //             radius: 20.0,
                              //             child: Icon(
                              //               Icons.camera_alt,
                              //               size: 16.0,
                              //             ),
                              //           ))
                              //     ],
                              //   ),
                              // ),

                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: BuildDropBottom(
                                  dropdownButtonTitle: ' اختر العنبر',
                                  function: (newValue) {
                                    cubit.onChangeSectionDropDownButton(newValue);
                                  },
                                  items: [
                                    'طلايق ',
                                    ' أمهات',
                                    'بكاري',
                                    'مهارة اناث',
                                    ' مهارة ذكور',
                                  ].map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                  value: cubit.sectionValueChoose,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                  controller: nameController,
                                  type: TextInputType.text,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'Name must not be empty ';
                                    }
                                    return null;
                                  },
                                  label: 'Name',
                                  prefixIcon: Icons.person),
                              SizedBox(
                          height: height*0.02,
                        ),
                              defaultFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'يجب ادخال الايميل ';
                                    }
                                    return null;
                                  },
                                  label: 'الايميل',
                                  prefixIcon: Icons.email,
                                hintText: 'email@doc.com'

                              ),
                              SizedBox(
                                height: height*0.02,
                              ),
                              defaultFormField(
                                  controller: passwordController,
                                  type: TextInputType.text,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'يجب ادخال كلمة المرور ';
                                    }
                                    return null;
                                  },
                                  label: 'الباسوررد',
                                  prefixIcon: Icons.lock),
                            SizedBox(
                              height: height*0.02,
                            ),
                              defaultFormField(
                                  controller: phoneController,
                                  type: TextInputType.text,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'يجب ادخال رقم الهاتف ';
                                    }
                                    return null;
                                  },
                                  label: 'رقم الهاتف ',
                                  prefixIcon: Icons.phone),

                      SizedBox(
                        height: height*0.02,
                      ),
                              ConditionalBuilder(
                                  condition: state is! DocRegisterLoadingState,
                                  builder: (context) => defaultButton(
                                      text: 'Submit',
                                      function: () {
                                        cubit.docRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                          section: cubit.sectionValueChoose as String,
                                        );

                                      }),
                                  fallback: (context) =>
                                      Center(child: CircularProgressIndicator())),
                              SizedBox(
                                height: height*0.05,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                )),
          );
        },
        listener: (context,state){
          if(state is CreateDocSuccessState)
            {
              CachHelper.saveData(key: 'done', value: 0).then((value) {
                showToast(text: 'Successful Register', state: ToastStates.SUCCESS);
              });


            }


        });
  }
}
