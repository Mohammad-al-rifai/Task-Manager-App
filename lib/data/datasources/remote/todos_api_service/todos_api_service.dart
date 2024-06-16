import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/utils/constants/urls.dart';
import '../../../../domain/models/responses/todos/todos_model.dart';

part 'todos_api_service.g.dart';

@RestApi(baseUrl: Urls.baseUrl, parser: Parser.MapSerializable)
abstract class TodosApiService {
  factory TodosApiService(Dio dio, {String baseUrl}) = _TodosApiService;

  @GET(Urls.getToDos)
  Future<HttpResponse<TodosModel>> getTodosList({
    @Query("limit") int? limit,
    @Query("skip") int? skip,
  });

  @GET('${Urls.getMyTasks}{uId}')
  Future<HttpResponse<TodosModel>> getMyTasks({
    @Path("uId") int? uId,
  });
}
