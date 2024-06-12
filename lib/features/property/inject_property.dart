import '../../injection_container.dart';
import 'data/data_sources/remote/property_remote_data_source.dart';
import 'data/repositories/property_repository_impl.dart';
import 'domain/repositories/property_repository.dart';
import 'domain/use_cases/property_use_case.dart';
import 'presentation/bloc/property_bloc.dart';

//call this function in ServiceLocator.setup() function
injectProperty() {
  // bloc
  getIt.registerFactory(() => PropertyBloc(propertyUseCase: getIt()));

  // Repository
  getIt.registerLazySingleton<PropertyRepository>(
          () => PropertyRepositoryImpl(remoteDataSource: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => PropertyUseCase(getIt()));

  // DataSources
  getIt.registerLazySingleton<PropertyRemoteDataSource>(
          () => PropertyRemoteDataSourceImpl());
}
      