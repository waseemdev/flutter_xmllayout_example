import 'home.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  
  HomePage(
    
  );

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController ctrl;
  

  @override
  void initState() {
    super.initState();
    ctrl = new HomeController();
    WidgetsBinding.instance.addPostFrameCallback((_) => ctrl.afterFirstBuild(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ctrl._load(context);
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final _pipeProvider = Provider.of<PipeProvider>(context);
    final __widget = Scaffold(
      appBar: AppBar(
        title: Text(
          _pipeProvider.transform(context, "translate", 'home', []),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SizedBox(
              width: _pipeProvider.transform(context, "widthPercent", 100, []),
              child: RaisedButton(
                onPressed: () => ctrl.gotoLogin(context),
                child: Text(
                  _pipeProvider.transform(context, "translate", 'login', []),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SizedBox(
              width: _pipeProvider.transform(context, "widthPercent", 75, []),
              child: RaisedButton(
                onPressed: () => ctrl.gotoSignup(context),
                child: Text(
                  _pipeProvider.transform(context, "translate", 'signup', []),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SizedBox(
              width: _pipeProvider.transform(context, "widthPercent", 100, []),
              child: RaisedButton(
                onPressed: () => ctrl.gotoList(context),
                child: Text(
                  _pipeProvider.transform(context, "translate", 'list', []),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SizedBox(
              width: _pipeProvider.transform(context, "widthPercent", 75, []),
              child: RaisedButton(
                onPressed: () => ctrl.gotoSettings(context),
                child: Text(
                  _pipeProvider.transform(context, "translate", 'settings', []),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: SizedBox(
              width: _pipeProvider.transform(context, "widthPercent", 75, []),
              child: RaisedButton(
                onPressed: () => ctrl.gotoTabs(context),
                child: Text(
                  _pipeProvider.transform(context, "translate", 'tabs', []),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return __widget;
  }
}

class HomeControllerBase {
  bool _loaded = false;
  

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
  

  @mustCallSuper
  void dispose() {
    
  }
}