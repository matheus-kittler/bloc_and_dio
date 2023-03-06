class PokeAbilities {
  PokeAbilities({
    required this.effectEntries,
  });
  late final List<EffectEntries> effectEntries;

  PokeAbilities.fromJson(Map<String, dynamic> json) {
    effectEntries = List.from(json['effect_entries'])
        .map((e) => EffectEntries.fromJson(e))
        .toList();
  }
}

class EffectEntries {
  EffectEntries({
    required this.effect,
    required this.language,
  });
  late final String effect;
  late final Language language;

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = Language.fromJson(json['language']);
  }
}

class Language {
  Language({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
