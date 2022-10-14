import 'package:currencies_api/Pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:currencies_api/Pages/home_page.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
    
     debugShowCheckedModeBanner: false,
     theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 25, 52, 99)),
     title: 'Currency Converter',
     initialRoute: '/',
     routes: {
       '/': (BuildContext context) => const HomeScreen(
       )
     },
   );
  }
}