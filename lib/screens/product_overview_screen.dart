import 'package:epasal/provider/cart_provider.dart';
import 'package:epasal/screens/cart_screen.dart';
import 'package:epasal/widgets/badge.dart';
import 'package:epasal/widgets/product_grid.dart';
import 'package:epasal/widgets/app_drawer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  static const String routId = "Product_Overview_Screen";

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Pasal",
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    //show fav
                    _showFavourites = true;
                  } else {
                    //else not show fav
                    _showFavourites = false;
                  }
                });
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: FilterOptions.Favourites,
                      child: Text("Show Favourites"),
                    ),
                    PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text("Show All"),
                    )
                  ]),
          Consumer<Cart>(
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routId);
                },
              ),
              builder: (_, cart, child) {
                return Badge(
                  child: child,
                  value: cart.itemCount.toString(),
                );
              })
        ],
      ),
      body: ProductGrid(_showFavourites),
      drawer: AppDrawer(),
    );
  }
}
