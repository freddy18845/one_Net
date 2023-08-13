import 'package:intl/intl.dart';

class Currency {
  String format(amount) {
    try {
      var currencyFormat = NumberFormat("USD #,###.00#");
      double newAmount = double.parse(amount.toString());

      String formattedAmount = currencyFormat.format(newAmount);

      return formattedAmount;
    } catch (e) {
      return "0.00";
    }
  }
}
