import 'package:flutter/material.dart';

//Flag widget is a widget that displays the flag of a country currency
//Flag takes one argument: [flag] which is the flag of the country
//Flag is used in the home page
class Flag extends StatelessWidget {
  final String flag;
  const Flag({Key? key, required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: ShapeDecoration(
          shape: const CircleBorder(),
          image: DecorationImage(
              image: NetworkImage("https://countryflagsapi.com/png/$flag"),
              fit: BoxFit.cover)),
    );
  }
}




