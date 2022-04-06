import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtest/pages/login.dart';
import 'package:newtest/utils/routes.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.lato().fontFamily,
        //fontFamily: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: MyRoutes.loginroute,
      routes: {
        MyRoutes.homeroute : (context)=> const Home(),
        MyRoutes.loginroute :(context)=>const Login(),
      },
    );
  }
}