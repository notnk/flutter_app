import 'package:flutter/material.dart';
import 'package:newtest/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: 'Cart'.text.xl5.make(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartModel _cart=(VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              mutations: const {RemoveMutation},
              notifications: const {},
              builder: (context,_)=>
                return "\$${_cart.totalPrice}".text.xl5.
                color(context.theme.backgroundColor).
                make();
              ,
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "cant buy".text.make()));
            },
            child: "BUY".text.make(),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(context.theme.backgroundColor)
            // ),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  final CartModel _cart=(VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty?"nothing to show".text.xl5.makeCentered():ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index)=>ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: (){
              _cart.remove(_cart.items[index]);
            },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}


