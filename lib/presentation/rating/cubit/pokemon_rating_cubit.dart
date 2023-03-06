import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/pokemon/entities/poke_rating.dart';
import '../../../domain/pokemon/usecases/get_pokemon_rating_use_case.dart';
import '../../../domain/pokemon/usecases/save_pokemon_rating_use_case.dart';

part 'pokemon_rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(
      {required this.getPokemonRatingUseCase,
      required this.savePokemonRatingUseCase})
      : super(PokemonRatingInitial());

  final GetPokemonRatingUseCase getPokemonRatingUseCase;
  final SavePokemonRatingUseCase savePokemonRatingUseCase;

  void getPokemonRating({required String pokemonId}) async {
    emit(PokemonRatingLoading());
    try {
      final result = await getPokemonRatingUseCase(pokemonId: pokemonId);
      emit(PokemonRatingSuccess(pokemonRating: result));
    } catch (error) {
      emit(PokemonRatingError());
    }
  }

  savePokemonRating({
    required String pokemonId,
    required double pokemonRating,
  }) async {
    savePokemonRatingUseCase(
      pokemonId: pokemonId,
      pokemonRating: pokemonRating,
    );
  }
}
