import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/DiseaseModel.dart';
import 'package:graduation_project/modules/Doctor_Screens/doc_profile_screen.dart';
import 'package:graduation_project/modules/Doctor_Screens/doctor_home_page.dart';

import '../../../modules/Doctor_Screens/doc_chat_screen.dart';
import '../../../modules/Doctor_Screens/doc_community_screen.dart';
import '../../../shared/styles/icon_broken.dart';
import 'doc_states.dart';

//import 'package:youssef_example/standardbloc/standardstates.dart';

class DoctorCubit extends Cubit<DoctorStates> //1
{
  DoctorCubit() : super(InitialState()); //السوبر بياخد استاتس//1
  static DoctorCubit get(context) => BlocProvider.of(context);




  int currentIndex = 0;
  List<Widget> docScreens = [
    DocHomeScreen(),
    DocCommunityScreen(),
    DocChatScreen(),
    DocProfileScreen(),
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
    emit(DocChangeBottomNavState());
  }

  String? valueChooseTimesPerDay;
  void dropDownButtonTimesPerDay(newValue) {
    valueChooseTimesPerDay = newValue.toString();
    emit(DropDownButtonState());
  }

  //////////////////////////////////////////
  String? valueChooseNumOfDayWeekMonth;
  void dropDownButtonNumOfDayWeekMonth(newValue) {
    valueChooseNumOfDayWeekMonth = newValue.toString();
    emit(DropDownButtonState());
  }



  String? valueChooseDayWeekMonth;
  void dropDownButtonDayWeekMonth(newValue) {
    valueChooseDayWeekMonth = newValue.toString();
    emit(DropDownButtonState());
  }

  List<DiseaseModel> data = [];
  Future getdata() async {
    data.clear();

    FirebaseFirestore.instance.collection('doctor').get().then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('doctor')
            .doc(element.id)
            .get()
            .then((value) {
          print(value);
          data.add(DiseaseModel.fromJson(element.data()));
          emit(GetdataState());
        });
      });
    });
  }

  bool shouldCheck = false;
  void Check_Box(val) {
    shouldCheck = val;
    emit(CheckBoxx());
  }
}
