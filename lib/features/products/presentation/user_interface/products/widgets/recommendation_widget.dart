import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/core/utils/shared_widgets/app_grid_view.dart';
import 'package:nana_mobile_task/core/utils/shared_widgets/grid_utilities.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsStateBase>(
      builder: (context, state) {
        if (state is ProductsState) {
          log("Data is ${state.productsData ?? "No Data"}");
          return AppGridView(
            sectionHeaderTitle: "Recommendation",
            productsData: state.recommendationResults,
            gridDelegateView: horizontalGridDelegate(),
            gridScrollDirection: Axis.horizontal,
          );
        }
        return const SizedBox();
      },
    );
  }
}
