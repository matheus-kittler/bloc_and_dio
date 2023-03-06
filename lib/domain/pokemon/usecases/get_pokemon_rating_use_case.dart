import '../entities/poke_rating.dart';
import '../repositories/pokemon_repository.dart';

abstract class GetPokemonRatingUseCase {
  Future<PokeRating> call({required String pokemonId});
}

class GetPokemonRatingUseCaseImpl implements GetPokemonRatingUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  GetPokemonRatingUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<PokeRating> call({required String pokemonId}) async {
    return await pokemonLocalRepository.getRating(pokemonId: pokemonId);
  }
}
