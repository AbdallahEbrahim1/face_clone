import 'package:face_clone/views/home/pages/main/components/change_reaction.dart';
import 'package:face_clone/views/home/pages/main/components/post_button.dart';
import 'package:face_clone/views/home/pages/main/controller/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostStats extends StatelessWidget {
  final PostDataModel post;

  const PostStats({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0.r),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 4.0.w),
            Expanded(
              child: Text(
                post.likes,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(width: 8.0.w),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 8.0.w),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            const ChangeReaction(),
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => debugPrint('Comment'),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.whatsapp,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Send',
              onTap: () => debugPrint('Send'),
            ),
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () => debugPrint('Share'),
            )
          ],
        ),
      ],
    );
  }
}
