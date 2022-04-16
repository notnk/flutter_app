import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatefulWidget {
  Item catalog;
  AddToCart({Key? key,required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart=_cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed:() {
        isInCart=isInCart.toggle();
        CatalogModel  _catalog = CatalogModel();
        _cart.catalog=_catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
      ),
      child: isInCart? const Icon(Icons.done):const Icon(Icons.add),
    );
  }
}
