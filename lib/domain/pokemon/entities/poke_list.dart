class PokeList {
  PokeList({
    required this.count,
    required this.next,
    required this.pokemons,
    String? previous,
  });
  late final int count;
  late final String next;
  late final String? previous = null;
  late final List<Pokemon> pokemons;
}

class Pokemon {
  Pokemon({
    required this.name,
    required this.url,
    required this.id,
  });
  late final String id;
  late final String name;
  late final String url;

  Pokemon.fromJson(Map<String, dynamic> json) {

    id = json['url'].replaceAll("https://pokeapi.co/api/v2/pokemon/", "")
        .replaceAll("/", "");

    name = json['name'];
    url = json['url'];
  }
}
