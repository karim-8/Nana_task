import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/injection/injector.dart';
import '/core/utils/resources/resources_exporter.dart';
import 'features/products/presentation/cubit/products_cubit.dart';

class NanaApp extends StatelessWidget {
  const NanaApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ProductsCubit(
                  repository: injector(),
                )..getProductsData()),
      ],
      child: MaterialApp(
        title: StringsManager.products,
        debugShowCheckedModeBanner: false,
        theme: ThemManager.lightTheme,
        initialRoute: RouteManager.splash,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
