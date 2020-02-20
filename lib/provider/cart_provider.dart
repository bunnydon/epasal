import 'package:flutter/material.dart';

class CartItems with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItems(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItems> _items = {};

  Map<String, CartItems> get items {
    return _items;
  }

  //this gives us total items in the cart
  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  void addToCart(
    String productId,
    String title,
    double price,
  ) {
    if (_items.containsKey(productId)) {
      //update the current item ko quantity
      _items.update(
          productId,
          (existingCardItems) => CartItems(
                id: existingCardItems.id,
                title: existingCardItems.title,
                price: existingCardItems.price,
                quantity: existingCardItems.quantity + 1,
              ));
    } else {
      //if no item then add item to cart
      _items.putIfAbsent(
          productId,
          () => CartItems(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
