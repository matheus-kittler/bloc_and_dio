import '../entities/poke_details.dart';
import '../repositories/pokemon_repository.dart';

abstract class GetPokemonDetailsUseCase {
  Future<PokeDetails?> call({required String pokemonId});
}

class GetPokemonDetailsUseCaseImp implements GetPokemonDetailsUseCase {
  GetPokemonDetailsUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override
  Future<PokeDetails?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonDetails(pokemonId: pokemonId);
  }
}
