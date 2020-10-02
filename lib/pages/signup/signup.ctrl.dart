import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:rxdart/rxdart.dart';
import 'signup.xml.dart';

class SignupController extends SignupControllerBase {
  final errorMessage = BehaviorSubject.seeded('');

  SignupController() {
    formGroup.addAll([
      FormControl('email', '', validators: [Validators.required, FnValidator(_validateEmail)]),
      FormControl('password', '', validators: [Validators.required, FnValidator(_validatePassword)]),
      FormControl('confirmPassword', '', validators: [Validators.required]),
    ]);
    formGroup.onSubmit(_login);
    formGroup.setValidator(FnValidator(_validatePasswords));
  }

  String _validateEmail(value) {
    if (value == null || value.toString().isEmpty) {
      return null; // Validators.required will handle it
    }

    final valid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value);
    if (!valid) {
      return 'validations/invalid-email';
    }
    
    return null; // no errors
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

  String _validatePasswords(value) {
    // don't validate if the inputs wasn't touched
    if (!formGroup.get('password').touched || !formGroup.get('confirmPassword').touched) {
      return null;
    }

    if (value['password'] != value['confirmPassword']) {
      return 'validations/password-not-match';
    }
    
    return null; // no errors
  }
  
  Future _login(dynamic data) async {
    // call validate method only if you are not using formGroup.onSubmit & :formSubmit directive
    // await formGroup.validate();
    // if (!formGroup.valid) {
    //   return;
    // }

    // 
    // final result = await authService.regsiter(data['email'], data['password'], data['confirmPassword']);
    await Future.delayed(Duration(seconds: 1));

    pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  void didLoad(BuildContext context) {
  }

  @override
  void onBuild(BuildContext context) {
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