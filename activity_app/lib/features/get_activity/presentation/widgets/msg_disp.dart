import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';
import 'display.dart';

class MsgDisp extends StatefulWidget {
  const MsgDisp({super.key});

  @override
  State<MsgDisp> createState() => _MsgDispState();
}

class _MsgDispState extends State<MsgDisp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      if (state is Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is Loaded) {
        return Display(
          message: state.activity.activtiyName,
        );
      } else if (state is ErrorNetwork) {
        return Display(message: 'Nema internetske veze');
      } else {
        return Display(message: 'Serverska greška');
      }
    });
  }
}
