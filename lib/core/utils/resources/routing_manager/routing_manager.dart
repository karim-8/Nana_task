import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nana_mobile_task/features/products/presentation/user_interface/splash/splash_screen.dart';
import '../../../../features/products/presentation/user_interface/products/screens/products_screen.dart';
import 'unknown_route.dart';

class RouteManager {
  static const splash = '/';
  static const products = '/home';

  static final routes = {
    products: (context) => const ProductsScreen(),
  };
  static const pageTransitionsTheme = PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    },
  );

  static Object? navigatorArgument(BuildContext context) =>
      ModalRoute.of(context)!.settings.arguments;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route pageRoute(Widget routeWidget) =>
        CupertinoPageRoute(builder: (_) => routeWidget);

    switch (settings.name) {
      case splash:
        return pageRoute(const SplashScreen());
      case products:
        return pageRoute(ProductsScreen());
      default:
        return pageRoute(const UnknownRouteWidget());
    }
  }
}
