import 'package:flutter/material.dart';

class ExchangeRate extends StatelessWidget{
  const ExchangeRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        height: 80,
        decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Exchange rate", style: TextStyle(color: Color.fromARGB(255, 36, 151, 61), fontSize: 20)),
            Text("1 EUR = 0.678 AUD", style: TextStyle(color: Colors.black, fontSize: 20)),
        ]),
        
      ),
    );
  }
}