import 'package:flutter/material.dart';
import 'package:newtest/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  Item catalog;
  AddToCart({Key? key,required this.catalog}) : super(key: key);
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[AddMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
    //final CatalogModel _catalog=(VxState.store as MyStore).catalog;
    bool isInCart=_cart.items.contains(catalog);
    return ElevatedButton(
      onPressed:() {
        // isInCart=isInCart.toggle();
        // _cart.catalog=_catalog;
        // _cart.add(catalog);
        AddMutation(catalog);
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
      ),
      child: isInCart? const Icon(Icons.done):const Icon(Icons.add),
    );
  }
}