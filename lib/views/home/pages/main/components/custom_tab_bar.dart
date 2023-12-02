import 'package:face_clone/data/data.dart';
import 'package:face_clone/views/home/pages/main/components/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final List icons;
  final List names;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({
    super.key,
    required this.icons,
    required this.names,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.blue,
            width: 4.0,
          ),
        ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: i == 4
                      ? ProfileAvatar(
                          imageUrl: currentUser.imageUrl,
                          radius: 15,
                        )
                      : Icon(
                          e,
                          color:
                              i == selectedIndex ? Colors.blue : Colors.black45,
                          size: 30.0,
                        ),
                  // text: names[i],
                  child: Text(
                    names[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 8.0.sp, fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                  // height: 60,
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
