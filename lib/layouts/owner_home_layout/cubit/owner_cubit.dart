import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/models/horse_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/owner_model.dart';
import '../../../modules/chats_screen/chat_screen.dart';
import '../../../modules/community_screen/community_screen.dart';
import '../../../modules/owner-screen/owner_home_screen/owner_home_screen.dart';
import '../../../modules/profile_screen/profile_screen.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/styles/icon_broken.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class OwnerCubit extends Cubit<OwnerState> {
  OwnerCubit() : super(OwnerInitialState());

  static OwnerCubit get(context) => BlocProvider.of(context);

  late OwnerModel ownerModel;

  void getOwnerData() {
    emit(GetOwnerLoadingState());

    FirebaseFirestore.instance
        .collection('owners')
        .doc('00' + uId!)
        .get()
        .then((value) {
      ownerModel = OwnerModel.fromJson(value.data()!);
      emit(GetOwnerSuccessfulState());
    }).catchError((error) {
      emit(GetOwnerErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> ownerScreens = [
    OwnerHomeScreen(),
    CommunityScreen(),
    ChatsScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(IconBroken.Activity), label: 'Community'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Profile), label: 'Profile'),
  ];
  List<String> titles = ['Home', 'Community', 'Chats', 'Profile'];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(OwnerChangeBottomNavState());
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ));
  String? valueChoose;
  List<String> colorItems = ['Black', 'White'];
  List<String> gender_items = [
    'ذكر',
    'انثي',
  ];
  String? rasanValueChoose;

  void onChangeRasanDropDownButton(newValue) {
    rasanValueChoose = newValue;
    emit(DropDownButtonState());
  }

  String? ganderValueChoose;

  void onChangeGanderItem(newValue) {
    ganderValueChoose = newValue;
    emit(DropDownButtonState());
  }

  String? colorValueChoose;

  void onChangeColorItem(newValue) {
    colorValueChoose = newValue;
    emit(DropDownButtonState());
  }

  Timestamp? dateTime;

  void pickHorseBirthDate(date) {
    dateTime = date;
    emit(DatePickedSuccessfulState());
  }

  File? horseImage;

  ImagePicker picker = ImagePicker();

  Future<void> getHorseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      horseImage = File(pickedFile.path);
      emit(HorseImageSuccessState());
    } else {
      print('No image selected');
      emit(HorseImageErrorState());
    }
  }

  void uploadHorseImage({
    required String horseName,
    required String fatherName,
    required String motherName,
    required String sectionNum,
    required String boxNum,
    required String owner,
    required Timestamp dateTime,
    required String initPrice,
    required String microshipCode,
    required String type,
    required String color,
    required String gander,
  }) {
    emit(CreateHorseLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('horse/${Uri.file(horseImage!.path).pathSegments.last}')
        .putFile(horseImage!)
        .then((value) {
      print(value);
      value.ref.getDownloadURL().then((value) {
        createHorse(
          horseName: horseName,
          horseImage: value,
          fatherName: fatherName,
          motherName: motherName,
          sectionNum: sectionNum,
          boxNum: boxNum,
          dateTime: dateTime,
          initPrice: initPrice,
          microshipCode: microshipCode,
          type: type,
          owner:owner,
          color: color,
          gander: gander

        );
      }).catchError((error) {
        print(error.toString());
        emit(CreateHorseErrorState(error.toString()));
      });
    }).catchError((error) {
      print(error.toString());
      emit(CreateHorseErrorState(error.toString()));
    });
  }

  void createHorse({
    required String horseName,
    required String horseImage,
    required String fatherName,
    required String motherName,
    required String sectionNum,
    required String boxNum,
    required String owner,
    required String initPrice,
    required Timestamp dateTime,
    required String microshipCode,
    required String type,
    required String color,
    required String gander,
  }) {
    emit(CreateHorseLoadingState());
    HorseModel model = HorseModel(
        horseName: horseName,
        horseImage: horseImage,
        fatherName: fatherName,
        motherName: motherName,
        sectionNum: sectionNum,
        boxNum: boxNum,
        owner: owner,
        birthDate: dateTime,
        initPrice: initPrice,
        microshipCode: microshipCode,
        type: type,
        color: color,
      gander: gander
    );
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('horses')
        .doc(microshipCode)
        .set(model.toMap())
        .then((value) {
      emit(CreateHorseSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateHorseErrorState(error.toString()));
    });
  }

  int index = 0;
  List<HorseModel> horses = [];
  List<String> horsesId = [];

  void getHorseData() {
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('horses')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        horses.add(HorseModel.fromJson(element.data()));
        horsesId.add(element.id);
      });
      emit(GetHorsesSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHorsesErrorState(error.toString()));
    });
  }

  getHorseDetails({
    required String horseId,
  }) {
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('horses')
        .doc(horseId)
        .get()
        .then((value) {
      emit(GetHorsesDetailsSuccessfulState());
    }).catchError((error) {
      emit(GetHorsesDetailsErrorState(error.toString()));
    });
  }

  String? valueChooseType;

  void dropDownButtonType(newValue) {
    valueChooseType = newValue.toString();
    emit(DropDownButtonState());
  }
}
