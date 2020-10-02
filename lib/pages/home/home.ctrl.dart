import 'package:flutter/widgets.dart';
import 'home.xml.dart';

class HomeController extends HomeControllerBase {

  gotoLogin(context) {
    Navigator.of(context).pushNamed('/login');
  }
  
  gotoList(context) {
    Navigator.of(context).pushNamed('/list');
  }
  
  gotoSignup(context) {
    Navigator.of(context).pushNamed('/signup');
  }
  
  gotoSettings(context) {
    Navigator.of(context).pushNamed('/settings');
  }
  
  gotoTabs(context) {
    Navigator.of(context).pushNamed('/tabs');
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
  }
}