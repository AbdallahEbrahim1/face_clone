import 'package:face_clone/views/home/pages/main/controller/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

class MarketPlaceView extends StatefulWidget {
  const MarketPlaceView({super.key});

  @override
  State<MarketPlaceView> createState() => _MarketPlaceViewState();
}

class _MarketPlaceViewState extends State<MarketPlaceView> {
  final bloc = KiwiContainer().resolve<PostBloc>()..add(GetPostsEvent());
  final bloc1 = KiwiContainer().resolve<PostBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is GetPostsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetPostsSuccessState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.list[index].caption),
                  subtitle: Text(state.list[index].userName),
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      bloc1.add(DeletePostsEvent(id: state.list[index].id));
                      bloc.add(GetPostsEvent());
                    },
                  ),
                );
              },
            );
          } else if (state is GetPostsErrorState) {
            return Center(child: Text('Error: ${state.msg}'));
          } else {
            return Container(); // Placeholder, you can customize this
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc1.add(
            AddPostEvent(
              userName: "Ali Mohamed",
              userImageUrl: "",
              caption: "text",
              timeAgo: DateTime.now().toString(),
              imageUrl: "",
              likes: "0",
              shares: "0",
              comments: "0",
            ),
          );
          setState(() {
            // bloc1.add(AddPostsEvent());
            bloc.add(GetPostsEvent());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
