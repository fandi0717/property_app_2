import 'package:dartz/dartz.dart';
import 'package:property_app/features/property/domain/entities/property_entity.dart';
import '../repositories/property_repository.dart';

class PropertyUseCase {
  final PropertyRepository repository;

  PropertyUseCase(this.repository);

  Future<Either<Exception, PropertyEntity>> call() async {
    // logic bisnis
    return await repository.getPropertys();
  }
}
