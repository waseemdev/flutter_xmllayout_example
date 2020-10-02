import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  String getTranslation(String key) {
    final lang = _localizedValues[locale.languageCode];
    if (lang != null) {
      return lang[key];
    }
    return null;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    "ar": {
      "home": "الرئيسية",
      "login": "تسجيل دخول",
      "signup": "إنشاء حساب",
      "settings": "إعدادات",
      "list": "List page",
      "item": "Detail page",
      "Tabs": "Tabs page",
      "validations/password-length": "Passwords must be 8 charachter at least",
      "validations/password-not-match": "Passwords don't match",
      "validations/invalid-email": "Invalid email address",
      "required": "Required field"
    },
    "en": {
      "home": "Home",
      "login": "Login",
      "signup": "Signup",
      "settings": "Settings",
      "list": "List page",
      "item": "Detail page",
      "Tabs": "Tabs page",
      "validations/password-length": "Passwords must be 8 charachter at least",
      "validations/password-not-match": "Passwords don't match",
      "validations/invalid-email": "Invalid email address",
      "required": "Required field"
    }
  };
}