import 'package:flutter_xmllayout_example/services/DataService.dart';
import 'package:flutter_xmllayout_example/components/InfiniteListView.dart';
import 'package:flutter_xmllayout_example/models/ItemModel.dart';
import 'list.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  
  ListPage(
    
  );

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListController ctrl;
  DataService dataService;
  

  @override
  void initState() {
    super.initState();
    ctrl = new ListController();
    WidgetsBinding.instance.addPostFrameCallback((_) => ctrl.afterFirstBuild(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ctrl._dataService = dataService = Provider.of<DataService>(context);
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
          _pipeProvider.transform(context, "translate", 'list', []),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ctrl.refreshData,
        child: InfiniteListView(
          hasMore: ctrl.hasMore,
          itemCount: ctrl.getItemCount,
          loadMore: ctrl.loadMore,
          physics: const AlwaysScrollableScrollPhysics(),
          bottomWidget: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
              child: SizedBox(
                height: 28,
                width: 28,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
          itemBuilder: (BuildContext context, int index) {
            final ItemModel item = ctrl.items == null || ctrl.items.length <= index || ctrl.items.length == 0 ? null : ctrl.items[index];
            return GestureDetector(
              onTap: () => ctrl.gotoItem(item, context),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: item.imageUrl + item.id.toString(),
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                        height: 180,
                        width: _pipeProvider.transform(context, "widthPercent", 100, []),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        item.title,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
    return __widget;
  }
}

class ListControllerBase {
  bool _loaded = false;
  DataService _dataService;
  DataService get dataService => _dataService;

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