import 'package:activity_app/core/entity/activity.dart';
import 'package:activity_app/core/faliure/network_faliure.dart';
import 'package:activity_app/features/get_activity/data/repositroy/activity_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final ActivityRepository repo;
  ActivityBloc({required this.repo}) : super(ActivityInitial()) {
    on<ActivityEvent>((event, emit) async {
      if (event is GetActivity) {
        emit(Loading());
        final response = await repo.fetch();
        print('bp1');
        if (response is Activity) {
          emit(Loaded(activity: response));
          print('em1');
        } else if (response is NetworkFaliure) {
          emit(ErrorNetwork());
          print('em2');
        } else {
          emit(ErrorServer());
          print('em3');
        }
      }
    });
  }
}
