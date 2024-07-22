import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/core/utils/remote_request_manager/models_exporter.dart';
import 'package:nana_mobile_task/core/utils/resources/enums.dart';
import 'package:nana_mobile_task/features/products/domain/repository_base/products_repository_base.dart';
import 'package:nana_mobile_task/features/products/domain/use_case/products_use_case.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_state.dart';


class ProductsCubit extends Cubit<ProductsStateBase> {

  final ProductsRepositoryBase repository;

  ProductsCubit({
    required this.repository,
  }) : super(ProductsInitialState());


  ProductsRequestModel? products;

  Future<void> getProductsData() async {

    final result = await ProductsUseCase(
      repository: repository,
      limit: '10',
      offset: '0',
    )();
    result.fold(
      (failure) => emit(
         ProductsState(
          callStatus: CallStatus.error,
          productsData: null
        ),
      ),
      (data) => emit(
        ProductsState(
          callStatus: CallStatus.loaded,
          productsData: data,
        ),
      )
    );
  } 
}
