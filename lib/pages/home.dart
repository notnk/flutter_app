import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtest/models/catalog.dart';
import 'package:newtest/utils/routes.dart';
import '../models/catalog.dart';
import '../widgets/home_widgets/catalogHeader.dart';
import '../widgets/home_widgets/catalogList.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

import '../widgets/theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final int days = 40;
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    //print(productData);
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context)  {
    //final dummyList = List.generate(8, (index) => CatalogModel.items[0]);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: const Icon(CupertinoIcons.cart,color: Colors.white,),
      ),
      //backgroundColor: MyTheme.creamColor,
      backgroundColor: Colors.brown[50],
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if(CatalogModel.items != null)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().expand().centered(),
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
    );
  }
}