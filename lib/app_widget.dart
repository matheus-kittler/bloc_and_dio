import 'package:bloc_and_dio_test/presentation/abilities/cubit/pokemon_abilities_cubit.dart';
import 'package:bloc_and_dio_test/presentation/comments/cubit/pokemon_comment_cubit.dart';
import 'package:bloc_and_dio_test/presentation/details/cubit/pokemon_detail_cubit.dart';
import 'package:bloc_and_dio_test/presentation/details/pokemon_details_page.dart';
import 'package:bloc_and_dio_test/presentation/list/cubit/pokemon_list_cubit.dart';
import 'package:bloc_and_dio_test/presentation/list/pokemon_list_page.dart';
import 'package:bloc_and_dio_test/presentation/rating/cubit/pokemon_rating_cubit.dart';
import 'package:bloc_and_dio_test/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'domain/pokemon/entities/poke_list.dart';
import 'locator.dart';

class PokemonPoc extends StatelessWidget {
  const PokemonPoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Poke Poc',
        theme: ThemeData(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          primarySwatch: Colors.grey,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        routes: {
          "/": (context) => const Splash(),
          "/pokemon-list": (context) => BlocProvider(
                create: (context) => locator.get<PokemonListCubit>(),
                child: const PokemonListPage(),
              ),
          "/pokemon-detail-page": (context) => PokemonDetailsPage(
                pokemonAbilitiesCubit: locator.get<AbilitiesCubit>(),
                pokemonDetailsCubit: locator.get<DetailsCubit>(),
                pokemonRatingCubit: locator.get<RatingCubit>(),
                pokemonCommentCubit: locator.get<CommentCubit>(),
                pokemon: ModalRoute.of(context)!.settings.arguments as Pokemon,
              ),
        },
      ),
    );
  }
}
