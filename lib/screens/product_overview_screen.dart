import 'package:epasal/model/product.dart';
import 'package:epasal/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedproducts = [
    Product(
        id: "first",
        title: "tshirt",
        price: 2000,
        description: "onepiece tshirt ",
        imageURL:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYQSrXyw3qOQ0aUWts8NjCHO6A6BQHCgBeb8qr6dcogO0oPqMD.jpg",
        isFavourite: false),
    Product(
        id: "first",
        title: "watch",
        price: 2000,
        description: "onepeice watch ",
        imageURL:
            "https://superbrass.com/194-thickbox_default/onepiece-one-piece-classic-manga-wrist-watch.jpg",
        isFavourite: false),
    Product(
        id: "first",
        title: "shoes",
        price: 2000,
        description: "onepiece shoes ",
        imageURL:
            "https://ae01.alicdn.com/kf/HTB1Z7pNjQZmBKNjSZPiq6xFNVXaI.jpg",
        isFavourite: false),
    Product(
        id: "first",
        title: " onepiece mobile cover",
        price: 2000,
        description: "onepiece cover ",
        imageURL:
            "https://ae01.alicdn.com/kf/Hde9cc647b6e1478e8b6646a24039d6f97/For-iphone-8-XS-11-Pro-MAX-case-silicone-cover-Roronoa-Zoro-One-Piece-Luffy-Phone.jpg",
        isFavourite: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Pasal",
        ),
      ),
      body: GridView.builder(
        itemCount: loadedproducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, i) {
          return ProductItem(
            loadedproducts[i].title,
            loadedproducts[i].price,
            loadedproducts[i].imageURL,
          );
        },
      ),
    );
  }
}
