import 'package:epasal/provider/provider_products.dart';
import 'package:epasal/screens/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductItems extends StatelessWidget {
  final String title;
  final String imageURL;
  final String id;

  UserProductItems(this.title, this.imageURL, this.id);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.pushNamed(context, EditProductScreen.routeId,
                    arguments: id);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.grey,
              onPressed: () {
                Provider.of<Products>(context, listen: false).deleteProduct(id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
