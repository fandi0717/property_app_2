import 'package:dartz/dartz.dart';


abstract class AccountRepository {
  Future<Either<Exception, Unit>> callApi();
}

