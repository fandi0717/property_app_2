import 'package:dartz/dartz.dart';


abstract class BuildingRepository {
  Future<Either<Exception, Unit>> callApi();
}

