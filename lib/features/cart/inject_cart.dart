import '../../injection_container.dart';
import 'data/data_sources/remote/cart_remote_data_source.dart';
import 'data/repositories/cart_repository_impl.dart';
import 'domain/repositories/cart_repository.dart';
import 'domain/use_cases/cart_use_case.dart';
import 'presentation/bloc/cart_bloc.dart';

//call this function in ServiceLocator.setup() function
injectCart() {
  // bloc
  getIt.registerFactory(() => CartBloc(cartUseCase: getIt()));

  // Repository
  getIt.registerLazySingleton<CartRepository>(
          () => CartRepositoryImpl(remoteDataSource: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => CartUseCase(getIt()));

  // DataSources
  getIt.registerLazySingleton<CartRemoteDataSource>(
          () => CartRemoteDataSourceImpl());
}
      