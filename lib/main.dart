import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtest/pages/login.dart';
import 'package:newtest/utils/routes.dart';
import 'package:newtest/widgets/theme.dart';
import 'pages/home.dart';

void main() {
  runApp(const TestApp());
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
        MyRoutes.homeroute : (context)=>  Home(),
        MyRoutes.loginroute :(context)=>const Login(),
      },
    );
  }
}