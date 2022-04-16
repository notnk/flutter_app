import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key,required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:const IconThemeData(color: Colors.black)
      ),
      bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            '\$${catalog.price}'.text.xl5.color(Colors.red).make(),
            AddToCart(catalog:catalog).wh(120, 50),
          ],
        ).p32(),
      backgroundColor: Colors.brown[50],
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              child: Image.network(catalog.image),
              tag: Key(catalog.id.toString()),
            ).p32().h32(context),
            Expanded(
                child: VxArc(
                  height: 30,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl5.color(Colors.purpleAccent).bold.make(),
                        catalog.desc.text.lg.make(),
                        10.heightBox,
                        'this is just a dummy text this has no meaning, related to the actual product whatsoever. This senstense will be copied and pasted many times to make it an paragraph.this is just a dummy text this has no meaning, related to the actual product whatsoever. This senstense will be copied and pasted many times to make it an paragraph.this is just a '
                            .text.make().p16(),
                      ],
                    ).py64(),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
