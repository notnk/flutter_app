import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  Item catalog;
  AddToCart({Key? key,required this.catalog}) : super(key: key);
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(catalog);
    return ElevatedButton(
      onPressed:() {
        isInCart=isInCart.toggle();
        CatalogModel  _catalog = CatalogModel();
        _cart.catalog=_catalog;
        _cart.add(catalog);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
      ),
      child: isInCart? const Icon(Icons.done):const Icon(Icons.add),
    );
  }
}
