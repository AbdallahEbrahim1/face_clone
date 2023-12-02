import 'package:face_clone/components/constants.dart';
import 'package:face_clone/views/home/pages/main/controller/bloc.dart';
import 'package:face_clone/views/home/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final bloc = KiwiContainer().resolve<PostBloc>();
  bool isClicked = false;
  String? imageUrl;

  TextEditingController postTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create post',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Form(
          key: formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: postTextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'post body must not be empty';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.text,
                  maxLines: null,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What\'s in your mind?',
                  ),
                ),
              ),
              BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is ImagePickedLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ImagePickedSuccessState) {
                    imageUrl = state.url;
                    return Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          15.0.r,
                        ),
                      ),
                      child: Image.network(
                        state.url,
                        width: double.infinity,
                        height: 230.0.h,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else if (state is ImagePickedErrorState) {
                    return const Text('error');
                  }
                  return const SizedBox.shrink();
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        bloc.appAlert
                            .imagePickerDialog(
                          context: context,
                          onSubmit: (file, name) {
                            bloc.imageFile = file;
                            bloc.imageName = name;
                          },
                        )
                            .then((value) {
                          setState(() {});
                          bloc.add(AddPhotoEvent(
                              image: bloc.imageFile!,
                              imageName: bloc.imageName!));
                        });
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                          ),
                          Text(
                            'Add photo',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 42.0.h,
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(
                    15.0.r,
                  ),
                ),
                child: MaterialButton(
                  height: 42.0.h,
                  onPressed: () {
                    bloc.add(
                      AddPostEvent(
                        userName: "Abdallah",
                        userImageUrl: imageUrl ??
                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        caption: postTextController.text,
                        timeAgo: DateTime.now().toString(),
                        imageUrl: imageUrl ?? "",
                        likes: "0",
                        shares: "0",
                        comments: "0",
                      ),
                    );
                    navigateAndFinish(context, HomeView());
                  },
                  child: isClicked
                      ? const CupertinoActivityIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
