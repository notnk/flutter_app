import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData light(BuildContext context)=>ThemeData(
      primarySwatch: Colors.indigo,
      //fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme:  AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      )
  );
  static ThemeData dark(BuildContext context)=>ThemeData(
      //brightness: Brightness.dark,
      cardColor: Colors.black,
      primarySwatch: Colors.indigo,
      //fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme:  AppBarTheme(
        color: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      )
  );
  //colors
  static Color creamColor =(0xfff5f5f5) as Color;
  static Color test =const Color.fromRGBO(245, 245, 245, 0);
  static Color darkgray = Vx.gray900;
  static Color darkBlur =(0xff403b58) as Color;
}