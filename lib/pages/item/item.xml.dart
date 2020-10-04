import 'package:flutter_xmllayout_example/models/ItemModel.dart';
import 'item.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final ItemModel item;
  final Animation<double> animation;
  ItemPage({
    @required this.item,
    this.animation
  });

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  ItemPageController ctrl;
  

  @override
  void initState() {
    super.initState();
    ctrl = new ItemPageController();
    ctrl._item = widget.item;
    ctrl._animation = widget.animation;
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
          _pipeProvider.transform(context, "translate", 'item', []),
        ),
      ),
      body: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.item.imageUrl + widget.item.id.toString(),
              child: Image.network(
                widget.item.imageUrl,
                fit: BoxFit.cover,
                height: 400,
                width: _pipeProvider.transform(context, "widthPercent", 100, []),
              ),
            ),
            AnimatedBuilder(
              animation: widget.animation,
              builder: (context, child) {
                return SlideTransition(
                  position: ctrl.animatePosition(),
                  child: Container(
                    color: Colors.grey.shade300,
                    height: 80,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: _pipeProvider.transform(context, "widthPercent", 100, []),
                    child: Center(
                      child: Text(
                        widget.item.title,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
    return __widget;
  }
}

class ItemPageControllerBase {
  bool _loaded = false;
  ItemModel _item;
  ItemModel get item => _item;
  Animation<double> _animation;
  Animation<double> get animation => _animation;

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