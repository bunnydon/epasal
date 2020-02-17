import 'package:epasal/provider/provider_products.dart';
import 'package:flutter/material.dart';
import 'package:epasal/model/product.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  static const String routId = "/product_details_screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    // we get single products from the provider
    final loadedProduct =
        Provider.of<Products>(context).items.firstWhere((prod) {
      return prod.id == id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
