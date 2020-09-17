import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imgUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imgUrl,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductsProvider with ChangeNotifier {
  List<Product> _products = [
    Product(

      id: 'p1',
      title: '1960s Dress',
      description: 'Vintage 1960s Dress',
      price: 59.99,
      imgUrl: "assets/images/wdress.jpg",
    ),
    Product(

      id: 'p2',
      title: 'Florish Dress',
      description: 'A Florish Dress - it is pretty Florish',
      price: 29.99,
      imgUrl: "assets/images/dressf.jpg",
    ),
    Product(
      id: 'p3',
      title: '1950s Dress',
      description: 'vintage 1950s Dress - Polka Dot',
      price: 19.99,
      imgUrl: "assets/images/pdress.jpg",
    ),
    Product(
      id: 'p4',
      title: '1950s Dress',
      description: 'Sweet 1950s black pique cotton new look day dress with red rose buds',
      price: 49.99,
      imgUrl: "assets/images/bdress.jpg",
    ),
  ];
  List<Product> get products {
    return [..._products];
  }

  List<Product> get favorites {
    return _products.where((productItems) => productItems.isFavorite).toList();
  }

  Product findById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void addProduct({String id, String title, double price, String image, String description}) {
    _products.add(Product(id: id , title: title, price: price, imgUrl: image, description: description));
    notifyListeners();
  }

  void removeOneItem(String id) {
    _products.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

}
