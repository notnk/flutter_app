import 'package:flutter/material.dart';
import 'package:newtest/pages/login.dart';
import 'pages/home.dart';

void main(){
    runApp(MaterialApp(
      //home: Home(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=> Home(),
        '/login' :(context)=>Login(),
      },
  ),
  );
}