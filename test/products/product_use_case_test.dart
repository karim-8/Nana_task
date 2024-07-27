import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:nana_mobile_task/core/error/failure.dart";
import "package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart";
import "package:nana_mobile_task/features/products/domain/repository_base/products_repository_base.dart";
import "package:nana_mobile_task/features/products/domain/use_case/products_use_case.dart";
import "product_use_case_test.mocks.dart";
import "test_constant.dart";


class MockProductsRepositoryBase extends Mock implements ProductsRepositoryBase{}

@GenerateMocks([MockProductsRepositoryBase])
Future<void> main() async {
  late MockProductsRepositoryBase mockProductsRepo;
  late ProductsUseCase productsUseCase;

  setUp(() {
   mockProductsRepo = MockMockProductsRepositoryBase();
   productsUseCase = ProductsUseCase(repository: mockProductsRepo, page: TestConstant.page);
  });

group("Test Products Usecase", (){

  test("Test Products Usecase Success", () async {

      // Arrange
      when(mockProductsRepo.getProducts(page: TestConstant.page))
          .thenAnswer((_) async => Right(ProductsRequestModel()));

      // Act
      final result = await productsUseCase.call();

      // Assert
      expect(result, isA<Right>());
      expect(result, equals(Right(ProductsRequestModel())));
      verify(mockProductsRepo.getProducts(page: TestConstant.page));
      verifyNoMoreInteractions(mockProductsRepo);
  });


    test("Test Products Usecase failure", () async {

    // Arrange
      Either<RemoteFailure, ProductsRequestModel> failureResponse =
          const Left(RemoteFailure(message: "Error parsing data"));
    
    when(productsUseCase.call()).thenAnswer((_) async {
      return failureResponse;
    });

    // Act
    final result = await productsUseCase.call();

    // Assert
    expect(result, isA<Left<RemoteFailure, dynamic>>());
    expect(result, failureResponse);
    verify(productsUseCase.call()).called(1);
    verifyNoMoreInteractions(mockProductsRepo);
  });


});

}
