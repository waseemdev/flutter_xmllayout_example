import 'package:shared_preferences/shared_preferences.dart';

class PersistentStorage {
  final SharedPreferences _prefs;

  static const String _localeField = 'locale';
  static const String _darkModeEnabledField = 'dark-mode';
  static const String _userTokenField = 'user-token';

  String _localeCode;
  String get localeCode => _localeCode ?? getLocale() ?? 'en';
  bool _darkModeEnabled;
  bool get darkModeEnabled => _darkModeEnabled ?? getDarkModeEnabled() ?? false;
  String _userToken;
  String get userToken => _userToken ?? getToken();

  PersistentStorage(this._prefs);

  String getLocale() {
    return _localeCode = _prefs.getString(_localeField);
  }

  void setLocale(String locale) {
    _prefs.setString(_localeField, _localeCode = locale);
  }

  bool getDarkModeEnabled() {
    return _darkModeEnabled = _prefs.getBool(_darkModeEnabledField);
  }

  void setDarkModeEnabled(bool enabled) {
    _prefs.setBool(_darkModeEnabledField, _darkModeEnabled = enabled);
  }

  String getToken() {
    return _userToken = _prefs.getString(_userTokenField);
  }

  void setToken(String token) {
    _prefs.setString(_userTokenField, _userToken = token);
  }
}