import '../entities/poke_rating.dart';
import '../repositories/pokemon_repository.dart';

abstract class SavePokemonRatingUseCase {
  void call({
    required String pokemonId,
    required double pokemonRating,
  });
}

class SavePokemonRatingUseCaseImpl implements SavePokemonRatingUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  SavePokemonRatingUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<void> call({
    required String pokemonId,
    required double pokemonRating,
  }) async {
    pokemonLocalRepository.saveRating(
        pokemonRating: PokeRating(
      id: pokemonId,
      rating: pokemonRating,
    ));
  }
}
