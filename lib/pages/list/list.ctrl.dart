import 'package:flutter/widgets.dart';
import 'package:flutter_xmllayout_example/models/ItemModel.dart';
import 'list.xml.dart';

class ListController extends ListControllerBase {
  List<ItemModel> items = [];
  bool _hasMore = true;
  int _page = 0;


  bool hasMore() {
    return _hasMore;
  }

  Future loadMore() async {
    final res = await dataService.loadItems(++_page);
    if (res.length == 0) {
      _hasMore = false;
    }
    items.addAll(res);
  }

  int getItemCount() {
    return items.length;
  }

  Future refreshData() async {
    _page = 0;
    items = await dataService.loadItems(_page);
  }

  gotoItem(ItemModel item, context) {
    Navigator.of(context).pushNamed('/item', arguments: item);
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