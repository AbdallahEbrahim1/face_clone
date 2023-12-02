import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_clone/views/home/pages/main/components/post_header.dart';
import 'package:face_clone/views/home/pages/main/components/post_stats.dart';
import 'package:face_clone/views/home/pages/main/controller/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostContainer extends StatelessWidget {
  final PostDataModel post;

  const PostContainer({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5.0.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PostHeader(
                    post: post,
                  ),
                  SizedBox(height: 4.0.h),
                  Text(post.caption),
                  post.imageUrl != ""
                      ? const SizedBox.shrink()
                      : SizedBox(height: 6.0.h),
                ],
              ),
            ),
            post.imageUrl != ""
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: CachedNetworkImage(imageUrl: post.imageUrl),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: PostStats(post: post),
            ),
          ],
        ),
      ),
    );
  }
}
