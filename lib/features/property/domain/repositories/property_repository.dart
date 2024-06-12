import 'package:dartz/dartz.dart';
import '../entities/property_entity.dart';

abstract class PropertyRepository {
  Future<Either<Exception, PropertyEntity>> getPropertys();
}
