import 'package:epasal/provider/provider_products.dart';
import 'package:epasal/screens/product_details.dart';
import 'package:epasal/screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-Pasal",
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.red,
          fontFamily: "Lato",
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.routId: (context) => ProductOverviewScreen(),
          ProductDetails.routId: (context) => ProductDetails(),
        },
      ),
    );
  }
}
