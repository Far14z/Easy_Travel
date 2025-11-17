import 'package:easy_travel/features/home/domain/models/category.dart';
import 'package:easy_travel/features/home/domain/models/destination.dart';

abstract class DestinationRepository {
  Future<List<Destination>> getDestinationsByCategory(CategoryType category);

  Future<List<Destination>> getAllFavorites();

  Future<Set<int>> getFavoriteIds();

  Future<void> toggleFavorite(Destination destination);
}