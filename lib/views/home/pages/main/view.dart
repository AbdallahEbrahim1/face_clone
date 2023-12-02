import 'package:face_clone/data/data.dart';
import 'package:face_clone/views/home/pages/main/components/circle_button.dart';
import 'package:face_clone/views/home/pages/main/components/create_post_container.dart';
import 'package:face_clone/views/home/pages/main/components/post_container.dart';
import 'package:face_clone/views/home/pages/main/components/stories.dart';
import 'package:face_clone/views/home/pages/main/controller/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final getPostsBloc = KiwiContainer().resolve<PostBloc>()
    ..add(GetPostsEvent());
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: getPostsBloc,
        builder: (context, state) {
          if (state is GetPostsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetPostsSuccessState) {
            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              onRefresh: () async {
                getPostsBloc.add(GetPostsEvent());
                refreshController.refreshCompleted();
              },
              controller: refreshController,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      'faceClone',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 28.0.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.2,
                      ),
                    ),
                    centerTitle: false,
                    floating: true,
                    actions: [
                      CircleButton(
                        icon: Icons.add,
                        iconSize: 30.0,
                        onPressed: () => debugPrint('add post'),
                      ),
                      CircleButton(
                        icon: Icons.search,
                        iconSize: 30.0,
                        onPressed: () => debugPrint('Search'),
                      ),
                      CircleButton(
                        icon: MdiIcons.facebookMessenger,
                        iconSize: 30.0,
                        onPressed: () => debugPrint('Messenger'),
                      ),
                    ],
                  ),
                  const SliverToBoxAdapter(
                    child: CreatePostContainer(currentUser: currentUser),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0.h, 0.0, 5.0.h),
                    sliver: SliverToBoxAdapter(
                      child: Stories(
                        currentUser: currentUser,
                        stories: stories,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final post = state.list[index];
                        return state.list.isNotEmpty
                            ? PostContainer(
                                post: post,
                              )
                            : const SizedBox.shrink();
                      },
                      childCount: state.list.length,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetPostsErrorState) {
            return Center(child: Text('Error: ${state.msg}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
