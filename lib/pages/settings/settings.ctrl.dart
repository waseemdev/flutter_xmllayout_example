import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'settings.xml.dart';

class SettingsController extends SettingsControllerBase {

  void _darkModeEnabledChanged(bool value) {
    themeChanger.changeTheme(value);
  }

  void _selectedLocaleChanged(String value) {
    localeChanger.changeLocale(value);
    // force reloading home
    // navigator.pushNamedAndRemoveUntil('/', (_) => false);
  }

  @override
  void didLoad(BuildContext context) {
    formGroup.addAll([
      FormControl<bool>('darkModeEnabled', themeChanger.darkModeEnabled, changesListener: _darkModeEnabledChanged),
      FormControl<String>('selectedLocale', localeChanger.localeCode, changesListener: _selectedLocaleChanged),
    ]);
  }

  @override
  void onBuild(BuildContext context) {
  }

  @override
  void afterFirstBuild(BuildContext context) {
  }

  @override
  void dispose() {
    super.dispose();
  }
}