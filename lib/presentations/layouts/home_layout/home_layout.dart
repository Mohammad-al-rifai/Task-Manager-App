import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/resources/strings_manager.dart';
import '../../cubits/app_cubit/app_cubit.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) => cubit.changeBottom(
              index,
              function: (index) {
                setState(() {});
              },
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: AppStrings.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.square_split_2x2,
                ),
                label: AppStrings.myTasks,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.settings_solid,
                ),
                label: AppStrings.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
