import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '/core/utils/resources/resources_exporter.dart';

class PersistentToast extends StatefulWidget {
  final String message;
  final Duration duration;
  final Toast toast;

  const PersistentToast({
    super.key,
    required this.message,
    required this.duration,
    required this.toast,
  });

  @override
  State<PersistentToast> createState() => _PersistentToastState();
}

class _PersistentToastState extends State<PersistentToast> {
  late Timer _dismissTimer;

  @override
  void initState() {
    super.initState();
    _dismissTimer = Timer(widget.duration, () {
      if (context.mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 1,
        sigmaY: 1,
      ),
      child: Dialog(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: ColorManager.formGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 5.0,
              height: 80,
              color: chooseColor(widget.toast),
            ),
            20.00.widthSpace,
            CircleAvatar(
              radius: 15.0,
              backgroundColor: chooseColor(widget.toast),
              child: Icon(
                chooseIcon(widget.toast),
                color: ColorManager.whiteColor,
                size: 18.0,
              ),
            ),
            20.00.widthSpace,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chooseTitle(widget.toast),
                      style: TextStyleManager.screenBodyMedium),
                  Text(
                    widget.message, // Hard coded value
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyleManager.screenBodySmall.copyWith(
                      color: ColorManager.greyText,
                    ),
                  ),
                ],
              ),
            ),
            20.00.widthSpace,
          ],
        ),
      ),
    );
  }
}
