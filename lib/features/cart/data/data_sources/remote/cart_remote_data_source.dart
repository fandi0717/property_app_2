import 'package:dartz/dartz.dart';


abstract class CartRemoteDataSource {
  Future<Unit> callApi();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  CartRemoteDataSourceImpl();

  @override
  Future<Unit> callApi() async {
    // send api request here
    return Future.value(unit);
  }

}


  