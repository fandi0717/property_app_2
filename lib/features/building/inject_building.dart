import '../../injection_container.dart';
import 'data/data_sources/remote/building_remote_data_source.dart';
import 'data/repositories/building_repository_impl.dart';
import 'domain/repositories/building_repository.dart';
import 'domain/use_cases/building_use_case.dart';
import 'presentation/bloc/building_bloc.dart';

//call this function in ServiceLocator.setup() function
injectBuilding() {
  // bloc
  getIt.registerFactory(() => BuildingBloc(buildingUseCase: getIt()));

  // Repository
  getIt.registerLazySingleton<BuildingRepository>(
          () => BuildingRepositoryImpl(remoteDataSource: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => BuildingUseCase(getIt()));

  // DataSources
  getIt.registerLazySingleton<BuildingRemoteDataSource>(
          () => BuildingRemoteDataSourceImpl());
}
      