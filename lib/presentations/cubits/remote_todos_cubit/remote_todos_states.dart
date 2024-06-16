part of 'remote_todos_cubit.dart';

@immutable
abstract class RemoteTodosStates {
  final List<Todo> todos;
  final bool noMoreData;
  final DioException? error;

  const RemoteTodosStates({
    this.todos = const [],
    this.noMoreData = true,
    this.error,
  });
}

class RemoteTodosLoading extends RemoteTodosStates {
  const RemoteTodosLoading();
}

class RemoteTodosSuccess extends RemoteTodosStates {
  const RemoteTodosSuccess({super.todos, super.noMoreData});
}

class RemoteTodosFailed extends RemoteTodosStates {
  const RemoteTodosFailed({super.error});
}
