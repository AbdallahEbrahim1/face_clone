part of 'bloc.dart';

class PostState {}

class AddPostsLoadingState extends PostState {}

class AddPostsSuccessState extends PostState {
  String msg;

  AddPostsSuccessState({
    required this.msg,
  });
}

class AddPostsErrorState extends PostState {
  String msg;

  AddPostsErrorState({required this.msg});
}

class GetPostsLoadingState extends PostState {}

class GetPostsSuccessState extends PostState {
  List<PostDataModel> list;
  String msg;

  GetPostsSuccessState({
    required this.msg,
    required this.list,
  });
}

class GetPostsErrorState extends PostState {
  String msg;

  GetPostsErrorState({required this.msg});
}

class DeletePostsLoadingState extends PostState {}

class DeletePostsSuccessState extends PostState {}

class DeletePostsErrorState extends PostState {}

class ImagePickedLoadingState extends PostState {}

class ImagePickedSuccessState extends PostState {
  final String url;
  ImagePickedSuccessState({required this.url});
}

class ImagePickedErrorState extends PostState {}

class AddStoryLoadingState extends PostState {}

class AddStorySuccessState extends PostState {
  String msg;

  AddStorySuccessState({
    required this.msg,
  });
}

class AddStoryErrorState extends PostState {
  String msg;

  AddStoryErrorState({required this.msg});
}

class GetStoryLoadingState extends PostState {}

class GetStorySuccessState extends PostState {
  List<StoryDataModel> list;
  String msg;

  GetStorySuccessState({
    required this.msg,
    required this.list,
  });
}

class GetStoryErrorState extends PostState {
  String msg;

  GetStoryErrorState({required this.msg});
}
