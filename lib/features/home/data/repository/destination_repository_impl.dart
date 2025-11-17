import 'package:easy_travel/features/home/data/local/dao/destinations_dao.dart';
import 'package:easy_travel/features/home/data/remote/service/destination_service.dart';
import 'package:easy_travel/features/home/domain/models/category.dart';
import 'package:easy_travel/features/home/domain/models/destination.dart';
import 'package:easy_travel/features/home/domain/repository/destination_respository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationDao dao;
  final DestinationService service;

  const DestinationRepositoryImpl({required this.dao, required this.service});

  @override
  Future<List<Destination>> getAllFavorites() {
    return dao.fetchAll();
  }

  @override
  Future<List<Destination>> getDestinationsByCategory(CategoryType category) {
    return service.getDestinations(category: category);
  }

  @override
  Future<Set<int>> getFavoriteIds() {
    return dao.fetchAllIds();
  }

  @override
  Future<void> toggleFavorite(Destination destination) async {
    final bool isFavorite = await dao.isFavorite(destination.id);
    isFavorite
        ? await dao.delete(destination.id)
        : await dao.insert(destination);
  }
}