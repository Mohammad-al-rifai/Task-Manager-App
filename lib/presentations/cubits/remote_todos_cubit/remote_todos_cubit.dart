import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/constants/constants_manager.dart';
import '../../../core/utils/functions/functions.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../domain/models/responses/todos/todos_model.dart';
import '../../../domain/repositories/api_repository.dart';
import '../base/base_cubit.dart';

part 'remote_todos_states.dart';

class RemoteTodosCubit extends BaseCubit<RemoteTodosStates, List<Todo>> {
  RemoteTodosCubit(this._apiRepository) : super(const RemoteTodosLoading(), []);

  static RemoteTodosCubit get(context) => BlocProvider.of(context);
  final ApiRepository _apiRepository;

  bool noMoreTodos = false;

  Future<void> getTodosList({
    bool reset = false,
  }) async {
    if (reset) {
      data.clear();
      noMoreTodos = false;
    }
    if (isBusy) return;
    if (noMoreTodos) return;
    if (data.isEmpty) {
      emit(const RemoteTodosLoading());
    }

    await run(() async {
      final response = await _apiRepository.getTodosList(
        limit: Constants.pageSize,
        skip: data.isNotEmpty ? data.last.id : 0,
      );
      if (response is DataSuccess) {
        final todos = response.data!.todos;
        noMoreTodos = todos!.length < Constants.pageSize;
        data.addAll(todos);
        emit(RemoteTodosSuccess(todos: data, noMoreData: noMoreTodos));
        myPrint(text: "The Length Of mY List is : ${data.length}");
      } else if (response is DataFailed) {
        emit(RemoteTodosFailed(error: response.error));
      }
    });
  }

  Future<void> getMyTasks() async {
    data.clear();
    emit(const RemoteTodosLoading());
    if (isBusy) return;
    await run(() async {
      final response =
          await _apiRepository.getMyTasks(uId: Constants.uId?.toInt());
      if (response is DataSuccess) {
        final List<Todo>? myTasks = response.data!.todos;
        if (myTasks != null) data.addAll(myTasks);
        emit(RemoteTodosSuccess(todos: data));
      } else if (response is DataFailed) {
        emit(RemoteTodosFailed(error: response.error));
      }
    });
  }
}
