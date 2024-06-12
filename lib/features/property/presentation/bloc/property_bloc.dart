import 'package:equatable/equatable.dart';

import '../../domain/entities/property_entity.dart';
import '../../domain/use_cases/property_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyUseCase propertyUseCase;

  PropertyBloc({required this.propertyUseCase})
      : super(const PropertyInitial()) {
    on<LoadPropertyEvent>(_loadProperty);
  }

  Future<void> _loadProperty(
    PropertyEvent event,
    Emitter<PropertyState> emit,
  ) async {
    emit(const PropertyLoading());
    final result = await propertyUseCase.call();
    result.fold(
      (exception) => emit(PropertyError(exception)),
      (property) => emit(PropertyLoaded(property)),
    );
  }
}
