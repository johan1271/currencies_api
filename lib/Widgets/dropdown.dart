import 'package:flutter/material.dart';

Widget customDropDown(Map<String,dynamic> currencies, String value, void onChanged(val)) {
  print("leggue al combo");
  List<String> currenciesList = currencies.keys.toList();
  print(currenciesList);
  return Container(

    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    alignment: Alignment.center,
    height: 40,
    width: 100,
    decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
    child: DropdownButton<String>(
      
      value: value,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black, size: 20),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 1,
        color: Colors.transparent,
      ),
      style: const TextStyle(color: Color.fromARGB(255, 17, 16, 16), fontSize: 18, ),
      onChanged: (String? val) {
        onChanged(val);
      },
      items: currenciesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}