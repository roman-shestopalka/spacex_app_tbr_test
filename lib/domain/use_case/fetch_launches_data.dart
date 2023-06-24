import 'package:spacex_app/data/repositories/launchesDataSourceRepo.dart';
import 'package:spacex_app/domain/entities/launch.dart';

class FetchLaunchesUseCase {
  final LaunchesDataRepository _repository;

  FetchLaunchesUseCase(this._repository);

  Future<List<Launch>> executeFetch() async {
    return await _repository.fetchLaunches();
  }
}
