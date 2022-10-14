import 'package:flutter/material.dart';
import 'package:currencies_api/Pages/home_page.dart';
import "package:currencies_api/Widgets/container_white.dart";
import 'package:currencies_api/Widgets/first_stack.dart';
import 'package:currencies_api/Widgets/convert_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            
            Text("Currency Converter", style: TextStyle(color: Colors.white, fontSize: 30)),
            
            Expanded(flex: 1, child: FlagCard()),
            Expanded(flex: 2, child: ConvertCard()),
            //Expanded(flex: 1, child: Image.network("https://countryflagsapi.com/png/usa")),
            
            
            //Expanded(flex: 3, child: MyHomeApp()),
            
            
          ],
        ),
      ),
    );
  }
}