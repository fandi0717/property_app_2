import 'package:dartz/dartz.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_sources/remote/cart_remote_data_source.dart';


class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, Unit>> callApi() async {
    try {
      return Right(await remoteDataSource.callApi());
    } on Exception catch (exception) {
      return Left(exception);
    }
  }

}

