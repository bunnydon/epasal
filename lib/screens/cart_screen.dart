import 'package:epasal/provider/cart_provider.dart' show Cart;
import 'package:epasal/provider/order_provider.dart';
import 'package:epasal/screens/order_screen.dart';
import 'package:epasal/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routId = "/cart_screen";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      "\$${cart.totalAmount}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      order.addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clearCart();
                      Navigator.pushNamed(context, OrderScreen.routeId);
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (context, i) => CartItem(
                      id: cart.items.values.toList()[i].id,
                      title: cart.items.values.toList()[i].title,
                      productId: cart.items.keys.toList()[i],
                      price: cart.items.values.toList()[i].price,
                      quantity: cart.items.values.toList()[i].quantity,
                    )),
          )
        ],
      ),
    );
  }
}
