import 'package:dartz/dartz.dart';


abstract class DocumentLocalDataSource {
  Future<Unit> getFromLocalDataBase();
}

class DocumentLocalDataSourceImpl implements DocumentLocalDataSource {
  DocumentLocalDataSourceImpl();

  @override
  Future<Unit> getFromLocalDataBase() async {
    // send api request here
    return Future.value(unit);
  }

}


  