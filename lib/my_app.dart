import 'package:flutter/material.dart';
import 'package:currencies_api/Pages/home_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Currency Converter',
     initialRoute: '/',
     routes: {
       '/': (BuildContext context) => MyHomeApp(
           title: 'Currency Converter'
       )
     },
   );
  }
}