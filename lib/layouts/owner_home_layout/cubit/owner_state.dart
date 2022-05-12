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

class   AddDocSuccessState extends OwnerState{
}
class AddDocErrorState extends OwnerState{
  final String error;
  AddDocErrorState(this.error);
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

class  ProfileImageSuccessState extends OwnerState{}
class  ProfileImageErrorState extends OwnerState{}
class  CoverImageSuccessState extends OwnerState{}
class  CoverImageErrorState extends OwnerState{}


class  UploadProfileImageSuccessState extends OwnerState{}
class  UploadProfileImageErrorState extends OwnerState{}

class  UploadCoverImageSuccessState extends OwnerState{}
class  UploadCoverImageErrorState extends OwnerState{}

class  OwnerUpdateLoadingState extends OwnerState{}
class  OwnerUpdateErrorState extends OwnerState{}

class GetAllUserSuccessfulState extends OwnerState{}
class GetAllUserErrorState extends OwnerState{
  final String error;
  GetAllUserErrorState(this.error);
}

class SendMessageSuccessfulState extends OwnerState{}
class SendMessageErrorState extends OwnerState{}


class GetMessageSuccessfulState extends OwnerState{}
class GetUserLoadingState extends OwnerState{}
class GetUserSuccessfulState extends OwnerState{}

class GetUserErrorState extends OwnerState{
  final String error;

  GetUserErrorState(this.error);


}
class SignOutSuccessfulState extends OwnerState{}

class SignOutErrorState extends OwnerState{
  final String error;

  SignOutErrorState(this.error);


}
class GetSectionsDataSuccessfulStates extends OwnerState{}
class GetSectionsDataErrorStates extends OwnerState{
  final String error;
  GetSectionsDataErrorStates(this.error);

}

class GetSectionsDoctorsDataSuccessfulStates extends OwnerState{}
class GetSectionsDoctorsDataErrorStates extends OwnerState{
  final String error;
  GetSectionsDoctorsDataErrorStates(this.error);

}