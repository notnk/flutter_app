import 'package:flutter/material.dart';
import 'package:newtest/models/catalog.dart';
import 'package:newtest/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final int days= 40;
  @override
  Widget   build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Catalog'),
        centerTitle: true,
      ),
      //drawer: const Drawer(),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context,index){
          return ItemWidget(
            item: dummyList[index],
          );
        },
      ),
      drawer:  MyDrawer(),
    )   ;
  }
}