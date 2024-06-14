import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentations/cubits/app_cubit/app_cubit.dart';
import '../../presentations/cubits/auth_cubit/auth_cubit.dart';
import '../../presentations/cubits/todo_cubit/to_do_cubit.dart';
import '../../presentations/view/splash/splash_view.dart';
import '../themes/themes_manager.dart';
import '../utils/functions/functions.dart';
import '../utils/resources/strings_manager.dart';

class MyApp extends StatefulWidget {
  // named Constructor

  const MyApp._internal();

  static const MyApp _instance =
      MyApp._internal(); // Singleton or Single Instance.

  factory MyApp() => _instance; //factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => ToDoCubit()..getTodos(reset: true)),
      ],
      child: ScreenUtilInit(
        designSize: Size(getScreenWidth(context), getScreenHeight(context)),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) {
          ScreenUtil.init(context);
          return MaterialApp(
            title: AppStrings.maids,
            debugShowCheckedModeBanner: false,
            theme: getApplicationTheme(),
            // title: App,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
