import 'package:flutter_xmllayout_example/models/ItemModel.dart';

class DataService {

  Future<List<ItemModel>> loadItems(int page) async {
    await Future.delayed(Duration(seconds: 1));

    // source: https://shibe.online/
    final images = [
      "https://cdn.shibe.online/shibes/98d0c554b013deca3e4fdc5b5ad190839f45afb5.jpg","https://cdn.shibe.online/shibes/4a07c8541ac693abe165366b6252006aeace2540.jpg","https://cdn.shibe.online/shibes/d3277191934648303826e6dd03aef45d37d7dfda.jpg","https://cdn.shibe.online/shibes/0a20baacdd012a7eddda02d86310aacb59f97792.jpg","https://cdn.shibe.online/shibes/8f675921917bceb7b6bb265e6b4714d2d06fa158.jpg","https://cdn.shibe.online/shibes/31dd5c6f22f0ba4f72c5b9c370ddda94bc46190a.jpg","https://cdn.shibe.online/shibes/7e580a4f1615c852ede081a1aedcc16e771d19d7.jpg","https://cdn.shibe.online/shibes/e50627e5876a72bcbdcfb53227c6d918b7d0e347.jpg","https://cdn.shibe.online/shibes/23a2a4ee1b272031caba1fa4358a60238464be61.jpg","https://cdn.shibe.online/shibes/a26096c3797c83134e1070ece11938be25b46897.jpg"
    ];
    
    return List.generate(10, (index) => 
        ItemModel(title: 'Item title #${index + 1 + page * 10}', imageUrl: images[index], id: index + page * 10),
      );
  }
}
