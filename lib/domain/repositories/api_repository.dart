import '../../core/utils/resources/data_state.dart';
import '../models/responses/todos/todos_model.dart';

abstract class ApiRepository {
  Future<DataState<TodosModel>> getTodosList({
    required int? limit,
    required int? skip,
  });

  Future<DataState<TodosModel>> getMyTasks({
    required int? uId,
  });
}
