import 'dart:convert';

import 'package:dio/dio.dart';
import '/core/error/remote_exception.dart';
import '/core/remote/error_model.dart';
import '/core/remote/remote_constants.dart';
import '/core/utils/remote_request_manager/remote_request_manager.dart';
import '../../../../core/utils/remote_request_manager/models_exporter.dart';

abstract class ProductsRemoteDatasourceBase {
  final RemoteRequestManager remoteRequestManager;

  ProductsRemoteDatasourceBase({required this.remoteRequestManager});

  Future<ProductsRequestModel> getProducts({String? limit, String? offset});
}

class ProductsRemoteDatasource extends ProductsRemoteDatasourceBase {
  ProductsRemoteDatasource({required super.remoteRequestManager});

  @override
  Future<ProductsRequestModel> getProducts({String? limit = "20", String? offset = "1"}) async {
    try {
      final response = await remoteRequestManager.get(
        url: RemoteConstants.productApi,
        query: {
          "page":offset
          // "limit": limit,
          // "offset": offset,
        }
      );

      final result = response.data;


//1
 // List<ProductsRequestModel> list = json.decode(result);
//2
//  productsRequestModelFromJsonv1(result);

//3
  // List<ProductsRequestModel> productsRequestModelFromJson() =>
  //   List<ProductsRequestModel>.from(json.decode(result).map((x) => ProductsRequestModel.fromJson(x)));





      return ProductsRequestModel.fromJson(result);

     // return result;

    } on DioException catch (exception) {
      throw RemoteException(
          errorModel: RemoteErrorModel.fromJson(exception.response!.data));
    }
  }

        List<ProductsRequestModel> productsRequestModelFromJsonv1(String str) {
  return List<ProductsRequestModel>.from(json.decode(str).map((x) => ProductsRequestModel.fromJson(x)));

    }
}
