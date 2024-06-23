import '../../injection_container.dart';
import 'data/data_sources/remote/account_remote_data_source.dart';
import 'data/repositories/account_repository_impl.dart';
import 'domain/repositories/account_repository.dart';
import 'domain/use_cases/account_use_case.dart';
import 'presentation/bloc/account_bloc.dart';

//call this function in ServiceLocator.setup() function
injectAccount() {
  // bloc
  getIt.registerFactory(() => AccountBloc(accountUseCase: getIt()));

  // Repository
  getIt.registerLazySingleton<AccountRepository>(
          () => AccountRepositoryImpl(remoteDataSource: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => AccountUseCase(getIt()));

  // DataSources
  getIt.registerLazySingleton<AccountRemoteDataSource>(
          () => AccountRemoteDataSourceImpl());
}
      