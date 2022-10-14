import 'dart:html';

import 'package:flutter/material.dart';
import 'package:currencies_api/Widgets/container_white.dart';
import 'package:currencies_api/Widgets/flag.dart';
import 'package:currencies_api/Pages/home_page.dart';


class FlagCard extends StatelessWidget {
  const FlagCard({Key? key}) : super(key: key);
  

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Flag(flag: "br"),
                    Icon(Icons.arrow_right_alt_outlined, size: 110, color: Color.fromARGB(255, 36, 151, 61)),
                    Flag(flag: "usa")

                  ], 
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 53),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("0 AUD", style: TextStyle(color: Colors.black, fontSize: 25)),
                    Text("0 USD", style: TextStyle(color: Colors.black, fontSize: 25))
                  ],
                ),
              )


              
              


            ],
          )
        ]),
      ),
    );
  }
}
