import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData light(BuildContext context)=>ThemeData(
      primarySwatch: Colors.indigo,
      //fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme:  AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        //toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      )
  );
  static ThemeData dark(BuildContext context)=>ThemeData(
    brightness: Brightness.dark,
  );
}