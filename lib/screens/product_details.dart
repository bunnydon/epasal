import 'package:cached_network_image/cached_network_image.dart';
import 'package:epasal/provider/provider_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  static const String routId = "/product_details_screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    // we get single products from the provider
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: CachedNetworkImage(
                imageUrl: loadedProduct.imageURL,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              loadedProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
