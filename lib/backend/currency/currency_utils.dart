import 'package:intl/intl.dart';

import '/backend/schema/order_record.dart';

const Set<String> supportedOrderCurrencies = {'EUR', 'USD'};

String? normalizeOrderCurrency(String? currency) {
  final code = currency?.trim().toUpperCase();
  if (code == null || !supportedOrderCurrencies.contains(code)) {
    return null;
  }
  return code;
}

String formatOrderCurrency(
  double? amount,
  String? currency, {
  int decimalDigits = 2,
}) {
  final code = normalizeOrderCurrency(currency);
  final value = amount ?? 0;
  if (code == null) {
    return value.toStringAsFixed(decimalDigits);
  }
  return NumberFormat.simpleCurrency(
    name: code,
    decimalDigits: decimalDigits,
  ).format(value);
}

class CurrencyAmount {
  const CurrencyAmount(this.amount, this.currency);

  final double amount;
  final String? currency;
}

class CurrencyTotals {
  const CurrencyTotals({
    required this.known,
    required this.unknownAmounts,
  });

  final Map<String, double> known;
  final List<double> unknownAmounts;
}

CurrencyTotals groupCurrencyAmounts(Iterable<CurrencyAmount> entries) {
  final known = <String, double>{};
  final unknownAmounts = <double>[];

  for (final entry in entries) {
    final amount = entry.amount;
    if (!amount.isFinite) continue;

    final code = normalizeOrderCurrency(entry.currency);
    if (code == null) {
      unknownAmounts.add(amount);
    } else {
      known[code] = (known[code] ?? 0) + amount;
    }
  }

  return CurrencyTotals(known: known, unknownAmounts: unknownAmounts);
}

CurrencyTotals groupOrderAmountsByCurrency(
  Iterable<OrderRecord> orders,
  double Function(OrderRecord) amountSelector,
) =>
    groupCurrencyAmounts(
      orders.map(
        (order) => CurrencyAmount(amountSelector(order), order.currency),
      ),
    );

String formatCurrencyTotals(
  CurrencyTotals totals, {
  String separator = ' · ',
}) {
  final parts = <String>[];

  for (final code in const ['EUR', 'USD']) {
    final amount = totals.known[code];
    if (amount != null && amount != 0) {
      parts.add(formatOrderCurrency(amount, code));
    }
  }

  if (totals.unknownAmounts.isNotEmpty) {
    final unknown = totals.unknownAmounts
        .map((amount) => amount.toStringAsFixed(2))
        .join(', ');
    parts.add('unspecified: $unknown');
  }

  return parts.isEmpty ? '0.00' : parts.join(separator);
}
