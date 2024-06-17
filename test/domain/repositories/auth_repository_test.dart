import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/core/utils/resources/data_state.dart';
import 'package:task_manager_app/domain/models/responses/auth_models/user_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  const UserModel userModel = UserModel(
    id: 1,
    username: "emilys",
    email: "emily.johnson@x.dummyjson.com",
    firstName: "Emily",
    lastName: "Johnson",
    gender: "female",
    image: "https://dummyjson.com/icon/emilys/128",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTg2MjI2MzUsImV4cCI6MTcxODYyNjIzNX0.TS_mm9q0bsGKzUnNvKOarZ8sECjCmoCs_ayRJxyLHAk",
    refreshToken:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3MTg2MjI2MzUsImV4cCI6MTcyMTIxNDYzNX0.jzV_TVNhMTEPkimEj69xaky3yKJ0cj_SsFgLvK-rrqc",
  );

  const String userName = "";
  const String password = "";

  test('should login user repository', () async {
    // arrange
    when(mockAuthRepository.login(username: userName, password: password))
        .thenAnswer((_) async => const DataSuccess<UserModel>(userModel));

    // act
    final result = await mockAuthRepository.login(
      username: userName,
      password: password,
    );

    // assert
    expect(result, const DataSuccess<UserModel>(userModel));
  });
}
