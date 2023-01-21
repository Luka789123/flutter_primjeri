import 'package:activity_app/core/network/network_info.dart';
import 'package:activity_app/features/get_activity/data/data_source/remote_data_swource.dart';
import 'package:activity_app/features/get_activity/data/repositroy/activity_repository.dart';
import 'package:activity_app/features/get_activity/presentation/bloc/activity_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void init() {
  sl.registerFactory(() => ActivityBloc(repo: sl()));
  sl.registerLazySingleton(
      () => ActivityRepository(netInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton(() => RemoteDataSource(client: sl()));
  sl.registerLazySingleton(() => NetworkInfo());
  sl.registerLazySingleton(() => http.Client());
}
