import 'dart:async';
import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsStates> {
  final DestinationService destinationService;

  DestinationsBloc({required this.destinationService})
    : super(DestinationsStates()) {
    on<GetDestinationsByCategory>(_getDestinationByCategory);
    on<GetAllDestinations>(_getAllDestinations);
  }

  FutureOr<void> _getDestinationByCategory(event, emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        selectedCategory: event.category,
        message: null,
      ),
    );
    try {
      final destinations = await DestinationService().getDestinations(
        category: event.category,
      );
      emit(state.copyWith(isLoading: false, destinations: destinations));
    } catch (e) {
      emit(state.copyWith(isLoading: false, message: e.toString()));
    }
  }

  Future<void> getDestinationsByCategory(
    Emitter emit,
    GetDestinationsByCategory event,
  ) async {
    {
      emit(
        state.copyWith(
          isLoading: true,
          selectedCategory: event.category,
          message: null,
        ),
      );
      try {
        final destinations = await DestinationService().getDestinations(
          category: event.category,
        );
        emit(state.copyWith(isLoading: false, destinations: destinations));
      } catch (e) {
        emit(state.copyWith(isLoading: false, message: e.toString()));
      }
    }
  }

  Future<void> _getAllDestinations(
    GetAllDestinations event,
    Emitter emit,
  ) async {
    {
      emit(
        state.copyWith(isLoading: true, selectedCategory: 'All', message: null),
      );
      try {
        final destinations = await DestinationService().getDestinations();
        emit(state.copyWith(isLoading: false, destinations: destinations));
      } catch (e) {
        emit(state.copyWith(isLoading: false, message: e.toString()));
      }
    }
  }
}
