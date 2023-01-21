import 'package:activity_app/features/get_activity/data/data_source/remote_data_swource.dart';
import 'package:activity_app/features/get_activity/presentation/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;

import 'features/get_activity/presentation/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(BlocProvider(
    create: (_) => di.sl<ActivityBloc>(),
    child: const ActivityApp(),
  ));
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivityHomeRoute(),
    );
  }
}
