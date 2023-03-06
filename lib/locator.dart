import 'package:bloc_and_dio_test/presentation/abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:bloc_and_dio_test/presentation/comments/cubit/pokemon_comment_cubit.dart';
import 'package:bloc_and_dio_test/presentation/details/cubit/pokemon_detail_cubit.dart';
import 'package:bloc_and_dio_test/presentation/list/cubit/pokemon_list_cubit.dart';
import 'package:bloc_and_dio_test/presentation/rating/cubit/pokemon_rating_cubit.dart';
import 'package:get_it/get_it.dart';
import 'domain/pokemon/repositories/pokemon_repository.dart';
import 'domain/pokemon/usecases/get_pokemon_abilities_use_case.dart';
import 'domain/pokemon/usecases/get_pokemon_comments_use_case.dart';
import 'domain/pokemon/usecases/get_pokemon_detail_use_case.dart';
import 'domain/pokemon/usecases/get_pokemon_rating_use_case.dart';
import 'domain/pokemon/usecases/get_pokemons_use_case.dart';
import 'domain/pokemon/usecases/save_pokemon_comment_use_case.dart';
import 'domain/pokemon/usecases/save_pokemon_rating_use_case.dart';
import 'external/datasources/pokemon_local_datasource.dart';
import 'external/datasources/pokemon_remote_datasource.dart';
import 'infra/repositories/pokemon_local_repository.dart';
import 'infra/repositories/pokemon_remote_repository.dart';

final locator = GetIt.instance;

void registerDependencies() {
  locator.registerFactory<PokemonLocalDataSource>(
      () => PokemonLocalDataSourceImpl());

  locator.registerFactory<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceImpl());

  locator.registerFactory<PokemonRemoteRepository>(() => PokemonRepositoryImpl(
        pokemonRemoteDataSource: locator.get<PokemonRemoteDataSource>(),
      ));

  locator
      .registerFactory<PokemonLocalRepository>(() => PokemonLocalRepositoryImpl(
            pokemonLocalDataSource: locator.get<PokemonLocalDataSource>(),
          ));

  locator.registerFactory<GetPokemonsUseCase>(
    () => GetPokemonsUseCaseImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<SavePokemonCommentsUseCase>(
    () => SavePokemonCommentUseCaseImpl(
      pokemonLocalRepository: locator.get<PokemonLocalRepository>(),
    ),
  );

  locator.registerFactory<GetPokemonDetailsUseCase>(
    () => GetPokemonDetailsUseCaseImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<GetPokemonAbilitiesUseCase>(
    () => GetPokemonAbilitiesUseCaseImp(
      pokemonRepository: locator.get<PokemonRemoteRepository>(),
    ),
  );

  locator.registerFactory<GetPokemonCommentsUseCase>(
    () => GetPokemonCommentsUseCaseImpl(
      pokemonLocalRepository: locator.get<PokemonLocalRepository>(),
    ),
  );

  locator.registerFactory<GetPokemonRatingUseCase>(
    () => GetPokemonRatingUseCaseImpl(
      pokemonLocalRepository: locator.get<PokemonLocalRepository>(),
    ),
  );

  locator.registerFactory<SavePokemonRatingUseCase>(
    () => SavePokemonRatingUseCaseImpl(
      pokemonLocalRepository: locator.get<PokemonLocalRepository>(),
    ),
  );

  locator.registerFactory<PokemonListCubit>(
    () => PokemonListCubit(
      getPokemonsUseCase: locator.get<GetPokemonsUseCase>(),
    ),
  );

  locator.registerFactory<DetailsCubit>(
    () => DetailsCubit(
      getPokemonDetailsUseCase: locator.get<GetPokemonDetailsUseCase>(),
    ),
  );

  locator.registerFactory<AbilitiesCubit>(
    () => AbilitiesCubit(
      getPokemonAbilitiesUseCase: locator.get<GetPokemonAbilitiesUseCase>(),
    ),
  );

  locator.registerFactory<RatingCubit>(
    () => RatingCubit(
      getPokemonRatingUseCase: locator.get<GetPokemonRatingUseCase>(),
      savePokemonRatingUseCase: locator.get<SavePokemonRatingUseCase>(),
    ),
  );

  locator.registerFactory<CommentCubit>(
    () => CommentCubit(
      savePokemonCommentsUseCase: locator.get<SavePokemonCommentsUseCase>(),
      getPokemonCommentsUseCase: locator.get<GetPokemonCommentsUseCase>(),
    ),
  );
}
