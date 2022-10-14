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
        decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
        
        
        child: Stack(children: [
          
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Flag(flag: "br"),
                    Icon(Icons.arrow_right_alt_outlined, size: 110, color: Color.fromARGB(255, 36, 151, 61)),
                    Flag(flag: "usa")

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
