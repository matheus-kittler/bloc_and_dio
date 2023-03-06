import '../../domain/pokemon/entities/poke_list.dart';

abstract class PokemonMapper {
  // @TODO Todos os mappers devem ficar aqui, e não na entity.
  static PokeList pokemonListFromJson(Map<String, dynamic> json) {
    return PokeList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      pokemons:
      List.from(json['results']).map((e) => Pokemon.fromJson(e)).toList(),
    );
  }
}
