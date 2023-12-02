part of 'bloc.dart';

class PostEvent {}

class GetPostsEvent extends PostEvent {}

class AddPostEvent extends PostEvent {
  final String userName,
      userImageUrl,
      caption,
      timeAgo,
      imageUrl,
      likes,
      shares,
      comments;

  AddPostEvent(
      {required this.userName,
      required this.userImageUrl,
      required this.caption,
      required this.timeAgo,
      required this.imageUrl,
      required this.likes,
      required this.shares,
      required this.comments});
}

class DeletePostsEvent extends PostEvent {
  final String id;

  DeletePostsEvent({required this.id});
}

class AddPhotoEvent extends PostEvent {
  final File image;
  final String imageName;

  AddPhotoEvent({required this.image, required this.imageName});
}

class AddStoryEvent extends PostEvent {
  final String userNameStory, userImageUrlStory, imageUrl;

  AddStoryEvent({
    required this.userNameStory,
    required this.userImageUrlStory,
    required this.imageUrl,
  });
}

class GetStoryEvent extends PostEvent {}
