import 'package:agricoo_admin/backend/currency/currency_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeOrderCurrency', () {
    test('accepts EUR and USD case-insensitively', () {
      expect(normalizeOrderCurrency('eur'), 'EUR');
      expect(normalizeOrderCurrency(' usd '), 'USD');
    });

    test('rejects missing and unsupported currencies', () {
      expect(normalizeOrderCurrency(null), isNull);
      expect(normalizeOrderCurrency(''), isNull);
      expect(normalizeOrderCurrency('GBP'), isNull);
    });
  });

  group('groupCurrencyAmounts', () {
    test('groups EUR-only amounts into one EUR total', () {
      final totals = groupCurrencyAmounts(const [
        CurrencyAmount(10, 'EUR'),
        CurrencyAmount(5, 'eur'),
      ]);
      expect(totals.known['EUR'], 15);
      expect(totals.known['USD'], isNull);
      expect(totals.unknownAmounts, isEmpty);
    });

    test('groups USD-only amounts into one USD total', () {
      final totals = groupCurrencyAmounts(const [
        CurrencyAmount(5, 'USD'),
        CurrencyAmount(2.5, 'usd'),
      ]);
      expect(totals.known['USD'], 7.5);
      expect(totals.known['EUR'], isNull);
      expect(totals.unknownAmounts, isEmpty);
    });

    test('keeps EUR and USD totals separate for mixed orders', () {
      final totals = groupCurrencyAmounts(const [
        CurrencyAmount(10, 'EUR'),
        CurrencyAmount(5, 'USD'),
        CurrencyAmount(2, 'EUR'),
        CurrencyAmount(1, 'USD'),
      ]);
      expect(totals.known['EUR'], 12);
      expect(totals.known['USD'], 6);
      expect(totals.unknownAmounts, isEmpty);
    });

    test('does not sum multiple unknown-currency amounts', () {
      final totals = groupCurrencyAmounts(const [
        CurrencyAmount(3, null),
        CurrencyAmount(4, ''),
        CurrencyAmount(5, 'GBP'),
      ]);
      expect(totals.known, isEmpty);
      expect(totals.unknownAmounts, [3, 4, 5]);
    });
  });

  group('formatCurrencyTotals', () {
    test('EUR-only totals use the EUR symbol only', () {
      final result = formatCurrencyTotals(
        const CurrencyTotals(known: {'EUR': 10}, unknownAmounts: []),
      );
      expect(result.contains('€'), isTrue);
      expect(result.contains(r'$'), isFalse);
    });

    test('USD-only totals use the USD symbol only', () {
      final result = formatCurrencyTotals(
        const CurrencyTotals(known: {'USD': 5}, unknownAmounts: []),
      );
      expect(result.contains(r'$'), isTrue);
      expect(result.contains('€'), isFalse);
    });

    test('mixed totals display EUR and USD separately', () {
      final result = formatCurrencyTotals(
        const CurrencyTotals(
          known: {'EUR': 10, 'USD': 5},
          unknownAmounts: [],
        ),
      );
      expect(result.contains('€'), isTrue);
      expect(result.contains(r'$'), isTrue);
    });

    test('unknown amounts are listed individually, not summed', () {
      final result = formatCurrencyTotals(
        const CurrencyTotals(
          known: {},
          unknownAmounts: [3, 4, 5],
        ),
      );
      expect(result.contains('unspecified:'), isTrue);
      expect(result.contains('3.00'), isTrue);
      expect(result.contains('4.00'), isTrue);
      expect(result.contains('5.00'), isTrue);
      expect(result.contains('12.00'), isFalse);
    });

    test('mixed known and unknown totals stay separate', () {
      final result = formatCurrencyTotals(
        const CurrencyTotals(
          known: {'EUR': 10, 'USD': 5},
          unknownAmounts: [2.5],
        ),
      );
      expect(result.contains('€'), isTrue);
      expect(result.contains(r'$'), isTrue);
      expect(result.contains('unspecified: 2.50'), isTrue);
    });

    test('empty totals return zero', () {
      expect(
        formatCurrencyTotals(
          const CurrencyTotals(known: {}, unknownAmounts: []),
        ),
        '0.00',
      );
    });
  });
}
