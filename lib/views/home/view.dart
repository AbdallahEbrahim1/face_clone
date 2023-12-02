import 'package:face_clone/views/home/pages/main/components/custom_tab_bar.dart';
import 'package:face_clone/views/home/pages/main/view.dart';
import 'package:face_clone/views/home/pages/market_place/view.dart';
import 'package:face_clone/views/home/pages/notifications/view.dart';
import 'package:face_clone/views/home/pages/profile/view.dart';
import 'package:face_clone/views/home/pages/video/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const MainView(),
    const VideoView(),
    const MarketPlaceView(),
    const NotificationsView(),
    const ProfileView(),
  ];

  final List _icons = [
    Icons.home,
    Icons.ondemand_video_rounded,
    Icons.call_to_action_outlined,
    Icons.notifications,
    MdiIcons.menu,
  ];
  final List _names = [
    "Home",
    "Video",
    "Marketplace",
    "Notifications",
    "profile",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 2.0.h),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            names: _names,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}
