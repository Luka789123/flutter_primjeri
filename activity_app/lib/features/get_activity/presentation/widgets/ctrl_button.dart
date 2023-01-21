import 'package:activity_app/features/get_activity/presentation/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () =>
            BlocProvider.of<ActivityBloc>(context).add(GetActivity()),
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
