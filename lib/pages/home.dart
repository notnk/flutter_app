import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtest/models/catalog.dart';
import 'package:newtest/widgets/drawer.dart';
import 'package:newtest/widgets/theme.dart';
import '../models/catalog.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days= 40;

  //get decodedData => null;
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData() async{
    final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    //print(productData);
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
  @override
  Widget   build(BuildContext context) {
    //final dummyList = List.generate(8, (index) => CatalogModel.items[0]);
    return  Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const CatalogHeader(),
              if(CatalogModel.items!=null)
                const CatalogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
      //In case if we are not using the velocityX dependency
      // appBar: AppBar(
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: Colors.black),
      //   title: const Text('Catalog'),
      //   centerTitle: true,
      // ),
      // body: CatalogModel.items!=null && CatalogModel.items.isNotEmpty?ListView.builder(
      //   itemCount: CatalogModel.items.length,
      //   itemBuilder: (context,index){
      //     return ItemWidget(
      //       item: CatalogModel.items[index],
      //     );
      //   },//Item builder
      // ):const Center(
      //         child: CircularProgressIndicator(),
      //       ),//center
      //In case if the json file was not working
      // body: GridView.builder(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 16,
      //   ),
      //   itemCount: dummyList.length,
      //   itemBuilder: (context,index){
      //     return Card(
      //       clipBehavior: Clip.antiAlias,
      //       shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
      //       child: GridTile(
      //         child: Image.network(dummyList[index].image),
      //         header: Container(
      //           padding: const EdgeInsets.symmetric(horizontal: 8),
      //             height: 20,
      //             child: Text(dummyList[index].name,style: const TextStyle(color: Colors.white),),
      //             decoration: const BoxDecoration(
      //               color: Colors.deepPurpleAccent,
      //             ),
      //         ),
      //         footer: Container(
      //           padding: const EdgeInsets.symmetric(horizontal: 8),
      //             child: Text("\$${dummyList[index].price}",style: const TextStyle(color: Colors.white),),
      //           decoration: const BoxDecoration(
      //             color: Colors.deepPurpleAccent,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      //drawer:  const MyDrawer(),
    )   ;
  }
}
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog App".text.xl5.bold.color(Colors.black).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}
class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog=CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
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
          CatalogImage(image: catalog.image),
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
                    ElevatedButton(
                        onPressed:() {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                      ),
                        child: "buy".text.make(),
                    )
                  ],
                ).pOnly(right: 8),
              ],
            ),
          ),
        ],
      )
    ).white.roundedLg.square(150).py8.make();
  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(image).box.rounded.p8.color(Colors.black12).make().p16().w40(context);
  }
}


