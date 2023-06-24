part of 'home_cubit.dart';

@immutable
abstract class LaunchState {}

class LaunchesInitial extends LaunchState {}

class LaunchesLoading extends LaunchState {}

class LaunchesLoaded extends LaunchState {
  LaunchesLoaded(this.launches);

  final List<Launch> launches;

  List<Object> get props => [launches];
}

class LaunchesExeption extends LaunchState {
  LaunchesExeption(this.exeptionMessege);

  final String exeptionMessege;

  List<Object> get props => [exeptionMessege];
}
