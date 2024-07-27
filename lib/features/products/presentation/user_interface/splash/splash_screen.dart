import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/resources/resources_exporter.dart';
import '/core/utils/shared_widgets/full_screen_loading.dart';
import '../../cubit/products_cubit.dart';
import '../../cubit/products_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsCubit, ProductsStateBase>(
      listener: (context, state) async {
        if (context.mounted) {
          navigateAndFinish(context, RouteManager.products);
        }
      },
      child: Container(
        color: ColorManager.whiteColor,
        child: const FullScreenLoading(),
      ),
    );
  }
}
