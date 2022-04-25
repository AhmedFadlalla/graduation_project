abstract class HorseStates{}

class HorseInitialState extends HorseStates{}


class HorseChangeBottomNavState extends HorseStates{}

class GetUserLoadingState extends HorseStates{}
class GetUserSuccessfulState extends HorseStates{}

class GetUserErrorState extends HorseStates{
  final String error;

  GetUserErrorState(this.error);


}

class CreatePostLoadingState extends HorseStates{}
class CreatePostSuccessState extends HorseStates{}
class CreatePostErrorState extends HorseStates{}

class PostImageSuccessState extends HorseStates{}
class PostImageErrorState extends HorseStates{}

class RemovePostImageState extends HorseStates{}

class GetPostsLoadingState extends HorseStates{}
class GetPostsSuccessfulState extends HorseStates{}
  class GetPostsErrorState extends HorseStates{
  final String error;
  GetPostsErrorState(this.error);
  }

class GetOwnerLoadingState extends HorseStates{}
class GetOwnerSuccessfulState extends HorseStates{}

class GetOwnerErrorState extends HorseStates{
  final String error;

  GetOwnerErrorState(this.error);


}
class  OwnerImageSuccessState extends HorseStates{}
class  OwnerImageErrorState extends HorseStates{}
class CreateOwnerLoadingState extends HorseStates{}
class CreateOwnerSuccessState extends HorseStates{
  final String oId;
  CreateOwnerSuccessState(this.oId);
}
class CreateOwnerErrorState extends HorseStates{
  final String error;
  CreateOwnerErrorState(this.error);
}

class MakeOwnerSuccessState extends HorseStates{

}
class MakeOwnerErrorState extends HorseStates{
  final String error;
  MakeOwnerErrorState(this.error);
}


class GetAllUsersLoadingState extends HorseStates {}

class GetAllUsersSuccessState extends HorseStates {}

class GetAllUsersErrorState extends HorseStates {
  final String error;

  GetAllUsersErrorState(this.error);
}

class SendMessageSuccessState extends HorseStates {}

class SendMessageErrorState extends HorseStates {}

class GetMessagesSuccessState extends HorseStates {}

class ProfileImagePickedSuccessState extends HorseStates {}

class ProfileImagePickedErrorState extends HorseStates {}

class CoverImagePickedSuccessState extends HorseStates {}

class CoverImagePickedErrorState extends HorseStates {}

class UploadProfileImageSuccessState extends HorseStates {}

class UploadProfileImageErrorState extends HorseStates {}

class UploadCoverImageSuccessState extends HorseStates {}

class UploadCoverImageErrorState extends HorseStates {}

class UserUpdateLoadingState extends HorseStates {}

class UserUpdateErrorState extends HorseStates {}


