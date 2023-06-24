import 'package:flutter/material.dart';
import 'package:spacex_app/presentation/common/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LauchesDataContainer extends StatelessWidget {
  const LauchesDataContainer({
    super.key,
    required String date,
    required String time,
    required String missionName,
    required String missionNameLong,
    required String url,
  })  : _date = date,
        _time = time,
        _missionName = missionName,
        _missionNameLong = missionNameLong,
        _url = url;

  final String _date;
  final String _time;
  final String _missionName;
  final String _missionNameLong;
  final String _url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse(_url);

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Container(
        height: 96,
        padding: const EdgeInsets.only(
          top: 15,
          left: 16,
          right: 16,
        ),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: AppColors.fillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _date,
                  style: const TextStyle(
                    color: AppColors.accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _time,
                  style: const TextStyle(
                    color: AppColors.captionColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 21),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _missionName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColors.elemetsColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _missionNameLong,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: AppColors.captionColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
