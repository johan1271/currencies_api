import 'package:flutter/material.dart';

Widget customDropDown(List<String> currencies, String value, void onChanged(val)) {
  
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    height: 40,
    width: 84,
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
      items: currencies.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}