int convertToInt(String value) {
  // Try parsing the string as a double
  final doubleValue = double.tryParse(value);
  if (doubleValue != null) {
    return doubleValue.toInt(); // Truncates if it's a decimal
  }

  // Fallback if the string can't be parsed to a number
  return 0;
}

double convertToDouble(String value) {
  // Try parsing the string as a double
  final doubleValue = double.tryParse(value);
  if (doubleValue != null) {
    return doubleValue;
  }

  // Fallback if the string can't be parsed to a number
  return 0.0;
}
