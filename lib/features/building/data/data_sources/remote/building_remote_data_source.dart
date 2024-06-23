import 'package:dartz/dartz.dart';


abstract class BuildingRemoteDataSource {
  Future<Unit> callApi();
}

class BuildingRemoteDataSourceImpl implements BuildingRemoteDataSource {
  BuildingRemoteDataSourceImpl();

  @override
  Future<Unit> callApi() async {
    // send api request here
    return Future.value(unit);
  }

}


  