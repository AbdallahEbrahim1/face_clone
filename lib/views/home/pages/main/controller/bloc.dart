import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_clone/components/image_picker.dart';
import 'package:face_clone/models/story_data_model.dart';
import 'package:face_clone/views/home/pages/main/controller/model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'states.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostState()) {
    on<AddPostEvent>(addPost);
    on<GetPostsEvent>(getPost);
    on<DeletePostsEvent>(deletePost);
    on<AddPhotoEvent>(uploadPhoto);
    on<AddStoryEvent>(addStory);
    on<GetStoryEvent>(getStory);
  }

  AppAlert appAlert = AppAlert.init;
  File? imageFile;
  String? imageName;

  void onSubmit(File imageFile, String imageName) {
    imageFile = imageFile;
    this.imageName = imageName;
  }

  Future getPost(GetPostsEvent event, Emitter<PostState> emit) async {
    emit(GetPostsLoadingState());
    try {
      List<PostDataModel> posts = [];
      final response =
          await FirebaseFirestore.instance.collection("posts").get();
      if (response.docs.isNotEmpty) {
        for (int i = 0; i < response.docs.length; i++) {
          posts.add(PostDataModel.fromJson(
              response.docs[i].data(), response.docs[i].id));
        }
      }
      emit(GetPostsSuccessState(
        msg: "Post added successfully",
        list: posts,
      ));
    } on FirebaseException catch (e) {
      emit(GetPostsErrorState(msg: e.code));
    }
  }

  Future addPost(AddPostEvent event, Emitter<PostState> emit) async {
    emit(AddPostsLoadingState());
    try {
      final response =
          await FirebaseFirestore.instance.collection("posts").add({
        "userName": event.userName,
        "userImageUrl": event.userImageUrl,
        "caption": event.caption,
        "timeAgo": event.timeAgo,
        "imageUrl": event.imageUrl,
        "likes": event.likes,
        "shares": event.shares,
        "comments": event.comments
      });
      emit(AddPostsSuccessState(
        msg: "Post added successfully",
      ));
    } on FirebaseException catch (e) {
      emit(AddPostsErrorState(msg: e.code));
    }
  }

  Future deletePost(DeletePostsEvent event, Emitter<PostState> emit) async {
    emit(DeletePostsLoadingState());
    try {
      final response = await FirebaseFirestore.instance
          .collection("posts")
          .doc(event.id)
          .delete();
      emit(DeletePostsSuccessState());
    } on FirebaseException catch (e) {
      emit(DeletePostsErrorState());
    }
  }

  Future uploadPhoto(AddPhotoEvent event, Emitter<PostState> emit) async {
    emit(ImagePickedLoadingState());
    try {
      final response = await FirebaseStorage.instance
          .ref()
          .child("${DateTime.now()} $imageName");
      await response.putFile(imageFile!);
      final url = await response.getDownloadURL();
      emit(ImagePickedSuccessState(url: url));
    } on FirebaseException catch (e) {
      emit(ImagePickedErrorState());
    }
  }

  Future addStory(AddStoryEvent event, Emitter<PostState> emit) async {
    emit(AddStoryLoadingState());
    try {
      final response =
          await FirebaseFirestore.instance.collection("story").add({
        "userName": event.userNameStory,
        "userImageUrl": event.userImageUrlStory,
        "imageUrl": event.imageUrl,
      });
      emit(AddStorySuccessState(
        msg: "Story added successfully",
      ));
    } on FirebaseException catch (e) {
      emit(AddStoryErrorState(msg: e.code));
    }
  }

  Future getStory(GetStoryEvent event, Emitter<PostState> emit) async {
    emit(GetPostsLoadingState());
    try {
      List<StoryDataModel> story = [];
      final response =
          await FirebaseFirestore.instance.collection("story").get();
      if (response.docs.isNotEmpty) {
        for (int i = 0; i < response.docs.length; i++) {
          story.add(StoryDataModel.fromJson(
              response.docs[i].data(), response.docs[i].id));
        }
      }
      emit(GetStorySuccessState(
        msg: "Story added successfully",
        list: story,
      ));
    } on FirebaseException catch (e) {
      emit(GetStoryErrorState(msg: e.code));
    }
  }
}
