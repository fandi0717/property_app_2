import '../../injection_container.dart';
import 'data/data_sources/remote/document_remote_data_source.dart';
import 'data/repositories/document_repository_impl.dart';
import 'domain/repositories/document_repository.dart';
import 'domain/use_cases/document_use_case.dart';
import 'presentation/bloc/document_bloc.dart';

//call this function in ServiceLocator.setup() function
injectDocument() {
  // bloc
  getIt.registerFactory(() => DocumentBloc(documentUseCase: getIt()));

  // Repository
  getIt.registerLazySingleton<DocumentRepository>(
          () => DocumentRepositoryImpl(remoteDataSource: getIt()));

  // UseCases
  getIt.registerLazySingleton(() => DocumentUseCase(getIt()));

  // DataSources
  getIt.registerLazySingleton<DocumentRemoteDataSource>(
          () => DocumentRemoteDataSourceImpl());
}
      