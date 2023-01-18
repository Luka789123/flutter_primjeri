import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String message;
  const Display({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          message,
          style: TextStyle(
              fontSize: 30,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
