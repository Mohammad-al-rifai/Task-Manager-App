part of 'auth_cubit.dart';

@immutable
sealed class AuthStates {}

final class AuthInitialState extends AuthStates {}

// Login States:
class LoginLoadingState extends AuthStates {}

class LoginDoneState extends AuthStates {
  final UserModel? userModel;

  LoginDoneState({required this.userModel});
}

class LoginErrorState extends AuthStates {
  final String errorMSG;

  LoginErrorState({required this.errorMSG});
}

class UpdateConstDataState extends AuthStates {}
