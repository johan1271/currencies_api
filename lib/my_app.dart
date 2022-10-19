
import 'package:flutter/material.dart';

import 'package:currencies_api/Pages/home_screen.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
    
     debugShowCheckedModeBanner: false,
     theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 25, 52, 99)),
     title: 'Currency Converter',
     initialRoute: '/',
     routes: {
       '/': (BuildContext context) => const HomeScreen(
       )
     },
   );
  }
}