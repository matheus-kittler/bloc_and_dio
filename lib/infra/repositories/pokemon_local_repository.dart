import 'package:hive/hive.dart';
import '../../domain/pokemon/entities/poke_comments.dart';
import '../../domain/pokemon/entities/poke_rating.dart';
import '../../domain/pokemon/repositories/pokemon_repository.dart';
import '../../external/datasources/pokemon_local_datasource.dart';
import '../../settings/app_constants.dart';
import '../../shared/exceptions/app_error_exception.dart';

class PokemonLocalRepositoryImpl implements PokemonLocalRepository {
  final PokemonLocalDataSource pokemonLocalDataSource;
  PokemonLocalRepositoryImpl({required this.pokemonLocalDataSource});

  var box = Hive.box(AppConstants.ratingHiveBoxName);
  @override
  Future<PokeRating> getRating({required String pokemonId}) async {
    try {
      return pokemonLocalDataSource.getRating(pokemonId: pokemonId);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  void saveRating({required PokeRating pokemonRating}) async {
    try {
      pokemonLocalDataSource.saveRating(pokemonRating: pokemonRating);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  void saveComment({required String pokemonId, required String comment}) async {
    try {
      pokemonLocalDataSource.saveComment(
          pokemonId: pokemonId, comment: comment);
    } catch (error) {
      throw AppErrorException();
    }
  }

  @override
  Future<PokeComments> getComments({required String pokemonId}) async {
    try {
      return pokemonLocalDataSource.getComments(pokemonId: pokemonId);
    } catch (error) {
      throw AppErrorException();
    }
  }
}
