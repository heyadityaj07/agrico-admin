import 'package:intl/intl.dart';

String currencyCodeForLanguage(String? languageCode) {
  return languageCode?.toLowerCase() == 'fr' ? 'EUR' : 'USD';
}

String formatLanguageCurrency(
  double? amount,
  String? languageCode, {
  int decimalDigits = 2,
}) {
  final code = currencyCodeForLanguage(languageCode);
  return NumberFormat.simpleCurrency(
    name: code,
    decimalDigits: decimalDigits,
  ).format(amount ?? 0);
}
