import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/doctor_model.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/cubit/states.dart';

import '../../../../shared/component/constants.dart';




class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());


  static LoginCubit get(context)=>BlocProvider.of(context);


  int? value;
  void userLogin ({
    required String email,
    required String password,
  }){

    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value){
          print(value.user!.uid);
          getStatusValue('${value.user!.uid}') ;
          emit(LoginSuccessState(value.user!.uid));


    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
    



  }


  UserModel? userData;
  int? status;
  void getStatusValue(
      String userId
){
    print('hi');
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen((value) {
      userData=UserModel.fromJson(value.data()!);
      status =userData!.status;
          print(status);
          // emit(GetDocValueSuccessState());

    });
    print(status);

  }

  DoctorModel? doctorModel;
  int? routeStates;
  getDocStatusValue(String docId){
    FirebaseFirestore.instance
        .collection('owners')
        .doc(userData!.oId)
        .collection('sections')
        .doc(userData!.section)
        .collection('doctor')
        .doc(docId)
        .get()
        .then((value) {
          doctorModel=DoctorModel.fromJson(value.data()!);
          print(routeStates);
          emit(LoginGetDoctorDataSuccessState());

    }).catchError((error){
      emit(LoginGetDoctorDataErrorState(error.toString()));
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







