import 'package:task_manager_app/core/utils/resources/data_state.dart';
import 'package:task_manager_app/domain/models/responses/todos/todos_model.dart';

import '../../helpers/test_helper.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  late MockApiRepository mockApiRepository;

  setUp(() {
    mockApiRepository = MockApiRepository();
  });

  const TodosModel todosModel = TodosModel(
    total: 254,
    limit: 2,
    skip: 0,
    todos: [
      Todo(
        id: 1,
        todo: "Do something nice for someone you care about",
        completed: false,
        userId: 152,
      ),
      Todo(
        id: 2,
        todo: "Memorize a poem",
        completed: true,
        userId: 13,
      ),
    ],
  );

  test('should get TodosModel from the repository', () async {
    // arrange
    when(mockApiRepository.getTodosList(limit: 2, skip: 0))
        .thenAnswer((_) async => const DataSuccess<TodosModel>(todosModel));

    // act
    final result = await mockApiRepository.getTodosList(limit: 2, skip: 0);

    // assert
    expect(result, const DataSuccess<TodosModel>(todosModel));
  });
}
