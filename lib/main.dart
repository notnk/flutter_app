import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newtest/pages/login.dart';
import 'pages/home.dart';

void main() {
  runApp(const TestApp());
}
class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: GoogleFonts.lato().fontFamily,
        //fontFamily: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: '/login',
      routes: {
        '/' : (context)=> const Home(),
        '/login' :(context)=>const Login(),
      },
    );
  }
}