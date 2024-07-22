import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/remote_exception.dart';
import '../../../../core/utils/remote_request_manager/models_exporter.dart';
import '../../domain/repository_base/products_repository_base.dart';
import '../datasource/products_datasource.dart';


class ProductsRepository extends ProductsRepositoryBase {

  final ProductsRemoteDatasourceBase remoteDatasource;

  ProductsRepository({required this.remoteDatasource});

  @override
  Future<Either<Failure, ProductsRequestModel>> getProducts({
    required String limit,
    required String offset,
  }) async {
    try {
      final response = await remoteDatasource.getProducts(
        limit: limit,
        offset: offset,
      );
      return Right(response);
    } on RemoteException catch (exception) {
      log(name: 'Remote Exception', exception.errorModel.statusMessage);
      return Left(
        RemoteFailure(
          message: exception.errorModel.statusMessage,
        ),
      );
    }
  }
}
