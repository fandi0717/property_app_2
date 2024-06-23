import 'package:dartz/dartz.dart';
import '../repositories/building_repository.dart';


class BuildingUseCase {
  final BuildingRepository repository;

  BuildingUseCase(this.repository);

  Future<Either<Exception, Unit>> call() async {
    return await repository.callApi();
  }
}

