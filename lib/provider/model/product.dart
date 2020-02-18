import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageURL;
  bool isFavourite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.imageURL,
      this.price,
      this.isFavourite = false});

  void toggleIsFavourite() {
    isFavourite = !isFavourite;
  }
}
