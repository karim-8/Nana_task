import 'package:equatable/equatable.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';
import '/core/utils/resources/resources_exporter.dart';

abstract class ProductsStateBase {}

class ProductsState extends ProductsStateBase with EquatableMixin {
  final CallStatus callStatus;
  final ProductsRequestModel? productsData;
  List<Results>? results;
  List<Results>? recommendationResults;
  int? gridHeightSize;
  final bool indicatorStatus;

  ProductsState({
    this.callStatus = CallStatus.loading,
    this.productsData,
    this.results,
    this.gridHeightSize = 320,
    this.indicatorStatus = false,
    this.recommendationResults,
  });
  ProductsState copyWith({
    List<Results>? results,
    CallStatus? callStatus,
    ProductsRequestModel? productsData,
    int? gridHeightSize,
    bool? indicatorStatus,
    List<Results>? recommendationResults,

  }) {
    return ProductsState(
      results: results ?? this.results,
      callStatus: callStatus ?? this.callStatus,
      productsData: productsData ?? this.productsData,
      gridHeightSize: gridHeightSize ?? this.gridHeightSize,
      indicatorStatus: indicatorStatus ?? this.indicatorStatus,
      recommendationResults: recommendationResults ?? this.recommendationResults,
    );
  }

  @override
  List<Object?> get props => [
        callStatus,
        productsData,
        gridHeightSize,
        indicatorStatus,
        results,
        recommendationResults,
      ];
}
