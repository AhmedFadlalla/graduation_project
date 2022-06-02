import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/registeration_screen/register_screen/register_cubit/states.dart';



class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

   String? valueChoose;
  List<String> items=['Owner','User'];

  void onChangeDropDownButton(String newValue){

    valueChoose=newValue;

  }


  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,

  }) {
    UserModel model = UserModel(
        name: name,
        email: email,
        uId: uId,
        image:
            'https://rcmi.fiu.edu/wp-content/uploads/sites/30/2018/02/no_user.png',
        cover: 'https://th.bing.com/th/id/R.38f36f9f78b46ab781fbba072232dd5b?rik=NbBTb1D4YyZSUQ&pid=ImgRaw&r=0',
        bio: 'write your bio',
        phone: phone,
        status: 1,
      oId: '',
      section: ''



    );

     FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffixIcon = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(RegisterChangePasswordVisibilityState());
  }
}
