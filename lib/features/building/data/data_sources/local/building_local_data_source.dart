import 'package:dartz/dartz.dart';


abstract class BuildingLocalDataSource {
  Future<Unit> getFromLocalDataBase();
}

class BuildingLocalDataSourceImpl implements BuildingLocalDataSource {
  BuildingLocalDataSourceImpl();

  @override
  Future<Unit> getFromLocalDataBase() async {
    // send api request here
    return Future.value(unit);
  }

}


  