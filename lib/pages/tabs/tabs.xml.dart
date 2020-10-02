import 'tabs.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatefulWidget {
  
  TabsPage(
    
  );

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with TickerProviderStateMixin {
  TabsPageController ctrl;
  TabController tabController;
  

  @override
  void initState() {
    super.initState();
    ctrl = new TabsPageController();
    ctrl._tabController = tabController = TabController(length: 3, vsync: this);
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
          _pipeProvider.transform(context, "translate", 'tabs', []),
        ),
      ),
      body: TabBarView(
        controller: ctrl.tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
                child: Text(
                  'page 1',
                ),
              ),
              RaisedButton(
                onPressed: () => ctrl.selectTab(1),
                child: Text(
                  'Goto 2',
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
                child: Text(
                  'page 2',
                ),
              ),
              RaisedButton(
                onPressed: () => ctrl.selectTab(2),
                child: Text(
                  'Goto 3',
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 0),
                child: Text(
                  'page 3',
                ),
              ),
              RaisedButton(
                onPressed: () => ctrl.selectTab(0),
                child: Text(
                  'Back to 1',
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 8,
        child: TabBar(
          controller: ctrl.tabController,
          onTap: (i) => ctrl.selectTab(i),
          tabs: [
            Tab(
              icon: StreamBuilder(
                initialData: ctrl.selectedTab.value,
                stream: ctrl.selectedTab,
                builder: (BuildContext context, ctrlSelectedTabSnapshot) {
                  final ctrlSelectedTabValue = ctrlSelectedTabSnapshot.data;
                  if (ctrlSelectedTabValue == null) {
                    return Container(width: 0, height: 0);
                  }
                  return Icon(
                    Icons.home,
                    color: (ctrlSelectedTabValue) == 0 ? Colors.blue : Colors.grey,
                  );
                },
              ),
            ),
            Tab(
              icon: StreamBuilder(
                initialData: ctrl.selectedTab.value,
                stream: ctrl.selectedTab,
                builder: (BuildContext context, ctrlSelectedTabSnapshot) {
                  final ctrlSelectedTabValue = ctrlSelectedTabSnapshot.data;
                  if (ctrlSelectedTabValue == null) {
                    return Container(width: 0, height: 0);
                  }
                  return Icon(
                    Icons.widgets,
                    color: (ctrlSelectedTabValue) == 1 ? Colors.blue : Colors.grey,
                  );
                },
              ),
            ),
            Tab(
              icon: StreamBuilder(
                initialData: ctrl.selectedTab.value,
                stream: ctrl.selectedTab,
                builder: (BuildContext context, ctrlSelectedTabSnapshot) {
                  final ctrlSelectedTabValue = ctrlSelectedTabSnapshot.data;
                  if (ctrlSelectedTabValue == null) {
                    return Container(width: 0, height: 0);
                  }
                  return Icon(
                    Icons.info,
                    color: (ctrlSelectedTabValue) == 2 ? Colors.blue : Colors.grey,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    return __widget;
  }
}

class TabsPageControllerBase {
  bool _loaded = false;
  TabController _tabController;
  TabController get tabController => _tabController;

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