import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_helpers/pipes/Pipe.dart';
import 'package:intl/intl.dart';

class FormatCurrencyPipe extends Pipe {
  String get name => 'formatCurrency';

  dynamic transform(BuildContext context, value, args) {
    final res = NumberFormat.currency(decimalDigits: 2).format(value is String ? num.tryParse(value) ?? 0 : value);
    return res;
  }
}
