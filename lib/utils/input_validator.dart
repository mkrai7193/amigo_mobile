import '../constants/string_constants.dart';

class InputValidator {
  String? isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    if (email.isEmpty) {
      return StringConstants.emailCantBeEmpty;
    } else if (regex.hasMatch(email)) {
      return null;
    } else {
      return StringConstants.enterValidEmail;
    }
  }

  String? isValidPassword(String password) {
    final RegExp regex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+');
    if (password.isEmpty) {
      return StringConstants.passwordCantBeEmpty;
    } else if (regex.hasMatch(password)) {
      return null;
    } else {
      return StringConstants.passwordMustContain;
    }
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return StringConstants.passwordCantBeEmpty;
    } else if (password == confirmPassword) {
      return null;
    } else {
      return StringConstants.passwordMustMatch;
    }
  }

  String? validateFields(String field, String value) {
    if (value.isEmpty) {
      return '$field can\'t be empty';
    } else {
      return null;
    }
  }

  String? validateOTP(String field, String value) {
    if (field != value) {
      return 'OTP mismatch';
    } else {
      return null;
    }
  }

  String? isValidPhoneNumber(String value) {
    if (value.isEmpty) {
      return StringConstants.pleaseEnterPhoneNumber;
    } else if (value.length < 10 || value.length > 15) {
      return StringConstants.pleaseEnterValidPhoneNumber;
    } else {
      return null;
    }
  }
}
