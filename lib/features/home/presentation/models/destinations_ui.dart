import 'package:easy_travel/features/home/domain/models/destination.dart';

class DestinationsUi {
  final Destination destination;
  final bool isFavorite;

  const DestinationsUi({required this.destination, required this.isFavorite});
}