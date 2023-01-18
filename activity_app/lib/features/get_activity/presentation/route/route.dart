import 'package:activity_app/features/get_activity/presentation/bloc/activity_bloc.dart';
import 'package:activity_app/features/get_activity/presentation/widgets/msg_disp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/ctrl_button.dart';

class ActivityHomeRoute extends StatefulWidget {
  const ActivityHomeRoute({super.key});

  @override
  State<ActivityHomeRoute> createState() => _ActivityHomeRouteState();
}

class _ActivityHomeRouteState extends State<ActivityHomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text('Activity App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [MsgDisp(), ControlButton()],
        ),
      ),
    );
  }
}
