import 'package:dio/dio.dart';
import '../../data/pokemon/pokemon_mapper.dart';
import '../../domain/pokemon/entities/poke_abilities.dart';
import '../../domain/pokemon/entities/poke_details.dart';
import '../../domain/pokemon/entities/poke_list.dart';
import '../../settings/app_constants.dart';

abstract class PokemonRemoteDataSource {
  Future<PokeList?> getPokemons({PokeList? currentPokemonList});
  Future<PokeDetails?> getPokemonDetails({required String pokemonId});
  Future<PokeAbilities?> getPokemonAbilities({required String pokemonId});
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  var dio = Dio();

  @override
  Future<PokeList?> getPokemons({PokeList? currentPokemonList}) async {
    try {
      var url = '${AppConstants.apiUrl}/pokemon/?limit=15&offset=0';
      if (currentPokemonList != null) {
        url = currentPokemonList.next;
      }
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final pokemonList = PokemonMapper.pokemonListFromJson(response.data);
        return pokemonList;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<PokeDetails?> getPokemonDetails({required String pokemonId}) async {
    try {
      final response =
          await dio.get('${AppConstants.apiUrl}/pokemon/$pokemonId/');

      if (response.statusCode == 200) {
        final pokemonDetails = PokeDetails.fromJson(response.data);
        return pokemonDetails;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }

  @override
  Future<PokeAbilities?> getPokemonAbilities(
      {required String pokemonId}) async {
    try {
      final response =
          await dio.get('${AppConstants.apiUrl}/ability/$pokemonId/');

      if (response.statusCode == 200) {
        final pokemonAbilities = PokeAbilities.fromJson(response.data);
        return pokemonAbilities;
      }
    } catch (error) {
      rethrow;
    }
    return null;
  }
}
