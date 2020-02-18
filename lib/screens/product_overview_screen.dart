import 'package:epasal/widgets/product_grid.dart';

import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const String routId = "Product_Overview_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Pasal",
        ),
        centerTitle: true,
      ),
      body: ProductGrid(),
    );
  }
}
