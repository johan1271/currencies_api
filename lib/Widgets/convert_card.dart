
import 'package:flutter/material.dart';

//ConvertCard is a widget that displays the conversion between two currencies
//ConvertCard takes four widgets as arguments: [dropdown1] which is a from dropdown, [dropdown2] which is a to dropdown, [textfield] which receive a amount to convert and [buttonConvert] which is a button that triggers the conversion
//ConvertCard is used in the home page
//ConvertCard returns a container widget with a column of children widgets that are the arguments passed to it

class ConvertCard extends StatelessWidget {
  
  //atributes
  final Widget dropdown1;
  final Widget dropdown2;
  final Widget textfield;
  final Widget buttonConvert;
  

  const ConvertCard(
      {Key? key, required this.dropdown1, required this.dropdown2, required this.textfield, required this.buttonConvert})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 350,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("From",
                      style: TextStyle(color: Colors.black, fontSize: 30)),

                  //show dropdown of the country to be converted
                  dropdown1,
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("To",
                      style: TextStyle(color: Colors.black, fontSize: 30)),

                  //show dropdown of the country to be converted to
                  dropdown2,
                ],
              ),
            ),

            //show textfield to enter the amount to be converted
            textfield,

            //show button to convert the amount
            buttonConvert

          ],
        )
      ]),
    );
  }
}
