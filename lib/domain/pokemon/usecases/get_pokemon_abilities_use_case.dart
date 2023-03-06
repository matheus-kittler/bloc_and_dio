import '../entities/poke_abilities.dart';
import '../repositories/pokemon_repository.dart';

abstract class GetPokemonAbilitiesUseCase {
  Future<PokeAbilities?> call({required String pokemonId});
}

class GetPokemonAbilitiesUseCaseImp implements GetPokemonAbilitiesUseCase {
  GetPokemonAbilitiesUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override
  Future<PokeAbilities?> call({required String pokemonId}) {
    return pokemonRepository.getPokemonAbilities(pokemonId: pokemonId);
  }
}
