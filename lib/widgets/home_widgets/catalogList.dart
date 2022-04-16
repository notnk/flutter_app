import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/home_detail_page.dart';
import 'add_to_cart.dart';
import 'catalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog=CatalogModel.items[index];
        return InkWell(
            child: CatalogItem(catalog: catalog),
          onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>HomeDetailPage(catalog:catalog)
                  )
              );//Navigator.push
          },
        );
      },//itemBuilder
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key,required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            //const SizedBox(height: 20,),
            Hero(
              child: CatalogImage(image: catalog.image),
              tag: Key(catalog.id.toString()),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  catalog.name.text.lg.color(Colors.purpleAccent).bold.make(),
                  catalog.desc.text.make(),
                  12.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: Vx.mH0,
                    children: [
                      '\$${catalog.price}'.text.xl.make(),
                    ],
                  ).pOnly(right: 12),
                   AddToCart(catalog: catalog),
                ],
              ),
            ),
          ],
        )
    ).white.roundedLg.square(150).py1.make();
  }
}