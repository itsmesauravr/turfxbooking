class EmailValidation {
  static String? Function(String? value) emailValid() {
    return (String? value) {
      if (value!.isEmpty) {
        return 'Please enter your email';
      } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
              r"([a-zA-Z]+)?$")
          .hasMatch(value)) {
        return 'Please enter a valid email';
      }
      return null;
    };
  }
}
