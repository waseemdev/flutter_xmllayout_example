import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_helpers/pipes/Pipe.dart';

class FormatDatePipe extends Pipe {
  String get name => 'formatDate';

  dynamic transform(BuildContext context, value, args) {
    if (value == null) {
      return '';
    }
    DateTime date;
    if (value is String) {
      date = DateTime.parse(value);
    }
    else if (value is DateTime) {
      date = value;
    }
    else {
      return 'Invalid date';
    }

    return '${date.year}-${date.month}-${date.day}';
  }
}