import 'package:flutter/material.dart';
import 'package:newtest/widgets/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final int days= 40;
  @override
  Widget   build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Catalog'),
        centerTitle: true,
      ),
      //drawer: const Drawer(),
      body: Center(
        child: Text("this is outputting the no of  $days"),
      ),
      drawer:  MyDrawer(),
    )   ;
  }
}