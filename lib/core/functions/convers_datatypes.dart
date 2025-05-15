int? convertToInt(String? value) {
  // Try parsing the string as a double
  if (value != null) {
    final doubleValue = double.tryParse(value);
    if (doubleValue != null) {
      return doubleValue.toInt(); // Truncates if it's a decimal
    }
  }

  // Fallback if the string can't be parsed to a number
  return null;
}

double? convertToDouble(String? value) {
  // Try parsing the string as a double
  if (value != null) {
    final doubleValue = double.tryParse(value);
    if (doubleValue != null) {
      return doubleValue;
    }
  }
  return null; // Return null if the input is null
}
