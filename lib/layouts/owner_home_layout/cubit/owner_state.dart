abstract class OwnerState{}


class OwnerInitialState extends OwnerState{}

class GetOwnerLoadingState extends OwnerState{}
class GetOwnerSuccessfulState extends OwnerState{}

class GetOwnerErrorState extends OwnerState{
  final String error;

  GetOwnerErrorState(this.error);


}
class OwnerChangeBottomNavState extends OwnerState{}

class DatePickedSuccessfulState extends OwnerState{}

class HorseImageSuccessState extends OwnerState{}
class HorseImageErrorState extends OwnerState{}

class CreateHorseLoadingState extends OwnerState{}
class CreateHorseSuccessState extends OwnerState{}
class CreateHorseErrorState extends OwnerState{
  final String error;

  CreateHorseErrorState(this.error);

}

class GetHorsesLoadingState extends OwnerState{}
class GetHorsesSuccessfulState extends OwnerState{}

class GetHorsesErrorState extends OwnerState{
  final String error;

  GetHorsesErrorState(this.error);


}
class AddCollectionSuccessfulState extends OwnerState{}
class AddCollectionErrorState extends OwnerState{
  final String error;

  AddCollectionErrorState(this.error);

}

class GetHorsesDetailsSuccessfulState extends OwnerState{}

class GetHorsesDetailsErrorState extends OwnerState{
  final String error;

  GetHorsesDetailsErrorState(this.error);


}
class DropDownButtonState extends OwnerState{}

class CreateAccomLoadingState extends OwnerState{}
class CreateAccomSuccessState extends OwnerState{}
class CreateAccomErrorState extends OwnerState{
  final String error;

  CreateAccomErrorState(this.error);

}

class AccomImageSuccessState extends OwnerState{}
class AccomImageErrorState extends OwnerState{}

class DocRegisterLoadingState extends OwnerState{}
class DocRegisterSuccessState extends OwnerState{
}
class DocRegisterErrorState extends OwnerState{
  final String error;
  DocRegisterErrorState(this.error);
}

class   CreateDocSuccessState extends OwnerState{
}
class CreateDocErrorState extends OwnerState{
  final String error;
  CreateDocErrorState(this.error);
}

class CreatePostLoadingState extends OwnerState{}
class CreatePostSuccessState extends OwnerState{}
class CreatePostErrorState extends OwnerState{}

class PostImageSuccessState extends OwnerState{}
class PostImageErrorState extends OwnerState{}

class RemovePostImageState extends OwnerState{}

class GetPostsLoadingState extends OwnerState{}
class GetPostsSuccessfulState extends OwnerState{}
class GetPostsErrorState extends OwnerState{
  final String error;
  GetPostsErrorState(this.error);
}

class  SocialProfileImageSuccessState extends OwnerState{}
class  SocialProfileImageErrorState extends OwnerState{}
class  SocialCoverImageSuccessState extends OwnerState{}
class  SocialCoverImageErrorState extends OwnerState{}


class  SocialUploadProfileImageSuccessState extends OwnerState{}
class  SocialUploadProfileImageErrorState extends OwnerState{}

class  SocialUploadCoverImageSuccessState extends OwnerState{}
class  SocialUploadCoverImageErrorState extends OwnerState{}

class  SocialUserUpdateLoadingState extends OwnerState{}
class  SocialUserUpdateErrorState extends OwnerState{}
