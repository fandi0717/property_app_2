part of 'property_bloc.dart';

abstract class PropertyState extends Equatable {
  const PropertyState();
}

class PropertyInitial extends PropertyState {
  const PropertyInitial();

  @override
  List<Object?> get props => [];
}

class PropertyLoading extends PropertyState {
  const PropertyLoading();

  @override
  List<Object?> get props => [];
}

class PropertyLoaded extends PropertyState {
  final PropertyEntity property;

  const PropertyLoaded(this.property);

  @override
  List<Object?> get props => [property];
}

class PropertyError extends PropertyState {
  final Exception exception;
  const PropertyError(this.exception);

  @override
  List<Object?> get props => [exception];
}
