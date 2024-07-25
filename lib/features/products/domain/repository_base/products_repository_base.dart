import 'package:dartz/dartz.dart';
import 'package:nana_mobile_task/core/error/failure.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';


abstract class ProductsRepositoryBase {
  Future<Either<Failure, ProductsRequestModel>> getProducts({
    required String page,
  });
}
