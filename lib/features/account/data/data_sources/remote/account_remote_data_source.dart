import 'package:dartz/dartz.dart';


abstract class AccountRemoteDataSource {
  Future<Unit> callApi();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  AccountRemoteDataSourceImpl();

  @override
  Future<Unit> callApi() async {
    // send api request here
    return Future.value(unit);
  }

}


  