import '../entities/poke_comments.dart';
import '../repositories/pokemon_repository.dart';

abstract class GetPokemonCommentsUseCase {
  Future<PokeComments> call({
    required String pokemonId,
  });
}

class GetPokemonCommentsUseCaseImpl implements GetPokemonCommentsUseCase {
  final PokemonLocalRepository pokemonLocalRepository;

  GetPokemonCommentsUseCaseImpl({required this.pokemonLocalRepository});
  @override
  Future<PokeComments> call({
    required String pokemonId,
  }) async {
    return pokemonLocalRepository.getComments(pokemonId: pokemonId);
  }
}
