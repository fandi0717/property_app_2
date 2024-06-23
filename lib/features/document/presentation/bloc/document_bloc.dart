import '../../domain/use_cases/document_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentUseCase documentUseCase;

  DocumentBloc({required this.documentUseCase}) : super(const DocumentInitial()) {
    on<DocumentEvent>(_document);
  }

  Future<void> _document(
    DocumentEvent event,
    Emitter<DocumentState> emit,
  ) async {
    emit(const DocumentLoading());
    final result = await documentUseCase.call();
    result.fold(
      (exception) => emit(DocumentError(exception)),
      (_) => emit(const DocumentLoaded()),
    );
  }
}

      