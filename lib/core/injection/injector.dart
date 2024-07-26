import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nana_mobile_task/core/utils/remote_request_manager/dio_implementation.dart';
import 'package:nana_mobile_task/core/utils/remote_request_manager/remote_request_manager.dart';
import 'package:nana_mobile_task/features/products/data/datasource/products_datasource.dart';
import 'package:nana_mobile_task/features/products/data/repository/products_repository.dart';
import 'package:nana_mobile_task/features/products/domain/repository_base/products_repository_base.dart';
import 'package:nana_mobile_task/features/products/presentation/cubit/products_cubit.dart';

final injector = GetIt.instance;

class Injector {
  static void init() async {
    /// Bloc
    injector.registerLazySingleton(() => ProductsCubit(repository: injector()));

    /// Repository.
    injector.registerLazySingleton<ProductsRepositoryBase>(
        () => ProductsRepository(remoteDatasource: injector()));

    /// Data Sources.
    injector.registerLazySingleton<ProductsRemoteDatasourceBase>(
        () => ProductsRemoteDatasource(
              remoteRequestManager: injector(),
            ));

    /// Remote Request Manager.
    injector
        .registerLazySingleton<RemoteRequestManager>(() => DioImplementation(Dio()));
  }
}
