import 'package:dartz/dartz.dart';
import '../repositories/account_repository.dart';


class AccountUseCase {
  final AccountRepository repository;

  AccountUseCase(this.repository);

  Future<Either<Exception, Unit>> call() async {
    return await repository.callApi();
  }
}

