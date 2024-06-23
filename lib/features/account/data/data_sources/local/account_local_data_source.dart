import 'package:dartz/dartz.dart';


abstract class AccountLocalDataSource {
  Future<Unit> getFromLocalDataBase();
}

class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  AccountLocalDataSourceImpl();

  @override
  Future<Unit> getFromLocalDataBase() async {
    // send api request here
    return Future.value(unit);
  }

}


  