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

class GetHorsesDetailsSuccessfulState extends OwnerState{}

class GetHorsesDetailsErrorState extends OwnerState{
  final String error;

  GetHorsesDetailsErrorState(this.error);


}
class DropDownButtonState extends OwnerState{}
