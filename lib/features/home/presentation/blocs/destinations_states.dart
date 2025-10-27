import 'package:easy_travel/features/home/domain/destination.dart';

abstract class DestinationsStates {}

class DestinationsInitialState extends DestinationsStates {}

class DestinationsLoadingState extends DestinationsStates {}

class DestinationSuccessState extends DestinationsStates {
  final List<Destination> destinations;
  DestinationSuccessState({required this.destinations});
}

class DestiantionFailureState extends DestinationsStates {
  final String message;
  DestiantionFailureState({required this.message});
}