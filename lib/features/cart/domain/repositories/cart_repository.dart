import 'package:dartz/dartz.dart';


abstract class CartRepository {
  Future<Either<Exception, Unit>> callApi();
}

