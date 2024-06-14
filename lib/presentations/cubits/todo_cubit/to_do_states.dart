part of 'to_do_cubit.dart';

@immutable
sealed class ToDoStates {}

final class ToDoInitialState extends ToDoStates {}

// Get ToDos States:
final class GetToDosLoadingState extends ToDoStates {}

final class GetToDosDoneState extends ToDoStates {}

final class GetToDosErrorState extends ToDoStates {}

// Get My Tasks:
final class GetMyTasksLoadingState extends ToDoStates {}

final class GetMyTasksDoneState extends ToDoStates {}

final class GetMyTasksErrorState extends ToDoStates {}
