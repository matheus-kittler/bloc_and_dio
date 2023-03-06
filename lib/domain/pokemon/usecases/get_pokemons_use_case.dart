import '../entities/poke_list.dart';
import '../repositories/pokemon_repository.dart';

abstract class GetPokemonsUseCase {
  Future<PokeList?> call({PokeList? currentPokemonList});
}

class GetPokemonsUseCaseImp implements GetPokemonsUseCase {
  GetPokemonsUseCaseImp({required this.pokemonRepository});

  final PokemonRemoteRepository pokemonRepository;

  @override
  Future<PokeList?> call({PokeList? currentPokemonList}) async {
    List<Pokemon> pokemonList = [];
    final result = await pokemonRepository.getPokemons(
        currentPokemonList: currentPokemonList);

    if (currentPokemonList != null) {
      pokemonList.addAll(currentPokemonList.pokemons);
    }

    if (result != null && result.pokemons.isNotEmpty) {
      pokemonList.addAll(result.pokemons);
    }

    return PokeList(
      count: result!.count,
      next: result.next,
      previous: result.previous,
      pokemons: pokemonList,
    );
  }
}
