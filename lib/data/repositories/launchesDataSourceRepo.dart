import 'package:spacex_app/data/data_sources/launches_data_source.dart';
import 'package:spacex_app/domain/entities/launch.dart';

class LaunchesDataRepository {
  final LaunchesDataSource _dataSource;

  LaunchesDataRepository(this._dataSource);

  Future<List<Launch>> fetchLaunches() async {
    final launchesData = await _dataSource.fetchLaunchesData();
    return launchesData.map((json) => Launch.fromJson(json)).toList();
  }
}
