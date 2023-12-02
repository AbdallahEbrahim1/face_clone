import 'package:face_clone/data/data.dart';
import 'package:face_clone/data/models/post_model.dart';
import 'package:face_clone/views/home/pages/main/components/profile_avatar.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 320.0.h,
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 180.0.h,
                width: MediaQuery.of(context).size.width,
                child: FancyShimmerImage(
                  imageUrl: currentUser.imageUrl,
                  height: 45.h,
                  width: 45.w,
                  boxFit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 10.w,
                bottom: 0,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 75.r,
                      child: ProfileAvatar(
                        imageUrl: currentUser.imageUrl,
                        radius: 70.r,
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    Text(currentUser.name,
                        style: TextStyle(
                            fontSize: 24.0.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 40.0.h,
                  width: 140.0.w,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0.r)),
                  child: Center(
                      child: Text('Add to Story',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0.sp))),
                ),
                Container(
                  height: 40.0.h,
                  width: 140.0.w,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5.0.r)),
                  child: Center(
                      child: Text('Edit profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0.sp))),
                ),
                Container(
                  height: 40.0.h,
                  width: 45.0.w,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5.0.r)),
                  child: const Icon(Icons.more_horiz),
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15.0.w, 0.0, 15.0.w, 0.0),
          child: Divider(height: 40.0.h),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.home, color: Colors.grey, size: 30.0),
                  SizedBox(width: 10.0.w),
                  Text('Lives in Dumyat Al jadidah',
                      style: TextStyle(fontSize: 16.0.sp))
                ],
              ),
              SizedBox(height: 15.0.h),
              Row(
                children: <Widget>[
                  const Icon(Icons.location_on, color: Colors.grey, size: 30.0),
                  SizedBox(width: 10.0.w),
                  Text('From Dumyat Al jadidah',
                      style: TextStyle(fontSize: 16.0.sp))
                ],
              ),
              SizedBox(height: 15.0.h),
              Row(
                children: <Widget>[
                  const Icon(Icons.more_horiz, color: Colors.grey, size: 30.0),
                  SizedBox(width: 10.0.w),
                  Text('See your About Info',
                      style: TextStyle(fontSize: 16.0.sp))
                ],
              ),
              SizedBox(height: 15.0.h),
              Container(
                height: 40.0.h,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.20),
                  borderRadius: BorderRadius.circular(5.0.r),
                ),
                child: Center(
                    child: Text('Edit Public Details',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0.sp))),
              ),
            ],
          ),
        ),
        Divider(height: 40.0.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Friends',
                          style: TextStyle(
                              fontSize: 22.0.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 6.0.h),
                      Text('536 friends',
                          style: TextStyle(
                              fontSize: 16.0.sp, color: Colors.grey[800])),
                    ],
                  ),
                  Text('Find Friends',
                      style: TextStyle(
                          fontSize: 16.0.sp, color: Colors.blueAccent)),
                ],
              ),
              Container(
                height: 400.h,
                padding: EdgeInsets.only(top: 15.0.h),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: posts.length - 1,
                  itemBuilder: (context, index) {
                    final Post post = posts[index + 1];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: MediaQuery.of(context).size.width / 3 - 20,
                          width: MediaQuery.of(context).size.width / 3 - 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FancyShimmerImage(
                            imageUrl: post.user.imageUrl,
                            boxFit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 5.0.h),
                        Text(post.user.name,
                            style: TextStyle(
                                fontSize: 16.0.sp, fontWeight: FontWeight.bold))
                      ],
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0.h),
                height: 40.0.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0.r),
                ),
                child: Center(
                    child: Text('See All Friends',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0.sp))),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey[400],
          width: MediaQuery.of(context).size.width,
          height: 11.0.h,
        ),
      ],
    );
  }
}
