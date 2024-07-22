import 'package:dartz/dartz.dart';
import 'package:nana_mobile_task/core/error/failure.dart';
import 'package:nana_mobile_task/core/utils/resources/use_case_base.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';
import '../repository_base/products_repository_base.dart';


class ProductsUseCase extends UseCaseBase<ProductsRequestModel> {
  final ProductsRepositoryBase repository;
  final String limit;
  final String offset;

  ProductsUseCase({
    required this.repository,
    required this.limit,
    required this.offset,
  });

  @override
  Future<Either<Failure, ProductsRequestModel>> call() async {
    return await repository.getProducts(
      limit: limit,
      offset: offset,
    );
  }
}
