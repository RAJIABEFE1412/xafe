import 'package:xafe/values/regex.dart';

class XafeValidators {
  static String passwordValidator(String password) {
    if (password.length >= 8) return null;

    if (password.isEmpty) return "Password field cannot be empty";

    return "Password cannot be less than eight characters";
  }

  static String emailValidator(String email) {
    if (email.isEmpty) return "Email field cannot be empty";

    if (!_validateEmail(email)) return "Please enter valid email address";

    return null;
  }

  static String required(String text) {
    if (text == null || text.isEmpty) return "This field cannot be empty";

    return null;
  }

  static String nameValidator(String name) {
    if (name.isEmpty) return "Name field cannot be empty";

    if (name.length < 2) return "Name cannot be less than two characters";

    return null;
  }

  static String minLength(String value, {int length = 1}) {
    if (value == null || (value?.isEmpty ?? true)) {
      return 'This field is required';
    }
    if (value.length < length) {
      return 'The field should contain at least $length characters';
    }
    return null;
  }

  static bool _validateEmail(String value) {
    return (!mailRegEx.hasMatch(value)) ? false : true;
  }
}
