class RequiredTextValidator {
  final String errorMessage;

  const RequiredTextValidator({
    this.errorMessage = 'This field cannot be empty',
  });

  /// The method that makes this class callable.
  /// It returns an error message string if the validation fails, otherwise null.
  String? call(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }
}
