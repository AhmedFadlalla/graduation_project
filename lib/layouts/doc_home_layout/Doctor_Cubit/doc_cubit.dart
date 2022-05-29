import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/doctor_model.dart';
import 'package:graduation_project/models/horse_model.dart';
import 'package:graduation_project/models/roshetamodel.dart';
import 'package:graduation_project/models/user_model.dart';

import 'package:graduation_project/modules/Doctor_Screens/doc_profile_screens/doc_profile_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/Message_model.dart';
import '../../../models/alekaamodel.dart';
import '../../../models/disease_model/disease_model.dart';

import '../../../models/horsemodel.dart';
import '../../../models/post_model.dart';
import '../../../models/productmodel.dart';
import '../../../modules/Doctor_Screens/Doc_settings_screen.dart';
import '../../../modules/Doctor_Screens/doc_chats_screens/doc_chat_screen.dart';
import '../../../modules/Doctor_Screens/doc_community_screen.dart';
import '../../../modules/Doctor_Screens/doctor_home_screen.dart';
import '../../../modules/owner-screen/doctor_screen/doc_home_screen.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/styles/icon_broken.dart';
import 'doc_states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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

  int cIndex=0;
  void changeIndex(int index){
    cIndex=index;
    emit(ChangeIndexSuccess());

  }
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

  UserModel? userModel;

  void getDocData() {
    // emit(GetDocLoadingState());
    FirebaseFirestore.instance.collection('users')
        .doc(dId)
        .snapshots()
        .listen((value) {
      userModel = UserModel.fromJson(value.data()!);
      // emit(GetDocSuccessfulState());
    });
  }

  File? docImage;
  ImagePicker picker = ImagePicker();

  Future<void> getDocImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      docImage = File(pickedFile.path);
      emit(PickedDocImageSuccessState());
    } else {
      print('No image selected');
      emit(PickedDocImageErrorState());
    }
  }

  void uploadDocImage({
    required String name,
    required String ssn,
    required String address,
  }) {
    emit(UpdateDocDataLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('docImage/${Uri
        .file(docImage!.path)
        .pathSegments
        .last}')
        .putFile(docImage!)
        .then((value) {
      print(value);
      value.ref.getDownloadURL().then((value) {
        print(value);
        updateDocData(name: name, ssn: ssn, image: value, address: address);
      }).catchError((error) {
        print(error.toString());
        emit(UpdateDocDataErrorState(error.toString()));
      });
    }).catchError((error) {
      print(error.toString());
      emit(UpdateDocDataErrorState(error.toString()));
    });
  }

  void updateDocData({
    required String name,
    required String ssn,
    required String image,
    required String address,
  }) {
    emit(UpdateDocDataLoadingState());
    print(userModel!.email);
    print(userModel!.phone);
    print(userModel!.oId!);
    print(userModel!.section!);
    DoctorModel model = DoctorModel(
        name: name,
        email: userModel!.email,
        phone: userModel!.phone,
        ssn: ssn,
        image: image,
        oId: userModel!.oId!,
        dId: dId!,
        section: userModel!.section!,
        address: address,
        cover: userModel!.cover,
        bio: userModel!.bio);
    FirebaseFirestore.instance
        .collection('owners')
        .doc(userModel!.oId)
        .collection('sections')
        .doc(userModel!.section)
        .collection('doctor')
        .doc(dId)
        .update(model.toMap())
        .then((value) {
      getDocFullData();
      emit(UpdateDocDataSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateDocDataErrorState(error.toString()));
    });
  }

  DoctorModel? doctorModel;

  void getDocFullData() {

    FirebaseFirestore.instance
        .collection('owners')
        .doc(userModel!.oId)
        .collection('sections')
        .doc(userModel!.section)
        .collection('doctor')
        .doc(dId)
        .snapshots()
        .listen((value) {
      doctorModel = DoctorModel.fromJson(value.data()!);
      // emit(GetDocFullDataSuccessfulState());

    });
  }

  List<HorseModel> horses = [];
  String? horseId;
  HorseModel? horseModel;
  String?horseName;
  void getHorses() {

    horses=[];
    emit(GetHorsesDataLoadingState());
    FirebaseFirestore.instance
        .collection('owners')
        .doc(userModel!.oId)
        .collection('sections')
        .doc(userModel!.section)
        .collection('horses')
        .get()
        .then((value) {

      value.docs.forEach((element) {
        horseModel=HorseModel.fromJson(element.data());
        horses.add(HorseModel.fromJson(element.data()));
        horseId = element.id;

      });
      emit(GetHorsesDataSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHorsesDataErrorState(error.toString()));
    });
  }


  // Stream<List<HorseModel>>? getHorsesData() {
  //
  //   FirebaseFirestore.instance
  //       .collection('owners')
  //       .doc(userModel!.oId)
  //       .collection('sections')
  //       .doc(userModel!.section)
  //       .collection('horses')
  //       .snapshots().map((event) {
  //     emit(GetHorsesDataSuccessfulState());
  //        return event.docs.map((e) {
  //           return HorseModel.fromJson(e.data());
  //         }).toList();
  //
  //   });
  //   return null;
  //
  //
  // }

  Future<void> sendDisease(DiseaseData diseaseData, hId) async {
    FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('sections')
        .doc(doctorModel!.section)
        .collection('horses')
        .doc(hId)
        .collection('Disease')
        .doc()
        .set(diseaseData.toMap())
        .then((value) {
      emit(SendHealthRecordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendHealthRecordErrorState(error.toString()));
    });
  }

  List<DiseaseData> diseaseData = [];

  Future getdDisease({required hId}) async {
    diseaseData = [];
    FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('sections')
        .doc(doctorModel!.section)
        .collection('horses')
        .doc(hId)
        .collection('Disease')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        diseaseData.add(DiseaseData.fromJson(element.data()));
      });
      emit(GetHealthRecordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetHealthRecordErrorState(error.toString()));
    });
  }

  List<DiseaseModel> data = [];

  Future getdata({required hId}) async {
    data = [];
    FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('sections')
        .doc(doctorModel!.section)
        .collection('horses')
        .doc(hId)
        .collection('rosheta')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        data.add(DiseaseModel.fromJson(element.data()));
      });
      emit(GetRoshetSuccessState());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetRoshetErrorState(error.toString()));
    });
  }

  Future<void> sendRosheta(DiseaseModel rosheta, hId) async {
    FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('sections')
        .doc(doctorModel!.section)
        .collection('horses')
        .doc(hId)
        .collection('rosheta')
        .doc()
        .set(rosheta.toMap())
        .then((value) {
      emit(SendRoshetSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendRoshetErrorState(error.toString()));
    });
  }

  bool shouldCheck = false;

  void Check_Box(val) {
    shouldCheck = val;
    emit(CheckBoxx());
  }



  File? profileImage;


  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImageSuccessState());
    } else {
      print('No image selected');
      emit(ProfileImageErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(CoverImageSuccessState());
    } else {
      print('No image selected');
      emit(CoverImageErrorState());
    }
  }

  void uploadProfileImage({
    required String docName,
    required String phone,
    required String bio,
    required String address,
    required context
  }) {
    emit(DoctorUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('doctor/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(UploadProfileImageSuccessState());
        // updateOwner(studName: name, phone: phone, bio: bio, image: value);
        updateDoctor(docName: docName, phone: phone, bio: bio, address: address,image: value);
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String docName,
    required String phone,
    required String bio,
    required String address,
    required context
  }) {
    emit(DoctorUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('doctor/${Uri
        .file(coverImage!.path)
        .pathSegments
        .last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(UploadCoverImageSuccessState());
        updateDoctor(docName: docName, phone: phone, bio: bio, address: address,cover: value);
        print(value);
      }).catchError((error) {
        emit(UploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(UploadCoverImageErrorState());
    });
  }

  void updateDoctor({
    required String docName,
    required String phone,
    required String bio,
    required String address,
    String? cover,
    String? image,
  }) {
    DoctorModel model = DoctorModel(
        name: docName,
        email: doctorModel!.email,
        phone: phone,
        ssn: doctorModel!.ssn,
        image: image ?? doctorModel!.image,
        oId: doctorModel!.oId,
        dId: dId!,
        section: doctorModel!.section,
        address: address,
        bio: bio,
        cover: cover ?? doctorModel!.cover

    );
    FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('sections')
        .doc(doctorModel!.section)
        .collection('doctor')
        .doc(dId!)
        .update(model.toMap())
        .then((value) {
      getDocFullData();
    }).catchError((error) {
      emit(DoctorUpdateErrorState());
    });
  }

  File? postImage;
  Future<void> getPostImage() async {
    final  pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PostImageSuccessState());
    } else {
      print('No image selected');
      emit(PostImageErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(DocCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(dateTime: dateTime, text: text, postImage: value);
        // emit(SocialUploadCoverImageSuccessState());

        print(value);
      }).catchError((error) {
        emit(DocCreatePostErrorState());
      });
    }).catchError((error) {
      emit(DocCreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    PostModel models = PostModel(
        name: doctorModel!.name,
        uId: dId!,
        image: doctorModel!.image,
        dateTime: dateTime,
        text: text,
        postImage: postImage ?? '');
    FirebaseFirestore.instance
        .collection('posts')
        .add(models.toMap())
        .then((value) {
      emit(DocCreatePostSuccessState());
    }).catchError((error) {
      emit(DocCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getAllPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
      });
      emit(GetPostsSuccessfulState());
    }).catchError((error) {
      emit(GetPostsErrorState(error.toString()));
    });
  }



  List<UserModel> users = [];
  void getAllUsers() {
    users=[];
      FirebaseFirestore.instance.collection('users').get().then((value) {

        emit(GetAllUserSuccessfulState());
        value.docs.forEach((element) {
          if (element.data()['uId'] != dId)
            users.add(UserModel.fromJson(element.data()));
        });
      }).catchError((error) {
        print(error.toString());
        emit(GetAllUserErrorState(error.toString()));
      });
  }
  void sendMessage({
    required String receiverId,
    required String text,
    required String dateTime,
  }) {
    MessageModel model = MessageModel(
        dateTime: dateTime,
        senderId: dId,
        receiverId: receiverId,
        text: text);

    FirebaseFirestore.instance
        .collection('users')
        .doc(dId!)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(SendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(dId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(dId)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(GetMessageSuccessfulState());
    });
  }


  String? AliqaValueChoose;

  void onChangeAliqaItem(newValue) {
    AliqaValueChoose = newValue;
    emit(DropDownButtonState());
  }
  String? AliqaValueChoose1;
  String? AliqaValueChoose2;
  String? AliqaValueChoose3;
  void onChangeAliqaIngredientItem(newValue,indeex) {
    if(indeex==0){
      AliqaValueChoose1=newValue;
    }
    else if(indeex==1){
      AliqaValueChoose2=newValue;
    }
    else if(indeex==2){
      AliqaValueChoose3=newValue;
    }
    emit(DropDownButtonState());
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

  String? HorseNameChoose;

  void onChangeNameItem(newValue) {
    HorseNameChoose = newValue;
    emit(DropDownButtonState());
  }

  String? HorseHalaChoose;

  void onChangeHalaItem(newValue) {
    HorseHalaChoose = newValue;
    emit(DropDownButtonState());
  }

  String? colorValueChoose;

  void onChangeColorItem(newValue) {
    colorValueChoose = newValue;
    emit(DropDownButtonState());
  }
  String? datanamechoose;
  void onChangedataItem(newValue) {
    datanamechoose = newValue;
    emit(DropDownButtonState());
  }

  Stream<List<ProductData>>? getProducts(){
    return FirebaseFirestore.instance.collection('owners')
        .doc(doctorModel!.oId).collection('Ingredients').snapshots().map((snapShot){
      return snapShot.docs.map((docs){
        return ProductData.fromJson(docs.data());
      }).toList();
    });
  }

  Future<void> saveala2kData(AlekaModel alekaModel)async{
    await FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('ala2k')
        .doc()
        .set(alekaModel.toMap()).then((value){
      emit(SendAlekaSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SendAlekaErrorState(error.toString()));

    });
  }
  Stream<List<AlekaModel>>? getelAlaaik(){
    return FirebaseFirestore.instance
        .collection('owners')
        .doc(doctorModel!.oId)
        .collection('ala2k')
        .snapshots()
        .map((snapShot){
      return snapShot.docs.map((docs){
        print(AlekaModel.fromJson(docs.data()));
        return AlekaModel.fromJson(docs.data());

      }).toList();

    });
  }
  
  List<ProductData> productModel=[];
  ProductData? productData;
  void getAlekaData(){
    FirebaseFirestore.instance.collection('owners')
        .doc(doctorModel!.oId)
        .collection('Ingredients')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        productModel.add(ProductData.fromJson(element.data()));
        productData=ProductData.fromJson(element.data());
      });
    }).catchError((error){

    });
  }


  Future<void> saveHorseFeed(HorseData horseData,horseId)async{
    await FirebaseFirestore.instance..collection('owners')
        .doc(doctorModel!.oId)
         .collection('sections')
        .doc(doctorModel!.section)
        .collection('horses')
        .doc(horseId)
        .collection('HorseFeeding').doc().set(horseData.toMap()).then((value){
      emit(SendHorseFeedSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(SendHorseFeedErrorState(error.toString()));

    });
  }

}
