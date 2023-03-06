part of 'pokemon_rating_cubit.dart';

abstract class RatingState {}

class PokemonRatingInitial extends RatingState {}

class PokemonRatingLoading extends RatingState {}

class PokemonRatingSuccess extends RatingState {
  final PokeRating pokemonRating;

  PokemonRatingSuccess({required this.pokemonRating});
}

class PokemonRatingError extends RatingState {}
