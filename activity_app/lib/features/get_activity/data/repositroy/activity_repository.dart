import 'package:activity_app/core/contracts/data_source.dart';
import 'package:activity_app/core/contracts/repository.dart';
import 'package:activity_app/core/contracts/server_response.dart';
import 'package:activity_app/core/faliure/network_faliure.dart';
import 'package:activity_app/core/faliure/server_faliure.dart';
import 'package:activity_app/core/network/network_info.dart';
import 'package:activity_app/features/get_activity/data/data_source/remote_data_swource.dart';

class ActivityRepository extends Repository {
  final NetworkInfo netInfo;
  final RemoteDataSource remoteDataSource;

  ActivityRepository({required this.netInfo, required this.remoteDataSource});
  @override
  Future<ServerResponse> fetch() async {
    if (await netInfo.hasConnection()) {
      try {
        final response = await remoteDataSource.fetch();
        return response;
      } on ServerFaliure {
        return ServerFaliure();
      }
    } else {
      return NetworkFaliure();
    }
  }
}
