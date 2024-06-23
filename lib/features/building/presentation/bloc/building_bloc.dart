import '../../domain/use_cases/building_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'building_event.dart';
part 'building_state.dart';

class BuildingBloc extends Bloc<BuildingEvent, BuildingState> {
  final BuildingUseCase buildingUseCase;

  BuildingBloc({required this.buildingUseCase}) : super(const BuildingInitial()) {
    on<BuildingEvent>(_building);
  }

  Future<void> _building(
    BuildingEvent event,
    Emitter<BuildingState> emit,
  ) async {
    emit(const BuildingLoading());
    final result = await buildingUseCase.call();
    result.fold(
      (exception) => emit(BuildingError(exception)),
      (_) => emit(const BuildingLoaded()),
    );
  }
}

      