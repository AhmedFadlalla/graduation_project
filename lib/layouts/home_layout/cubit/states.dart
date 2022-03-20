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