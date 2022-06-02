

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/doc_home_layout/doc_home_layout.dart';
import 'package:graduation_project/layouts/home_layout/cubit/cubit.dart';
import 'package:graduation_project/layouts/home_layout/home_layout.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/owner_home_Layout.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/modules/Doctor_Screens/complete_info.dart';

import 'package:graduation_project/modules/owner-screen/doctor_screen/doc_home_screen.dart';
import 'package:graduation_project/modules/registeration_screen/register_screen/register_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:graduation_project/shared/network/local/cach_helper.dart';
import 'package:graduation_project/shared/styles/colors.dart';


import '../../../shared/component/constants.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/component/constants.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is LoginErrorState)
            showToast(text: state.error, state: ToastStates.ERROR);




          if(state is LoginSuccessState)
            {

              if(LoginCubit.get(context).status==1) {
                CachHelper.saveData(
                    key: 'uId',
                    value: state.uId)
                    .then((value) {
                  Navigator.pushReplacement(
                    context, //my place
                    MaterialPageRoute(
                      builder: (context) => HomeScreenLayout(userId: CachHelper.getData(key: 'uId')),
                    ),
                    /////اللي انا رايحله
                  );
                  // navigateAndFinish(context, HomeScreenLayout());
                  print(uId);
                });
              }
              else if(LoginCubit.get(context).status==2)
                {
                  CachHelper.saveData(
                      key: 'oId',
                      value: state.uId)
                      .then((value) {
                    Navigator.pushReplacement(
                      context, //my place
                      MaterialPageRoute(
                        builder: (context) => OwnerHomeScreenLayout(ownerId: CachHelper.getData(key: 'oId')),
                      ),
                      /////اللي انا رايحله
                    );
                    // navigateAndFinish(context, OwnerHomeScreenLayout(oId: CachHelper.getData(key: 'oId'),));


                    print(oId);
                  });
                }
              else if(LoginCubit.get(context).status==3)
                {
                  CachHelper.saveData(
                      key: 'dId',
                      value: state.uId)
                      .then((value) {
                        dDone=CachHelper.getData(key: 'done');
                    if(dDone==1){
                      navigateAndFinish(context,DocHomeScreenLayout(docId: CachHelper.getData(key: 'dId'),) );
                    }
                    else
                       navigateAndFinish(context,DoctorCompleteInfo(docId: CachHelper.getData(key: 'dId'),) );
                    print(dId);
                  });
                }


            }


          
        },
        builder: (context,state){
          var cubit=LoginCubit.get(context);
          var formKey=GlobalKey<FormState>();
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: defaultColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0
                      ),),
                    SizedBox(height: 5.0,),
                    Text(
                      'Login to communicate with your friend',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0
                      ),),
                    SizedBox(height: 15.0,),
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
                    ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context)=>materialBottomLogin(
                            pressFunction: (){


                              if(formKey.currentState!.validate()){
                                cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }


                                  // LoginCubit.get(context).getDocValue();
                                  // if(LoginCubit.get(context).isDoc==true)
                                  //   navigateTo(context, DoctorHomeScreen());



                            },
                            bottomText: 'LOGIN',
                            backgroundColor: defaultColor,
                            width: double.infinity),
                        fallback: (context)=>Center(child: CircularProgressIndicator())),
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ',
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black
                          ),),
                        TextButton(onPressed: (){
                          navigateTo(context, RegisterScreen());
                        }, child: Text('Register now'))

                      ],
                    )



                  ],

                ),
              ),
            ),
          );
        },

      )
    );
  }
}
