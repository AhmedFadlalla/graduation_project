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







