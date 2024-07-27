

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nana_mobile_task/core/error/failure.dart';
import 'package:nana_mobile_task/core/error/remote_exception.dart';
import 'package:nana_mobile_task/core/remote/error_model.dart';
import 'package:nana_mobile_task/features/products/data/datasource/products_datasource.dart';
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart';
import 'package:nana_mobile_task/features/products/data/repository/products_repository.dart';

import 'products_repo_test.mocks.dart';
import 'test_constant.dart';

class MockProductsRemoteDataSource extends Mock implements ProductsRemoteDatasourceBase{}

@GenerateMocks([MockProductsRemoteDataSource])

void main() {
  late ProductsRepository repository;
  late MockProductsRemoteDataSource mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockMockProductsRemoteDataSource();//MockProductsRemoteDatasourceBase();
    repository = ProductsRepository(remoteDatasource: mockRemoteDatasource);
  });

  group('Testing Products Repository', () {
    final productsRequestModel = ProductsRequestModel.fromJson(TestConstant.responseJson);

    test('Testing Products Repository Success', () async {
      // Arrange
      when(mockRemoteDatasource.getProducts(page: TestConstant.page))
          .thenAnswer((_) async => productsRequestModel);

      // Act
      final result = await repository.getProducts(page: TestConstant.page);

      // Assert
      expect(result, equals(Right(productsRequestModel)));
      verify(mockRemoteDatasource.getProducts(page: TestConstant.page));
      verifyNoMoreInteractions(mockRemoteDatasource);
    });

    test('Testing Products Repository Failure', () async {
      // Arrange
      const remoteException = RemoteException(
        errorModel: RemoteErrorModel(statusMessage: 'An error occurred'),
      );

      when(mockRemoteDatasource.getProducts(page: TestConstant.page))
          .thenThrow(remoteException);

      // Act
      final result = await repository.getProducts(page: TestConstant.page);

      // Assert
      expect(result, equals(const Left(RemoteFailure(message: 'An error occurred'))));
      verify(mockRemoteDatasource.getProducts(page: TestConstant.page));
      verifyNoMoreInteractions(mockRemoteDatasource);
    });
  });
}


