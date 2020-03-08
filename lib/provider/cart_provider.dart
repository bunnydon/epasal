import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
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
          (existingCardItems) => CartItem(
                id: existingCardItems.id,
                title: existingCardItems.title,
                price: existingCardItems.price,
                quantity: existingCardItems.quantity + 1,
              ));
    } else {
      //if no item then add item to cart
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  //this is used to remove items from the carts

  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

//this is used t calculate the total amount

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.quantity * cartItem.price;
    });
    return total;
  }

  //this removes all the items from the cart
  void clearCart() {
    _items = {};
    notifyListeners();
  }

  //This removes single item form cart
  void removeSingleItemFromCart(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(id, (existingCartItem) {
        return CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        );
      });
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }
}
