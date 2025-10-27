import 'package:easy_travel/features/home/data/destination_service.dart';
import 'package:easy_travel/features/home/presentation/blocs/destination_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/destinations_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationsBloc extends Bloc<DestinationsEvent, DestinationsStates> {
  DestinationsBloc() : super(DestinationsInitialState()) {
    on<GetDestinationsByCategory>((event, emit) async {
      emit(DestinationsLoadingState());
      final destinations = await DestinationService().getDestinations(
        event.category,
      );
      emit(DestinationSuccessState(destinations: destinations));
    });
  }
}
