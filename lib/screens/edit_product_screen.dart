import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeId = '/edit_product_screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusedNode = FocusNode();
  final _desFocusedNode = FocusNode();
  final _imageurlFocusedNode = FocusNode();
  final _imageurlController = TextEditingController();

  // to clean off the unwanted widgets
  @override
  void dispose() {
    _priceFocusedNode.dispose();
    _desFocusedNode.dispose();
    _imageurlFocusedNode.dispose();
    _imageurlController.dispose();
    super.dispose();
  }

  //-- the function called when our screen is created
  @override
  void initstate() {
    _imageurlFocusedNode.addListener(_updateImageUrl);
    super.initState();
  }

  //------- to ypdate image in the container after user enter the new image url
  void _updateImageUrl() {
    if (!_imageurlFocusedNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusedNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_desFocusedNode);
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusedNode,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
                textInputAction: TextInputAction.next,
                focusNode: _desFocusedNode,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: _imageurlController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(_imageurlController.text),
                              fit: BoxFit.cover,
                            )),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Image URL',
                      ),
                      focusNode: _imageurlFocusedNode,
                      controller: _imageurlController,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
