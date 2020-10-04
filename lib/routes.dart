import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/ItemModel.dart';
import 'pages/home/home.xml.dart';
import 'pages/item/item.xml.dart';
import 'pages/list/list.xml.dart';
import 'pages/signup/signup.xml.dart';
import 'pages/login/login.xml.dart';
import 'pages/settings/settings.xml.dart';
import 'pages/tabs/tabs.xml.dart';

getRoute(RouteSettings settings) {
	switch (settings.name) {
		case '/login':
			return MaterialPageRoute(builder: (context) => LoginPage());
		case '/signup':
			return MaterialPageRoute(builder: (context) => SignupPage());
		case '/tabs':
			return MaterialPageRoute(builder: (context) => TabsPage());
		case '/settings':
			return MaterialPageRoute(builder: (context) => SettingsPage());
		case '/list':
			return MaterialPageRoute(builder: (context) => ListPage());
		case '/item':
			//	use PageRouteBuilder for custom route animation
			return PageRouteBuilder(
				pageBuilder: (context, animation, secondaryAnimation) {
					return ItemPage(item: settings.arguments as ItemModel, animation: animation);
				},
				transitionDuration: Duration(milliseconds: 600)
			);
			// return MaterialPageRoute(builder: (context) => ItemPage(item: settings.arguments as ItemModel));
	}
	return MaterialPageRoute(builder: (context) => HomePage());
}