import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'pipes/FormatCurrency.dart';
import 'pipes/FormatDate.dart';
import 'pipes/Translate.dart';
import 'services/AuthService.dart';
import 'services/DataService.dart';
import 'services/LocaleChanger.dart';
import 'services/PersistentStorage.dart';
import 'services/ThemeChanger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();
  final _prefs = await SharedPreferences.getInstance();

  final persistentStorage = PersistentStorage(_prefs);
  final authService = AuthService(persistentStorage);
  authService.coldLogin();

  runApp(
    MultiProvider(
      //
      // registering dependencies
      //
      providers: [
        Provider<RouteObserver<Route>>.value(value: routeObserver),
        Provider<PipeProvider>(create: (context) => _createPipeProvider()),
        Provider<PersistentStorage>.value(value: persistentStorage),
        ChangeNotifierProvider<LocaleChanger>(create: (_) => LocaleChanger(persistentStorage)),
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(persistentStorage)),
        Provider<AuthService>.value(value: authService),
        Provider<DataService>(create: (_) => DataService()),
      ],
      child: MyApp(routeObserver: routeObserver)
    )
  );
}

PipeProvider _createPipeProvider() {
  final PipeProvider pipeProvider = PipeProvider();

  //
  // registering pipes
  //
  pipeProvider.register(TranslatePipe());
  pipeProvider.register(FormatDatePipe());
  pipeProvider.register(FormatCurrencyPipe());

  return pipeProvider;
}
