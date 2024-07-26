import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";
import "package:nana_mobile_task/core/error/failure.dart";
import "package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart";
import "package:nana_mobile_task/features/products/domain/use_case/products_use_case.dart";
import "products_repo_test.mocks.dart";

Future<void> main() async {
  late MockProductsRepoTest mockProductsRepo;
  late ProductsUseCase productsUseCase;

  setUp(() {
    mockProductsRepo = MockProductsRepoTest();
    productsUseCase = ProductsUseCase(repository: mockProductsRepo, page: "1");
  });

group("Test Product Use case", () {

  test("Test Repo getProducts Success", () async {
    // Arrange
    var tResponse = ProductsRequestModel.empty();
    when(productsUseCase.call()).thenAnswer((_) async {
      return Right(tResponse);
    });

    // Act
    final result = await productsUseCase.call();

    // Assert
    expect(result, isA<Right>());
    expect(result, equals(Right(tResponse)));
    verify(productsUseCase.call()).called(1);
    verifyNoMoreInteractions(mockProductsRepo);
  });

    test("Test Repo getProducts failure", () async {
    // Arrange
      Either<RemoteFailure, ProductsRequestModel> failureResponse =
          const Left(RemoteFailure(message: "Error While Fetching data"));
    
    //var tResponse = ProductsRequestModel.empty();
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
