import 'package:intl/intl.dart';

class AppPipes {
  static String formatDate(DateTime date) =>
      DateFormat('d/MM/y').format(DateTime.parse(date.toString()));

  static String formatMoney(double value) =>
      'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}';
}
