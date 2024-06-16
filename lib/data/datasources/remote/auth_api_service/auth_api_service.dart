import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/constants/urls.dart';
import '../../../../domain/models/responses/auth_models/user_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl, parser: Parser.MapSerializable)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST(Urls.login)
  Future<HttpResponse<UserModel>> login({
    @Field("username") String? userName,
    @Field("password") String? password,
  });
}
