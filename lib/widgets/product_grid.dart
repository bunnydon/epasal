import 'package:epasal/provider/provider_products.dart';
import 'package:epasal/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Products>(context).items;
    return GridView.builder(
      itemCount: loadedproducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          value: loadedproducts[i],
          child: ProductItem(),
        );
      },
    );
  }
}
