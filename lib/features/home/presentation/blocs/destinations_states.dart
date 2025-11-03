import 'package:easy_travel/features/home/domain/destination.dart';

class DestinationsStates {

  final bool isLoading;
  final String selectedCategory;
  final List<Destination> destinations;
  final String message;

  const DestinationsStates({
    this.isLoading = false,
    this.selectedCategory = 'All',
    this.destinations = const [],
    this.message = '',
  });

  DestinationsStates copyWith({
    bool? isLoading,
    String? selectedCategory,
    List<Destination>? destinations,
    String? message,
  }) {
    return DestinationsStates(
      isLoading: isLoading ?? this.isLoading,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      destinations: destinations ?? this.destinations,
      message: message ?? this.message,
    );
  }
}