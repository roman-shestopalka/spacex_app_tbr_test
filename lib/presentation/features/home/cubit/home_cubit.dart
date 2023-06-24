import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_app/domain/entities/launch.dart';
import 'package:spacex_app/domain/use_case/fetch_launches_data.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<LaunchState> {
  final FetchLaunchesUseCase _fetchLaunchesUseCase;
  HomeCubit(this._fetchLaunchesUseCase) : super(LaunchesInitial());

  Future<void> fetchLaunches() async {
    try {
      emit(LaunchesLoading());
      final launch = await _fetchLaunchesUseCase.executeFetch();
      emit(LaunchesLoaded(launch));
    } catch (e) {
      emit(LaunchesExeption("Failed to fetch data: $e"));
    }
  }
}
