import '../constants/constants_manager.dart';

class Validations {
  static bool isEmailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isPassword(String password) {
    return password.length >= Constants.minPasswordLength;
  }

  static bool isUserName(String username) {
    return username.isNotEmpty && username.length < 30;
  }

  static bool isPasswordWithConfirm(String pass1, String pass2) {
    return (pass1 == pass2 &&
        pass1.length >= Constants.minPasswordLength &&
        pass2.length >= Constants.minPasswordLength);
  }

  static bool isPhoneNum(String number) {
    return number.length >= 10 && number.length <= 15;
  }

  static bool isOTPValid(String otp) {
    return otp.length >= 5 && otp.length <= 8;
  }
}
