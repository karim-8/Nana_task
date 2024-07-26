import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:nana_mobile_task/core/error/failure.dart";
import "package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart";
import "package:nana_mobile_task/features/products/domain/repository_base/products_repository_base.dart";
import "products_repo_test.mocks.dart";

class ProductsRepoTest extends Mock implements ProductsRepositoryBase {}

@GenerateMocks([ProductsRepoTest])
void main()  {
  late ProductsRepositoryBase mockProductsRepo;

  setUp(() {
    mockProductsRepo = MockProductsRepoTest();
  });

  group("Product repo test ", () {
    test("Test Repo getProducts Success", () async {
     // Arrange
      var model = ProductsRequestModel(
          info: Info(count: 100, pages: 1, next: "", prev: ""), results: const []);
          
      when(mockProductsRepo.getProducts(page: "1")).thenAnswer((_) async {
        return Right(model);
      });

    // Act
      final result = await mockProductsRepo.getProducts(page: "1");

    // Assert
      expect(result, isA<Right>());
      verify(mockProductsRepo.getProducts(page: "1")).called(1);
      verifyNoMoreInteractions(mockProductsRepo);
    });

    test("Test Repo getProducts Failure", () async {
      // Arrange
      Either<RemoteFailure, ProductsRequestModel> failureResponse =
          const Left(RemoteFailure(message: "Error While Fetching data"));
      // Act
      when(mockProductsRepo.getProducts(page: "1"))
          .thenAnswer((_) async => failureResponse);
      final failResult = await mockProductsRepo.getProducts(page: "1");
      // Assert
      expect(failResult, isA<Left>());
      verify(mockProductsRepo.getProducts(page: "1")).called(1);
      verifyNoMoreInteractions(mockProductsRepo);
    });

    test("Test Repo getProducts returns failure with a message", () async {
      final mockProductsRepo = MockProductsRepoTest();

      // Define the failure response
      Either<RemoteFailure, ProductsRequestModel> failureResponse =
          const Left(RemoteFailure(message: "Error While Fetching data"));

      // Mock the repository method to return a Future containing the failure response
      when(mockProductsRepo.getProducts(page: "1"))
          .thenAnswer((_) async => failureResponse);

      // Act
      final result = await mockProductsRepo.getProducts(page: "1");

      // Assert
      expect(result, isA<Left<RemoteFailure, dynamic>>());
      expect(result, failureResponse);
      verify(mockProductsRepo.getProducts(page: "1")).called(1);
      verifyNoMoreInteractions(mockProductsRepo);
    });
  });
}

