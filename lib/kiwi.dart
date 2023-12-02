import 'package:face_clone/views/home/pages/main/controller/bloc.dart';
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((container) => PostBloc());
}
