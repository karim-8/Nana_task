import 'package:flutter/material.dart';

import '/core/utils/resources/resources_exporter.dart';
import 'image_assets_widget.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ImageAssetWidget(
          imagePath: AssetsManager.appIcon,
          color: ColorManager.primaryColor,
          size: 100,
        ),
        40.00.heightSpace,
        const Center(
          child: LinearProgressIndicator(
            color: ColorManager.primaryColor,
            backgroundColor: ColorManager.whiteColor,
          ),
        ),
      ],
    );
  }
}
