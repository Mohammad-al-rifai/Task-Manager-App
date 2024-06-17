import 'package:equatable/equatable.dart';

class TodosModel extends Equatable {
  const TodosModel({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  final List<Todo>? todos;
  final num? total;
  final num? skip;
  final num? limit;

  factory TodosModel.fromMap(Map<String, dynamic> json) {
    return TodosModel(
      todos: json["todos"] == null
          ? []
          : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
      total: json["total"],
      skip: json["skip"],
      limit: json["limit"],
    );
  }

  Map<String, dynamic> toJson() => {
        "todos": todos?.map((x) => x.toJson()).toList(),
        "total": total,
        "skip": skip,
        "limit": limit,
      };

  @override
  String toString() {
    return "$todos, $total, $skip, $limit, ";
  }

  @override
  List<Object?> get props => [todos, total, skip, limit];
}

class Todo extends Equatable {
  const Todo({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  final int? id;
  final String? todo;
  final bool? completed;
  final num? userId;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json["id"],
      todo: json["todo"],
      completed: json["completed"],
      userId: json["userId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };

  @override
  String toString() {
    return "$id, $todo, $completed, $userId, ";
  }

  @override
  List<Object?> get props => [id, todo, completed, userId];
}
