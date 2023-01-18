import 'package:activity_app/features/get_activity/data/data_source/remote_data_swource.dart';
import 'package:activity_app/features/get_activity/presentation/bloc/activity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'injection_container.dart' as di;
import 'features/get_activity/presentation/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.intl();
  runApp(BlocProvider<ActivityBloc>(
    create: (context) => di.sl<ActivityBloc>(),
    child: ActivityApp(),
  ));
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivityHomeRoute(),
    );
  }
}
