import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constants/constants_manager.dart';

import '../../../core/utils/resources/data_state.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../data/datasources/local/cache/cache_helper.dart';
import '../../../data/datasources/local/cache/keys.dart';
import '../../../domain/models/responses/auth_models/user_model.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../base/base_cubit.dart';

part 'auth_states.dart';

class AuthCubit extends BaseCubit<AuthStates, UserModel> {
  AuthCubit(this._authRepository) : super(AuthInitialState(), UserModel());

  final AuthRepository _authRepository;

  static AuthCubit get(context) => BlocProvider.of(context);

// Login
  UserModel userModel = UserModel();

  login({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoadingState());

    if (isBusy) return;

    await run(() async {
      final response = await _authRepository.login(
        username: userName,
        password: password,
      );
      if (response is DataSuccess) {
        userModel = response.data ?? UserModel();
        if (userModel.token != null) {
          // Save Token Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.token,
            value: userModel.token!,
          ).then((value) {
            // Update Token Value Here ✅
            Constants.token = userModel.token!;
          });

          // Save Name Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.fullName,
            value: "${userModel.firstName!} ${userModel.lastName!}",
          ).then((value) {
            // Update Name Value Here ✅
            Constants.fullName =
                "${userModel.firstName!} ${userModel.lastName!}";
          });
          // Save uId Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.uId,
            value: userModel.id!,
          ).then((value) {
            // Update UID Value Here ✅
            Constants.uId = userModel.id!;
          });
          // Save Email Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.email,
            value: userModel.email,
          ).then((value) {
            // Update Name Value Here ✅
            Constants.email = userModel.email!;
          });

          // Save User Name Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.username,
            value: userModel.username,
          ).then((value) {
            // Update Name Value Here ✅
            Constants.username = userModel.username!;
          });
          // Save User Name Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.gender,
            value: userModel.gender,
          ).then((value) {
            // Update gender Value Here ✅
            Constants.gender = userModel.gender!;
          });

          // Save image Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.image,
            value: userModel.image,
          ).then((value) {
            // Update gender Value Here ✅
            Constants.image = userModel.image!;
          });
          // Save image Here:
          CacheHelper.saveData(
            key: CacheHelperKeys.refreshToken,
            value: userModel.refreshToken,
          ).then((value) {
            // Update gender Value Here ✅
            Constants.refreshToken = userModel.refreshToken!;
          });
          emit(LoginDoneState(userModel: userModel));
          updateConstData();
        }
      } else if (response is DataFailed) {
        emit(LoginErrorState(errorMSG: AppStrings.error));
      }
    });
  }

  updateConstData() {
    Constants.token = CacheHelper.getData(key: CacheHelperKeys.token) ?? "";
    Constants.fullName =
        CacheHelper.getData(key: CacheHelperKeys.fullName) ?? "";
    Constants.email = CacheHelper.getData(key: CacheHelperKeys.email) ?? "";
    Constants.uId = CacheHelper.getData(key: CacheHelperKeys.uId) ?? 0;
    Constants.username =
        CacheHelper.getData(key: CacheHelperKeys.username) ?? "";
    Constants.gender = CacheHelper.getData(key: CacheHelperKeys.gender) ?? "";
    Constants.image = CacheHelper.getData(key: CacheHelperKeys.image) ?? "";
    Constants.refreshToken =
        CacheHelper.getData(key: CacheHelperKeys.refreshToken) ?? "";
    emit(UpdateConstDataState());
  }
}
