import 'package:hive/hive.dart';

import '../../domain/pokemon/entities/poke_comments.dart';
import '../../domain/pokemon/entities/poke_rating.dart';
import '../../settings/app_constants.dart';

// ignore: constant_identifier_names
const COMMENT_IDENTIFIER = 'comments';

abstract class PokemonLocalDataSource {
  void saveRating({required PokeRating pokemonRating});
  Future<PokeRating> getRating({required String pokemonId});
  Future<PokeComments> getComments({required String pokemonId});
  void saveComment({required String pokemonId, required String comment});
}

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  var box = Hive.box(AppConstants.ratingHiveBoxName);
  @override
  Future<PokeRating> getRating({required String pokemonId}) async {
    try {
      final rating = await box.get(pokemonId);

      if (rating == null) {
        return PokeRating(id: '', rating: 0);
      }
      return PokeRating(id: pokemonId, rating: rating['rating']);
    } catch (error) {
      rethrow;
    }
  }

  @override
  void saveRating({required PokeRating pokemonRating}) async {
    try {
      await box.put(
        pokemonRating.id,
        {
          'rating': pokemonRating.rating,
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  void saveComment({required String pokemonId, required String comment}) async {
    try {
      final existentComments = await getComments(pokemonId: pokemonId);

      await box.put(
        pokemonId + COMMENT_IDENTIFIER,
        {
          'comments': [...existentComments.comments, comment],
        },
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<PokeComments> getComments({required String pokemonId}) async {
    try {
      final comments = await box.get(
        pokemonId + COMMENT_IDENTIFIER,
      );

      if (comments == null) {
        return PokeComments(id: pokemonId, comments: []);
      }
      return PokeComments(id: pokemonId, comments: comments['comments']);
    } catch (error) {
      rethrow;
    }
  }
}
