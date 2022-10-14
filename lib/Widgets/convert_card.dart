import 'dart:html';

import 'package:flutter/material.dart';
import 'package:currencies_api/Widgets/container_white.dart';
import 'package:currencies_api/Widgets/flag.dart';
import 'package:currencies_api/Pages/home_page.dart';


class ConvertCard extends StatelessWidget {
  const ConvertCard({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 500,
        height: 200,
        decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
        
        
        child: Stack(children: [
          
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    const Text("From", style: TextStyle(color: Colors.black, fontSize: 30)),
                    MyHomeApp()

                  ], 
                ),
              ),
              
              


            ],
          )
        ]),
      ),
    );
  }
}