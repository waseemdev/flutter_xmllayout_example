import 'package:flutter/widgets.dart';
import 'item.xml.dart';

class ItemPageController extends ItemPageControllerBase {

	animatePosition() {
		return Tween<Offset>(
				begin: Offset(-1.1, 0),
				end: Offset(0, 0),
			).animate(
				CurvedAnimation(
					// curve: Curves.easeOutCubic,
					curve: Interval(.5, 1, curve: Curves.easeOutCubic),
					parent: animation,
				),
			);
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