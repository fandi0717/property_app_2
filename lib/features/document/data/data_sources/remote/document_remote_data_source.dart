import 'package:dartz/dartz.dart';


abstract class DocumentRemoteDataSource {
  Future<Unit> callApi();
}

class DocumentRemoteDataSourceImpl implements DocumentRemoteDataSource {
  DocumentRemoteDataSourceImpl();

  @override
  Future<Unit> callApi() async {
    // send api request here
    return Future.value(unit);
  }

}


  