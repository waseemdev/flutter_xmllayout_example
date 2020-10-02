import 'package:flutter/material.dart';
import 'PersistentStorage.dart';

class LocaleChanger with ChangeNotifier {
  final PersistentStorage storage;
  
  Locale _locale;
  Locale get locale => _locale;

  String get localeCode => storage.localeCode;

  LocaleChanger(this.storage) {
    final code = storage.getLocale();
    if (code != null && code.isNotEmpty) {
      _locale = Locale(code);
    }
    else {
      _locale = Locale('en');
    }
  }
  

  void changeLocale(String code) {
    _locale = Locale(code);
    storage.setLocale(code);
    notifyListeners();
  }
}
