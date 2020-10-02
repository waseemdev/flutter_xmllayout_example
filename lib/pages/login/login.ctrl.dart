import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:rxdart/rxdart.dart';
import 'login.xml.dart';

class LoginController extends LoginControllerBase {
  final errorMessage = BehaviorSubject.seeded('');
  BuildContext _context;

  LoginController() {
    formGroup.addAll([
      FormControl('email', '', validators: [Validators.required]),
      FormControl('password', '', validators: [Validators.required, FnValidator(_validatePassword)]),
    ]);
    formGroup.onSubmit(_login);
  }

  String _validatePassword(value) {
    if (value == null || value.toString().isEmpty) {
      return null; // Validators.required will handle it
    }

    if (value.toString().length < 8) {
      return 'validations/password-length';
    }
    
    return null; // no errors
  }
  
  Future _login(dynamic data) async {
    // call validate method only if you are not using formGroup.onSubmit & :formSubmit directive
    // await formGroup.validate();
    // if (!formGroup.valid) {
    //   return;
    // }

    final result = await authService.login(data['email'], data['password']);
    if (result.succeeded) {
      Navigator.of(_context).pop();
    }
    else {
      errorMessage.value = result.error;
    }
  }

  @override
  void didLoad(BuildContext context) {
  }

  @override
  void onBuild(BuildContext context) {
    _context = context;
  }

  @override
  void afterFirstBuild(BuildContext context) {
  }

  @override
  void dispose() {
    super.dispose();
    errorMessage.close();
  }
}