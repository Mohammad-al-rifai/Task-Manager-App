import '../../core/utils/resources/data_state.dart';
import '../models/responses/auth_models/user_model.dart';

abstract class AuthRepository {
  Future<DataState<UserModel>> login({
    required String username,
    required String password,
  });
}
