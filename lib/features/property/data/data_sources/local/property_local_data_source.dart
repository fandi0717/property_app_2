import 'package:dartz/dartz.dart';


abstract class PropertyLocalDataSource {
  Future<Unit> getFromLocalDataBase();
}

class PropertyLocalDataSourceImpl implements PropertyLocalDataSource {
  PropertyLocalDataSourceImpl();

  @override
  Future<Unit> getFromLocalDataBase() async {
    // send api request here
    return Future.value(unit);
  }

}


  