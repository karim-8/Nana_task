import 'package:flutter/material.dart';

import '/core/utils/shared_widgets/hide_keyboard.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: HideKeyboard(
          child: child,
        ),
      ),
    );
  }
}
