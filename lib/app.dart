import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_xmllayout_example/routes.dart';
import 'package:provider/provider.dart';

import 'i18n/gen/delegate.dart';
import 'pages/home/home.xml.dart';
import 'services/LocaleChanger.dart';
import 'services/ThemeChanger.dart';

class MyApp extends StatelessWidget {

  const MyApp({
    Key key,
    this.routeObserver
  }) : super(key: key);

  final RouteObserver<PageRoute> routeObserver;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localeChanger = Provider.of<LocaleChanger>(context);
    final themeChanger = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      navigatorObservers: [routeObserver],
      title: 'Flutter Demo',
      
      //
      // theme
      //
      theme: themeChanger.theme,
      
      //
      // localization
      //
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate()
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: localeChanger.locale,

      //
      // routing
      //
      onGenerateRoute: (RouteSettings settings) {
				return getRoute(settings);
      },

      home: HomePage(),
    );
  }
}
