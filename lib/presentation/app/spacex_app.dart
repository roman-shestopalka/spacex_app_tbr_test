import 'package:flutter/material.dart';
import 'package:spacex_app/data/data_sources/launches_data_source.dart';
import 'package:spacex_app/data/repositories/launchesDataSourceRepo.dart';
import 'package:spacex_app/domain/use_case/fetch_launches_data.dart';
import 'package:spacex_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:spacex_app/presentation/features/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpacexApp extends StatelessWidget {
  const SpacexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        FetchLaunchesUseCase(
          LaunchesDataRepository(LaunchesDataSource()),
        ),
      ),
      child: MaterialApp(
        title: "SpaceX App",
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
