import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key,required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme:const IconThemeData(color: Colors.white)
      ),
      bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            '\$${catalog.price}'.text.xl5.color(Colors.red).make(),
            ElevatedButton(
              onPressed:() {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
              ),
              child: "Add to cart".text.make(),
            ).wh(120,50),
          ],
        ).p32(),
      backgroundColor: Colors.black,
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
