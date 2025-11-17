import 'dart:async';

import 'package:easy_travel/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:easy_travel/features/home/data/local/dao/destinations_dao.dart';
import 'package:easy_travel/features/home/domain/models/destination.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DestinationDao dao;
  FavoritesBloc({required this.dao})
    : super(FavoritesState(destinations: const [])) {
    on<GetAllFavorites>(_getAllFavorites);

    on<RemoveFavorite>(_removeFavorite);
  }

  FutureOr<void> _getAllFavorites(
    GetAllFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    final List<Destination> destinations = await dao.fetchAll();
    emit(FavoritesState(destinations: destinations));
  }

  FutureOr<void> _removeFavorite(
    RemoveFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    dao.delete(event.id);

    final List<Destination> destinations = await dao.fetchAll();
    emit(FavoritesState(destinations: destinations));
  }
}
