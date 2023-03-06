import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/pokemon/entities/poke_details.dart';
import '../../../domain/pokemon/usecases/get_pokemon_detail_use_case.dart';
part 'pokemon_detail_state.dart';

class DetailsCubit extends Cubit<PokemonDetailsState> {
  DetailsCubit({required this.getPokemonDetailsUseCase})
      : super(PokemonDetailsInitial());

  final GetPokemonDetailsUseCase getPokemonDetailsUseCase;

  void getPokemonDetails({required String pokemonId}) async {
    emit(PokemonDetailsLoading());
    final pokemonDetails = await getPokemonDetailsUseCase(pokemonId: pokemonId);
    if (pokemonDetails != null && pokemonDetails.abilities.isNotEmpty) {
      emit(PokemonDetailsSuccess(pokemonDetails: pokemonDetails));
    } else {
      emit(PokemonDetailsError());
    }
  }
}
