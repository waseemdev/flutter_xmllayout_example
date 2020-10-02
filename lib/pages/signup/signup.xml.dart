import 'signup.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  
  SignupPage(
    
  );

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  SignupController ctrl;
  PageController pageController;
  

  @override
  void initState() {
    super.initState();
    ctrl = new SignupController();
    ctrl._pageController = pageController = new PageController();
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
          _pipeProvider.transform(context, "translate", 'signup', []),
        ),
      ),
      body: Center(
        child: PageView(
          controller: ctrl.pageController,
          children: [
            Form(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 40, 12, 12),
                  child: Column(
                    children: [
                      AnimationBuilder(
                        autoTrigger: true,
                        cycles: 5,
                        duration: Duration(milliseconds: 1000),
                        tweenMap: {
                          "height": Tween<double>(begin: 100, end: 150),
                          "width": Tween<double>(begin: 100, end: 200),
                          "color": ColorTween(begin: Colors.blue, end: Colors.red)
                        },
                        builderMap: (Map<String, Animation> animations, Widget child) {
                          return Container(
                            color: animations["color"].value,
                            height: animations["height"].value,
                            width: animations["width"].value,
                          );
                        },
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
                              StreamBuilder(
                                initialData: ctrl.formGroup.get('confirmPassword').value,
                                stream: ctrl.formGroup.get('confirmPassword').valueStream,
                                builder: (BuildContext context, ctrlFormGroupGetConfirmPasswordValueStreamSnapshot) {
                                  return TextField(
                                    controller: ctrl._attachController(ctrl.formGroup, 'confirmPassword', () => TextEditingController()),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                      enabledBorder: InputBorder.none,
                                      errorText: (_pipeProvider.transform(context, "translate", ctrl.formGroup.get('confirmPassword').firstErrorIfTouched, [])) ?? ctrl.formGroup.invalid ? (_pipeProvider.transform(context, "translate", ctrl.formGroup.getError(), [])) : null,
                                      labelText: 'Consfirm password',
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Register',
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
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'signup result',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return __widget;
  }
}

class SignupControllerBase {
  bool _loaded = false;
  PageController _pageController;
  PageController get pageController => _pageController;
  final formGroup = new FormGroup();
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
  

  @mustCallSuper
  void dispose() {
    pageController.dispose();
    formGroup.dispose();
  }
}