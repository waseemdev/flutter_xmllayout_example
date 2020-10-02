import 'package:flutter_xmllayout_example/services/LocaleChanger.dart';
import 'package:flutter_xmllayout_example/services/ThemeChanger.dart';
import 'settings.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  
  SettingsPage(
    
  );

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with RouteAware {
  SettingsController ctrl;
  ThemeChanger themeChanger;
  LocaleChanger localeChanger;
  RouteObserver<Route> _routeObserver;
  
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    ctrl.didPopNext();
  }

  // Called when the current route has been pushed.
  void didPush() {
    ctrl.didPush();
  }

  // Called when the current route has been popped off.
  void didPop() {
    ctrl.didPop();
  }

  // Called when a new route has been pushed, and the current route is no longer visible.
  void didPushNext() {
    ctrl.didPushNext();
  }

  @override
  void initState() {
    super.initState();
    ctrl = new SettingsController();
    WidgetsBinding.instance.addPostFrameCallback((_) => ctrl.afterFirstBuild(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver = Provider.of<RouteObserver<Route>>(context)..subscribe(this, ModalRoute.of(context));
    ctrl._themeChanger = themeChanger = Provider.of<ThemeChanger>(context);
    ctrl._localeChanger = localeChanger = Provider.of<LocaleChanger>(context);
    ctrl._load(context);
  }

  @override
  void dispose() {
    ctrl.dispose();
    _routeObserver.unsubscribe(this);
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final _pipeProvider = Provider.of<PipeProvider>(context);
    final __widget = Scaffold(
      appBar: AppBar(
        title: Text(
          _pipeProvider.transform(context, "translate", 'settings', []),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder(
            initialData: ctrl.formGroup.get('darkModeEnabled').value,
            stream: ctrl.formGroup.get('darkModeEnabled').valueStream,
            builder: (BuildContext context, ctrlFormGroupGetDarkModeEnabledValueStreamSnapshot) {
              final ctrlFormGroupGetDarkModeEnabledValueStreamValue = ctrlFormGroupGetDarkModeEnabledValueStreamSnapshot.data;
              return SwitchListTile(
                onChanged: (value) => ctrl.formGroup.get('darkModeEnabled').value = value,
                value: ctrlFormGroupGetDarkModeEnabledValueStreamValue,
                title: Text(
                  'Dark Mode',
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Language',
            ),
            trailing: DropdownButtonHideUnderline(
              child: StreamBuilder(
                initialData: ctrl.formGroup.get('selectedLocale').value,
                stream: ctrl.formGroup.get('selectedLocale').valueStream,
                builder: (BuildContext context, ctrlFormGroupGetSelectedLocaleValueStreamSnapshot) {
                  final ctrlFormGroupGetSelectedLocaleValueStreamValue = ctrlFormGroupGetSelectedLocaleValueStreamSnapshot.data;
                  return DropdownButton(
                    onChanged: (value) => ctrl.formGroup.get('selectedLocale').value = value,
                    value: ctrlFormGroupGetSelectedLocaleValueStreamValue,
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(
                          'العربية',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          'English',
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
    return __widget;
  }
}

class SettingsControllerBase {
  bool _loaded = false;
  final formGroup = new FormGroup();
  ThemeChanger _themeChanger;
  ThemeChanger get themeChanger => _themeChanger;
  LocaleChanger _localeChanger;
  LocaleChanger get localeChanger => _localeChanger;

  void _load(BuildContext context) {
    if (!_loaded) {
      _loaded = true;
      didLoad(context);
    }
    
    onBuild(context);
  }

  void didLoad(BuildContext context) {
  }

  void onBuild(BuildContext context) {
  }

  void afterFirstBuild(BuildContext context) {
  }
  
  void didPopNext() {
  }

  void didPush() {
  }

  void didPop() {
  }

  void didPushNext() {
  }

  @mustCallSuper
  void dispose() {
    formGroup.dispose();
  }
}