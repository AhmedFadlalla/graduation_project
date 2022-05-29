import 'package:graduation_project/layouts/doc_home_layout/Doctor_Cubit/doc_cubit.dart';

abstract class DoctorStates {}
///////////////////////////counter///////////////////////
class InitialState extends DoctorStates{}//1
class DropDownButtonState  extends DoctorStates{}
class CheckBoxx  extends DoctorStates{}

//class DatePickedSuccessfulState extends DoctorStates{}
//
class GetdataState extends DoctorStates{}

class OwnerChangeBottomNavState  extends DoctorStates{}

class SendRoshetSuccessState  extends DoctorStates{}
class SendRoshetErrorState  extends DoctorStates{
  String error;
  SendRoshetErrorState (this.error);
}
class GetRoshetSuccessState  extends DoctorStates{}
class GetRoshetErrorState  extends DoctorStates{
  String error;
  GetRoshetErrorState (this.error);
}
class GetDiseaseSuccessState  extends DoctorStates{}
class GetDiseaseErrorState  extends DoctorStates{
  String error;
  GetDiseaseErrorState (this.error);
}

class GetDocLoadingState extends DoctorStates{}
class GetDocSuccessfulState extends DoctorStates{}

class GetDocErrorState extends DoctorStates{
  final String error;

  GetDocErrorState(this.error);


}
class ChangeIndexSuccess extends DoctorStates{}
class  PickedDocImageSuccessState extends DoctorStates{}
class  PickedDocImageErrorState extends DoctorStates{}
class  UploadDocImageSuccessState extends DoctorStates{}
class  UploadDocImageErrorState extends DoctorStates{}

class UpdateDocDataLoadingState extends DoctorStates{}

class UpdateDocDataSuccessfulState extends DoctorStates{}
class UpdateDocDataErrorState extends DoctorStates{

  final String error;

  UpdateDocDataErrorState(this.error);
}
class GetDocFullDataLoadingState extends DoctorStates{}
class GetDocFullDataSuccessfulState extends DoctorStates{}

class GetDocFullDataErrorState extends DoctorStates{
  final String error;

  GetDocFullDataErrorState(this.error);


}
class GetHorsesDataLoadingState extends DoctorStates{}
class GetHorsesDataSuccessfulState extends DoctorStates{}

class GetHorsesDataErrorState extends DoctorStates{
  final String error;

  GetHorsesDataErrorState(this.error);


}
class SendHealthRecordLoadingState  extends DoctorStates{}
class SendHealthRecordSuccessState  extends DoctorStates{}
class SendHealthRecordErrorState  extends DoctorStates{
  String error;
  SendHealthRecordErrorState (this.error);
}
class GetHealthRecordLoadingState  extends DoctorStates{}
class GetHealthRecordSuccessState  extends DoctorStates{}
class GetHealthRecordErrorState  extends DoctorStates{
  String error;
  GetHealthRecordErrorState (this.error);
}


class  ProfileImageSuccessState extends DoctorStates{}
class  ProfileImageErrorState extends DoctorStates{}
class  CoverImageSuccessState extends DoctorStates{}
class  CoverImageErrorState extends DoctorStates{}  
class  UploadProfileImageSuccessState extends DoctorStates{}
class  UploadProfileImageErrorState extends DoctorStates{}

class  UploadCoverImageSuccessState extends DoctorStates{}
class  UploadCoverImageErrorState extends DoctorStates{}

class  DoctorUpdateLoadingState extends DoctorStates{}
class  DoctorUpdateErrorState extends DoctorStates{}

class DocCreatePostLoadingState extends DoctorStates{}
class DocCreatePostSuccessState extends DoctorStates{}
class DocCreatePostErrorState extends DoctorStates{}

class PostImageSuccessState extends DoctorStates{}
class PostImageErrorState extends DoctorStates{}

class RemovePostImageState extends DoctorStates{}

class GetPostsLoadingState extends DoctorStates{}
class GetPostsSuccessfulState extends DoctorStates{}
class GetPostsErrorState extends DoctorStates{
  final String error;
  GetPostsErrorState(this.error);
}


class GetAllUserSuccessfulState extends DoctorStates{}
class GetAllUserErrorState extends DoctorStates{
  final String error;
  GetAllUserErrorState(this.error);
}

class SendMessageSuccessfulState extends DoctorStates{}
class SendMessageErrorState extends DoctorStates{}


class GetMessageSuccessfulState extends DoctorStates{}
class GetUserLoadingState extends DoctorStates{}
class GetUserSuccessfulState extends DoctorStates{}

class GetUserErrorState extends DoctorStates{
  final String error;

  GetUserErrorState(this.error);


}
class SendAlekaSuccessState extends DoctorStates{}
class SendAlekaErrorState extends DoctorStates{
  final String error;

  SendAlekaErrorState(this.error);

}

class SendHorseFeedSuccessfulState extends DoctorStates{}

class SendHorseFeedErrorState extends DoctorStates{
  final String error;

  SendHorseFeedErrorState(this.error);


}






