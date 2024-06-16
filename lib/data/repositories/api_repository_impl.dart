import '../../core/utils/resources/data_state.dart';
import '../../domain/models/responses/todos/todos_model.dart';
import '../../domain/repositories/api_repository.dart';
import '../base/base_api_repository.dart';
import '../datasources/remote/todos_api_service/todos_api_service.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final TodosApiService _todoApiService;

  ApiRepositoryImpl(this._todoApiService);

  @override
  Future<DataState<TodosModel>> getTodosList({
    int? limit,
    int? skip,
  }) {
    return getStateOf<TodosModel>(
      request: () => _todoApiService.getTodosList(
        limit: limit,
        skip: skip,
      ),
    );
  }

  @override
  Future<DataState<TodosModel>> getMyTasks({required int? uId}) {
    return getStateOf<TodosModel>(
      request: () => _todoApiService.getMyTasks(uId: uId),
    );
  }
}
