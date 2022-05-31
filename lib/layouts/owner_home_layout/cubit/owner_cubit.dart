import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/models/doctor_model.dart';
import 'package:graduation_project/models/horse_model.dart';
import 'package:graduation_project/models/section_data_model.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/login_screen.dart';
import 'package:graduation_project/shared/component/components.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/Message_model.dart';
import '../../../models/accom_model.dart';
import '../../../models/owner_model.dart';
import '../../../models/post_model.dart';
import '../../../models/productmodel.dart';
import '../../../models/user_model.dart';
import '../../../modules/chats_screen/chat_screen.dart';
import '../../../modules/community_screen/community_screen.dart';
import '../../../modules/owner-screen/OwnerCommunityScreen.dart';
import '../../../modules/owner-screen/OwnerSettingScreen.dart';
import '../../../modules/owner-screen/owner_chat_screen/chat_home_screen.dart';
import '../../../modules/owner-screen/owner_home_screen/owner_home_screen.dart';
import '../../../modules/owner-screen/owner_profile_screen/owner_profile_screen.dart';
import '../../../modules/profile_screen/profile_screen.dart';
import '../../../shared/component/constants.dart';
import '../../../shared/styles/icon_broken.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class OwnerCubit extends Cubit<OwnerState> {
  OwnerCubit() : super(OwnerInitialState());

  static OwnerCubit get(context) => BlocProvider.of(context);

    OwnerModel? ownerModel;

  void getOwnerData() {
    // emit(GetOwnerLoadingState());

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .snapshots()
        .listen((value) {
      ownerModel = OwnerModel.fromJson(value.data()!);
      print(ownerModel!.image);
      print(ownerModel!.studName);
      print(ownerModel!.ownerName);
      print(ownerModel!.oId);
      print(ownerModel!.cover);
      print(ownerModel!.bio);
      print(ownerModel!.phone);
      // emit(GetOwnerSuccessfulState());
    });
  }

  int currentIndex = 0;
  List<Widget> ownerScreens = [
    OwnerHomeScreen(),
    OwnerCommunityScreen(),
    OwnerChatsScreen(),
    OwnerSettingsScreen(),
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
    if(index==2)
      getAllUsers();
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
  String? sectionValueChoose;

  void onChangeSectionDropDownButton(newValue) {
    sectionValueChoose = newValue;
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
  String? DayValueChoose;

  void onChangeDayDropDownButton(newValue) {
    DayValueChoose = newValue;
    emit(DropDownButtonState());
  }

  String? MonthsValueChoose;

  void onChangeMonthsDropDownButton(newValue) {
    MonthsValueChoose = newValue;
    emit(DropDownButtonState());
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
    required String fatherName1,
    required String fatherName2,
    required String motherName,
    required String motherName1,
    required String motherName2,
    required String sectionName,
    required String boxNum,
    required String owner,
    required String dateTime,
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
            fatherName1: fatherName1,
            fatherName2: fatherName2,
            motherName: motherName,
            motherName1: motherName1,
            motherName2: motherName2,
            sectionName: sectionName,
            boxNum: boxNum,
            dateTime: dateTime,
            initPrice: initPrice,
            microshipCode: microshipCode,
            type: type,
            owner: owner,
            color: color,
            gander: gander);
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
    required String fatherName1,
    required String fatherName2,
    required String motherName,
    required String motherName1,
    required String motherName2,
    required String sectionName,
    required String boxNum,
    required String owner,
    required String initPrice,
    required String dateTime,
    required String microshipCode,
    required String type,
    required String color,
    required String gander,
  }) {

    addTypeCollection(sectionName);
    emit(CreateHorseLoadingState());
    HorseModel model = HorseModel(
        horseName: horseName,
        horseImage: horseImage,
        fatherName: fatherName,
        fatherName1: fatherName1,
        fatherName2: fatherName2,
        motherName: motherName,
        motherName1: motherName1,
        motherName2: motherName2,
        sectionName: sectionName,
        boxNum: boxNum,
        owner: owner,
        type: type,
        birthDate: dateTime,
        initPrice: initPrice,
        microshipCode: microshipCode,
        color: color,
        gander: gander);

    print(sectionName);
    print(oId);
    print(microshipCode);
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .collection('sections')
        .doc(sectionName)
        .collection('horses')
        .doc(microshipCode)
        .set(model.toMap())
        .then((value) {

      createHorseCollection(horseName: horseName,
          horseImage: horseImage,
          fatherName: fatherName,
          fatherName1: fatherName1,
          fatherName2: fatherName2,
          motherName: motherName,
          motherName1: motherName1,
          motherName2: motherName2,
          sectionName: sectionName,
          boxNum: boxNum,
          dateTime: dateTime,
          initPrice: initPrice,
          microshipCode: microshipCode,
          type: type,
          owner: owner,
          color: color,
          gander: gander);
      emit(CreateHorseSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateHorseErrorState(error.toString()));
    });
  }


  void createHorseCollection({
    required String horseName,
    required String horseImage,
    required String fatherName,
    required String fatherName1,
    required String fatherName2,
    required String motherName,
    required String motherName1,
    required String motherName2,
    required String sectionName,
    required String boxNum,
    required String owner,
    required String initPrice,
    required String dateTime,
    required String microshipCode,
    required String type,
    required String color,
    required String gander,

}){
    HorseModel model = HorseModel(
        horseName: horseName,
        horseImage: horseImage,
        fatherName: fatherName,
        fatherName1: fatherName1,
        fatherName2: fatherName2,
        motherName: motherName,
        motherName1: motherName1,
        motherName2: motherName2,
        sectionName: sectionName,
        boxNum: boxNum,
        owner: owner,
        type: type,
        birthDate: dateTime,
        initPrice: initPrice,
        microshipCode: microshipCode,
        color: color,
        gander: gander);

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .collection('horses')
        .doc(microshipCode)
         .set(model.toMap())
         .then((value) {
           emit(CreateHorsesCollectionSuccessfulState());
    }).catchError((error){

      emit(CreateHorsesCollectionErrorState(error.toString()));
    });


  }

  void addTypeCollection(String section){

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .doc('$section').set({
      'name':section,
      'secId':section
    })
        .then((value) {
      emit(AddCollectionSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(AddCollectionErrorState(error.toString()));
    });


  }
  int index = 0;
  List<HorseModel> horses = [];
  List<String> horsesId = [];



  String? valueChooseType;

  void dropDownButtonType(newValue) {
    valueChooseType = newValue.toString();
    emit(DropDownButtonState());
  }





  File? AccomImage;



  Future<void> getAccomImage() async {
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      AccomImage = File(pickedFile.path);
      emit(AccomImageSuccessState());
    } else {
      print('No image selected');
      emit(AccomImageErrorState());
    }
  }

  void uploadAccomImage({
    required String type,
    required String Price,
    required String info,
    required String address,
    required String phone,
  }) {
    emit(CreateAccomLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Accomendation/${Uri.file(AccomImage!.path).pathSegments.last}')
        .putFile(AccomImage!)
        .then((value) {
      print(value);
      value.ref.getDownloadURL().then((value) {
        createAccom(
          AccomImage: value,
          type: type,
          Price: Price,
          info: info,
          address: address,
          phone: phone,
        );
      }).catchError((error) {
        print(error.toString());
        emit(CreateAccomErrorState(error.toString()));
      });
    }).catchError((error) {
      print(error.toString());
      emit(CreateAccomErrorState(error.toString()));
    });
  }

  void createAccom({
    required String AccomImage,
    required String type,
    required String Price,
    required String info,
    required String address,

    required String phone,
  }) {
    emit(CreateAccomLoadingState());
    AccomModel model = AccomModel(
      AccomImage: AccomImage,
      type: type,
      Price: Price,
      info: info,
      address: address,

      phone: phone,
    );

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('Accomendation')
        .add(model.toMap())
        .then((value) {
          addAccomCollection(
              AccomImage: AccomImage,
              type: type,
              Price: Price,
              info: info,
              address: address,
              phone: phone);
      emit(CreateAccomSuccessState());

    }).catchError((error) {
      print(error.toString());
      emit(CreateAccomErrorState(error.toString()));
    });
  }

  void addAccomCollection({
    required String AccomImage,
    required String type,
    required String Price,
    required String info,
    required String address,

    required String phone,
}){
    AccomModel model = AccomModel(
      AccomImage: AccomImage,
      type: type,
      Price: Price,
      info: info,
      address: address,
      phone: phone,
      accomCreatorId: ownerModel!.oId,
      accomCreatorName: ownerModel!.studName
    );
    FirebaseFirestore.instance
        .collection('Accomendations')
        .add(model.toMap())
        .then((value) {

          emit(CreateAccomCollectionSuccessState());
    }).catchError((error){

      emit(CreateAccomCollectionErrorState(error.toString()));
    });
  }

  void docRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String section
  }) {
    emit(DocRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      docCreate(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
        section: section
      );
      addDoc(
          name: name,
          email: email,
          phone: phone,
          dId: value.user!.uid,
          section: section);
    }).catchError((error) {
      print(error.toString());
      emit(DocRegisterErrorState(error.toString()));
    });
  }

  void docCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required String section,

  }) {
    UserModel model = UserModel(
        name: name,
        email: email,
        uId: uId,
        image:
        'https://rcmi.fiu.edu/wp-content/uploads/sites/30/2018/02/no_user.png',
        bio: 'write your bio',
        cover: '',
        phone: phone,
        status: 3,
      oId: oId,
      section: section
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateDocSuccessState());
    }).catchError((error) {
      emit(CreateDocErrorState(error.toString()));
    });
  }


  void addDoc({
    required String name,
    required String email,
    required String phone,
    required String dId,
    required String section
}){


    DoctorModel doctorModel=DoctorModel(
        name: name,
        email: email,
        phone: phone,
        ssn: '',
        image: '',
        oId: oId!,
        dId: dId,
      section:section,
      address: '',
      bio: userModel!.bio,
      cover: userModel!.cover
    );
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .collection('sections')
        .doc(section)
     .collection('doctor').doc(dId)
    .set(doctorModel.toMap()).then((value) {
      emit(AddDocSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(AddDocErrorState(error.toString()));

    });

  }

  Future signOut({required context})async{

    await FirebaseAuth.instance.signOut().then((value) {
      navigateTo(context, LoginScreen());
      emit(SignOutSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(SignOutErrorState(error.toString()));
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
    emit(CreatePostLoadingState());
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
        emit(CreatePostErrorState());
      });
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    PostModel models = PostModel(
        name: ownerModel!.studName,
        uId: ownerModel!.oId,
        image: ownerModel!.image,
        dateTime: dateTime,
        text: text,
        postImage: postImage ?? '');
    FirebaseFirestore.instance
        .collection('posts')
        .add(models.toMap())
        .then((value) {
      emit(CreatePostSuccessState());
    }).catchError((error) {
      emit(CreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getAllPosts() {
    FirebaseFirestore.instance.collection('posts').snapshots().listen((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error) {});
      });
      // emit(GetPostsSuccessfulState());
    });
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
    required String name,
    required String phone,
    required String bio,
    required context
  }) {
    emit(OwnerUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('owners/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadProfileImageSuccessState());
        updateOwner(studName: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
    required context
  }) {
    emit(OwnerUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('owners/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadCoverImageSuccessState());
        updateOwner(studName: name, phone: phone, bio: bio, cover: value);
        print(value);
      }).catchError((error) {
        emit(UploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(UploadCoverImageErrorState());
    });
  }

  void updateOwner({
    required String studName,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    OwnerModel models = OwnerModel(
        studName: studName,
        oId: oId!,
        phone: phone,
        bio: bio,
        image: image ?? ownerModel!.image,
        cover: cover ?? ownerModel!.cover,
        address:  ownerModel!.address,
        ownerName: ownerModel!.ownerName);
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .update(models.toMap())
        .then((value) {
      getOwnerData();
    }).catchError((error) {
      emit(OwnerUpdateErrorState());
    });
  }



  UserModel? userModel;
  void getUserData(){
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(oId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessfulState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }

  List<UserModel> users = [];
  void getAllUsers() {
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {

        emit(GetAllUserSuccessfulState());
        value.docs.forEach((element) {
          if (element.data()['uId'] != ownerModel!.oId)
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
        senderId: oId,
        receiverId: receiverId,
        text: text);

    FirebaseFirestore.instance
        .collection('users')
        .doc(oId!)
        .collection('chats')
        .doc(receiverId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(OwnerSendMessageSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(OwnerSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(oId)
        .collection('message')
        .add(model.toMap())
        .then((value) {
      emit(OwnerSendMessageSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(OwnerSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(oId)
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
      print(messages.length);
      emit(GetMessageSuccessfulState());

    });
  }



  List<SectionDataModel> sectionData=[];
  void getSectionsData(){

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .snapshots()
        .listen((value) {
      value.docs.forEach((element){
        sectionData.add(SectionDataModel.fromJson(element.data()));
      });

       // emit(GetSectionsDataSuccessfulStates());
       print(sectionData.length);
    });





  }

  List<DoctorModel> docData=[];
  void getDoctors({
  required String secId
}){

    docData=[];
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .doc(secId)
        .collection('doctor')
        .get()
        .then((value) {
      value.docs.forEach((element){
        docData.add(DoctorModel.fromJson(element.data()));
      });
      emit(GetSectionsDoctorsDataSuccessfulStates());
      print(docData.length);
    }).catchError((error){
      print(error.toString());
      emit(GetSectionsDoctorsDataErrorStates(error.toString()));
    });

  }
  List<HorseModel> horseData=[];
  void getHorses({required String secId}){
    horseData=[];
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .doc(secId)
    .collection('horses')
        .snapshots()
        .listen((value) {
      value.docs.forEach((element) {
        horseData.add(HorseModel.fromJson(element.data()));
      });
      emit(GetHorsesSecDataSuccessState());

    });

  }

HorseModel? horseModel;
  void getHorseDetailsData({
    required horseId,
    required secId

}){
    print(oId);
    print("sec:${userModel!.section}");
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .doc(secId)
        .collection('horses')
        .doc(horseId)
        .get()
        .then((value) {
          horseModel=HorseModel.fromJson(value.data()!);
          emit(GetHorsesDetailsSuccessfulState());
    })
        .catchError((error){

          print(error.toString());
      emit(GetHorsesDetailsErrorState(error.toString()));
    });



  }

  void deleteHorse({
  required String secId,
    required horseId,
}){
    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .doc(secId)
        .collection('horses')
        .doc(horseId).delete().then((value) {

          emit(DeleteHorseSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(DeleteHorseErrorState(error.toString()));
    });

  }

  Future<void> saveProduct(ProductData productData)async{

    emit(SendProductLoadingState());
    await FirebaseFirestore.instance
         .collection('owners')
         .doc(oId!)
        .collection('Ingredients')
        .doc()
        .set(productData.toMap())
        .then((value){
      emit(SendProductSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(SendProductErrorState(error.toString()));

    });
  }
  Stream<List<ProductData>>? getProducts(){
    return FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .collection('Ingredients')
        .snapshots()
        .map((snapShot){
      return snapShot.docs.map((docs){

        return ProductData.fromJson(docs.data());

      }).toList();

    });

  }



  bool shouldCheck = false;

  void Check_Box(val) {
    shouldCheck = val;
    emit(CheckBoxx());
  }
}
