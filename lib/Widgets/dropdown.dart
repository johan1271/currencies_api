import 'package:flutter/material.dart';


//create a custom dropdown widget that takes a list of items, value and onChanged function as arguments
Widget customDropDown(Map<String,dynamic> currencies, String value, void onChanged(val)) {
  
  //create a list that will contain the list of keys from the currencies map
  List<String> currenciesList = currencies.keys.toList();
  
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

      //fuction onchanged updates the value of the dropdown
      onChanged: (String? val) {
        onChanged(val);
      },

      //create a list of dropdown menu items from the currencies list
      items: currenciesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}