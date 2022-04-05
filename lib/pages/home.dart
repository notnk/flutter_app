import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final int days= 40;
  @override
  Widget   build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Text("this is outputing the no of  $days"),
        ),
      ),
    );
  }
}