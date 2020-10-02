import '../../services/AuthService.dart';
import 'login.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  
  LoginPage(
    
  );

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with RouteAware {
  LoginController ctrl;
  AuthService authService;
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
    ctrl = new LoginController();
    WidgetsBinding.instance.addPostFrameCallback((_) => ctrl.afterFirstBuild(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver = Provider.of<RouteObserver<Route>>(context)..subscribe(this, ModalRoute.of(context));
    ctrl._authService = authService = Provider.of<AuthService>(context);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 40, 12, 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 0),
                child: Icon(
                  Icons.home,
                  size: 80,
                ),
              ),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 6),
                  child: Column(
                    children: [
                      StreamBuilder(
                        initialData: ctrl.formGroup.get('email').value,
                        stream: ctrl.formGroup.get('email').valueStream,
                        builder: (BuildContext context, ctrlFormGroupGetEmailValueStreamSnapshot) {
                          return TextField(
                            controller: ctrl._attachController(ctrl.formGroup, 'email', () => TextEditingController()),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              enabledBorder: InputBorder.none,
                              errorText: _pipeProvider.transform(context, "translate", ctrl.formGroup.get('email').firstErrorIfTouched, []),
                              labelText: 'Email address',
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                        child: Divider(

                        ),
                      ),
                      StreamBuilder(
                        initialData: ctrl.formGroup.get('password').value,
                        stream: ctrl.formGroup.get('password').valueStream,
                        builder: (BuildContext context, ctrlFormGroupGetPasswordValueStreamSnapshot) {
                          return TextField(
                            controller: ctrl._attachController(ctrl.formGroup, 'password', () => TextEditingController()),
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                              enabledBorder: InputBorder.none,
                              errorText: _pipeProvider.transform(context, "translate", ctrl.formGroup.get('password').firstErrorIfTouched, []),
                              labelText: 'Password',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder(
                initialData: ctrl.formGroup.submitEnabled,
                stream: ctrl.formGroup.submitEnabledStream,
                builder: (BuildContext context, ctrlFormGroupSubmitEnabledStreamSnapshot) {
                  final ctrlFormGroupSubmitEnabledStreamValue = ctrlFormGroupSubmitEnabledStreamSnapshot.data;
                  return Disable(
                    event: ctrl.formGroup.submit,
                    value: !(ctrlFormGroupSubmitEnabledStreamValue),
                    builder: (BuildContext context, event) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: RaisedButton(
                          onPressed: event,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                              ),
                              Icon(
                                Icons.arrow_forward,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              StreamBuilder(
                initialData: ctrl.errorMessage.value,
                stream: ctrl.errorMessage,
                builder: (BuildContext context, ctrlErrorMessageSnapshot) {
                  final ctrlErrorMessageValue = ctrlErrorMessageSnapshot.data;
                  if (ctrlErrorMessageValue == null) {
                    return Container(width: 0, height: 0);
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      ctrlErrorMessageValue,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
    return __widget;
  }
}

class LoginControllerBase {
  bool _loaded = false;
  final formGroup = new FormGroup();
  AuthService _authService;
  AuthService get authService => _authService;
  Map<String, dynamic> _attachedControllers = Map();

  dynamic _attachController(FormGroup formGroup, String controlName, controllerBuilder) {
    if (_attachedControllers.containsKey(controlName)) {
      final controller = _attachedControllers[controlName];
      return controller;
    }
    final controller = controllerBuilder();
    _attachedControllers[controlName] = controller;
    formGroup.get(controlName).attachTextEditingController(controller);
    return controller;
  }

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