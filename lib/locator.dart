import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/auth_api_service/auth_api_service.dart';
import 'data/datasources/remote/dio_helper.dart';
import 'data/datasources/remote/todos_api_service/todos_api_service.dart';
import 'data/repositories/api_repository_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/auth_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = DioHelper.dio;

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<AuthApiService>(AuthApiService(locator<Dio>()));
  locator.registerSingleton<TodosApiService>(TodosApiService(locator<Dio>()));

  locator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(authApiService: locator<AuthApiService>()),
  );
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<TodosApiService>()),
  );
}
