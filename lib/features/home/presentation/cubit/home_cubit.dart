// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit()  : super(HomeState.init());

  init(BuildContext context) {

    getMovieList(context: context);
  }

  getMovieList({required BuildContext context}) async {}

  void changeListView(String key) {}
}
