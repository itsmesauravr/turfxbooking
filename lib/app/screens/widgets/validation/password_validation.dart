class PassWordValidation {
  static String? Function(String? value) passWordValid() {
    return (String? value) {
      if (value!.isEmpty) {
        return 'Please enter your password';
      } else if (!RegExp(
        r'^(?=.*?[A-Z])',
      ).hasMatch(value)) {
        return 'Password must contain at least one uppercase letter';
      } else if (!RegExp(
        r'^(?=.*?[a-z])',
      ).hasMatch(value)) {
        return 'Password must contain at least one lowercase letter';
      } else if (!RegExp(
        r'^(?=.*?[0-9])',
      ).hasMatch(value)) {
        return 'Password must contain at least one digit';
      } else if (!RegExp(
        r'^(?=.*?[!@#\$&*~])',
      ).hasMatch(value)) {
        return 'Password must contain at least one special character';
      } else if (!RegExp(
        r'^.{8,}',
      ).hasMatch(value)) {
        return 'Password must contain at least 8 characters';
      }
      return null;
    };
  }
}
// r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length  
// $
//r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'