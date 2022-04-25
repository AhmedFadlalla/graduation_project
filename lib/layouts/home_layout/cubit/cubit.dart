
import 'dart:io';



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/models/owner_model.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/cubit/cubit.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/home_layout/cubit/states.dart';
import 'package:graduation_project/models/post_model.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/modules/chats_screen/chat_screen.dart';
import 'package:graduation_project/modules/community_screen/community_screen.dart';
import 'package:graduation_project/modules/home_screen/home_screen.dart';
import 'package:graduation_project/modules/profile_screen/profile_screen.dart';
import 'package:graduation_project/shared/styles/icon_broken.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../models/Message_model.dart';
import '../../../modules/owner-screen/owner_home_screen/owner_home_screen.dart';
import '../../../shared/component/constants.dart';


class HorseCubit extends Cubit<HorseStates> {
  HorseCubit() : super(HorseInitialState());

  static HorseCubit get(context) => BlocProvider.of(context);

   UserModel? userModel;

  void getUserData() {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessfulState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    // CommunityScreen(),
    ChatsScreen(),
    // ProfileScreen(),
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
    emit(HorseChangeBottomNavState());
  }


  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      print('No image selected');
      emit(ProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(CoverImagePickedSuccessState());
    } else {
      print('No image selected');
      emit(CoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
    required context
  }) {
    emit(UserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadProfileImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, image: value, context: context);
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
    emit(UserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadCoverImageSuccessState());
        updateUser(name: name, phone: phone, bio: bio, cover: value, context: context);
        print(value);
      }).catchError((error) {
        emit(CoverImagePickedErrorState());
      });
    }).catchError((error) {
      emit(CoverImagePickedErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
    required context,
  }) {
    UserModel models = UserModel(
        name: name,
        email: userModel!.email,
        uId: userModel!.uId,
        phone: phone,
        bio: bio,
        image: image ?? userModel!.image,
        cover: cover ?? userModel!.cover, status: LoginCubit.get(context).status!);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(models.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UserUpdateErrorState());
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
        name: userModel!.name,
        uId: userModel!.uId,
        image: userModel!.image,
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


  File? ownerImage;

  Future<void> getOwnerImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ownerImage = File(pickedFile.path);
      emit(OwnerImageSuccessState());
    } else {
      print('No image selected');
      emit(OwnerImageErrorState());
    }
  }
  void uploadOwnerImage({
    required String studName,
    required String address,

  }) {
    emit(CreateOwnerLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('owner/${Uri
        .file(ownerImage!.path)
        .pathSegments
        .last}')
        .putFile(ownerImage!)
        .then((value) {
      print(value);
      value.ref.getDownloadURL().then((value) {
        createOwner(
            studName: studName,
            address: address,
            image: value);



      }).catchError((error) {
        print(error.toString());
        emit(CreateOwnerErrorState(error.toString()));
      });
    }).catchError((error) {
      print(error.toString());
      emit(CreateOwnerErrorState(error.toString()));
    });
  }
   OwnerModel? ownerModel;
  void getOwnerData()  {
    emit(GetOwnerLoadingState());

    FirebaseFirestore.instance.collection('owners').doc(ownerModel!.oId).get().then((value) {
      ownerModel = OwnerModel.fromJson(value.data()!);
      emit(GetOwnerSuccessfulState());
    }).catchError((error) {
      emit(GetOwnerErrorState(error.toString()));
    });
  }
  void createOwner({
    required String studName,
    required String address,
    required String image,
  }) {
    OwnerModel model = OwnerModel(
        studName: studName,
        ownerName: userModel!.name,
        oId: '00' +uId! ,
        phone: userModel!.phone,
        address: address,
        image: image,
      cover: userModel!.cover,
      bio: userModel!.bio
    );
    emit(CreateOwnerLoadingState());
    FirebaseFirestore.instance
        .collection('owners')
        .doc('00' + uId!)
        .set(model.toMap())
        .then((value) {
      emit(CreateOwnerSuccessState('00' + uId!));
    }).catchError((error) {
      print(error.toString());
      emit(CreateOwnerErrorState(error.toString()));
    });
  }

  void makeOwner(){
    UserModel model = UserModel(
        name: userModel!.name,
        email: userModel!.email,
        uId: userModel!.uId,
        image:
        'https://rcmi.fiu.edu/wp-content/uploads/sites/30/2018/02/no_user.png',
        bio: 'write your bio',
        phone: userModel!.phone,
        cover: '',
        status:2

    );
    FirebaseFirestore.instance.collection('users')
        .doc(uId).update(model.toMap())
        .then((value) {


      emit(MakeOwnerSuccessState());

    })
        .catchError((error){
      emit(MakeOwnerErrorState(error.toString()));
    });

  }


  List<UserModel> users = [];

  void getAllUsers() {
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        emit(GetAllUsersSuccessState());
        value.docs.forEach((element) {
          if (element.data()['uId'] != userModel!.uId)
            users.add(UserModel.fromJson(element.data()));
        });
      }).catchError((error) {
        print(error.toString());
        emit(GetAllUsersErrorState(error.toString()));
      });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: userModel?.uId,
      receiverId: receiverId,
      dateTime: dateTime,
    );

    // set my chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });

    // set receiver chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];

      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(GetMessagesSuccessState());
    });
  }







}







