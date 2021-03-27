import 'package:flutter/services.dart';

class SizeMultiplierTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '')
      return TextEditingValue();
    else if (double.parse(newValue.text) < 0.01)
      return TextEditingValue().copyWith(text: '0.01');

    return double.parse(newValue.text) > 4.0
        ? TextEditingValue().copyWith(text: '4.0')
        : newValue;
  }
}
