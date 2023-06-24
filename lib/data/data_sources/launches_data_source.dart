import 'package:dio/dio.dart';

class LaunchesDataSource {
  final String _url = "https://api.spacexdata.com/v3/launches";
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchLaunchesData() async {
    final response = await _dio.get(_url);

    return response.data;
  }
}
