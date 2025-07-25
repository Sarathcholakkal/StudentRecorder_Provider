class PhoneNumberValidator {
  final String fieldName;

  PhoneNumberValidator({this.fieldName = 'Phone number'});

  final RegExp _phoneValid = RegExp(r'^(?:\+91|91)?\s?[6-9]\d{9}$');

  String? call(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (!_phoneValid.hasMatch(value)) {
      return 'Enter a valid 10-digit $fieldName';
    }

    return null; // ✅ Valid
  }
}
