import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => null,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.teal)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Get Activtiy',
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade200,
                fontWeight: FontWeight.w500),
          ),
        ));
  }
}
