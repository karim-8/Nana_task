import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart';
import 'package:nana_mobile_task/core/utils/resources/enums.dart';
import 'package:nana_mobile_task/features/products/domain/repository_base/products_repository_base.dart';
import 'package:nana_mobile_task/features/products/domain/use_case/products_use_case.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepositoryBase repository;
  var currentPage = 1;
  List<Results>? dataResults = [];
  var deductedAmount = 340;

  ProductsCubit({
    required this.repository,
  }) : super(ProductsState());

  ProductsRequestModel? products;

  Future<void> getProductsData() async {
    final result = await ProductsUseCase(
      repository: repository,
      page: incrementCurrentPage().toString(),
    )();
    result.fold(
        (failure) => emit(
              ProductsState(callStatus: CallStatus.error, productsData: null),
            ), (data) {
      toggleIndicator(false);

      dataResults?.addAll(data.results ?? []);

      emit(
        state.copyWith(
            callStatus: CallStatus.loaded,
            productsData: data,
            results: dataResults,
            recommendationResults: setRecommendationItems(),
            gridHeightSize: calculateGridHeight()),
      );
    });
  }

  List<Results>? setRecommendationItems() => dataResults?.reversed.toList();
  

  int calculateGridHeight() {
    if (dataResults != null && dataResults!.isNotEmpty) {
      final int itemsCount = dataResults!.length;
      final int rowHeight = itemsCount * 100;
      var height = (currentPage > 2) ? rowHeight - deductedAmount : rowHeight;
      deductedAmount += 200;
      return height;
    } else {
      return 320;
    }
  }

  void toggleIndicator(bool show) {
    emit(state.copyWith(indicatorStatus: show));
  }

  int incrementCurrentPage() => currentPage++;
}
