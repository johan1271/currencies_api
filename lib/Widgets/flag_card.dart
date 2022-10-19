
import 'package:flutter/material.dart';
import 'package:currencies_api/Widgets/flag.dart';

//FlagCard is a widget that displays the flag, symbol, amount and currency of a country to be converted
//FlagCard takes 4 arguments: [flag], [symbol], [amount] and [currency]
//Flagcard returns a container widget with a column of children widgets that are the arguments passed to it
//FlagCard is used in the home page


class FlagCard extends StatelessWidget {
  

  //atributes
  final List<String> flags;
  final List<String> symbol;  
  final String amount;
  final String to;
  const FlagCard({Key? key, required this.flags, required this.symbol, required this.to, required this.amount}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20)),
      
      
      child: Stack(children: [
        
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [

                  //show flag of the country to be converted
                  Flag(flag: flags[0]),

                  //show icon arrow
                  const Icon(Icons.arrow_right_alt_outlined, size: 110, color: Color.fromARGB(255, 36, 151, 61)),

                  //show flag of the country to be converted to
                  Flag(flag: flags[1])

                ], 
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  
                  //show symbol and amount of the country to be converted
                  Text("$amount ${symbol[0]}", style: const TextStyle(color: Colors.black, fontSize: 17)),
                  
                  //show symbol and result of the country to be converted to
                  Text("$to ${symbol[1]}", style: const TextStyle(color: Colors.black, fontSize: 17))
                ],
              ),
            )
     

          ],
        )
      ]),
    );
  }
}
