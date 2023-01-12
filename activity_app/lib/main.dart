import 'package:activity_app/features/get_activity/data/data_source/remote_data_swource.dart';
import 'package:http/http.dart' as http;

void main() async {
  final client = http.Client();

  final RemoteDataSource dataSource = RemoteDataSource(client: client);

  final result = await dataSource.fetch();

  print(result.activtiyName);
}
