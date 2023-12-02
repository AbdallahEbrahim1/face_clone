import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_clone/data/models/story_model.dart';
import 'package:face_clone/data/models/user_model.dart';
import 'package:face_clone/views/home/pages/main/components/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User? currentUser;
  final Story? story;

  const StoryCard(
      {super.key, this.isAddStory = false, this.currentUser, this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: isAddStory ? 120 : double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            // gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
          top: isAddStory ? 120.h : 8.0.h,
          left: isAddStory ? 38.h : 8.0.h,
          child: isAddStory
              ? Container(
                  height: 40.0.h,
                  width: 40.0.w,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add,
                    ),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () => print('Add to Story'),
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.imageUrl,
                  // hasBorder: !story.isViewed,
                ),
        ),
        Positioned(
          bottom: isAddStory ? 0 : 8.0.h,
          left: 8.0.w,
          right: 8.0.w,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user.name,
            style: TextStyle(
              color: isAddStory ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
