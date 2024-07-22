import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/core/utils/resources/resources_exporter.dart';
import '/core/utils/shared_widgets/toast_widget.dart';

Future<void> pushAndRecord({
  required context,
  required String routeName,
  required Object? arguments,
  required Function(Object?) onReturn,
}) async {
  final result = await Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );

  if (!context.mounted) return;

  onReturn(result);
}

void navigateTo(context, routeName) => Navigator.pushNamed(context, routeName);

void navigateAndFinish(context, String routeName) =>
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
    );

Future<void> designToastDialog({
  required BuildContext context,
  required Toast toast,
  required String message,
  int duration = 2,
}) async {
  return showDialog(
    context: context,
    builder: (context) => PersistentToast(
      duration: Duration(seconds: duration),
      message: message,
      toast: toast,
    ),
  );
}

enum Toast { success, error, info, warning }

const successColor = ColorManager.primaryColor;
const errorColor = ColorManager.redBorder;
const infoColor = ColorManager.blueToastColor;
const warningColor = ColorManager.goldy;

IconData chooseIcon(Toast toast) {
  late IconData iconData;

  switch (toast) {
    case Toast.success:
      iconData = FontAwesomeIcons.check;
      break;
    case Toast.error:
      iconData = FontAwesomeIcons.xmark;
      break;
    case Toast.info:
      iconData = FontAwesomeIcons.info;
      break;
    case Toast.warning:
      iconData = FontAwesomeIcons.exclamation;
      break;
  }

  return iconData;
}

Color chooseColor(Toast toast) {
  late Color color;

  switch (toast) {
    case Toast.success:
      color = successColor;
      break;
    case Toast.error:
      color = errorColor;
      break;
    case Toast.info:
      color = infoColor;
      break;
    case Toast.warning:
      color = warningColor;
      break;
  }

  return color;
}

String chooseTitle(Toast toast) {
  late String title;

  switch (toast) {
    case Toast.success:
      title = 'Success';
      break;
    case Toast.error:
      title = 'Error';
      break;
    case Toast.info:
      title = 'Information';
      break;
    case Toast.warning:
      title = 'Warning';
      break;
  }

  return title;
}

const initialGender = 0;

