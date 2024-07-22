import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';
import '/core/utils/resources/resources_exporter.dart';

abstract class ProductsStateBase  {}

class ProductsInitialState extends ProductsStateBase {}

class ProductsState extends ProductsStateBase {
  final CallStatus callStatus;
  final ProductsRequestModel? productsData;

   ProductsState({
    this.callStatus = CallStatus.loading,
    this.productsData,
  });
}
