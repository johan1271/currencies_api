import 'package:flutter/material.dart';

//ExchangeRateCard is a widget that displays the exchange rate between two currencies
//It is used in the home page
//ExchangeRateCard takes three arguments: [from] and [to] which are the two currencies and rates which is the exchange rate between the two currencies
//ExchangeRateCard returns a container widget with a column of children widgets that are the arguments passed to it

class ExchangeRateCard extends StatelessWidget{

  //atributes
  final String from;
  final String to;
  final String rate;
  const ExchangeRateCard({Key? key, required this.rate, required this.from, required this.to}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      decoration: BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20)),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Exchange rate", style:  TextStyle(color: Color.fromARGB(255, 36, 151, 61), fontSize: 20)),

          //show exchange rate
          Text("1 $from = $rate $to", style: const TextStyle(color: Colors.black, fontSize: 20)),
      ]),
      
    );
  }
}