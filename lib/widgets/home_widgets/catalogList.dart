import 'package:flutter/material.dart';
import 'package:newtest/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/home_detail_page.dart';
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
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: Vx.mH8,
                    children: [
                      '\$${catalog.price}'.text.make(),
                    ],
                  ).pOnly(right: 8),
                   _AddToCart(catalog: catalog),
                ],
              ),
            ),
          ],
        )
    ).white.roundedLg.square(150).py1.make();
  }
}
class _AddToCart extends StatefulWidget {
   Item catalog;
   _AddToCart({Key? key,required this.catalog}) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded=false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:() {
        isAdded=isAdded.toggle();
        print(isAdded);
        CatalogModel  _catalog = CatalogModel();
        final _cart=CartModel();
        _cart.catalog=_catalog as CatalogModel;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
      ),
      child: isAdded? Icon(Icons.done):"Add to cart".text.make(),
    );
  }
}
