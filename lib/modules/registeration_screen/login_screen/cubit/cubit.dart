import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/cubit/states.dart';

import '../../../../shared/component/constants.dart';




class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());


  static LoginCubit get(context)=>BlocProvider.of(context);


  void userLogin ({
    required String email,
    required String password,
  }){

    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value){
          print(value.user!.uid);
          getStatusValue('${value.user!.uid}');
          emit(LoginSuccessState(value.user!.uid));

    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
    



  }


  UserModel? userData;
  int? status;
  getStatusValue(
      String userId
){
    FirebaseFirestore.instance
        .collection('users').doc(userId)
        .get()
        .then((value) {
          userData=UserModel.fromJson(value.data()!);
          status=userData!.status;
          print(status);
          emit(GetDocValueSuccessState());

    })
        .catchError((error){
          print(error.toString());
      emit(GetDocValueErrorState(error.toString()));
    });
  }

  IconData suffixIcon=Icons.visibility;
  bool isPassword=true;

  void changePasswordVisibility(){

    isPassword=!isPassword;
    suffixIcon=isPassword?Icons.visibility:Icons.visibility_off;

    emit(LoginChangePasswordVisibilityState());
  }


}







