import 'package:flutter/material.dart';
import 'package:grocery_market/presentation/Home.dart';
import 'package:grocery_market/presentation/Splash.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/splash",
    routes: {
      "/splash" : (context) => Splash(),
      "/home" : (context) => Home()
    },
  ));
}
