import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'tabs.xml.dart';

class TabsPageController extends TabsPageControllerBase {
	final selectedTab = BehaviorSubject.seeded(0);

	selectTab(i) {
		tabController.animateTo(i);
		selectedTab.value = i;
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
		selectedTab.close();
  }
}