import 'package:flutter/material.dart';
//Zeleni kvadrti na ekranu koje koristimo za demonstraciju

class Box extends StatelessWidget {
  final String text;
  const Box({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(text);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.green,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
