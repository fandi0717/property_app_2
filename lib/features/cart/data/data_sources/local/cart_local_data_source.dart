import 'package:dartz/dartz.dart';


abstract class CartLocalDataSource {
  Future<Unit> getFromLocalDataBase();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  CartLocalDataSourceImpl();

  @override
  Future<Unit> getFromLocalDataBase() async {
    // send api request here
    return Future.value(unit);
  }

}


  