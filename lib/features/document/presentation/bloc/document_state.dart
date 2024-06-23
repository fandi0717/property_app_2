part of 'document_bloc.dart';
abstract class DocumentState {
  const DocumentState();
}

class DocumentInitial extends DocumentState {
  const DocumentInitial();
}
class DocumentLoading extends DocumentState {
  const DocumentLoading();
}
class DocumentLoaded extends DocumentState {
  const DocumentLoaded();
}
class DocumentError extends DocumentState {
  final Exception exception;
  const DocumentError(this.exception);
}

