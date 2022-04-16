import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtest/core/store.dart';
import 'package:newtest/pages/cart_page.dart';
import 'package:newtest/pages/login.dart';
import 'package:newtest/utils/routes.dart';
import 'package:newtest/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home.dart';

void main() {
  runApp(VxState(store: MyStore(),
  child:  const TestApp()));
}
class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.light(context),
      darkTheme: MyTheme.dark(context),
      initialRoute: MyRoutes.homeroute,
      routes: {
        MyRoutes.homeroute : (context)=>  const Home(),
        MyRoutes.loginroute :(context)=>const Login(),
        MyRoutes.cartRoute :(context)=>const CartPage(),
      },
    );
  }
}