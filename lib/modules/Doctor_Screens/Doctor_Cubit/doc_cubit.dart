import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/DiseaseModel.dart';
import 'package:graduation_project/modules/Doctor_Screens/Doctor_Cubit/doc_states.dart';
//import 'package:youssef_example/standardbloc/standardstates.dart';

class StandardCubit extends Cubit<StandardStates> //1
{
  StandardCubit() : super(InitialState()); //السوبر بياخد استاتس//1
  static StandardCubit get(context) => BlocProvider.of(context);

////////////////////////////////////

// ////////////////////////////////////
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

////////////////////////////////////////////
  //   Timestamp? dateTime;
//
//   void pickHorseBirthDate(date) {
//     dateTime = date;
//     emit(DatePickedSuccessfulState());
//   }
  ///////////////////////////////////
  String? valueChooseDayWeekMonth;
  void dropDownButtonDayWeekMonth(newValue) {
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
