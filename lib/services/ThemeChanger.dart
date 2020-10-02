

import 'package:flutter/material.dart';
import 'PersistentStorage.dart';

class ThemeChanger with ChangeNotifier {
  final PersistentStorage storage;

  bool get darkModeEnabled => storage.darkModeEnabled;

  ThemeChanger(this.storage);

  void changeTheme(bool darkMode) {
    storage.setDarkModeEnabled(darkMode);
    notifyListeners();
  }

  bool _isArabic() {
    return storage.getLocale() == 'ar';
  }

  ThemeData get theme {
    return darkModeEnabled ? _buildTheme(Brightness.dark) : _buildTheme(Brightness.light);
  }

  ThemeData _buildTheme(Brightness brightness) {
    final arabic = _isArabic();

    return ThemeData(
      brightness: brightness,
      primarySwatch: Colors.teal,
      fontFamily: arabic ? 'Roboto' : 'Roboto', // custom font depending on locale
    );
  }
}