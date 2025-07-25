class EmailValidator {
  final String fieldName;

  EmailValidator({this.fieldName = 'Email'});

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp _emailValid = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9. !#$%&'*+-/ =? ^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  String? call(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (!_emailValid.hasMatch(value.trim())) {
      return 'Enter a valid $fieldName';
    }

    return null;
  }
}
