import 'package:flutter/material.dart';
import 'package:newtest/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

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
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart=CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl5.color(context.theme.backgroundColor).make(),
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

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index)=>ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: (){},
        ),
        // title: '_cart.items[index].name'.text.make(),
        title: 'Title name not working'.text.make(),
      ),
    );
  }
}


