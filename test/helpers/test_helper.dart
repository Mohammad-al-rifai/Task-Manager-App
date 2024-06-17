import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager_app/domain/repositories/api_repository.dart';

@GenerateMocks(
  [
    ApiRepository,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
