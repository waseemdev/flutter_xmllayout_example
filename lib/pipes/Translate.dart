import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_example/i18n/gen/localizations.dart';
import 'package:flutter_xmllayout_helpers/pipes/Pipe.dart';

class TranslatePipe extends Pipe {
  String get name => 'translate';

  dynamic transform(BuildContext context, value, args) {
    return AppLocalizations.of(context).getTranslation(value) ?? value;
  }
}
