///Email id validator

class Validators {
  static String? validateEmail(String val, bool isId) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    //checking for empty value
    if (val.isEmpty) {
      return "Required field";
    } else {
      //matching the regular expression
      if (!regExp.hasMatch(val)) {
        return "Enter valid ${isId ? 'user id' : 'email'}";
      } else {
        return null;
      }
    }
  }

  ///Password validator
  static String? validatePassword(String val) {
    RegExp upperCaseRegExp = RegExp(r'[A-Z]');
    RegExp lowerCaseRegExp = RegExp(r'[a-z]');
    RegExp digitRegExp = RegExp(r'\d');
    RegExp specialCharRegExp = RegExp(r'[!@#\$&*~]');

    bool hasUpperCase = upperCaseRegExp.hasMatch(val);
    bool hasLowerCase = lowerCaseRegExp.hasMatch(val);
    bool hasDigit = digitRegExp.hasMatch(val);
    bool hasSpecialChar = specialCharRegExp.hasMatch(val);
    bool isLengthValid = val.length >= 10;

    if (val.isEmpty) {
      return "Required field";
    } else if (!hasUpperCase) {
      return 'Password must contain at least 1 uppercase letter';
    } else if (!hasLowerCase) {
      return 'Password must contain at least 1 lowercase letter';
    } else if (!hasDigit) {
      return 'Password must contain at least 1 number';
    } else if (!hasSpecialChar) {
      return 'Password must contain at least 1 special character';
    } else if (!isLengthValid) {
      return 'Password must be at least 10 characters long';
    } else {
      return null;
    }
  }
}
