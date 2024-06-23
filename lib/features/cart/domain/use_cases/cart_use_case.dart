import 'package:dartz/dartz.dart';
import '../repositories/cart_repository.dart';


class CartUseCase {
  final CartRepository repository;

  CartUseCase(this.repository);

  Future<Either<Exception, Unit>> call() async {
    return await repository.callApi();
  }
}

