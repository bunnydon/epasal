import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: "first",
        title: "tshirt",
        price: 2000,
        description: "onepiece tshirt ",
        imageURL:
            "https://geekbeholder-production.s3.amazonaws.com/product/picture/luffy-picking-his-nose-one-piece-t-shirt-large.jpg",
        isFavourite: false),
    Product(
        id: "second",
        title: "watch",
        price: 2000,
        description: "onepeice watch ",
        imageURL:
            "https://images-na.ssl-images-amazon.com/images/I/612u0j-lWIL._AC_SX425_.jpg",
        isFavourite: false),
    Product(
        id: "third",
        title: "shoes",
        price: 2000,
        description: "onepiece shoes ",
        imageURL:
            "https://d2a2wjuuf1c30f.cloudfront.net/product_photos/45471320/l_20(2)_original.jpg",
        isFavourite: false),
    Product(
        id: "four",
        title: " onepiece mobile cover",
        price: 2000,
        description: "onepiece cover ",
        imageURL:
            "https://picture-cdn.wheretoget.it/342a5h-l-610x610-phone+cover-cartoon-anime-piece-iphone+cover-iphone+case-iphone-iphone+4+case-iphone+4s-iphone+5+case-iphone+5s-iphone+5c-iphone+6+case-iphone+6+plus-iphone+6s+plus+cases-iphone+6s.jpg",
        isFavourite: false),
  ];

  //this returns all the item of the product
  List<Product> get items {
    return [..._items];
  }

  //this returns only the favourites products
  List<Product> get favourites {
    return _items.where((prodItem) {
      return prodItem.isFavourite;
    }).toList();
  }

  //this returns particular items from the id
  Product findById(String id) {
    return items.firstWhere((prod) {
      return prod.id == id;
    });
  }

  Future<void> addProduct(Product product) {
    const url = "https://epasal-62e88.firebaseio.com/products.json";
//    const test = "http://ip.jsontest.com";
//    http.Response response = await http.get(test);
    //print (response.statuscode);
//    http.get(url);

    return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'price': product.price,
              'description': product.description,
              'isFavourite': product.isFavourite,
            }))
        //then uses future after posting on url other things are executed
        .then((response) {
      print(json.decode(response.body));

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        price: product.price,
        description: product.description,
        imageURL: product.imageURL,
      );
      _items.insert(0, newProduct);
      notifyListeners();
      //if we get an error during the post we catch errors and post accordingly
    }).catchError((error) {
      print(error);
      throw error;
    });
  }

  //------------ this function updates the current product-----------
  void updateProduct(String id, Product upProduct) {
    final productIndex = _items.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _items[productIndex] = upProduct;
      notifyListeners();
    }
  }

  //------------ this function delete current product----------
  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
