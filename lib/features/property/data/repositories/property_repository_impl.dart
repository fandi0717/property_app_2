import 'package:dartz/dartz.dart';
import '../../domain/entities/property_entity.dart';
import '../../domain/repositories/property_repository.dart';
import '../data_sources/remote/property_remote_data_source.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final PropertyRemoteDataSource remoteDataSource;

  PropertyRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, PropertyEntity>> getPropertys() async {
    try {
      final propertys = await remoteDataSource.getPropertysFromJson();
      return Right(propertys);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
