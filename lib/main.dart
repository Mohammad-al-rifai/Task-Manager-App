import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app/my_app.dart';
import 'core/utils/constants/constants_manager.dart';
import 'core/utils/functions/bloc_observer.dart';
import 'core/utils/functions/functions.dart';
import 'data/datasources/local/cache/cache_helper.dart';
import 'data/datasources/local/cache/keys.dart';
import 'data/datasources/remote/dio_helper.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper.init();
  DioHelper.init();
  await initializeDependencies();
  Bloc.observer = MyBlocObserver();
  Constants.token = CacheHelper.getData(key: CacheHelperKeys.token) ?? "";
  Constants.fullName = CacheHelper.getData(key: CacheHelperKeys.fullName) ?? "";
  Constants.email = CacheHelper.getData(key: CacheHelperKeys.email) ?? "";
  Constants.uId = CacheHelper.getData(key: CacheHelperKeys.uId) ?? 0;
  Constants.username = CacheHelper.getData(key: CacheHelperKeys.username) ?? "";
  Constants.gender = CacheHelper.getData(key: CacheHelperKeys.gender) ?? "";
  Constants.image = CacheHelper.getData(key: CacheHelperKeys.image) ?? "";
  Constants.refreshToken =
      CacheHelper.getData(key: CacheHelperKeys.refreshToken) ?? "";

  myPrint(text: "User Token Is: ${Constants.token}");
  myPrint(text: "User Name Is: ${Constants.fullName}");
  runApp(MyApp());
}
