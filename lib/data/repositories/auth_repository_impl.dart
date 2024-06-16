import '../../core/utils/resources/data_state.dart';
import '../../domain/models/responses/auth_models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../base/base_api_repository.dart';
import '../datasources/remote/auth_api_service/auth_api_service.dart';

class AuthRepositoryImpl extends BaseApiRepository implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl({
    required AuthApiService authApiService,
  }) : _authApiService = authApiService;

  @override
  Future<DataState<UserModel>> login({
    required String username,
    required String password,
  }) {
    return getStateOf<UserModel>(
      request: () => _authApiService.login(
        userName: username,
        password: password,
      ),
    );
  }
}
