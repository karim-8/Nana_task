import 'package:equatable/equatable.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';
import '/core/utils/resources/resources_exporter.dart';

abstract class ProductsStateBase {}

class ProductsState extends ProductsStateBase with EquatableMixin {
  final CallStatus callStatus;
  final ProductsRequestModel? productsData;
  List<Results>? results;
  int? gridHeightSize;
  final bool indicatorStatus;

  ProductsState({
    this.callStatus = CallStatus.loading,
    this.productsData,
    this.results,
    this.gridHeightSize = 320,
    this.indicatorStatus = false,
  });
  ProductsState copyWith({
    List<Results>? results,
    CallStatus? callStatus,
    ProductsRequestModel? productsData,
    int? gridHeightSize,
    bool? indicatorStatus,
  }) {
    return ProductsState(
      results: results ?? this.results,
      callStatus: callStatus ?? this.callStatus,
      productsData: productsData ?? this.productsData,
      gridHeightSize: gridHeightSize ?? this.gridHeightSize,
      indicatorStatus: indicatorStatus ?? this.indicatorStatus,
    );
  }

  @override
  List<Object?> get props => [
        callStatus,
        productsData,
        gridHeightSize,
        indicatorStatus,
        results,
      ];
}
