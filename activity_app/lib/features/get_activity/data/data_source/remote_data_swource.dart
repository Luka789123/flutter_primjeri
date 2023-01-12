import 'package:activity_app/core/contracts/data_source.dart';
import 'package:activity_app/features/get_activity/data/model/activity_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/faliure/server_faliure.dart';

class RemoteDataSource extends DataSource<ActivityModel> {
  final http.Client client;

  RemoteDataSource({required this.client});
  @override
  Future<ActivityModel> fetch() async {
    final Uri uri = Uri.parse('http://www.boredapi.com/api/activity/');

    final response =
        await client.get(uri, headers: {'Accept': 'application/json*/*'});

    if (response.statusCode == 200) {
      return ActivityModel.fromJson(response.body);
    } else {
      throw ServerFaliure();
    }
  }
}
