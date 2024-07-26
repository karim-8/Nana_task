import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart";
import "package:nana_mobile_task/features/products/data/datasource/products_datasource.dart";
import "product_data_source_test.mocks.dart";

class ProductsDataSourceTest extends Mock
    implements ProductsRemoteDatasourceBase {}

@GenerateMocks([ProductsDataSourceTest])
Future<void> main() async {
  late MockProductsDataSourceTest mockProductsDataSourceTest;

  setUp(() {
    mockProductsDataSourceTest = MockProductsDataSourceTest();
  });

  group("Product data source test ", () {
    test("Test DataSource getProducts Success", () async {
      // Arrange
      var model = ProductsRequestModel(
          info: Info(count: 100, pages: 1, next: "", prev: ""),
          results: const []);
      when(mockProductsDataSourceTest.getProducts(page: "1"))
          .thenAnswer((_) async {
        return model;
      });

      // Act
      final result = await mockProductsDataSourceTest.getProducts(page: "1");

      // Assert
      expect(result, isA<ProductsRequestModel>());
      verify(mockProductsDataSourceTest.getProducts(page: "1")).called(1);
      verifyNoMoreInteractions(mockProductsDataSourceTest);
    });

    test("Test DataSource getProducts Failure", () async {
      // Arrange
      var model = ProductsRequestModel.empty();
      // Act
      when(mockProductsDataSourceTest.getProducts(page: "1"))
          .thenAnswer((_) async => model);
      final failResult =
          await mockProductsDataSourceTest.getProducts(page: "1");
      // Assert
      expect(failResult, equals(ProductsRequestModel()));
      verify(mockProductsDataSourceTest.getProducts(page: "1")).called(1);
      verifyNoMoreInteractions(mockProductsDataSourceTest);
    });
  });
}
