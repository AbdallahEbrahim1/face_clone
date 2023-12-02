import 'package:face_clone/data/models/user_model.dart';
import 'package:face_clone/views/create_post/view.dart';
import 'package:face_clone/views/home/pages/main/components/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0.w, 8.0, 12.0.w, 0.0),
      color: Colors.white,
      child: Row(
        children: [
          ProfileAvatar(imageUrl: currentUser.imageUrl),
          const SizedBox(width: 8.0),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreatePostView(),
                  ),
                );
              },
              child: const Text('What\'s on your mind?'),
            ),
          ),
          IconButton(
            onPressed: () => debugPrint('Photo'),
            icon: const Icon(
              Icons.photo_library,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
