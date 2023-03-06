import '../entities/poke_abilities.dart';
import '../entities/poke_comments.dart';
import '../entities/poke_details.dart';
import '../entities/poke_list.dart';
import '../entities/poke_rating.dart';

abstract class PokemonLocalRepository {
  void saveRating({required PokeRating pokemonRating});

  Future<PokeRating> getRating({required String pokemonId});

  Future<PokeComments> getComments({required String pokemonId});

  void saveComment({required String pokemonId, required String comment});
}

abstract class PokemonRemoteRepository {
  Future<PokeList?> getPokemons({PokeList? currentPokemonList});

  Future<PokeDetails?> getPokemonDetails({required String pokemonId});

  Future<PokeAbilities?> getPokemonAbilities({required String pokemonId});
}
