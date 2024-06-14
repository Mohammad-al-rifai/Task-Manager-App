import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/resources/strings_manager.dart';
import '../../view/home/home_view.dart';
import '../../view/my_tasks/my_tasks_view.dart';
import '../../view/settings/settings_view.dart';

part 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    AppStrings.home,
    AppStrings.home,
    AppStrings.settings,
  ];

  List<Widget> views = [
    const HomeView(),
    const MyTasksView(),
    const SettingsView(),
  ];

  int currentIndex = 0;

  void changeBottom(int index, {Function? function}) {
    if (function != null) {
      function(index);
    }
    currentIndex = index;
    emit(ChangeBottomNavState(index: currentIndex));
  }
}
