import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/home_layout.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/login_screen.dart';

import 'package:graduation_project/modules/registeration_screen/register_screen/register_cubit/cubit.dart';
import 'package:graduation_project/modules/registeration_screen/register_screen/register_cubit/states.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/component/constants.dart';
import 'package:graduation_project/shared/styles/colors.dart';

import '../../../shared/component/constants.dart';
import '../../../shared/network/local/cach_helper.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child:BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){

          if(state is CreateUserSuccessState) {
              navigateAndFinish(context, LoginScreen());


          }
        },
        builder: (context,state){
          var emailController=TextEditingController();
          var passwordController=TextEditingController();
          var nameController=TextEditingController();
          var phoneController=TextEditingController();
          var formKey=GlobalKey<FormState>();
          // String valueChoose;
          var cubit=RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: defaultColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0
                        ),),
                      SizedBox(height: 5.0,),
                      Text(
                        'Register to  Manage your Own Stud',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0
                        ),),
                      SizedBox(height: 15.0,),
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
                          prefixIcon: Icons.lock),SizedBox(height: 15.0,),
                      defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Email must not be empty ';
                            }
                            return null;
                          },
                          label: 'E-mail Address',
                          prefixIcon: Icons.email),
                      SizedBox(height: 15.0,),
                      defaultFormField(
                          controller: passwordController,
                          type: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'password must not be empty ';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefixIcon: Icons.lock),
                      SizedBox(height: 15.0,),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.text,
                          validator: (value){
                            if(value.isEmpty){
                              return 'phone must not be empty ';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefixIcon: Icons.lock),



                      SizedBox(height: 15.0,),

                      ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context)=>materialBottomLogin(
                              pressFunction: (){
                                if(formKey.currentState!.validate()){
                                  cubit.userRegister(
                                      name: nameController.text ,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text);
                                }


                              },
                              bottomText: 'Confirm',
                              backgroundColor: defaultColor,
                              width: double.infinity),
                          fallback: (context)=>Center(child: CircularProgressIndicator()))
                    ],

                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
