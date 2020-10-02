import 'package:flutter_xmllayout_example/models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xmllayout_helpers/flutter_xmllayout_helpers.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final ItemModel item;
  ItemPage({
    @required this.item
  });

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  
  

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.item.title,
              ),
            ),
          ],
        ),
      ),
    );
    return __widget;
  }
}