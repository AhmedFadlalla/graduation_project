import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/roshetamodel.dart';

import 'package:graduation_project/modules/Doctor_Screens/doc_profile_screen.dart';


import '../../../models/disease_model/disease_model.dart';

import '../../../modules/Doctor_Screens/Doc_settings_screen.dart';
import '../../../modules/Doctor_Screens/doc_chat_screen.dart';
import '../../../modules/Doctor_Screens/doc_community_screen.dart';
import '../../../modules/owner-screen/doctor_screen/doc_home_screen.dart';
import '../../../shared/styles/icon_broken.dart';
import 'doc_states.dart';

//import 'package:youssef_example/standardbloc/standardstates.dart';

class DoctorCubit extends Cubit<DoctorStates> //1
    {
  DoctorCubit() : super(InitialState()); //السوبر بياخد استاتس//1
  static DoctorCubit get(context) => BlocProvider.of(context);



  int currentIndex = 0;
  List<Widget> docScreens = [
    DoctorHomeScreen(),
    DocCommunityScreen(),
    DocChatScreen(),
    DocSettingsScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(IconBroken.Activity), label: 'Community'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Chat), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Setting), label: 'Settings'),
  ];
  List<String> titles = ['Home', 'Community', 'Chats', 'Profile'];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(OwnerChangeBottomNavState());
  }

////////////////////////////////////

// ////////////////////////////////////
  String? valueChooseTimesPerDay;
  void dropDownButtonTimesPerDay(newValue)
  {
    valueChooseTimesPerDay = newValue.toString();
    emit(DropDownButtonState());
  }
  //////////////////////////////////////////
  String? valueChooseNumOfDayWeekMonth;
  void dropDownButtonNumOfDayWeekMonth(newValue)
  {
    valueChooseNumOfDayWeekMonth = newValue.toString();
    emit(DropDownButtonState());
  }
////////////////////////////////////////////
  //   Timestamp? dateTime;
//
//   void pickHorseBirthDate(date) {
//     dateTime = date;
//     emit(DatePickedSuccessfulState());
//   }
  ///////////////////////////////////
  String? valueChooseDayWeekMonth;
  void dropDownButtonDayWeekMonth(newValue)
  {
    valueChooseDayWeekMonth = newValue.toString();
    emit(DropDownButtonState());
  }
///////////////////////////////////////////////////
//   bool? ischeck=false;
//   void Check_Box(newValue)
//   {
//     ischeck=newvalue;
//     emit(CheckBoxx());
//   }
  List <DiseaseModel> data=[];
  Future getdata()async{

    FirebaseFirestore.instance.collection('Doctor').get().then((value) {

      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('Doctor')
            .doc(element.id)
            .collection('Rosheta')
            .get()
            .then((value2){
          value2.docs.forEach((element2) {
            data.add(DiseaseModel.fromJson(element2.data()));
          });
          emit(GetRoshetSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(GetRoshetErrorState(error.toString()));
        });
      });
    }).catchError((error){
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrror');
      print(error.toString());
    });

  }
  Future<void> sendRosheta(DiseaseModel rosheta)async{

    var doc =FirebaseFirestore.instance
        .collection('Doctor')
        .doc();
    doc.set({})
        .then((value) {
      doc
          .collection('Rosheta')
          .doc()
          .set(rosheta.toMap())
          .then((value) {
        //emit(SendRoshetSuccessState());
      }).catchError((error){
        print(error.toString());
        // emit(SendRoshetErrorState(error.toString()));

      });


    })
        .catchError((error){
      print('error:'+error.toString());
    });
  }
  bool shouldCheck=false;
  void Check_Box(val)
  {

    shouldCheck = val;
    emit(CheckBoxx());
  }


  List <DiseaseData> diseaseData=[];
  Future getdDisease()async{

    FirebaseFirestore.instance.collection('Doctor').get().then((value) {

      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('Doctor')
            .doc(element.id)
            .collection('Disease')
            .get()
            .then((value2){
          value2.docs.forEach((element2) {
            diseaseData.add(DiseaseData.fromJson(element2.data()));
          });
          return diseaseData;
          emit(GetDiseaseSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(GetDiseaseErrorState(error.toString()));
        });
      });
    }).catchError((error){
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrror');
      print(error.toString());
    });

  }
  Future<void> sendDisease(DiseaseData diseaseData)async{

    var doc =FirebaseFirestore.instance
        .collection('Doctor')
        .doc();
    doc.set({})
        .then((value) {
      doc
          .collection('Disease')
          .doc()
          .set(diseaseData.toMap())
          .then((value) {
        //emit(SendRoshetSuccessState());
      }).catchError((error){
        print(error.toString());
        // emit(SendRoshetErrorState(error.toString()));

      });


    })
        .catchError((error){
      print('error:'+error.toString());
    });
  }








}
