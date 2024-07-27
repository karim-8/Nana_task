import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:nana_mobile_task/core/error/remote_exception.dart";
import "package:nana_mobile_task/core/remote/remote_constants.dart";
import "package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart";
import "package:nana_mobile_task/core/utils/remote_request_manager/remote_request_manager.dart";
import "package:nana_mobile_task/features/products/data/datasource/products_datasource.dart";
import 'package:dio/dio.dart';
import "product_data_source_test.mocks.dart";
import "test_constant.dart";

class MockRemoteRequestManager extends Mock implements RemoteRequestManager {}

@GenerateMocks([MockRemoteRequestManager])

Future<void> main() async {
  late ProductsRemoteDatasource datasource;
  late MockRemoteRequestManager mockRemoteRequestManager;

  setUp(() {
    mockRemoteRequestManager = MockMockRemoteRequestManager();
    datasource = ProductsRemoteDatasource(remoteRequestManager: mockRemoteRequestManager);
  });

   group('Product Remote Datasource Testing', () {
    // Api Mock Data
    final productsRequestModel = ProductsRequestModel.fromJson(TestConstant.responseJson);

    test('Test Fetching ProductsRequestModel Data successfully', () async {
      // Arrange
      when(mockRemoteRequestManager.get(
        url: RemoteConstants.productApi,
        query: {'page': TestConstant.page},
      )).thenAnswer((_) async => Response(
        data: TestConstant.responseJson,
        requestOptions: RequestOptions(path: ''),
      ));

      // Act
      final result = await datasource.getProducts(page: TestConstant.page);

      // Assert
      expect(result, equals(productsRequestModel));
      verify(mockRemoteRequestManager.get(
        url: RemoteConstants.productApi,
        query: {'page': TestConstant.page},
      ));
      verifyNoMoreInteractions(mockRemoteRequestManager);
    });

    test('Test Fetching ProductsRequestModel Data Failure', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          data: {'error': 'Error'},
          requestOptions: RequestOptions(path: ''),
        ),
      );

      when(mockRemoteRequestManager.get(
        url: RemoteConstants.productApi,
        query: {'page': TestConstant.page},
      )).thenThrow(dioException);

      // Act & Assert
      expect(() async => await datasource.getProducts(page: TestConstant.page), throwsA(isA<RemoteException>()));
      verify(mockRemoteRequestManager.get(
        url: RemoteConstants.productApi,
        query: {'page': TestConstant.page},
      ));
      verifyNoMoreInteractions(mockRemoteRequestManager);
    });
  });
}

