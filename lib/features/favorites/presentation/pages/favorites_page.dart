import 'package:easy_travel/features/favorites/presentation/blocs/favorites_bloc.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:easy_travel/features/favorites/presentation/widget/favorite_card.dart';
import 'package:easy_travel/features/home/domain/destination.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) => ListView.builder(
        itemCount: state.destinations.length,
        itemBuilder: (context, index) {
          final Destination destination = state.destinations[index];
          return FavoriteCard(destination: destination);
        },
      ),
    );
  }
}