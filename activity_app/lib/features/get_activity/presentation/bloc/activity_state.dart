part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class Loading extends ActivityState {}

class Loaded extends ActivityState {
  final Activity activity;

  Loaded({required this.activity});
}

class ErrorNetwork extends ActivityState {}

class ErrorServer extends ActivityState {}
