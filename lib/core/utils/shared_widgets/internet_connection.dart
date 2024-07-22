import 'package:flutter/material.dart';
import 'package:nana_mobile_task/core/utils/resources/resources_exporter.dart';

class InternetConnectionItem extends StatelessWidget {
  const InternetConnectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      color: ColorManager.primaryColor,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
            color: ColorManager.whiteColor,
          ),
          10.00.widthSpace,
          const Text(
            'No Internet Connection',
            style: TextStyle(
              color: ColorManager.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
