import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  final String? flag;
  const Flag({Key? key, this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: CircleBorder(),
          image: DecorationImage(
              image: NetworkImage("https://countryflagsapi.com/png/$flag"),
              fit: BoxFit.fill)),
    );
  }
}
