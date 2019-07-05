import "package:flutter/material.dart";

class Products extends StatelessWidget{
  final List<String> products;

  Products(this.products) {
    print("Products widget constructor");
  } //Constructor of Product

  @override
  Widget build(BuildContext context) {
    print('[Products widget] build()');
    return Column(
      children: products
          .map(
            (element) => Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/myImage.jpg'),
              Text(element)
            ],
          ),
        ),
      )
          .toList(),
    );
  }
}