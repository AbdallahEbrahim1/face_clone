import 'package:face_clone/data/models/story_model.dart';
import 'package:face_clone/data/models/user_model.dart';
import 'package:face_clone/views/home/pages/main/components/story_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({super.key, required this.stories, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0.h,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10.0.h,
          horizontal: 8.0.w,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.h),
              child: StoryCard(
                currentUser: currentUser,
                isAddStory: true,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}
