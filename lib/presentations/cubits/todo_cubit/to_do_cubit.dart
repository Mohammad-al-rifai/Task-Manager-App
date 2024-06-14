import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/constants/constants_manager.dart';
import '../../../core/utils/constants/urls.dart';
import '../../../data/datasources/remote/dio_helper.dart';
import '../../../domain/models/todos/todos_model.dart';

part 'to_do_states.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit() : super(ToDoInitialState());

  static ToDoCubit get(context) => BlocProvider.of(context);

  // Get ToDos:
  TodosModel todosModel = TodosModel();
  List<Todo> todos = [];
  bool noMoreToDos = false;
  int todoPage = 1;

  getTodos({bool reset = false}) {
    if (reset) {
      todosModel = TodosModel();
      todos.clear();
      noMoreToDos = false;
      todoPage = 1;
    }

    if (noMoreToDos) {
      return;
    }
    if (todos.isEmpty) {
      emit(GetToDosLoadingState());
    }

    DioHelper.instance.getData(url: Urls.getToDos, query: {
      "limit": Constants.pageSize,
      "skip": todos.isNotEmpty ? todos.last.id : 0,
    }).then((value) {
      if (value.data != null) {
        todosModel = TodosModel.fromJson(value.data);
        if (todosModel.todos != null) {
          List<Todo> result = todosModel.todos!;
          todos.addAll(result);
          noMoreToDos = result.length < Constants.pageSize;
          todoPage++;
        }
        emit(GetToDosDoneState());
      }
    }).catchError((error) {
      emit(GetToDosErrorState());
    });
  }

  // Get My Tasks:
  TodosModel myTasksModel = TodosModel();
  List<Todo> myTasks = [];

  getMyTasks() {
    myTasks.clear();
    emit(GetMyTasksLoadingState());
    DioHelper.instance
        .getData(
      url: Urls.getMyTasks + Constants.uId.toString(),
    )
        .then((value) {
      if (value.data != null) {
        myTasksModel = TodosModel.fromJson(value.data);
        if (myTasksModel.todos != null) {
          List<Todo> result = myTasksModel.todos!;
          myTasks.addAll(result);
        }
        emit(GetMyTasksDoneState());
      }
    }).catchError((error) {
      emit(GetMyTasksErrorState());
    });
  }
}
