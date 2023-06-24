import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spacex_app/domain/entities/launch.dart';
import 'package:spacex_app/presentation/common/assets/app_images.dart';
import 'package:spacex_app/presentation/common/colors/app_colors.dart';
import 'package:spacex_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:spacex_app/presentation/features/home/ui/dots_images_indicators.dart';
import 'package:spacex_app/presentation/features/home/ui/images_carousel.dart';
import 'package:spacex_app/presentation/features/home/ui/launches_data_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _title = "SpaceX Launches";

  final List _rocketsImg = [
    AppImages.falcon1Img,
    AppImages.falcon9Img,
    AppImages.falcon9HeavyImg,
  ];

  final ValueNotifier<int> _initialIndex = ValueNotifier<int>(0);

  final _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    final homeCubit = context.read<HomeCubit>();
    homeCubit.fetchLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          _title,
          style: const TextStyle(
            color: AppColors.elemetsColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, LaunchState>(
        builder: (context, state) {
          if (state is LaunchesInitial) {
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.accentColor,
              ),
            );
          } else {}
          if (state is LaunchesLoaded) {
            return Column(
              children: [
                ImagesCarousel(
                  controller: _controller,
                  rocketsImg: _rocketsImg,
                  initialIndex: _initialIndex,
                ),
                DotsImagesIndicator(
                  rocketsImg: _rocketsImg,
                  initialIndex: _initialIndex,
                ),
                LaunchesListView(
                  containerCount: state.launches.length,
                  launches: state.launches,
                ),
              ],
            );
          } else if (state is LaunchesLoading) {
            const CircularProgressIndicator(
              color: AppColors.accentColor,
            );
          } else if (state is LaunchesExeption) {
            return Center(
              child: Text(
                state.exeptionMessege,
                style: const TextStyle(
                  color: AppColors.elemetsColor,
                  fontSize: 24,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class LaunchesListView extends StatelessWidget {
  const LaunchesListView({
    Key? key,
    required this.containerCount,
    required this.launches,
  }) : super(key: key);

  final int containerCount;
  final List<Launch> launches;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "Missions",
                style: TextStyle(
                  color: AppColors.elemetsColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: containerCount,
                  itemBuilder: (context, index) {
                    final launch = launches[index];

                    return LauchesDataContainer(
                      date: DateFormat("yyyy/MM/dd")
                          .format(launch.launchDateLocal),
                      time: DateFormat("jm").format(launch.launchDateLocal),
                      missionName: launch.missionName,
                      missionNameLong: launch.siteNameLong,
                      url: launch.url,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
