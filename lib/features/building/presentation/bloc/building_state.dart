part of 'building_bloc.dart';
abstract class BuildingState {
  const BuildingState();
}

class BuildingInitial extends BuildingState {
  const BuildingInitial();
}
class BuildingLoading extends BuildingState {
  const BuildingLoading();
}
class BuildingLoaded extends BuildingState {
  const BuildingLoaded();
}
class BuildingError extends BuildingState {
  final Exception exception;
  const BuildingError(this.exception);
}

