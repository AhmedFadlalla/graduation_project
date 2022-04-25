import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/models/horse_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/accom_model.dart';
import '../../../models/owner_model.dart';
import '../../../models/post_model.dart';
import '../../../models/user_model.dart';
import '../../../modules/chats_screen/chat_screen.dart';
import '../../../modules/community_screen/community_screen.dart';
import '../../../modules/owner-screen/OwnerCommunityScreen.dart';
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
    emit(GetOwnerLoadingState());

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId!)
        .get()
        .then((value) {
      ownerModel = OwnerModel.fromJson(value.data()!);
      print(ownerModel!.image);
      print(ownerModel!.studName);
      print(ownerModel!.ownerName);
      print(ownerModel!.oId);
      print(ownerModel!.cover);
      print(ownerModel!.bio);
      print(ownerModel!.phone);
      emit(GetOwnerSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetOwnerErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> ownerScreens = [
    OwnerHomeScreen(),
    OwnerCommunityScreen(),
    ChatsScreen(),
    OwnerProfileScreen(),
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
    required String sectionNum,
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
            sectionNum: sectionNum,
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
    required String sectionNum,
    required String boxNum,
    required String owner,
    required String initPrice,
    required String dateTime,
    required String microshipCode,
    required String type,
    required String color,
    required String gander,
  }) {
    addTypeCollection(type);
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
        sectionNum: sectionNum,
        boxNum: boxNum,
        owner: owner,
        birthDate: dateTime,
        initPrice: initPrice,
        microshipCode: microshipCode,
        color: color,
        gander: gander);

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
         .doc('$type'+'1')
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


  void addTypeCollection(String type){

    FirebaseFirestore.instance
        .collection('owners')
        .doc(oId)
        .collection('sections')
        .doc('$type'+'1').set({
      'name':type,
      'secId':type+'1'
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

  getHorseDetails(
     String horseId,
  ) {
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

  String? sectionValueChoose;

  void dropDownButtonSection(newValue) {
    sectionValueChoose = newValue.toString();
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
      emit(CreateAccomSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateAccomErrorState(error.toString()));
    });
  }


  void docRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
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
      );
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
        status: 3);

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

  Future signOut()async{
    try{
      return await FirebaseAuth.instance.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }

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
        name: ownerModel!.ownerName,
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


  File? profileImage;


  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImageSuccessState());
    } else {
      print('No image selected');
      emit(SocialProfileImageErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImageSuccessState());
    } else {
      print('No image selected');
      emit(SocialCoverImageErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadProfileImageSuccessState());
        updateUser(studName: name, phone: phone, bio: bio, image: value);
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadCoverImageSuccessState());
        updateUser(studName: name, phone: phone, bio: bio, cover: value);
        print(value);
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  void updateUser({
    required String studName,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    OwnerModel models = OwnerModel(
        studName: studName,
        oId: ownerModel!.oId,
        phone: phone,
        bio: bio,
        image: image ?? ownerModel!.image,
        cover: cover ?? ownerModel!.cover,
        address:  ownerModel!.address,
        ownerName: ownerModel!.ownerName);
    FirebaseFirestore.instance
        .collection('owner')
        .doc(ownerModel!.oId)
        .update(models.toMap())
        .then((value) {
      getOwnerData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }


}
