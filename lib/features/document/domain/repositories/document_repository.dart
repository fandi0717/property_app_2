import 'package:dartz/dartz.dart';


abstract class DocumentRepository {
  Future<Either<Exception, Unit>> callApi();
}

