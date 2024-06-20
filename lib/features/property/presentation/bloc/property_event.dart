part of 'property_bloc.dart';

class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object?> get props => [];
}

final class LoadPropertyEvent extends PropertyEvent {}

final class RemovePropertyEvent extends PropertyEvent {}

final class ScrolledSliderPropertyEvent extends PropertyEvent {
  final PropertyEntity property;
  final int index;

  const ScrolledSliderPropertyEvent(
      {required this.property, required this.index});

  @override
  List<Object?> get props => [index];
}
