import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy, HH:mm');
  return formatter.format(dateTime);
}

String formatRupiah(double value) {
  final NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: value.truncateToDouble() == value ? 0 : 2,
  );
  return currencyFormatter.format(value).trim();
}

