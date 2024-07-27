import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nana_mobile_task/core/utils/resources/use_case_base.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';
import 'package:nana_mobile_task/core/utils/resources/enums.dart';
import 'package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart';
import 'product_cubit_test.mocks.dart';
import 'product_use_case_test.dart';
import 'product_use_case_test.mocks.dart';
import 'test_constant.dart';

class MockProductsUseCase extends Mock
    implements UseCaseBase<ProductsRequestModel> {}

@GenerateMocks([MockProductsUseCase])
void main() {
  late ProductsCubit productsCubit;
  late MockProductsRepositoryBase mockProductsRepository;
  late MockMockProductsUseCase mockProductsUseCase;

  setUp(() {
    mockProductsRepository = MockMockProductsRepositoryBase();
    mockProductsUseCase = MockMockProductsUseCase();

    when(mockProductsUseCase.call()).thenAnswer(
        (_) async => const Right(ProductsRequestModel(results: [])));

    productsCubit = ProductsCubit(repository: mockProductsRepository);
  });

  group('Test ProductsCubit', () {
    blocTest<ProductsCubit, ProductsState>(
      'Test getData successfully',
      build: () {
        when(mockProductsRepository.getProducts(page: TestConstant.page))
            .thenAnswer(
                (_) async => const Right(ProductsRequestModel(results: [])));
        return productsCubit;
      },
      act: (cubit) async => await cubit.getProductsData(),
      expect: () => [
        ProductsState(
          callStatus: CallStatus.loading,
          productsData: null,
          results: null,
          gridHeightSize: 320,
          indicatorStatus: false,
          recommendationResults: null
        ),
        ProductsState(
          callStatus: CallStatus.loaded,
          productsData: const ProductsRequestModel(results: []),
          results: [],
          gridHeightSize:
              320, // Verify this depending on the actual implementation
          indicatorStatus: false,
          recommendationResults: []
        ),
      ],
    );

    test('Calculate GridHeight Test', () {
      productsCubit.dataResults = List.generate(5, (index) => Results());
      productsCubit.currentPage = 3;

      final height = productsCubit.calculateGridHeight();

      expect(height, 160);
    });

    test('ToggleIndicator Indicator Status Test', () {
      productsCubit.toggleIndicator(true);
      expect(productsCubit.state.indicatorStatus, true);

      productsCubit.toggleIndicator(false);
      expect(productsCubit.state.indicatorStatus, false);
    });
  });
}
