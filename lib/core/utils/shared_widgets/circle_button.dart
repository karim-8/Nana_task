import 'package:flutter/material.dart';

import '/core/utils/resources/resources_exporter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.onTap,
    this.fillColor = ColorManager.primaryColor,
    this.iconColor = ColorManager.whiteColor,
    this.icon = Icons.add_rounded,
    this.child,
    this.size = 25.00,
  });

  final GestureTapCallback? onTap;
  final Color fillColor;
  final Color iconColor;
  final IconData icon;
  final Widget? child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: fillColor,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: child ??
              Icon(
                icon,
                size: 18.00,
                color: iconColor,
              ),
        ),
      ),
    );
  }
}
