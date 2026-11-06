import 'package:agricoo_admin/backend/currency/currency_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('currencyCodeForLanguage', () {
    test('French maps to EUR', () {
      expect(currencyCodeForLanguage('fr'), 'EUR');
      expect(currencyCodeForLanguage('FR'), 'EUR');
    });

    test('other languages map to USD', () {
      expect(currencyCodeForLanguage('en'), 'USD');
      expect(currencyCodeForLanguage(null), 'USD');
    });
  });

  group('formatLanguageCurrency', () {
    test('French amounts use EUR formatting', () {
      final result = formatLanguageCurrency(10, 'fr');
      expect(result.contains('€'), isTrue);
    });

    test('non-French amounts use USD formatting', () {
      final result = formatLanguageCurrency(10, 'en');
      expect(result.contains(r'$'), isTrue);
    });

    test('null amounts format as zero', () {
      expect(formatLanguageCurrency(null, 'en'), '\$0.00');
    });
  });
}
