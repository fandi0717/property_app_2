import 'package:dartz/dartz.dart';
import '../repositories/document_repository.dart';


class DocumentUseCase {
  final DocumentRepository repository;

  DocumentUseCase(this.repository);

  Future<Either<Exception, Unit>> call() async {
    return await repository.callApi();
  }
}

