part of 'pokemon_list_cubit.dart';

abstract class PokemonListState {}

class PokemonListInitial extends PokemonListState {}

class PokemonListLoading extends PokemonListState {}

class PokemonListLoadingMore extends PokemonListState {}

class PokemonListSuccess extends PokemonListState {
  final PokeList pokemonList;

  PokemonListSuccess({required this.pokemonList});
}

class PokemonListError extends PokemonListState {}
