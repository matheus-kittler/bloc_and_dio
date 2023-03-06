import 'package:dio/dio.dart';
import '../../domain/pokemon/entities/poke_abilities.dart';
import '../../domain/pokemon/entities/poke_details.dart';
import '../../domain/pokemon/entities/poke_list.dart';
import '../../domain/pokemon/repositories/pokemon_repository.dart';
import '../../external/datasources/pokemon_remote_datasource.dart';
import '../../shared/exceptions/app_error_exception.dart';

class PokemonRepositoryImpl implements PokemonRemoteRepository {
  var dio = Dio();

  final PokemonRemoteDataSource pokemonRemoteDataSource;

  PokemonRepositoryImpl({required this.pokemonRemoteDataSource});

  @override
  Future<PokeList?> getPokemons({PokeList? currentPokemonList}) async {
    try {
      return pokemonRemoteDataSource.getPokemons(
          currentPokemonList: currentPokemonList);
    } on DioError catch (error) {
      if (error is DioError) {
        throw AppErrorException(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        throw AppErrorException();
      }
    }
  }

  @override
  Future<PokeDetails?> getPokemonDetails({required String pokemonId}) async {
    try {
      return pokemonRemoteDataSource.getPokemonDetails(pokemonId: pokemonId);
    } catch (error) {
      if (error is DioError) {
        throw AppErrorException(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        throw AppErrorException();
      }
    }
  }

  @override
  Future<PokeAbilities?> getPokemonAbilities(
      {required String pokemonId}) async {
    try {
      return pokemonRemoteDataSource.getPokemonAbilities(pokemonId: pokemonId);
    } catch (error) {
      if (error is DioError) {
        throw AppErrorException(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        throw AppErrorException();
      }
    }
  }
}