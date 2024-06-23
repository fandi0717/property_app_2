import 'package:dartz/dartz.dart';
import '../../domain/repositories/building_repository.dart';
import '../data_sources/remote/building_remote_data_source.dart';


class BuildingRepositoryImpl implements BuildingRepository {
  final BuildingRemoteDataSource remoteDataSource;

  BuildingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, Unit>> callApi() async {
    try {
      return Right(await remoteDataSource.callApi());
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

}

