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
  static const String routId = "Product_Overview_Screen";

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
            title: loadedproducts[i].title,
            imgUrl: loadedproducts[i].imageURL,
            price: loadedproducts[i].price,
            id: loadedproducts[i].id,
          );
        },
      ),
    );
  }
}
