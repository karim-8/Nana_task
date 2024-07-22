import 'package:flutter/material.dart';

class ImageAssetWidget extends StatelessWidget {
  final String imagePath;
  final double? size;
  final bool rotate;
  final int rotationValue;
  final BoxFit fit;
  final Color? color;

  const ImageAssetWidget({
    super.key,
    required this.imagePath,
    this.size,
    this.rotate = false,
    this.fit = BoxFit.contain,
    this.rotationValue = 2,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: rotate
          ? Directionality.of(context) == TextDirection.rtl
              ? rotationValue
              : 0
          : 0,
      child: Image.asset(
        imagePath,
        width: size,
        height: size,
        fit: fit,
      ),
    );
  }
}
